<?php
if (!defined('PHPWG_ROOT_PATH')) die('Hacking attempt!');

function plugin_install() {
	include_once(dirname(__FILE__).'/install/functions.inc.php');
	include_once(dirname(__FILE__).'/install/config_default.inc.php');

	mtt_install($config_default);
}

function plugin_activate() {
	include_once(dirname(__FILE__).'/install/functions.inc.php');
	
	mtt_update_db();
}

function plugin_uninstall() {
	include_once(dirname(__FILE__).'/install/functions.inc.php');

	mtt_delete_conf("mobile_theme_for_tablets");
}

?>