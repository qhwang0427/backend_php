<?php
class ApiV1charitiesAction extends Action{
	public function listMobile(){
		$charities = M('charities');
		$effects = M('effects');
		
		$res = $charities->select();
		for($i=0;$i<count($res);$i++)
		{
			$res2 = $effects->where("charity_id=".$res[$i]['id'])->select();
			$res[$i]['effects'] = $res2;
		}
		
		$this->assign('charities',$res);
		$this->display('api:charities');
	}
}
?>