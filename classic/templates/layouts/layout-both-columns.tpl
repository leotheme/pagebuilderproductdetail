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
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<!doctype html>
<html lang="{$language.iso_code}" {if isset($IS_RTL) && $IS_RTL} dir="rtl"{if isset($LEO_RTL) && $LEO_RTL} class="rtl{if isset($LEO_DEFAULT_SKIN)} {$LEO_DEFAULT_SKIN}{/if}"{/if}
{else} class="{if isset($LEO_DEFAULT_SKIN)}{$LEO_DEFAULT_SKIN}{/if}" {/if}>

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}{if isset($LEO_LAYOUT_MODE)} {$LEO_LAYOUT_MODE}{/if}{if isset($USE_FHEADER) && $USE_FHEADER} keep-header{/if}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <main id="page">
      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}
      <header id="header">
        <div class="header-container">
          {block name='header'}
            {include file='_partials/header.tpl'}
          {/block}
        </div>
      </header>
      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}
      <section id="wrapper">
       {hook h="displayWrapperTop"}
      {if isset($fullwidth_hook.displayHome) AND $fullwidth_hook.displayHome == 0}
        <div class="container">
      {/if}
          {block name='breadcrumb'}
            {include file='_partials/breadcrumb.tpl'}
          {/block}
          <div class="row">
            {block name="left_column"}
              <div id="left-column" class="sidebar col-xs-12 col-sm-12 col-md-4 col-lg-3">
                {if $page.page_name == 'product'}
                  {hook h='displayLeftColumnProduct'}
                {else}
                  {hook h="displayLeftColumn"}
                {/if}
              </div>
            {/block}

            {block name="content_wrapper"}
              <div id="content-wrapper" class="left-column right-column col-sm-4 col-md-6">
		{hook h="displayContentWrapperTop"}
                {block name="content"}
                  <p>Hello world! This is HTML5 Boilerplate.</p>
                {/block}
		{hook h="displayContentWrapperBottom"}
              </div>
            {/block}

            {block name="right_column"}
              <div id="right-column" class="sidebar col-xs-12 col-sm-12 col-md-4 col-lg-3">
                {if $page.page_name == 'product'}
                  {hook h='displayRightColumnProduct'}
                {else}
                  {hook h="displayRightColumn"}
                {/if}
              </div>
            {/block}
          </div>
        {if isset($fullwidth_hook.displayHome) AND $fullwidth_hook.displayHome == 0}
          </div>
        {/if}
	{hook h="displayWrapperBottom"}
      </section>

      <footer id="footer" class="footer-container">
        {block name="footer"}
          {include file="_partials/footer.tpl"}
        {/block}
      </footer>
      {if isset($LEO_PANELTOOL) && $LEO_PANELTOOL}
          {include file="$tpl_dir./modules/appagebuilder/views/templates/front/info/paneltool.tpl"}
      {/if}
      {if isset($LEO_BACKTOP) && $LEO_BACKTOP}
          <div id="back-top"><a href="#" class="fa fa-angle-double-up"></a></div>
      {/if}

    </main>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

</html>
