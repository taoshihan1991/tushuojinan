<!--[主体]-->
<div id="bodyWraper">
	<!--[banner部分]-->
		<div class="topNew">
			<div class="newLeft">
				{foreach from=$cate8Data item=v key=k}
					{if $k==0}
						<p class="title"><a href="{$v.URL}">{$v.name}</a></p>
						<ul class="article">
					{else}
						<li><a href="{$v.URL}">{$v.name}</a></li>
					{/if}
				{/foreach}
						</ul>
				{foreach from=$cate7Data item=v key=k}
					{if $k==0}
						<p class="title"><a href="{$v.URL}">{$v.name}</a></p>
						<ul class="article">
					{else}
						<li><a href="{$v.URL}">{$v.name}</a></li>
					{/if}
				{/foreach}
						</ul>
			</div>
			<div class="newRight">
					<!--[轮播图]-->
					<div id="slideBox" class="slideBox">
						<div class="hd">
							<ul>
							{foreach from=$cate7Data item=v key=k}<li></li>{/foreach}
							</ul>
						</div>
						<div class="bd">
							<ul>
							{foreach from=$cate7Data item=v key=k}
								{assign var=derivative value=$pwg->derivative($derivative_params7, $v.src_image)}
								<li><a href="{$v.URL}" target="_blank"><img src="{$derivative->get_url()}" /></a></li>
							{/foreach}
							</ul>
						</div>
					</div>
					<!--[//轮播图]-->

			</div>
		</div>
	<!--[//banner部分]-->
	<!--[时政图片]-->
	<div id="politics">
		<div class="title">时政图片<span class="en">Political Pictures</span></div>
		<div class="politicsL">
			<!--[轮播图]-->
				<div id="politicSlide" class="politicSlide">
					<div class="hd">
						<ul>
							<b class="hd_l">[</b> 
							{foreach from=$cate10Data item=v key=k}
								<li><span>{$v.name}</span></li>
							{/foreach}
							<b class="hd_r">]</b>

						</ul>
					</div>
					<div class="bd">
						<ul>
						{foreach from=$cate10Data item=v key=k}
								{assign var=derivative value=$pwg->derivative($derivative_params10, $v.src_image)}
								<li><a href="{$v.URL}" target="_blank"><img src="{$derivative->get_url()}" /></a></li>
							{/foreach}
						</ul>
					</div>
				</div>
			<!--[//轮播图]-->
		</div>
		<div class="politicsR">
			<ul class="politicsPic">
				{foreach from=$cate11Data item=v key=k}
								{assign var=derivative value=$pwg->derivative($derivative_params11, $v.src_image)}
				{if $k<3}
				<li class="politicRec" {if ($k+1)%3==0}style="margin-right:0;"{/if}>
					<img src="{$derivative->get_url()}"/>
					<div class="cover f-trans">
						<a href="{$v.URL}" title="" class="name f-trans" target="_blank"><em>{$v.name}</em></a>
					</div>
				</li>
				{/if}
				{/foreach}
			</ul>
			<p class="clear"></p>
			<div class="focus">时政消息</div>
			<div class="focusList">
				<div class="focusListLeft">
					<ul>
						{foreach from=$cate12Data item=v key=k}
								<li><span>时政消息</span><a href="{$v.URL}">{$v.name}</a></li>
						{/foreach}
					</ul>
				</div>
				<div class="focusListRight">
					<ul>
						{foreach from=$cate13Data item=v key=k}
								<li><span>友好往来</span><a href="{$v.URL}">{$v.name}</a></li>
						{/foreach}
					</ul>
				</div>
			</div>

		</div>
	</div>
	<!--[//时政图片]-->
	<!--[行业风采]-->
	<div id="work">
		<div class="title">行业风采<span class="en">Country Album</span></div>
		<div class="workLeft">
			<div class="big">
				{foreach from=$cate14Data item=v key=k}
					{assign var=derivative value=$pwg->derivative($derivative_params14, $v.src_image)}
						<a href="{$v.URL}">
							<img src="{$derivative->get_url()}" />
						</a>
						<div class="cover">
							<p class="picname">{$v.name}</p>
						</div>
						{break}
				{/foreach}
			</div>
			<ul class="list">
				{foreach from=$cate14Data item=v key=k}
					{if $k>6}
						<li><span>[{$v.category.category_name}]</span><a href="{$v.URL}">{$v.name}</a></li>
					{/if}
				{/foreach}
			</ul>
		</div>
		<div class="workRight">
			<ul class="picList">
				{foreach from=$cate14Data item=v key=k name=cate14Data}
					{if 0<$k and $k<7}
					{assign var=derivative value=$pwg->derivative($derivative_params14, $v.src_image)}
					<li><a 
					{if ($smarty.foreach.cate14Data.iteration+2)%3==0}
						style="margin-right:0;" 
					{/if}
					 href="{$v.URL}" ><img src="{$derivative->get_url()}" />
						<p class="cover">{$v.name}</p>
					</a>
					</li>
					{/if}
					{if $k>=7}{break}{/if}
				{/foreach}
				<p class="clear"></p>
			</ul>
			<div class="workListBox">
				<p class="channelName"><span>外事侨务</span></p>
				<ul>
				{foreach from=$cate19Data item=v key=k}
						<li><a href="{$v.URL}">{$v.name}</a></li>
				{/foreach}
				</ul>
			</div>

			<div class="workListBox green">
				<p class="channelName"><span>工信交通</span></p>
				<ul>
					{foreach from=$cate15Data item=v key=k}
						<li><a href="{$v.URL}">{$v.name}</a></li>
					{/foreach}
				</ul>
			</div>

			<div class="workListBox blue" style="margin-right:0">
				<p class="channelName"><span>高新产业</span></p>
				<ul>
					{foreach from=$cate16Data item=v key=k}
						<li><a href="{$v.URL}">{$v.name}</a></li>
					{/foreach}
				</ul>
			</div>
		</div>
	</div>
	<!--[//行业风采]-->
	<!--[县区专辑]-->
	<div id="city">
		<div class="title">县区专辑<span class="en">Country Album</span></div>
		<div class="list">
			{foreach from=$cate20Data item=v key=k}
			{assign var=derivative value=$pwg->derivative($derivative_params20, $v.src_image)}
			<div class="box" {if ($k+1)%4==0}style="margin-right:0;"{/if}>
				<a href="{$v.URL}" class="pic"><img src="{$derivative->get_url()}" /></a>
				<a href="{$v.URL}" class="picname">{$v.name}</a>
				<div class="desc">
					<a href="{$v.URL}" class="archor"><img src="{$ROOT_URL}themes/default/images/new_570575.jpg" /></a>
					<p>{$v.comment}</p>
				</div>
			</div>
			{/foreach}
		</div>
	</div>
	<!--[//县区专辑]-->
	<!--[会员作品]-->
	<div id="memberPic">
		<div class="title">会员作品<span class="en">Members Work</span></div>
			<!--[轮播图]-->
				<div id="memberSlide" class="memberSlide ">
					<div class="hd">
						<ul>
						{foreach from=$cate21Data item=v key=k}
						{assign var=derivative value=$pwg->derivative($derivative_params21, $v.src_image)}
								<li>
									<p class="arrow">
										<img src="{$ROOT_URL}themes/default/images/member-active.png" />
									</p>
									<p class="memberRightTitle">{$v.name}</p>
									<p class="desc">
										{$v.comment} 
									</p>
								</li>
								{if $k>=4}{break}{/if}
							{/foreach}
						</ul>
					</div>
					<div class="bd">
						<ul>
						{foreach from=$cate21Data item=v key=k}
						{assign var=derivative value=$pwg->derivative($derivative_params21, $v.src_image)}
								<li><a href="{$v.URL}" ><img src="{$derivative->get_url()}" /></a></li>
							{if $k>=4}{break}{/if}
						{/foreach}
						</ul>
					</div>
				</div>
			<!--[//轮播图]-->
			<div class="menberNew">
				<p class="memberNewLeft"><span>最新作品</span>
				<b><img src="{$ROOT_URL}themes/default/images/arrow.jpg" /></b>
				</p>
				<ul class="list">
				{foreach from=$cate21Data item=v key=k}
					{if $k>=4}
						{assign var=derivative value=$pwg->derivative($derivative_params21, $v.src_image)}
					<li><a href="{$v.URL}" ><img src="{$derivative->get_url()}" /></a></li>
					{/if}
					{if $k>=8}{break}{/if}
				{/foreach}
				</ul>
			</div>
	</div>
	<!--[//会员作品]-->

	<!--[老照片]-->
	<div id="politics" class="old">
		<div class="title">老照片<span class="en">Old Pictures</span></div>
		<div class="politicsL">
			<!--[轮播图]-->
				<div id="oldSlide" class="politicSlide">
					<div class="hd">
						<ul>
							<b class="hd_l">[</b> 
								<li>
									<span class="oldLeftTitle">恭祝《图说济南》各位老师.网友羊年吉祥阖家团圆恭祝《图说济南》各位老师.网友羊年吉祥阖家团圆恭祝《图说济南》各位老师.网友羊年吉祥阖家团圆</span>
									<p class="desc">
										泺口黄河大桥是津浦铁路的咽喉要道，是北伐战争、中原大战、抗日战争、解放战争四次大战的见证者。在民国时期，它是亚洲跨度最大的铁路大桥，也是目前黄河上唯一一座百年铁路大桥。据了解，去年它还被评为全国第七批重点文物保护单位。 
									</p>
								</li>
								<li>
									<span class="oldLeftTitle">兴济园林.君子兰兴济园林.君子兰</span>
									<p class="desc">
										1960年，重汽前身济南汽车制造厂制造出中国第一辆重型汽车。 1960年，重汽前身济南汽车制造厂制造出中国第一辆重型汽车。  
									</p>
								</li>
								<li>
									<span class="oldLeftTitle">泉城鹈闹龙潭泉城鹈闹龙潭</span>
									<p class="desc">
										山东省济南第五中学。其前身为1893年(清光绪十九年)北美基督教长老会在济南华美街创办的“济美学馆”，当时学制四年或五年，课程设读经、古文、修身、英文、数学、理化、地理、中国历史等。这是外国人在济南开办的第一所中学，也是济南近代开办最早的中学。1912年改称“济美中学”，1930年与翰美女校合并，改称“齐鲁中学”。1932年4月齐鲁中学在山东省教育厅立案，校长为张子修。她的出现，在中国大地上开创了两个之最：最早男女同校的教会学校，最早由华人任校长的教会学校。济南解放后，1952年11月济南市人民政府接办，改为公立，定校名为“济南第五中学”，直至今日。济南日报  
									</p>
								</li> 
							<b class="hd_r">]</b>

						</ul>
					</div>
					<div class="bd">
						<ul>
								<li><a href="" ><img src="_data/i/upload/2015/03/17/20150317101730-b6b8ae62-me.jpg" /></a></li>
								<li><a href="" ><img src="_data/i/upload/2015/03/17/20150317101729-baadf751-me.jpg" /></a></li>
								<li><a href="" ><img src="_data/i/upload/2015/03/17/20150317101730-b6b8ae62-me.jpg" /></a></li>
						</ul>
					</div>
				</div>
			<!--[//轮播图]-->
		</div>
		<div class="politicsR">
			<ul class="politicsPic">
				{foreach from=$category_thumbnails item=v key=k}
				{assign var=derivative value=$pwg->derivative($derivative_params, $v.representative.src_image)}
				<li class="politicRec" {if ($k+1)%3==0}style="margin-right:0;"{/if}>
					<img src="{$derivative->get_url()}" height="188" class="albumPic">
					<div class="cover f-trans">
						<a href="{$v.URL}" title="" class="name f-trans" target="_blank"><em>{$v.NAME}[{$v.CAPTION_NB_IMAGES}]</em></a>
					</div>
				</li>
				{/foreach}
			</ul>
			<p class="clear"></p>
		</div>
	</div>
	<!--[//老照片]-->



	<!-- [index的相册] -->
<!-- <div class="channel">
		<div class="channel_l">LAST-ALBUM</div>
		<div class="channel_c">最新相册</div>
		<div class="channel_r"><a href="">更多+</a></div>
	</div>
	{if !empty($category_thumbnails)}
	<div class="albumList">
		<ul>
			<li class="rec rec-class">
				<p class="type">爱济南</p>
				<p class="type">爱生活</p>
				<p class="line"></p>
			</li>
			{foreach from=$category_thumbnails item=v key=k}
			{assign var=derivative value=$pwg->derivative($derivative_params, $v.representative.src_image)}
			<li class="rec {if ($k+1)%4==0}mr-0{/if}">
				<img src="{$derivative->get_url()}" height="188" class="albumPic">
				<div class="cover f-trans">
					<a href="{$v.URL}" title="南国之樱" class="name f-trans" target="_blank"><em>{$v.NAME}[{$v.CAPTION_NB_IMAGES}]</em></a>
				</div>
			</li>
			{if ($k+1)==5}
			 <li class="rec rec-class">
				<p class="type">新自然</p>
				<p class="type">新风光</p>
				<p class="line"></p>
			 </li>
			 {/if}
			 {if ($k+1)==10}
			 <li class="rec rec-class">
				<p class="type">记录下来</p>
				<p class="type">就是胜利</p>
				<p class="line"></p>
			 </li>
			 {/if}
			{/foreach}

		</ul>
		<p class="clear"></p>
	</div>
	{/if} -->
	<!-- [//index的相册] -->

	<!--[搜索排序]-->
	{if !empty($THUMBNAILS)}
		<div class="loader"><img src="{$ROOT_URL}{$themeconf.img_dir}/ajax_loader.gif"></div>
		<ul class="thumbnails" id="thumbnails">
		  {$THUMBNAILS}
		</ul>
	{/if}
	{if !empty($thumb_navbar)}
	{include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$thumb_navbar}
	{/if}
	<!--[//搜索排序]-->


</div>
<!--[//主体]-->



{combine_script id='core.switchbox' load='async' require='jquery' path='themes/default/js/switchbox.js'}
{$MENUBAR}


{if isset($errors) or isset($infos)}
<div class="content messages{if isset($MENUBAR)} contentWithMenu{/if}">
{include file='infos_errors.tpl'}
</div>
{/if}

{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">
<div class="titrePage{if isset($chronology.TITLE)} calendarTitleBar{/if}">
	<ul class="categoryActions">
{if !empty($image_orders)}
		<li>{strip}<a id="sortOrderLink" title="{'Sort order'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-sort"></span><span class="pwg-button-text">{'Sort order'|@translate}</span>
		</a>
		<div id="sortOrderBox" class="switchBox">
			<div class="switchBoxTitle">{'Sort order'|@translate}</div>
			{foreach from=$image_orders item=image_order name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
			{if $image_order.SELECTED}
			<span>&#x2714; </span>{$image_order.DISPLAY}
			{else}
			<span style="visibility:hidden">&#x2714; </span><a href="{$image_order.URL}" rel="nofollow">{$image_order.DISPLAY}</a>
			{/if}
			{/foreach}
		</div>
		{footer_script}(SwitchBox=window.SwitchBox||[]).push("#sortOrderLink", "#sortOrderBox");{/footer_script}
		{/strip}</li>
{/if}

{if !empty($image_derivatives)}
		<li>{strip}<a id="derivativeSwitchLink" title="{'Photo sizes'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-sizes"></span><span class="pwg-button-text">{'Photo sizes'|@translate}</span>
		</a>
		<div id="derivativeSwitchBox" class="switchBox">
			<div class="switchBoxTitle">{'Photo sizes'|@translate}</div>
			{foreach from=$image_derivatives item=image_derivative name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
			{if $image_derivative.SELECTED}
			<span>&#x2714; </span>{$image_derivative.DISPLAY}
			{else}
			<span style="visibility:hidden">&#x2714; </span><a href="{$image_derivative.URL}" rel="nofollow">{$image_derivative.DISPLAY}</a>
			{/if}
			{/foreach}
		</div>
		{footer_script}(SwitchBox=window.SwitchBox||[]).push("#derivativeSwitchLink", "#derivativeSwitchBox");{/footer_script}
		{/strip}</li>
{/if}

{if isset($favorite)}
		<li id="cmdFavorite"><a href="{$favorite.U_FAVORITE}" title="{'delete all photos from your favorites'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-favorite-del"></span><span class="pwg-button-text">{'delete all photos from your favorites'|@translate}</span>
		</a></li>
{/if}
{if isset($U_CADDIE)}
		<li id="cmdCaddie"><a href="{$U_CADDIE}" title="{'Add to caddie'|@translate}" class="pwg-state-default pwg-button">
			<span class="pwg-icon pwg-icon-caddie-add"></span><span class="pwg-button-text">{'Caddie'|@translate}</span>
		</a></li>
{/if}
{if isset($U_EDIT)}
		<li id="cmdEditAlbum"><a href="{$U_EDIT}" title="{'Edit album'|@translate}" class="pwg-state-default pwg-button">
			<span class="pwg-icon pwg-icon-category-edit"></span><span class="pwg-button-text">{'Edit'|@translate}</span>
		</a></li>
{/if}
{if isset($U_SEARCH_RULES)}
		{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
		<li><a href="{$U_SEARCH_RULES}" onclick="popuphelp(this.href); return false;" title="{'Search rules'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-help"></span><span class="pwg-button-text">(?)</span>
		</a></li>
{/if}
{if isset($U_SLIDESHOW)}
		<li id="cmdSlideshow">{strip}<a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-slideshow"></span><span class="pwg-button-text">{'slideshow'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_FLAT)}
		<li>{strip}<a href="{$U_MODE_FLAT}" title="{'display all photos in all sub-albums'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-category-view-flat"></span><span class="pwg-button-text">{'display all photos in all sub-albums'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_NORMAL)}
		<li>{strip}<a href="{$U_MODE_NORMAL}" title="{'return to normal view mode'|@translate}" class="pwg-state-default pwg-button">
			<span class="pwg-icon pwg-icon-category-view-normal"></span><span class="pwg-button-text">{'return to normal view mode'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_POSTED)}
		<li>{strip}<a href="{$U_MODE_POSTED}" title="{'display a calendar by posted date'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-calendar"></span><span class="pwg-button-text">{'Calendar'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_CREATED)}
		<li>{strip}<a href="{$U_MODE_CREATED}" title="{'display a calendar by creation date'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-camera-calendar"></span><span class="pwg-button-text">{'Calendar'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
	</ul>

<h2>{$TITLE}</h2>

{if isset($chronology_views)}
<div class="calendarViews">{'View'|@translate}:
	<a id="calendarViewSwitchLink" href="#">
	{foreach from=$chronology_views item=view}{if $view.SELECTED}{$view.CONTENT}{/if}{/foreach}
	</a>
	<div id="calendarViewSwitchBox" class="switchBox">
		{foreach from=$chronology_views item=view name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
		<span{if !$view.SELECTED} style="visibility:hidden"{/if}>&#x2714; </span><a href="{$view.VALUE}">{$view.CONTENT}</a>
		{/foreach}
	</div>
	{footer_script}(SwitchBox=window.SwitchBox||[]).push("#calendarViewSwitchLink", "#calendarViewSwitchBox");{/footer_script}
</div>
{/if}

{if isset($chronology.TITLE)}
<h2 class="calendarTitle">{$chronology.TITLE}</h2>
{/if}

</div>{* <!-- titrePage --> *}

{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

{if !empty($no_search_results)}
<p class="search_results">{'No results for'|@translate} :
	<em><strong>
	{foreach $no_search_results as $res}
	{if !$res@first} &mdash; {/if}
	{$res}
	{/foreach}
	</strong></em>
</p>
{/if}

{if !empty($category_search_results)}
<p class="search_results">{'Album results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
	<em><strong>
	{foreach from=$category_search_results item=res name=res_loop}
	{if !$smarty.foreach.res_loop.first} &mdash; {/if}
	{$res}
	{/foreach}
	</strong></em>
</p>
{/if}

{if !empty($tag_search_results)}
<p class="search_results">{'Tag results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
	<em><strong>
	{foreach from=$tag_search_results item=tag name=res_loop}
	{if !$smarty.foreach.res_loop.first} &mdash; {/if} <a href="{$tag.URL}">{$tag.name}</a>
	{/foreach}
	</strong></em>
</p>
{/if}

{if isset($FILE_CHRONOLOGY_VIEW)}
{include file=$FILE_CHRONOLOGY_VIEW}
{/if}

{if !empty($CONTENT_DESCRIPTION)}
<div class="additional_info">
	{$CONTENT_DESCRIPTION}
</div>
{/if}

{if !empty($CONTENT)}{$CONTENT}{/if}

{if !empty($CATEGORIES)}{$CATEGORIES}{/if}

{if !empty($cats_navbar)}
	{include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$cats_navbar}
{/if}

{if !empty($THUMBNAILS)}
<div class="loader"><img src="{$ROOT_URL}{$themeconf.img_dir}/ajax_loader.gif"></div>
<ul class="thumbnails" id="thumbnails">
  {$THUMBNAILS}
</ul>
{/if}
{if !empty($thumb_navbar)}
	{include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$thumb_navbar}
{/if}

{if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>{* <!-- content --> *}
{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}



