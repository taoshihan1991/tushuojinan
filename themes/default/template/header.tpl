<!DOCTYPE html>
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
<meta charset="{$CONTENT_ENCODING}">
<meta name="generator" content="Piwigo (aka PWG), see piwigo.org">

{if isset($meta_ref)} 
{if isset($INFO_AUTHOR)}
<meta name="author" content="{$INFO_AUTHOR|strip_tags:false|replace:'"':' '}">
{/if}
{if isset($related_tags)}
<meta name="keywords" content="{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}{$tag.name}{/foreach}">
{/if}
{if isset($COMMENT_IMG)}
<meta name="description" content="{$COMMENT_IMG|strip_tags:false|replace:'"':' '}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{else}
<meta name="description" content="{$PAGE_TITLE}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{/if}
{/if}

<title>{if $PAGE_TITLE!=l10n('Home') && $PAGE_TITLE!=$GALLERY_TITLE}{$PAGE_TITLE} | {/if}{$GALLERY_TITLE}</title>
<link rel="shortcut icon" type="image/x-icon" href="{$ROOT_URL}{$themeconf.icon_dir}/favicon.ico">

<link rel="start" title="{'Home'|translate}" href="{$U_HOME}" >
<link rel="search" title="{'Search'|translate}" href="{$ROOT_URL}search.php" >

{if isset($first.U_IMG)   }<link rel="first" title="{'First'|translate}" href="{$first.U_IMG}" >{/if}
{if isset($previous.U_IMG)}<link rel="prev" title="{'Previous'|translate}" href="{$previous.U_IMG}" >{/if}
{if isset($next.U_IMG)    }<link rel="next" title="{'Next'|translate}" href="{$next.U_IMG}" >{/if}
{if isset($last.U_IMG)    }<link rel="last" title="{'Last'|translate}" href="{$last.U_IMG}" >{/if}
{if isset($U_UP)          }<link rel="up" title="{'Thumbnails'|translate}" href="{$U_UP}" >{/if}

{if isset($U_PREFETCH)    }<link rel="prefetch" href="{$U_PREFETCH}">{/if}
{if isset($U_CANONICAL)   }<link rel="canonical" href="{$U_CANONICAL}">{/if}

{if not empty($page_refresh)}<meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">{/if}

{strip}
{foreach from=$themes item=theme}
  {if $theme.load_css}
  {combine_css path="themes/`$theme.id`/theme.css" order=-10}
  {/if}
  {if !empty($theme.local_head)}
  {include file=$theme.local_head load_css=$theme.load_css}
  {/if}
{/foreach}

{combine_script id="jquery" load="footer"}
{/strip}

<!-- BEGIN get_combined -->
{get_combined_css}

{get_combined_scripts load='header'}
<!-- END get_combined -->

<!--[if lt IE 7]>
<script type="text/javascript" src="{$ROOT_URL}themes/default/js/pngfix.js"></script>
<![endif]-->

{if not empty($head_elements)}
{foreach from=$head_elements item=elt}
  {$elt}
{/foreach}
{/if}

<!--[扩展css,js文件]-->
<link rel="stylesheet" type="text/css" href="{$ROOT_URL}themes/default/extend.css">
<script type="text/javascript" src="{$ROOT_URL}themes/default/js/jquery.min.js"></script>
<script type="text/javascript" src="{$ROOT_URL}themes/default/js/jquery.SuperSlide.2.1.1.source.js"></script>
<script type="text/javascript" src="{$ROOT_URL}themes/default/js/extend.js"></script>
<!--[//扩展css,js文件]-->
</head>

<body id="{$BODY_ID}">
<!--[顶部]-->
<div id="allTop">
  <div class="width-980">
    <form action="" method="post" class="topLogin">
      <span>登录名</span>
      <input type="text" class="inp" />
      <span>密码</span>
      <input type="password" class="inp"/>
      <input type="submit" value="登录" class="ins" />
      <input type="checkbox" class="ina"> <span>自动登录</span>
      <a href="">忘记密码?</a>
    </form>
    <div class="topRight">
    <a href="register.php">注册通行证</a> | <a href="javascript:;">收藏本站</a>
    </div>
  </div>
</div>
<!--[//顶部]-->
<!--[导航栏]-->
<div id="nav">
  <div class="width-980">
    <a class="logo" href="index.php">
      <img src="{$ROOT_URL}themes/default/images/logo.jpg" />
    </a>
    <div class="navRight">
        <form class="search">
          <input class="inp" type="text" />
          <button type="submit" tabindex="8">搜索</button>
        </form>
        <ul class="navigator">
            <li><a href="index.php" style="border-left:0">首页</a></li>
            <li><a href="index.php?/category/6">今日济南</a></li>
            <li><a href="index.php?/category/6">时政图片</a></li>
            <li><a href="index.php?/category/6">行业风采</a></li>
            <li><a href="index.php?/category/6">县(市)区专辑</a></li>
            <li><a href="index.php?/category/6">会员作品</a></li>
            <li><a href="index.php?/category/6">专题活动</a></li>
            <li><a href="index.php?/category/6">城市景观</a></li>
            <li><a href="index.php?/category/6">自然风光</a></li>
            <li><a href="index.php?/category/6">会员专辑</a></li>
            <li><a href="index.php?/category/6">老照片</a></li>
        </ul>
    </div>

  </div>
</div>
<!--[//导航栏]-->
<!--[头部]-->
<div id="header">
  <div class="width-1010">
    <div class="logo"><a href="index.php">图说<span class="blue">济南</span></a></div>
    <div class="nav">
      <ul>
      
        <li><a href="index.php?/category/6">生态摄影</a></li>
        <li><a href="index.php?/category/5">社会人文</a></li>
        <li><a href="index.php?/category/1">自然风光</a></li>
        <li><a href="index.php?/category/3">城市景观</a></li>
        <li><a href="index.php?/category/2">城市建设</a></li>
      </ul>
    </div>
    <div class="user">
      <a href="identification.php">登录图说济南</a> | <a href="register.php">注册通行证</a>
    </div>
  </div>
</div>
<!--[//头部]-->




<div id="the_page" class="width-980">

{if not empty($header_msgs)}
<div class="header_msgs">
  {foreach from=$header_msgs item=elt}
  {$elt}<br>
  {/foreach}
</div>
{/if}

<div id="theHeader">{$PAGE_BANNER}</div>

{if not empty($header_notes)}
<div class="header_notes">
  {foreach from=$header_notes item=elt}
  <p>{$elt}</p>
  {/foreach}
</div>
{/if}
