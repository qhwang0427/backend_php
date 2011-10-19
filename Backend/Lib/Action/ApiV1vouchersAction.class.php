<?php
// 本类由系统自动生成，仅供测试用途
class ApiV1vouchersAction extends Action{
    public function indexMobile(){
    	$users = new Model('users');
    	$data['firstname']=$_POST['tile'];
    	$data['lastname']=$_POST['content'];
    	$users->add($data);
    	$this->redirect('insertMobile');
    }
    
    public function insertMobile(){
    	$users = new Model('users');
    	$list = $users->select();
    	$this->assign('list',$list);
    	$this->display("api:api");
    }
}
?>