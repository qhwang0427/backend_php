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
    $res = $server_radius->select();//ȡ����ϵͳ���õİ뾶ֵ
    if(count($res)>0){
    	$radius = $res[0]['radius']/1000;//����ת��ǧ��
    	//����2���Ǹ��ݾ�����ͬһ�����ϵĵ��γ�ȣ�����Сֵ���ֵ
    	$lat_small = Instance::getSmallerLatFromSameLng($radius,$latitude);
    	$lat_big = Instance::getBiggerLatFromSameLng($radius,$latitude);
    	//����2���Ǹ��ݾ�����ͬһγ���ϵĵ�ľ��ȣ�����Сֵ���ֵ
    	$lng_small = Instance::getSmallerLngFromSameLat($radius,$latitude,$longitude);
    	$lng_big = Instance::getBiggerLngFromSameLat($radius,$latitude,$longitude);
    	//echo "radius=$radius;lat_small=$lat_small;lat_big=$lat_big;lng_small=$lng_small;lng_big=$lng_big";
    	$res2 = M('locations')->where("latitude>$lat_small and latitude<$lat_big and longitude>$lng_small and longitude<$lng_big")->select();
    	$this->assign('radius',$radius*1000);//���ص���Ҫ����Ϊ��λ
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
    $location->find($location_id);//�õ���Ӧid�ĵص㣬����location��
    $user = M('users');
    $user->find($uid);//�õ���Ӧid���û�������user��
    //ȡ���õص�ľ�γ�ȡ���ǩ���İ뾶ֵ���Լ�����ֵ
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
    	//�����û����ڵ����location��ľ��룬��ǧ��ת����
    	$distance = Instance::getdistance($longitude,$latitude,$lng2,$lat2) *1000;
    	if($distance > $l_radius){//����������ڿ�ǩ���İ뾶
    		$confirmed=false;
    		$message = 'The distance is too long, you cannot check in.';
    		$id_activity = 0;
    		
    		$data['confirmed'] = 0;
    	}else{//����ǩ��
    		$confirmed=true;
    		$message = 'Get the points successfully!';
    		
    		$location->count = $location->count +1;//�ص㱻ǩ����ͳ�Ƽ�1
    		$location->save();
    		
    		//�޸��û���points
    		$user->points = $user->points + $l_points;
    		$user->save();
    		
    		$data['confirmed'] = 1;
    	}
    	//��activities�����һ���¼�¼
    $id_activity = M('activities')->add($data);//��ӳɹ���ֱ�ӷ������������id
    
    $points = $user->points;
    
		$this->assign('id',$id_activity);
		$this->assign('confirmed',$confirmed);
		$this->assign('message',$message);
		$this->assign('points',$points);
		$this->display('api:locationsCheckin');
	}
}
?>