<?php

load_language('theme.lang', PHPWG_THEMES_PATH.'montblancxl/');

$options = array(
  'home',
  'categories',
  'picture',
  'other',
);

if (isset($_POST['submit']))
{
  foreach ($options as $option)
  {
    $_POST['mbxl'][$option] = empty($_POST['mbxl'][$option]) ? false : true;
  }

  $query = '
UPDATE '.CONFIG_TABLE.'
SET value = "'.addslashes(serialize($_POST['mbxl'])).'"
WHERE param = "MontblancXL"
;';
  pwg_query($query);

  array_push($page['infos'], l10n('Information data registered in database'));

  load_conf_from_db();
}

$template->set_filenames(array(
    'theme_admin_content' => dirname(__FILE__) . '/admin.tpl'));

$template->assign('mbxl', unserialize($conf['MontblancXL']));

$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');


?>