<?php
class Instance{
	public static function getdistance($lng1,$lat1,$lng2,$lat2)//根据经纬度计算距离
	{
		//将角度转为狐度 
		$radLat1=deg2rad($lat1);
		$radLat2=deg2rad($lat2);
		$radLng1=deg2rad($lng1);
		$radLng2=deg2rad($lng2);
		$a=$radLat1-$radLat2;//两纬度之差,纬度<90
		$b=$radLng1-$radLng2;//两经度之差纬度<180
		$s=2*asin(sqrt(pow(sin($a/2),2)+cos($radLat1)*cos($radLat2)*pow(sin($b/2),2)))*6378.137;
		return $s;//单位：公里
	}
	
	public static function getSmallerLatFromSameLng($distance,$lat1)//$distance单位为公里，根据距离计算同一经度上另一点的维度，返回较小的维度
	{
		$a=180*$distance/(pi()*6378.137);
		$lat2=$lat1-$a;            //a=lat1-lat2
		return $lat2;
	}
	
	public static function getBiggerLatFromSameLng($distance,$lat1)//$distance单位为公里，根据距离计算同一经度上另一点的维度，返回较大的维度
	{
		$a=180*$distance/(pi()*6378.137);
		$lat2=$lat1+$a;          //a=lat2-lat1
		return $lat2;
	}
	
	public static function getSmallerLngFromSameLat($distance,$lat,$lng1)//$distance单位为公里，根据距离计算同一维度上另一点的经度，返回较小的经度
	{
		$b=$distance/(111*cos(deg2rad($lat)));
		$lng2=$lng1-$b;    //b=lng1-lng2
		return $lng2;
	}
	
	public static function getBiggerLngFromSameLat($distance,$lat,$lng1)//$distance单位为公里，根据距离计算同一维度上另一点的经度，返回较大的经度
	{
		$b=$distance/(111*cos(deg2rad($lat)));
		$lng2=$lng1+$b;    //b=lng2-lng1
		return $lng2;
	}
}
?>