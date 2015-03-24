<div class="titrePage">
  <h2>MontblancXL</h2>
</div>

<form method="post" class="properties" action="" ENCTYPE="multipart/form-data" name="form" class="properties">
<div id="configContent">
  <fieldset id="mainConfCheck">
    <legend></legend>
      <ul>
        <li>
          <span class="property">{'Display page banner on home page'|@translate}</span>
          <input type="checkbox" name="mbxl[home]" value="true" {if $mbxl.home}checked="checked"{/if}>
        </li>
        <li>
          <span class="property">{'Display page banner on categories pages'|@translate}</span>
          <input type="checkbox" name="mbxl[categories]" value="true" {if $mbxl.categories}checked="checked"{/if}>
        </li>
        <li>
          <span class="property">{'Display page banner on picture page'|@translate}</span>
          <input type="checkbox" name="mbxl[picture]" value="true" {if $mbxl.picture}checked="checked"{/if}>
        </li>
        <li>
          <span class="property">{'Display page banner on other pages'|@translate}</span>
          <input type="checkbox" name="mbxl[other]" value="true" {if $mbxl.other}checked="checked"{/if}>
        </li>
      </ul>
  </fieldset>
</div>
<p><input class="submit" type="submit" value="{'Submit'|@translate}" name="submit" /></p>
</form>