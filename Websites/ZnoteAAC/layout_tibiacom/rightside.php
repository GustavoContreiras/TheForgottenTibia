<div id="DeactivationContainerThemebox" ></div>
<div id="RightArtwork">
	<img id="Monster" src="layout/images/global/header/monsters/hero.gif" onClick="window.location = 'onlinelist.php';" alt="Monster of the Week" />
	<img id="PedestalAndOnline" src="layout/images/global/header/pedestal-and-online.gif" alt="Monster Pedestal and Players Online Box"/>
	<div id="PlayersOnline" onClick="window.location = 'onlinelist.php';">
		<a href="onlinelist.php" id="online">Players online:<br><?php echo user_count_online();?></a>
		
	</div>
</div>
<div id="Themeboxes">
	<div id="NewcomerBox" class="Themebox" style="background-image:url(layout/images/global/themeboxes/newcomer/newcomerbox.gif);">
		<a class="ThemeboxButton" href="register.php" onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" style="background-image:url(layout/images/global/buttons/sbutton.gif);">
			<div class="BigButtonOver" style="background-image:url(layout/images/global/buttons/sbutton_over.gif);"></div>
			<div class="ButtonText" style="background-image:url(layout/images/global/buttons/_sbutton_jointibia.gif);"></div>
		</a>
		<div class="Bottom" style="background-image:url(layout/images/global/general/box-bottom.gif);"></div>
	</div>
	<div id="PremiumBox" class="Themebox" style="background-image:url(layout/images/global/themeboxes/premium/premiumbox.gif);">
		<a class="ThemeboxButton" href="buypoints.php" onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" style="background-image:url(layout/images/global/buttons/sbutton.gif);">
			<div class="BigButtonOver" style="background-image:url(layout/images/global/buttons/sbutton_over.gif);"></div>
			<div class="ButtonText" style="background-image:url(layout/images/global/buttons/_sbutton_getpremium.gif);"></div>
		</a>
		<div class="Bottom" style="background-image:url(layout/images/global/general/box-bottom.gif);"></div>
	</div>											
	<!--<div id="ScreenshotBox" class="Themebox" style="background-image:url(layout/images/global/themeboxes/screenshot/screenshotbox.gif);">
		<a href="{$path}/index.php/p/v/gallery">
			<img id="ScreenshotContent" class="ThemeboxContent" src="layout/images/abouttibia/screenshotoftheday.png" alt="Screenshot of the Day"/>
		</a>
		<div class="Bottom" style="background-image:url(http://static.tibia.com/images/global/general/box-bottom.gif);"></div>
	</div>
	<div id="CurrentPollBox" class="Themebox" style="background-image:url(layout/images/global/themeboxes/current-poll/currentpollbox.gif);">
		<div id="CurrentPollText">Most powerful vocation?</div>
		<a class="ThemeboxButton" href="{$path}" onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" style="background-image:url(layout/images/global/buttons/sbutton.gif);">
			<div class="BigButtonOver" style="background-image:url(layout/images/global/buttons/sbutton_over.gif);"></div>
			<div class="ButtonText" style="background-image:url(layout/images/global/buttons/_sbutton_votenow.gif);"></div>
		</a>
		<div class="Bottom" style="background-image:url(layout/images/global/general/box-bottom.gif);"></div>
	</div>-->
</div>