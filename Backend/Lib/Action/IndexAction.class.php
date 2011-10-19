<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action{
    public function insertMobile(){
    	$users = new Model('users');
    	$data['firstname']=$_POST['tile'];
    	$data['lastname']=$_POST['content'];
    	$users->add($data);
    	$this->redirect('indexMobile');
    }
    
    public function indexMobile(){
    	$users = new Model('users');
    	$list = $users->select();
    	$this->assign('list',$list);
    	$this->display('Index:index');
    }
    
    public function userMobile(){
    	$users = new Model('users');
    	$list = $users->select();
    	$this->assign('list',$list);
    	$this->display('Index:user');
    }
}
?>