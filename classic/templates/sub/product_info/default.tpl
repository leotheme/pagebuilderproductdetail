{block name='product_default'}
<div class="more-info-product">
	<div id="description">
		<h4 class="title-info-product">{l s='Description' d='Shop.Theme.Catalog'}</h4>
		{block name='product_description'}
       		<div class="product-description">{$product.description nofilter}</div>
     	{/block}
	</div>
	<div id="product-detail" data-product="{$product|json_encode}">
		<h4 class="title-info-product">{l s='Product Details' d='Shop.Theme.Catalog'}</h4>
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
	<div id="leofeature-product-review">
		<h4 class="title-info-product">{l s='Reviews' d='Shop.Theme.Catalog'}</h4>
		{hook h='displayLeoProductTabContent' product=$product}
	</div>
	{* Attachments Product Detail *}
	{if $product.attachments}
		<div id="attachments">
			<h4 class="title-info-product">{l s='Attachments' d='Shop.Theme.Catalog'}</h4>
			{block name='product_attachments'}
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
		   	{/block}
		</div>
	{/if}
	{* Attachments Product Detail *}
	<div id="product-extra">
		{foreach from=$product.extraContent item=extra key=extraKey}
		    <h4 class="title-info-product">{$extra.title}</h4>
		   	<div class="{$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
		       {$extra.content nofilter}
		   	</div>
	   	{/foreach}
   	</div>
</div>
{/block}