<?php
//Chech whether we are indeed included by Piwigo.
if (!defined('MTT_PATH')) die('Hacking attempt!');

//Load globals
global $conf;

//Load translation files
load_language('plugin.lang', MTT_PATH);

//Check access and exit when user status is not ok
check_status(ACCESS_ADMINISTRATOR);

include_once(MTT_PATH.'admin/admin_config.php');
?>