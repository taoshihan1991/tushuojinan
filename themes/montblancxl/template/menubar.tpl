{if !empty($blocks) }
<div id="menubar">
  {if isset($U_START_FILTER)}
  <a href="{$U_START_FILTER}" title="{'display only recently posted images'|@translate}" rel="nofollow"><img src="{$ROOT_URL}{$themeconf.icon_dir}/start_filter.png" class="button" alt="start filter"></a>
  {/if}
  {if isset($U_STOP_FILTER)}
  <a href="{$U_STOP_FILTER}" title="{'return to the display of all images'|@translate}"><img src="{$ROOT_URL}{$themeconf.icon_dir}/stop_filter.png" class="button" alt="stop filter"></a>
  {/if}
	{foreach from=$blocks key=id item=block}
	<dl id="{$id}">
		{if not empty($block->template)}
		{include file=$block->template|@get_extent:$id }
		{else}
		{$block->raw_content}
		{/if}
	</dl>
	{/foreach}
</div>
{/if}