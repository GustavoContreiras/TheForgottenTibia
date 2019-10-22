<div id="MenuColumn">
<div id="LeftArtwork">             
	<a href="sub.php?page=news" ><img id="TibiaLogoArtworkTop" src="layout/images/global/header/tibia-logo-artwork-top.gif" alt="logoartwork" /></a>
</div>
<?php if (user_logged_in() === true): ?>
	<div id="Loginbox">
		<div id="LoginTop" style="background-image:url(layout/images/global/general/box-top.gif)"></div>
		<div id="BorderLeft" class="LoginBorder" style="background-image:url(layout/images/global/general/chain.gif)"></div>

		<div class="Loginstatus" style="background-image:url(layout/images/global/loginbox/loginbox-textfield-background.gif)">
			<div id="LoginstatusText_12" class="LoginstatusText" style="background-image: url(layout/images/global/loginbox/loginbox-font-welcome.gif); "></div>
		</div>
		<div id="LoginButtonContainer" style="background-image:url(layout/images/global/loginbox/loginbox-textfield-background.gif)">
			<div id="LoginButton" style="background-image:url(layout/images/global/buttons/sbutton.gif)">
				<a href="sub.php?page=loggedin">
					<div onclick="LoginButtonAction();" onmouseover="MouseOverBigButton(this);" onmouseout="MouseOutBigButton(this);">
						<div class="Button" style="background-image: url(layout/images/global/buttons/sbutton_over.gif); visibility: hidden; "></div>
						<div id="ButtonText2" style="background-image: url(layout/images/global/buttons/_sbutton_myaccount.gif); "></div>
					</div>
				</a>
			</div>
		</div>
		<div style="clear:both"></div>

		<div class="Loginstatus" style="background-image:url(layout/images/global/loginbox/loginbox-textfield-background.gif)">
		</div>

		<div id="BorderRight" class="LoginBorder" style="background-image:url(layout/images/global/general/chain.gif)"></div>
		<div id="LoginBottom" class="Loginstatus" style="background-image:url(layout/images/global/general/box-bottom.gif)"></div>
	</div>
<?php else: ?>
	<div id="Loginbox" >
		<div class="Loginstatus" style="background-image:url(layout/images/global/loginbox/loginbox-textfield-background.gif)" >
		</div>
		<div id="LoginTop" style="background-image:url(layout/images/global/general/box-top.gif)" ></div>
		<div id="BorderLeft" class="LoginBorder" style="background-image:url(layout/images/global/general/chain.gif)" ></div>
		<div id="LoginButtonContainer" style="background-image:url(layout/images/global/loginbox/loginbox-textfield-background.gif)" >
			<div id="LoginButton" style="background-image:url(layout/images/global/buttons/sbutton.gif)" >
				<a href="sub.php?page=login">
					<div onClick="LoginButtonAction();" onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);">
						<div class="Button" style="background-image:url(layout/images/global/buttons/sbutton_over.gif)" ></div>
						<div id="ButtonText" style="background-image:url(layout/images/global/buttons/_sbutton_login.gif)" ></div>
					</div>
				</a>
			</div>
		</div>
		<div style="clear:both" ></div>
		<div class="Loginstatus" style="background-image:url(layout/images/global/loginbox/loginbox-textfield-background.gif)" >
		</div>
		<div id="BorderRight" class="LoginBorder" style="background-image:url(layout/images/global/general/chain.gif)" ></div>
		<div id="LoginBottom" class="Loginstatus" style="background-image:url(layout/images/global/general/box-bottom.gif)" ></div>
	</div>
<?php endif; ?>
<div id='Menu'>
	<div id='MenuTop' style='background-image:url(layout/images/global/general/box-top.gif);'></div>
	<div id='news' class='menuitem'>
		<span onClick="MenuItemAction('news')">
			<div class='MenuButton' style='background-image:url(layout/images/global/menu/button-background.gif);'>
				<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'><div class='Button' style='background-image:url(layout/images/global/menu/button-background-over.gif);'></div>
					<span id='news_Lights' class='Lights'>
						<div class='light_lu' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ld' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ru' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
					</span>
					<div id='news_Icon' class='Icon' style='background-image:url(layout/images/global/menu/icon-news.gif);'></div>
					<div id='news_Label' class='Label' style='background-image:url(layout/images/global/menu/label-news.gif);'></div>
					<div id='news_Extend' class='Extend' style='background-image:url(layout/images/global/general/plus.gif);'></div>
				</div>
			</div>
		</span>
		<div id='news_Submenu' class='Submenu'>
			<a href='sub.php?page=news'>
				<div id='submenu_latestnews' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_latestnews' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_latestnews' class='SubmenuitemLabel'>Latest News</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='changelog.php'>
				<div id='submenu_latestnews' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_latestnews' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_latestnews' class='SubmenuitemLabel'>Changelog</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='{$path}/index.php/home/archive'>
				<div id='submenu_newsarchive' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_newsarchive' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
		</div>
	</div>
	<div id='account' class='menuitem'>
		<span onClick="MenuItemAction('account')">
			<div class='MenuButton' style='background-image:url(layout/images/global/menu/button-background.gif);'>
				<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'><div class='Button' style='background-image:url(layout/images/global/menu/button-background-over.gif);'></div>
					<span id='account_Lights' class='Lights'>
						<div class='light_lu' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ld' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ru' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
					</span>
					<div id='account_Icon' class='Icon' style='background-image:url(layout/images/global/menu/icon-account.gif);'></div>
					<div id='account_Label' class='Label' style='background-image:url(layout/images/global/menu/label-account.gif);'></div>
					<div id='account_Extend' class='Extend' style='background-image:url(layout/images/global/general/plus.gif);'></div>
				</div>
			</div>
		</span>
		<div id='account_Submenu' class='Submenu'>
			<a href='myaccount.php'>
				<div id='submenu_accountmanagement' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_accountmanagement' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_accountmanagement' class='SubmenuitemLabel'>Account Management</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='register.php'>
				<div id='submenu_createaccountanddownload' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_createaccountanddownload' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_createaccountanddownload' class='SubmenuitemLabel'>Create Account</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='downloads.php'>
				<div id='submenu_downloadclient' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_downloadclient' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_downloadclient' class='SubmenuitemLabel'>Download Client</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<?php if (!user_logged_in()): ?>
				<a href='sub.php?page=recover'>
					<div id='submenu_lostaccount' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
						<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
						<div id='ActiveSubmenuItemIcon_lostaccount' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
						<div id='ActiveSubmenuItemLabel_lostaccount' class='SubmenuitemLabel'>Lost Account?</div>
						<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					</div>
				</a>
			<?php endif; ?>
		</div>
	</div>
	<div id='community' class='menuitem'>
		<span onClick="MenuItemAction('community')">
			<div class='MenuButton' style='background-image:url(layout/images/global/menu/button-background.gif);'>
				<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'><div class='Button' style='background-image:url(layout/images/global/menu/button-background-over.gif);'></div>
					<span id='community_Lights' class='Lights'>
						<div class='light_lu' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ld' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ru' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
					</span>
					<div id='community_Icon' class='Icon' style='background-image:url(layout/images/global/menu/icon-community.gif);'></div>
					<div id='community_Label' class='Label' style='background-image:url(layout/images/global/menu/label-community.gif);'></div>
					<div id='community_Extend' class='Extend' style='background-image:url(layout/images/global/general/plus.gif);'></div>
				</div>
			</div>
		</span>
		<div id='community_Submenu' class='Submenu'>
			<a href='sub.php?page=charactersearch'>
				<div id='submenu_characters' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_characters' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_characters' class='SubmenuitemLabel'>Characters</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='highscores.php'>
				<div id='submenu_highscores' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_highscores' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_highscores' class='SubmenuitemLabel'>Highscores</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='forum.php'>
				<div id='submenu_forums' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_forums' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_forums' class='SubmenuitemLabel'><font color="green">Forum Boards</font></div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='helpdesk.php'>
				<div id='submenu_helpdesks' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_helpdesks' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_helpdesks' class='SubmenuitemLabel'>Helpdesk</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='deaths.php'>
				<div id='submenu_creatures' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_creatures' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_creatures' class='SubmenuitemLabel'>Latest Deaths</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='killers.php'>
				<div id='submenu_spells' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_spells' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_spells' class='SubmenuitemLabel'>Kills</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='sub.php?page=houses'>
				<div id='submenu_houses' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_houses' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_houses' class='SubmenuitemLabel'>Houses</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='support.php'>
				<div id='submenu_downloadclient' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_downloadclient' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_downloadclient' class='SubmenuitemLabel'>Support</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<?php if ($config['items'] == true): ?>
				<a href='items.php'>
					<div id='submenu_downloadclient' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
						<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
						<div id='ActiveSubmenuItemIcon_downloadclient' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
						<div id='ActiveSubmenuItemLabel_downloadclient' class='SubmenuitemLabel'>Items</div>
						<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					</div>
				</a>
			<?php endif; ?>
			<a href='spells.php'>
				<div id='submenu_downloadclient' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_downloadclient' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_downloadclient' class='SubmenuitemLabel'>Spells</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='guilds.php'>
				<div id='submenu_guilds' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_guilds' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_guilds' class='SubmenuitemLabel'>Guilds</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='guildwar.php'>
				<div id='submenu_guilds' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_guilds' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_guilds' class='SubmenuitemLabel'>Guild Wars</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='market.php'>
				<div id='submenu_guilds' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_guilds' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_guilds' class='SubmenuitemLabel'>Item Market</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
		</div>
	</div>
	<div id='library' class='menuitem'>
		<span onClick="MenuItemAction('library')">
			<div class='MenuButton' style='background-image:url(layout/images/global/menu/button-background.gif);'>
				<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'><div class='Button' style='background-image:url(layout/images/global/menu/button-background-over.gif);'></div>
					<span id='library_Lights' class='Lights'>
						<div class='light_lu' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ld' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ru' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
					</span>
					<div id='library_Icon' class='Icon' style='background-image:url(layout/images/global/menu/icon-library.gif);'></div>
					<div id='library_Label' class='Label' style='background-image:url(layout/images/global/menu/label-library.gif);'></div>
					<div id='library_Extend' class='Extend' style='background-image:url(layout/images/global/general/plus.gif);'></div>
				</div>
			</div>
		</span>
		<div id='library_Submenu' class='Submenu'>
			<a href='gallery.php'>
				<div id='submenu_worldquests' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_worldquests' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_worldquests' class='SubmenuitemLabel'>Image Gallery</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
		</div>
	</div>
	<div id='shops' class='menuitem'>
		<span onClick="MenuItemAction('shops')">
			<div class='MenuButton' style='background-image:url(layout/images/global/menu/button-background.gif);'>
				<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'><div class='Button' style='background-image:url(layout/images/global/menu/button-background-over.gif);'></div>
					<span id='shops_Lights' class='Lights'>
						<div class='light_lu' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ld' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
						<div class='light_ru' style='background-image:url(layout/images/global/menu/green-light.gif);'></div>
					</span>
					<div id='shops_Icon' class='Icon' style='background-image:url(layout/images/global/menu/icon-shops.gif);'></div>
					<div id='shops_Label' class='Label' style='background-image:url(layout/images/global/menu/label-shops.gif);'></div>
					<div id='shops_Extend' class='Extend' style='background-image:url(layout/images/global/general/plus.gif);'></div>
				</div>
			</div>
		</span>
		<div id='shops_Submenu' class='Submenu'>
			<a href='buypoints.php'>
				<div id='submenu_cafepress' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_cafepress' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_cafepress' class='SubmenuitemLabel'>Donate</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<a href='shop.php'>
				<div id='submenu_cafepress' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
					<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					<div id='ActiveSubmenuItemIcon_cafepress2' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
					<div id='ActiveSubmenuItemLabel_cafepress2' class='SubmenuitemLabel'>Shop</div>
					<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
				</div>
			</a>
			<?php if ($config['shop_auction']['characterAuction']): ?>
				<a href='auctionChar.php'>
					<div id='submenu_cafepress' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
						<div class='LeftChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
						<div id='ActiveSubmenuItemIcon_cafepress2' class='ActiveSubmenuItemIcon' style='background-image:url(layout/images/global/menu/icon-activesubmenu.gif);'></div>
						<div id='ActiveSubmenuItemLabel_cafepress2' class='SubmenuitemLabel'>Character Auction</div>
						<div class='RightChain' style='background-image:url(layout/images/global/general/chain.gif);'></div>
					</div>
				</a>
			<?php endif; ?>
		</div>
	</div>
	<div id='MenuBottom' style='background-image:url(layout/images/global/general/box-bottom.gif);'></div>
</div>
</div>