<?php
return array(
	//'配置项'=>'配置值'
	'URL_CASE_INSENSITIVE' => true,
	'DB_TYPE'		=>	'mysql',
	'DB_HOST'		=>	'localhost',
	'DB_NAME'		=>	'development',
	'DB_USER'		=>	'root',
	'DB_PWD'		=>	'pkuss',
	'DB_PREFIX'		=>	'',	
	'ROUTER_ON'		=>	true,
	'APP_DEBUG'     =>  false,
	'TOKEN_ON'      =>  false,
	'USER_AUTH_KEY' =>  'aid',
	TMPL_PARSE_STRING =>array(
		'.mobile'=>'Mobile',
		'api/v1/'=>'ApiV1'
	)
);
?>