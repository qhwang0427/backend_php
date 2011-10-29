<?php
class Instance{
	public static function getdistance($lng1,$lat1,$lng2,$lat2)//���ݾ�γ�ȼ������
	{
		//���Ƕ�תΪ���� 
		$radLat1=deg2rad($lat1);
		$radLat2=deg2rad($lat2);
		$radLng1=deg2rad($lng1);
		$radLng2=deg2rad($lng2);
		$a=$radLat1-$radLat2;//��γ��֮��,γ��<90
		$b=$radLng1-$radLng2;//������֮��γ��<180
		$s=2*asin(sqrt(pow(sin($a/2),2)+cos($radLat1)*cos($radLat2)*pow(sin($b/2),2)))*6378.137;
		return $s;//��λ������
	}
	
	public static function getSmallerLatFromSameLng($distance,$lat1)//$distance��λΪ������ݾ������ͬһ��������һ���ά�ȣ����ؽ�С��ά��
	{
		$a=180*$distance/(pi()*6378.137);
		$lat2=$lat1-$a;            //a=lat1-lat2
		return $lat2;
	}
	
	public static function getBiggerLatFromSameLng($distance,$lat1)//$distance��λΪ������ݾ������ͬһ��������һ���ά�ȣ����ؽϴ��ά��
	{
		$a=180*$distance/(pi()*6378.137);
		$lat2=$lat1+$a;          //a=lat2-lat1
		return $lat2;
	}
	
	public static function getSmallerLngFromSameLat($distance,$lat,$lng1)//$distance��λΪ������ݾ������ͬһά������һ��ľ��ȣ����ؽ�С�ľ���
	{
		$b=$distance/(111*cos(deg2rad($lat)));
		$lng2=$lng1-$b;    //b=lng1-lng2
		return $lng2;
	}
	
	public static function getBiggerLngFromSameLat($distance,$lat,$lng1)//$distance��λΪ������ݾ������ͬһά������һ��ľ��ȣ����ؽϴ�ľ���
	{
		$b=$distance/(111*cos(deg2rad($lat)));
		$lng2=$lng1+$b;    //b=lng2-lng1
		return $lng2;
	}
}
?>