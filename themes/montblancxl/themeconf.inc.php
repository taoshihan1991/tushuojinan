<?php
/*
Theme Name: Montblanc XL
Version: 2.7.a
Description: Fixed 860px width, graphical banner, horizontal drop down menu.
Theme URI: http://piwigo.org/ext/extension_view.php?eid=133
Author: P@t
Author URI: http://www.gauchon.fr
*/

$themeconf = array(
  'parent'      => 'default',
  'icon_dir'    => 'themes/montblancxl/icon',
  'local_head'  => 'local_head.tpl',
  'colorscheme' => 'clear',
);


add_event_handler('loc_begin_page_header', 'set_mbxl_header');

function set_mbxl_header()
{
  global $page, $conf, $template;

  $config = unserialize($conf['MontblancXL']);

  if (isset($page['body_id']) and $page['body_id'] == 'theCategoryPage')
  {
    $header = isset($page['category']) ? $config['categories'] : $config['home'];
  }
  elseif (isset($page['body_id']) and $page['body_id'] == 'thePicturePage')
  {
    $header = $config['picture'];
  }
  else
  {
    $header = $config['other'];
  }

  $template->assign('display_mbxl_banner', $header);
}

?>
