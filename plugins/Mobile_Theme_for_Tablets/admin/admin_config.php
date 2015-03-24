<?php
//Initialization
$conf_mtt = unserialize($conf['mobile_theme_for_tablets']);

//Save config
if (isset($_POST['submit'])) { 
	foreach ($conf_mtt['devices'] as $device => $value) {
		if(isset($_POST['mtt_devices'][$device]) && $_POST['mtt_devices'][$device] == '1')
			$conf_mtt['devices'][$device] = '1';
		else
			$conf_mtt['devices'][$device] = '0';
	}
	
	//Save
	conf_update_param('mobile_theme_for_tablets', serialize($conf_mtt));
	array_push($page['infos'], l10n('Information data registered in database'));
}

//Parameters of the template
$template->assign('mtt_devices',$conf_mtt['devices']);

//Add our template to the global template
$template->set_filenames(
	array(
		'plugin_admin_content_general' => dirname(__FILE__).'/admin_config.tpl'
	)
);
 
//Assign the template contents to ADMIN_CONTENT
$template->assign_var_from_handle('ADMIN_CONTENT', 'plugin_admin_content_general');
?>