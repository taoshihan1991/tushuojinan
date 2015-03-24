<?php

function theme_activate($id, $version, &$errors)
{
  global $prefixeTable, $conf;

  if (!isset($conf['MontblancXL']))
  {
    $config = array(
      'home'       => true,
      'categories' => true,
      'picture'    => false,
      'other'      => true,
      );
      
    $query = '
INSERT INTO ' . CONFIG_TABLE . ' (param,value,comment)
VALUES ("MontblancXL" , "'.addslashes(serialize($config)).'" , "MontblancXL parameters");';

    pwg_query($query);
  }
}

function theme_deactivate()
{
  global $prefixeTable;

  $query = 'DELETE FROM ' . CONFIG_TABLE . ' WHERE param="MontblancXL" LIMIT 1;';
  pwg_query($query);
}

?>