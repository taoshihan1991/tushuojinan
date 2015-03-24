<?php
/*
图说济南首页
@author 济南道芬
*/
define('PHPWG_ROOT_PATH','./');
include_once( PHPWG_ROOT_PATH.'include/common.inc.php' );
include(PHPWG_ROOT_PATH.'include/section_init.inc.php');

//验证权限，无权退出 ACCESS_GUEST权限状态1
check_status(ACCESS_GUEST);

//验证是否允许浏览此分类
if (isset($page['category'])){
  check_restrictions($page['category']['id']);
}
if ($page['start']>0 && $page['start']>=count($page['items'])){
  page_not_found('', duplicate_index_url(array('start'=>0)));
}

trigger_notify('loc_begin_index');

//get传递image_order,设置session
if (isset($_GET['image_order'])){
  if ( (int)$_GET['image_order'] > 0){
    pwg_set_session_var('image_order', (int)$_GET['image_order']);
  }else{
    pwg_unset_session_var('image_order');
  }
  //跳转到生成的index的url
  redirect(duplicate_index_url(array(),array('start')));
}

if (isset($_GET['display'])){
  $page['meta_robots']['noindex']=1;
  if (array_key_exists($_GET['display'], ImageStdParams::get_defined_type_map())){
    pwg_set_session_var('index_deriv', $_GET['display']);
  }
}

//-------------------------------------------------------------- 初始化
// navigation bar导航条
$page['navigation_bar'] = array();
if (count($page['items']) > $page['nb_image_page']){
  $page['navigation_bar'] = create_navigation_bar(
    duplicate_index_url(array(), array('start')),
    count($page['items']),
    $page['start'],
    $page['nb_image_page'],
    true, 'start'
    );
}
//分配 thumb_navbar
$template->assign('thumb_navbar', $page['navigation_bar'] );

// caddie filling :-)
if (isset($_GET['caddie'])){
  fill_caddie($page['items']);
  redirect(duplicate_index_url());
}

if (isset($page['is_homepage']) and $page['is_homepage']){
  $canonical_url = get_gallery_home_url();
}else{

  $start = $page['nb_image_page'] * round($page['start'] / $page['nb_image_page']);

  if ($start>0 && $start >= count($page['items']) )
  {
    $start -= $page['nb_image_page'];
  }
  $canonical_url = duplicate_index_url(array('start' => $start));
}
//index.php?/categories 
$template->assign('U_CANONICAL', $canonical_url);

//-------------------------------------------------------------- page title
$title = $page['title'];
$template_title = $page['section_title'];
if (count($page['items']) > 0){
  $template_title.= ' ['.count($page['items']).']';
}
//<a href="/piwigo/">主页</a>
$template->assign('TITLE', $template_title);

//-------------------------------------------------------------- menubar
include( PHPWG_ROOT_PATH.'include/menubar.inc.php');
//设置文件名
$template->set_filename('index', 'index.tpl');

// +-----------------------------------------------------------------------+
// |  index page (categories, thumbnails, search, calendar, random, etc.)  |
// +-----------------------------------------------------------------------+
if ( empty($page['is_external']) or !$page['is_external'] )
{
  //----------------------------------------------------- template initialization
  $page['body_id'] = 'theCategoryPage';
  
  if (isset($page['flat']) or isset($page['chronology_field']))
  {
    $template->assign(
      'U_MODE_NORMAL',
      duplicate_index_url( array(), array('chronology_field', 'start', 'flat') )
      );
  }

  if ($conf['index_flat_icon'] and !isset($page['flat']) and 'categories' == $page['section'])
  {
    $template->assign(
      'U_MODE_FLAT',
      duplicate_index_url(array('flat' => ''), array('start', 'chronology_field'))
      );
  }

  if (!isset($page['chronology_field']))
  {
    $chronology_params = array(
      'chronology_field' => 'created',
      'chronology_style' => 'monthly',
      'chronology_view' => 'list',
      );
    if ($conf['index_created_date_icon'])
    {
      $template->assign(
        'U_MODE_CREATED',
        duplicate_index_url( $chronology_params, array('start', 'flat') )
        );
    }
    if ($conf['index_posted_date_icon'])
    {
      $chronology_params['chronology_field'] = 'posted';
      $template->assign(
        'U_MODE_POSTED',
        duplicate_index_url( $chronology_params, array('start', 'flat') )
        );
    }
  }
  else
  {
    if ($page['chronology_field'] == 'created')
    {
      $chronology_field = 'posted';
    }
    else
    {
      $chronology_field = 'created';
    }
    if ($conf['index_'.$chronology_field.'_date_icon'])
    {
      $url = duplicate_index_url(
                array('chronology_field'=>$chronology_field ),
                array('chronology_date', 'start', 'flat')
              );
      $template->assign(
          'U_MODE_'.strtoupper($chronology_field),
          $url
        );
    }
  }

  if ('search' == $page['section'])
  {
    $template->assign(
      'U_SEARCH_RULES',
      get_root_url().'search_rules.php?search_id='.$page['search']
      );
  }

  if (isset($page['category']) and is_admin())
  {
    $template->assign(
      'U_EDIT',
      get_root_url().'admin.php?page=album-'.$page['category']['id']
      );
  }

  if (is_admin() and !empty($page['items']))
  {
    $template->assign(
      'U_CADDIE',
       add_url_params(duplicate_index_url(), array('caddie'=>1) )
      );
  }

  if ( $page['section']=='search' and $page['start']==0 and
      !isset($page['chronology_field']) and isset($page['qsearch_details']) )
  {
    $cats = array_merge(
        (array)@$page['qsearch_details']['matching_cats_no_images'],
        (array)@$page['qsearch_details']['matching_cats'] );
    if (count($cats))
    {
      usort($cats, 'name_compare');
      $hints = array();
      foreach ( $cats as $cat )
      {
        $hints[] = get_cat_display_name( array($cat), '' );
      }
      $template->assign( 'category_search_results', $hints);
    }

    $tags = (array)@$page['qsearch_details']['matching_tags'];
    foreach ( $tags as $tag )
    {
      $tag['URL'] = make_index_url(array('tags'=>array($tag)));
      $template->append( 'tag_search_results', $tag);
    }
    
    if (empty($page['items']))
    {
      $template->append( 'no_search_results', htmlspecialchars($page['qsearch_details']['q']));
    }
    elseif (!empty($page['qsearch_details']['unmatched_terms']))
    {
      $template->assign( 'no_search_results', array_map('htmlspecialchars', $page['qsearch_details']['unmatched_terms']));
    }
  }

  // image order
  if ( $conf['index_sort_order_input']
      and count($page['items']) > 0
      and $page['section'] != 'most_visited'
      and $page['section'] != 'best_rated')
  {
    $preferred_image_orders = get_category_preferred_image_orders();
    $order_idx = pwg_get_session_var( 'image_order', 0 );
    
    // get first order field and direction
    $first_order = substr($conf['order_by'], 9);
    if (($pos = strpos($first_order, ',')) !== false)
    {
      $first_order = substr($first_order, 0, $pos);
    }
    $first_order = trim($first_order);
    
    $url = add_url_params(
            duplicate_index_url(),
            array('image_order' => '')
          );
    $tpl_orders = array();
    $order_selected = false;
    
    foreach ($preferred_image_orders as $order_id => $order)
    {
      if ($order[2])
      {
        // force select if the field is the first field of order_by
        if (!$order_selected && $order[1]==$first_order)
        {
          $order_idx = $order_id;
          $order_selected = true;
        }
        
        $tpl_orders[ $order_id ] = array(
          'DISPLAY' => $order[0],
          'URL' => $url.$order_id,
          'SELECTED' => $order_idx==$order_id,
          );
      }
    }
    
    $tpl_orders[0]['SELECTED'] = !$order_selected; // unselect "Default" if another one is selected
    
    $template->assign('image_orders', $tpl_orders);
  }

  // category comment
  if ($page['start']==0 and !isset($page['chronology_field']) and !empty($page['comment']) )
  {
    $template->assign('CONTENT_DESCRIPTION', $page['comment'] );
  }

  if ( isset($page['category']['count_categories']) and $page['category']['count_categories']==0 )
  {// count_categories might be computed by menubar - if the case unassign flat link if no sub albums
    $template->clear_assign('U_MODE_FLAT');
  }

  //------------------------------------------------------ main part : thumbnails
  if (0==$page['start'] && !isset($page['flat']) && !isset($page['chronology_field']) && ('recent_cats'==$page['section'] or 'categories'==$page['section'])
    and (!isset($page['category']['count_categories']) or $page['category']['count_categories']>0 )
  )
  {

    include(PHPWG_ROOT_PATH.'include/category_cats.inc.php');
  }

  if ( !empty($page['items']) ){

    include(PHPWG_ROOT_PATH.'include/category_default.inc.php');
    $url = add_url_params(
            duplicate_index_url(),
            array('display' => '')
          );
    $selected_type = $template->get_template_vars('derivative_params')->type;
    $template->clear_assign( 'derivative_params' );
    $type_map = ImageStdParams::get_defined_type_map();
    unset($type_map[IMG_XXLARGE], $type_map[IMG_XLARGE]);
    foreach($type_map as $params){
      $template->append(
        'image_derivatives',
        array(
          'DISPLAY' => l10n($params->type),
          'URL' => $url.$params->type,
          'SELECTED' => ($params->type == $selected_type ? true:false),
          )
        );
    }

  }

  // slideshow
  // execute after init thumbs in order to have all picture informations
  if (!empty($page['cat_slideshow_url'])){
    if (isset($_GET['slideshow'])){
      redirect($page['cat_slideshow_url']);
    }
    elseif ($conf['index_slideshow_icon'])
    {
      $template->assign('U_SLIDESHOW', $page['cat_slideshow_url']);
    }
  }
}

//------------------------------------------------------------ end
include(PHPWG_ROOT_PATH.'include/page_header.php');
trigger_notify('loc_end_index');
/*刷新session里面的page信息*/
flush_page_messages();
/*编译首页按钮*/
$template->parse_index_buttons();

/*载入编译分类模板文件*/
if(!empty($page['category'])){
  $template->set_filenames(array('category'=>'category.tpl'));
  $template->pparse('category');
}else{


  /*焦点新闻*/
  $cate7Data=getCatePic(7,IMG_MEDIUM);
  $template->assign('cate7Data', $cate7Data);
  
  /*今日济南*/
  $cate8Data=getCatePic(8);
  $template->assign('cate8Data', $cate8Data);

  /*时政图片->领导活动*/
  $cate10Data=getCatePic(10,IMG_XXSMALL);
  $template->assign('cate10Data', $cate10Data);

  /*时政图片->政府会议*/
  $cate11Data=getCatePic(11,IMG_XXSMALL);
  $template->assign('cate11Data', $cate11Data);

  /*时政图片->市政消息*/
  $cate12Data=getCatePic(12);
  $template->assign('cate12Data', $cate12Data);

  /*时政图片->友好往来*/
  $cate13Data=getCatePic(13);
  $template->assign('cate13Data', $cate13Data);

  /*行业风采*/
  $cate14Data=getPidCatePic(14,IMG_XSMALL);
  $template->assign('cate14Data', $cate14Data);

  /*行业风采->外事侨务*/
  $cate19Data=getCatePic(19);
  $template->assign('cate19Data', $cate19Data);

  /*行业风采->工信交通*/
  $cate15Data=getCatePic(15);
  $template->assign('cate15Data', $cate15Data);

  /*行业风采->高新产业*/
  $cate16Data=getCatePic(16);
  $template->assign('cate16Data', $cate16Data);

  /*县区专辑*/
  $cate20Data=getCatePic(20,IMG_XXSMALL);
  $template->assign('cate20Data', $cate20Data);

  /*会员作品*/
  $cate21Data=getCatePic(21,IMG_MEDIUM);
  $template->assign('cate21Data', $cate21Data);

  /*老照片*/
  $cate21Data=getCatePic(21,IMG_MEDIUM);
  $template->assign('cate21Data', $cate21Data);



  /*载入编译首页模板文件*/
  $template->pparse('index');
}

/*插入history表*/
pwg_log();
include(PHPWG_ROOT_PATH.'include/page_tail.php');
?>
