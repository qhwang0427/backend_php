<?php
// 本类
class ApiV1homeAction extends Action{
    public function indexMobile(){
    	$uid = $_POST['uid'];
    	$latitude= $_POST['latitude'];
    	$longitude= $_POST['longitude'];
    	
    	$activity_message=M('activity_message');
    	$res1 = $activity_message->where('type=1')->select();
    	$mes = $res1[0]['message'];
    	
    	$serverend_action=M('serverendaction');
    	$res2 = $serverend_action->where("uid=$uid and is_recommend=0")->select();
    	for($i=0;$i<count($res2);$i++)
    		$res2[$i]['timestamp']=strtotime($res2[$i]['timestamp']);//转为时间戳输出
    		
    	
    	$users = M('users');
    	$res3 = $users->where("id=$uid")->select();
    	$points=$res3[0]['points'];
    	if($res3[0]['status']==1)
    		$status='active';
    	else
    		$status='banned';
    	
    	
    	$this->assign('message',$mes);
    	$this->assign('points',$points);
    	$this->assign('status',$status);
    	$this->assign('activity',$res2);
    	$this->assign('testtime',$testtime);
    	
    	$this->display('api:home');
    }
    
}
?>