<?php
/**
 * activate the mobile theme
 */
function mtt_activate_mobile_theme() {
	global $conf;

	$conf_mtt = unserialize($conf['mobile_theme_for_tablets']);
	
	if (isset($conf_mtt['devices'][pwg_get_session_var('device')]) && $conf_mtt['devices'][pwg_get_session_var('device')] == '1') {
			pwg_set_session_var('mobile_theme', true);
		} else {
			pwg_set_session_var('mobile_theme', false);
		}
}
?>