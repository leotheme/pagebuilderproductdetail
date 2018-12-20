{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="images-container">
  {block name='product_cover_thumbnails'}

    {block name='product_cover'}
      <div class="product-cover">
        {block name='product_flags'}
          <ul class="product-flags">
            {foreach from=$product.flags item=flag}
              <li class="product-flag {$flag.type}">{$flag.label}</li>
            {/foreach}
          </ul>
        {/block}
        <img id="zoom_product" data-type-zoom="" class="js-qv-product-cover img-fluid" src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
        <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
          <i class="material-icons zoom-in">&#xE8FF;</i>
        </div>
      </div>
    {/block}

    {block name='product_images'}
      <div {if isset($language.is_rtl) && $language.is_rtl}dir="rtl"{/if} id="thumb-gallery" class="product-thumb-images">
        {foreach from=$product.images item=image}
          <div class="thumb-container {if $image.id_image == $product.cover.id_image} active {/if}">
            <a  href="javascript:void(0)" data-image="{$image.bySize.large_default.url}" data-zoom-image="{$image.bySize.large_default.url}"> 
              <img
                class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                data-image-medium-src="{$image.bySize.medium_default.url}"
                data-image-large-src="{$image.bySize.large_default.url}"
                src="{$image.bySize.home_default.url}"
                alt="{$image.legend}"
                title="{$image.legend}"
                itemprop="image"
              >
            </a>
          </div>
        {/foreach}
      </div>
      
      {if $product.images|@count > 1}
        <div class="arrows-product-fake slick-arrows">
          <button class="slick-prev slick-arrow" aria-label="Previous" type="button" >{l s='Previous' d='Shop.Theme.Catalog'}</button>
          <button class="slick-next slick-arrow" aria-label="Next" type="button">{l s='Next' d='Shop.Theme.Catalog'}</button>
        </div>
      {/if}
    {/block}
    
  {/block}
  {hook h='displayAfterProductThumbs'}
</div>
