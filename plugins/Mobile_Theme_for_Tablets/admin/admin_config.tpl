<div class="titrePage">
  <h2>{'mtt_name'|@translate}</h2>
</div>

<form method="post" action="" class="properties" ENCTYPE="multipart/form-data"> 
	<fieldset>
    <legend>{'mtt_configuration'|@translate}</legend>
	<p>
		{'mtt_devices_description'|@translate}
	</p>
	<p>
		{foreach from=$mtt_devices item=mtt_device_mobile key=mtt_device_name}
			<label>
				<input type="checkbox" name="mtt_devices[{$mtt_device_name}]" value="1" {if $mtt_device_mobile eq 1}checked = "checked"{/if}>
				{'mtt_'|cat:$mtt_device_name|@translate} - {'mtt_device_description.'|cat:$mtt_device_name|@translate}
			</label>
			<br />
		{/foreach}
	</p>
	</fieldset>
  
	<p><input class="submit" type="submit" value="{'Submit'|@translate}" name="submit"/></p>
</form>