{block name='product_accordion'}
<div class="products-accordion" id="accordion" role="tablist" aria-multiselectable="true">
    {* Description Product Detail *}
    <div class="card" id="description">
      <div class="card-header" role="tab" id="headingdescription">
          <h5 class="h5">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapsedescription" aria-expanded="true" aria-controls="collapsedescription">
              {l s='Description' d='Shop.Theme.Catalog'}
            </a>
         </h5>
      </div>
      <div id="collapsedescription" class="collapse in" role="tabpanel" aria-labelledby="headingdescription">
          <div class="card-block">
            {block name='product_description'}
              <div class="product-description">{$product.description nofilter}</div>
            {/block}
          </div>
      </div>
    </div>
    {* Product Detail *}
    <div class="card" id="product-detail">
      <div class="card-header" role="tab" id="headingdetails">
          <h5 class="h5">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapsedetails" aria-expanded="false" aria-controls="collapsedetails">
                {l s='Product Details' d='Shop.Theme.Catalog'}
            </a>
          </h5>
      </div>
      <div id="collapsedetails" class="collapse" role="tabpanel" aria-labelledby="headingdetails">
        <div class="card-block">
          <div data-product="{$product|json_encode}">
            {block name='product_reference'}
              {if isset($product_manufacturer->id)}
                  <div class="product-manufacturer">
                    {if isset($manufacturer_image_url)}
                        <a href="{$product_brand_url}">
                          <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" />
                        </a>
                    {else}
                        <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
                        <span>
                          <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                        </span>
                    {/if}
                  </div>
              {/if}
              {if isset($product.reference_to_display)}
                  <div class="product-reference">
                    <label class="label">{l s='Reference' d='Shop.Theme.Catalog'} </label>
                    <span itemprop="sku">{$product.reference_to_display}</span>
                  </div>
              {/if}
            {/block}
            {block name='product_quantities'}
                {if $product.show_quantities}
                  <div class="product-quantities">
                      <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
                      <span>{$product.quantity} {$product.quantity_label}</span>
                  </div>
                {/if}
            {/block}
            {block name='product_availability_date'}
                {if $product.availability_date}
                  <div class="product-availability-date">
                      <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
                      <span>{$product.availability_date}</span>
                  </div>
                {/if}
            {/block}
            {block name='product_out_of_stock'}
                <div class="product-out-of-stock">
                  {hook h='actionProductOutOfStock' product=$product}
                </div>
            {/block}
            {block name='product_features'}
                {if $product.features}
                  <section class="product-features">
                      <h3 class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</h3>
                      <dl class="data-sheet">
                        {foreach from=$product.features item=feature}
                            <dt class="name">{$feature.name}</dt>
                            <dd class="value">{$feature.value}</dd>
                        {/foreach}
                      </dl>
                  </section>
                {/if}
            {/block}
            {* if product have specific references, a table will be added to product details section *}
            {block name='product_specific_references'}
                {if isset($product.specific_references)}
                  <section class="product-features">
                      <h3 class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</h3>
                      <dl class="data-sheet">
                          {foreach from=$product.specific_references item=reference key=key}
                            <dt class="name">{$key}</dt>
                            <dd class="value">{$reference}</dd>
                          {/foreach}
                      </dl>
                  </section>
                {/if}
            {/block}
            {block name='product_condition'}
                {if $product.condition}
                  <div class="product-condition">
                      <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
                      <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
                      <span>{$product.condition.label}</span>
                  </div>
                {/if}
            {/block}
        </div>
        </div>
      </div>
  </div>
	<div id="leofeature-product-review" class="card">
    <div class="card-header" role="tab" id="headingdetails">
        <h5 class="h5">
          <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapsereviews" aria-expanded="false" aria-controls="collapsereviews">
               {l s='Reviews' d='Shop.Theme.Catalog'}
          </a>
        </h5>
    </div>
    <div id="collapsereviews" class="collapse" role="tabpanel" aria-labelledby="headingdetails">
      <div class="card-block">
    		{hook h='displayLeoProductTabContent' product=$product}
      </div>
    </div>
	</div>
    {* Attachments Product Detail *}
    {block name='product_attachments'}
    {if $product.attachments}
        <div class="card" id="attachments">
          <div class="card-header" role="tab" id="headingattachments">
              <h5 class="h5">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseattachments" aria-expanded="false" aria-controls="collapseattachments">
                    {l s='Attachments' d='Shop.Theme.Catalog'}
                </a>
              </h5>
          </div>
          <div id="collapseattachments" class="collapse" role="tabpanel" aria-labelledby="headingattachments">
              <div class="card-block">
                <div class="attachments">
                  <section class="product-attachments">
                      <h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
                      {foreach from=$product.attachments item=attachment}
                        <div class="attachment">
                            <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                            <p>{$attachment.description}</p
                            <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                             {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                            </a>
                        </div>
                      {/foreach}
                  </section>
                </div>
              </div>
          </div>
      </div>
    {/if}
  {/block}
  {* Extra Product *}
  {foreach from=$product.extraContent item=extra key=extraKey}
    <div class="card" id="extra-{$extraKey}">
       <div class="card-header" role="tab" id="headingextra-{$extraKey}">
            <h5 class="h5">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseextra-{$extraKey}" aria-expanded="false" aria-controls="collapseextra-{$extraKey}">
                  {$extra.title}
              </a>
            </h5>
        </div>
        <div id="collapseextra-{$extraKey}" class="collapse" role="tabpanel" aria-labelledby="headingextra-{$extraKey}">
            <div class="card-block">
              <div class="{$extra.attr.class}" id="extra-content-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
               {$extra.content nofilter}
            </div>
            </div>
        </div>
    </div>
  {/foreach}
</div>
{/block}