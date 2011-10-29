<?php
require("Instance.php");
class ApiV1locationsAction extends Action{
	public function listMobile(){
		$uid = $_POST['uid'];
		$latitude= $_POST['latitude'];
    $longitude= $_POST['longitude'];
    
    if($latitude == null || $longitude== null){
    	echo 'one is null';return;
    }
    
    $server_radius = M('server_radius');
    $res = $server_radius->select();//取出由系统设置的半径值
    if(count($res)>0){
    	$radius = $res[0]['radius']/1000;//由米转成千米
    	//以下2行是根据距离获得同一经度上的点的纬度，包括小值与大值
    	$lat_small = Instance::getSmallerLatFromSameLng($radius,$latitude);
    	$lat_big = Instance::getBiggerLatFromSameLng($radius,$latitude);
    	//以下2行是根据距离获得同一纬度上的点的经度，包括小值与大值
    	$lng_small = Instance::getSmallerLngFromSameLat($radius,$latitude,$longitude);
    	$lng_big = Instance::getBiggerLngFromSameLat($radius,$latitude,$longitude);
    	//echo "radius=$radius;lat_small=$lat_small;lat_big=$lat_big;lng_small=$lng_small;lng_big=$lng_big";
    	$res2 = M('locations')->where("latitude>$lat_small and latitude<$lat_big and longitude>$lng_small and longitude<$lng_big")->select();
    	$this->assign('radius',$radius*1000);//返回的需要以米为单位
    	$this->assign('locations',$res2);
    	$this->display('api:locationsList');
    }
    
    
	}
	public function checkinMobile(){
		$uid = $_POST['uid'];
		$latitude= $_POST['latitude'];
    $longitude= $_POST['longitude'];
    $location_id = $_POST['location_id'];
    
    if($latitude == null || $longitude== null || $uid ==null || $location_id == null){
    	echo 'one is null';return;
    }
    
    $location = M('locations');
    $location->find($location_id);//得到对应id的地点，存在location中
    $user = M('users');
    $user->find($uid);//得到对应id的用户，存在user中
    //取出该地点的经纬度、可签到的半径值，以及分数值
    	$lat2 = $location->latitude;
    	$lng2 = $location->longitude;
    	$l_radius = $location->radius;
    	$l_points = $location->points;
    	//echo "uid=$uid;location_id=$location_id;lat2=$lat2;lng2=$lng2;l_radius=$l_radius;l_points=$l_points";return;
    	$data['table_name'] = 'checkin';
    	$data['user_id'] = $uid;
    	$showtime = date("Y-m-d H:i:s");
    	$data['created_at'] = $showtime;
    	$data['updated_at'] = $showtime;
    	//计算用户所在地与该location间的距离，由千米转成米
    	$distance = Instance::getdistance($longitude,$latitude,$lng2,$lat2) *1000;
    	if($distance > $l_radius){//两点间距离大于可签到的半径
    		$confirmed=false;
    		$message = 'The distance is too long, you cannot check in.';
    		$id_activity = 0;
    		
    		$data['confirmed'] = 0;
    	}else{//可以签到
    		$confirmed=true;
    		$message = 'Get the points successfully!';
    		
    		$location->count = $location->count +1;//地点被签到的统计加1
    		$location->save();
    		
    		//修改用户的points
    		$user->points = $user->points + $l_points;
    		$user->save();
    		
    		$data['confirmed'] = 1;
    	}
    	//往activities表插入一条新纪录
    $id_activity = M('activities')->add($data);//添加成功后直接返回新增的项的id
    
    $points = $user->points;
    
		$this->assign('id',$id_activity);
		$this->assign('confirmed',$confirmed);
		$this->assign('message',$message);
		$this->assign('points',$points);
		$this->display('api:locationsCheckin');
	}
}
?>