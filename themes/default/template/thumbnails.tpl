{*define_derivative name='derivative_params' width=160 height=90 crop=true*}
<div class="albumList">
		<ul>
			<li class="rec rec-class">
				<p class="type">爱济南</p>
				<p class="type">爱生活</p>
				<p class="line"></p>
			</li>
			{foreach from=$thumbnails item=v key=k}
			{assign var=derivative value=$pwg->derivative($derivative_params, $v.src_image)}
			<li class="rec {if ($k+1)%4==0}mr-0{/if}">
				<img src="{$derivative->get_url()}" height="188" class="albumPic">
				<div class="cover f-trans">
					<a href="{$v.URL}" title="南国之樱" class="name f-trans" target="_blank"><em>{$v.NAME}</em></a>
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

<!-- 
{if !empty($thumbnails)}{strip}
{*define_derivative name='derivative_params' width=160 height=90 crop=true*}
{html_style}
{*Set some sizes according to maximum thumbnail width and height*}
.thumbnails SPAN,
.thumbnails .wrap2 A,
.thumbnails LABEL{ldelim}
	width: {$derivative_params->max_width()+2}px;
}

.thumbnails .wrap2{ldelim}
	height: {$derivative_params->max_height()+3}px;
}
{if $derivative_params->max_width() > 600}
.thumbLegend {ldelim}font-size: 130%}
{else}
{if $derivative_params->max_width() > 400}
.thumbLegend {ldelim}font-size: 110%}
{else}
.thumbLegend {ldelim}font-size: 90%}
{/if}
{/if}
{/html_style}
{footer_script}
  var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png", max_requests = {$maxRequests};
{/footer_script}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}
{if !$derivative->is_cached()}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
<li>
	<span class="wrap1">
		<span class="wrap2">
		<a href="{$thumbnail.URL}">
			<img class="thumbnail" {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}{$themeconf.icon_dir}/img_small.png" data-src="{$derivative->get_url()}"{/if} alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}">
		</a>
		</span>
		{if $SHOW_THUMBNAIL_CAPTION }
		<span class="thumbLegend">
		<span class="thumbName">{$thumbnail.NAME}</span>
		{if !empty($thumbnail.icon_ts)}
		<img title="{$thumbnail.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent.png" alt="(!)">
		{/if}
		{if isset($thumbnail.NB_COMMENTS)}
		<span class="{if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
		<br>
		{$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)}
		</span>
		{/if}

		{if isset($thumbnail.NB_HITS)}
		<span class="{if 0==$thumbnail.NB_HITS}zero {/if}nb-hits">
		<br>
		{$pwg->l10n_dec('%d hit', '%d hits',$thumbnail.NB_HITS)}
		</span>
		{/if}
		</span>
		{/if}
	</span>
	</li>
{/foreach}{/strip}
{/if}
 -->