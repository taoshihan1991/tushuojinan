
<div id="copyright">
  {if isset($debug.TIME)}
    {'Page generated in'|translate} {$debug.TIME} ({$debug.NB_QUERIES} {'SQL queries in'|translate} {$debug.SQL_TIME}) -
  {/if}

{*
    Please, do not remove this copyright. If you really want to,
    contact us on http://piwigo.org to find a solution on how
    to show the origin of the script...
*}

  {'Powered by'|translate}	<a href="{$PHPWG_URL}" class="Piwigo">Piwigo</a>
  {$VERSION}
  {if isset($CONTACT_MAIL)}
  - <a href="mailto:{$CONTACT_MAIL}?subject={'A comment on your site'|translate|@escape:url}">{'Contact webmaster'|translate}</a>
  {/if}
  {if isset($TOGGLE_MOBILE_THEME_URL)}
  - {'View in'|translate} : <a href="{$TOGGLE_MOBILE_THEME_URL}">{'Mobile'|translate}</a> | <b>{'Desktop'|translate}</b>
  {/if}
  
  {if isset($footer_elements)}
  {foreach from=$footer_elements item=elt}
    {$elt}
  {/foreach}
  {/if}
</div>{* <!-- copyright --> *}

{if isset($debug.QUERIES_LIST)}
<div id="debug">
  {$debug.QUERIES_LIST}
</div>
{/if}
</div>{* <!-- the_page --> *}




<!--[友情链接]-->
<div id="friendLink">
  <div  class="width-980">
    <div class="title">友情链接</div> 
    <ul>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
      <li><a href="">大众人才网</a></li>
    </ul>
    <p class="clear"></p>
  </div>
</div>
<!--[//友情链接]-->


<!--[立即注册]-->
<!-- <div id="signup">
  <a href="register.php" target="_blank" class="signupBtn">→ 立即注册，享受济南之旅</a>
</div> -->
<!--[//立即注册]-->

<!--[底部版权]-->
<div id="bottomCopyright">
  <div class="width-980">
    <div class="bottomLeft">
      <a href="index.php"  class="bottomLogo"><img src="{$ROOT_URL}themes/default/images/bottom_logo.jpg" /></a>
      <p class="intro">
        “济南政府网”由济南市人民政府主办，济南市人民政府办公厅承办，济南市信息中心负责技术支持，是市政府设立的面向公众和社会的政务外网门户。
      </p>

    </div>
    <div class="bottomMid">
      <p class="aboutUs">关于我们</p>
      <ul>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
        <li><a href="">关于我们</a></li>
      </ul>
    </div>
    <div class="bottomRight">
      <p class="beian">图说济南  鲁ICP备20150320</p>
      <p class="banquan">
        图说济南版权所有 © 2015-2016
      </p>
    </div>
  </div>
 <!--  <p>图说济南版权所有 © 2015-2016&nbsp;&nbsp;&nbsp;<a rel="nofollow" target="_blank" href="http://www.miibeian.gov.cn">鲁ICP备20090191号</a><a rel="nofollow" target="_blank" href="admin.php">后台管理</a></p> -->
</div>
<!--[//底部版权]-->
</body>
</html>