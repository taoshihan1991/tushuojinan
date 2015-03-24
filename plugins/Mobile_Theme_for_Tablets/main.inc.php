<?php
/*
Plugin Name: Mobile Theme for Tablets
Version: 2.7.a
Description: Allow to apply the mobile theme by default for tablets
Plugin URI: http://piwigo.org/ext/extension_view.php?eid=666
Author: Julien1311
*/

//Check whether we are indeed included by Piwigo.
if (!defined('PHPWG_ROOT_PATH')) die('Hacking attempt!');

global $conf;

define('MTT_DIR' , basename(dirname(__FILE__)));
define('MTT_PATH' , PHPWG_PLUGINS_PATH.MTT_DIR.'/');
define('MTT_ADMIN',   get_root_url() . 'admin.php?page=plugin-'.MTT_DIR);

/* +-----------------------------------------------------------------------+
 * | Plugin admin                                                          |
 * +-----------------------------------------------------------------------+ */

// Add an entry to the plugins menu
add_event_handler('get_admin_plugin_menu_links', 'mtt_admin_menu');

function mtt_admin_menu($menu) {
	array_push(
		$menu, array(
			'NAME'  => 'Mobile Theme for Tablets',
			'URL'   => MTT_ADMIN,
		)
	);      
	return $menu;
}

/* +-----------------------------------------------------------------------+
 * | Plugin code                                                           |
 * +-----------------------------------------------------------------------+ */
include_once(MTT_PATH.'include/functions.inc.php');
add_event_handler('loading_lang', 'mtt_activate_mobile_theme');
?>