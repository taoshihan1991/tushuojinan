<?php
/**
 * create the entry in the config table
 * @param string default parameters
 */
function mtt_install($config) {
	$query = 'INSERT INTO '.CONFIG_TABLE.' (param,value,comment) VALUES ("mobile_theme_for_tablets" ,"'.pwg_db_real_escape_string(serialize($config)).'", "Mobile Theme for Tablets plugin parameters");';
	pwg_query($query);
}

/**
 * update the config when plugin is activated or updated
 */
function mtt_update_db() {
	global $conf;
	include(dirname(__FILE__).'/config_default.inc.php');

	$config = array();
	if (isset($conf['mobile_theme_for_tablets']))
		$conf_mtt = unserialize($conf['mobile_theme_for_tablets']);
	
	if (isset($conf_mtt)) {
		foreach ($config_default as $key => $value) {
			if (isset($conf_mtt[$key]))
				$config[$key] = $conf_mtt[$key];
			else
				$config[$key] = $config_default[$key];
		}
		mtt_delete_conf("mobile_theme_for_tablets");
		mtt_install($config);
	} else {
		mtt_install($config_default);
	}
}

/**
 * delete the config
 * @param string param column of the table
 */
function mtt_delete_conf($where) {
	$query = 'DELETE FROM ' . CONFIG_TABLE . ' WHERE (param="'.$where.'");';
	pwg_query($query);
}
?>