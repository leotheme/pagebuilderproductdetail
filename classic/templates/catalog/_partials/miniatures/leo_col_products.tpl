{if !isset($LISTING_GRID_MODE) || !isset($LISTING_PRODUCT_COLUMN) || !isset($LISTING_PRODUCT_COLUMN_MODULE) || !isset($LISTING_PRODUCT_TABLET) || !isset($LISTING_PRODUCT_SMALLDEVICE) || !isset($LISTING_PRODUCT_EXTRASMALLDEVICE) || !isset($LISTING_PRODUCT_MOBILE)}
    {block name="setting"}
      {include file="layouts/setting.tpl"}
    {/block}
{/if}

{if !isset($productClassWidget)}
    {assign var="productClassWidget" value={hook h="pagebuilderConfig" configName="productClass"}}
{/if}
{if !isset($productProfileDefault)}
    {assign var="productProfileDefault" value={hook h="pagebuilderConfig" configName="productKey"}}
{/if}

{*define numbers of product per line in other page for desktop*}
{if (isset($page.page_name) && $page.page_name == 'category') || (isset($leo_page) && $leo_page=='category')}
    {assign var='nbItemsPerLine' value=$LISTING_PRODUCT_COLUMN}

    {if $LISTING_PRODUCT_COLUMN=="5"}       {assign var="col_cat_product_xl" value="col-xl-2-4"}{else}{assign var="col_cat_product_xl" value="col-xl-{12/$LISTING_PRODUCT_COLUMN}"}{/if}
    {if $LISTING_PRODUCT_LARGEDEVICE=="5"}  {assign var="col_cat_product_lg" value="col-lg-2-4"}{else}{assign var="col_cat_product_lg" value="col-lg-{12/$LISTING_PRODUCT_LARGEDEVICE}"}{/if}
    {assign var="colValue" value="col-sp-{12/$LISTING_PRODUCT_MOBILE} col-xs-{12/$LISTING_PRODUCT_EXTRASMALLDEVICE} col-sm-{12/$LISTING_PRODUCT_SMALLDEVICE} col-md-{12/$LISTING_PRODUCT_TABLET} {$col_cat_product_lg} {$col_cat_product_xl}" scope="global"}
{else}
    {assign var='nbItemsPerLine' value=$LISTING_PRODUCT_COLUMN_MODULE}
    
    {if $LISTING_PRODUCT_COLUMN_MODULE=="5"}{assign var="col_cat_product_xl" value="col-xl-2-4"}{else}{assign var="col_cat_product_xl" value="col-xl-{12/$LISTING_PRODUCT_COLUMN_MODULE}"}{/if}
    {if $LISTING_PRODUCT_LARGEDEVICE=="5"}  {assign var="col_cat_product_lg" value="col-lg-2-4"}{else}{assign var="col_cat_product_lg" value="col-lg-{12/$LISTING_PRODUCT_LARGEDEVICE}"}{/if}
    
    {assign var="colValue" value="col-sp-{12/$LISTING_PRODUCT_MOBILE} col-xs-{12/$LISTING_PRODUCT_EXTRASMALLDEVICE} col-sm-{12/$LISTING_PRODUCT_SMALLDEVICE} col-md-{12/$LISTING_PRODUCT_TABLET} {$col_cat_product_lg} {$col_cat_product_xl}" scope="global"}
{/if}
        
{assign var='nbItemsPerLineTablet' value=$LISTING_PRODUCT_TABLET}
{assign var='nbItemsPerLineMobile' value=$LISTING_PRODUCT_EXTRASMALLDEVICE}
{*define numbers of product per line in other page for tablet*}
{assign var='nbLi' value=$products|count}
{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
{math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
<!-- Products list -->

{assign var="categoryLayout" value={hook h="pagebuilderConfig" configName="categoryLayout"}}
{assign var="classCategoryLayout" value={hook h="pagebuilderConfig" configName="classCategoryLayout"}}

<div {if isset($id) && $id} id="{$id}"{/if} class="product_list {if isset($leo_page) && $leo_page=='category'}{$LISTING_GRID_MODE}{/if} {if isset($classCategoryLayout) && $classCategoryLayout != ""}{$classCategoryLayout} {elseif isset($productClassWidget)} {$productClassWidget}{/if} ">
    <div class="row">
        {foreach from=$products item=product name=products}
            {math equation="(total%perLine)" total=$products|count perLine=$nbItemsPerLine assign=totModulo}
            {math equation="(total%perLineT)" total=$products|count perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
            {math equation="(total%perLineT)" total=$products|count perLineT=$nbItemsPerLineMobile assign=totModuloMobile}
            {if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
            {if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
            {if $totModuloMobile == 0}{assign var='totModuloMobile' value=$nbItemsPerLineMobile}{/if}   
            <div class="ajax_block_product {$colValue}
                {if $smarty.foreach.products.iteration%$nbItemsPerLine == 0} last-in-line
                {elseif $smarty.foreach.products.iteration%$nbItemsPerLine == 1} first-in-line{/if}
                {if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModulo)} last-line{/if}
                {if $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 0} last-item-of-tablet-line
                {elseif $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}
                {if $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 0} last-item-of-mobile-line
                {elseif $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}
                {if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModuloMobile)} last-mobile-line{/if}
                ">
                {block name='product_miniature'}
                    {if isset($productProfileDefault) && $productProfileDefault}
                        {* exits THEME_NAME/profiles/profile_name.tpl -> load template*}
                        {if isset($categoryLayout) && $categoryLayout != ""}
                            {hook h='displayLeoProfileProduct' product=$product profile=$categoryLayout}
                        {else}
                            {hook h='displayLeoProfileProduct' product=$product profile=$productProfileDefault}
                        {/if}
                    {else}
                        {include file='catalog/_partials/miniatures/product.tpl' product=$product}
                    {/if}
                {/block}
            </div>
        {/foreach}
    </div>
</div>
<script>
if (window.jQuery) {
    $(document).ready(function(){
        if (prestashop.page.page_name == 'category'){
            setDefaultListGrid();
        }
    });
}
</script>