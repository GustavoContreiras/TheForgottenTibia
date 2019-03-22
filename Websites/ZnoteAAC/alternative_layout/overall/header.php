<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><?PHP echo $config['site_title']; ?></title>
	<link href='https://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
	<link href="layout/fontawesome.css" rel="stylesheet" type="text/css" />
	<link href="layout/style.css" rel="stylesheet" type="text/css"/>
	<script src="https://code.jquery.com/jquery-2.1.0.min.js"></script>
	<script src="layout/jquery.slides.min.js"></script>
	<style>
		#slides
		{
			display: none
		}
	</style>
</head>
<body>
	<div class="page">
		<div class="navbar">
			<a href="index.php"><div class="news link"></div></a>
			<a href="myaccount.php"><div class="account link"></div></a>
			<a href="serverinfo.php"><div class="info link"></div></a>
			<a href="shop.php"><div class="shop link"></div></a>
			<a href="register.php"><div class="register link"></div></a>

			<div class="search_area">
				<form method="get" action="characterprofile.php">
					<input type="text" name="name" class="nav_search" value="Find player..."  onfocus="this.value=''" onblur="if(this.value=='') { this.value='Find player...'};"/>
					<input type="submit" class="nav_search_btn" value="&#xf002;"/>
				</form>
			</div>
		</div>

		<div class="logo"></div>
		<div class="main_cnt">
			<div class="left_cnt">
				<div class="widget-news"></div>
					<ul>
						<li><a href="index.php">Home</a></li>
						<li><a href="serverinfo.php">Server Information</a></li>
					</ul>
				<div class="widget-account"></div>
					<ul>
						<li><a <?php if (user_logged_in()) echo 'style="color: green;"'; ?>href="myaccount.php">Manage Account</a></li>
						<?php if (!user_logged_in()): ?>
							<li><a style="color: yellow;" href="register.php">Create Account</a></li>
						<?php endif; ?>
						<li><a href="recovery.php">Lost Account?</a></li>
						<li><a href="downloads.php">Downloads</a></li>
					</ul>
				<div class="widget-community"></div>
					<ul>
						<li><a href="highscores.php">Highscores</a></li>
						<li><a href="sub.php?page=tasks">Tasks</a></li>
						<li><a href="market.php">Item Market</a></li>
						<li><a href="gallery.php">Gallery</a></li>
						<li><a href="support.php">Support</a></li>
						<li><a href="helpdesk.php">Helpdesk</a></li>
						<li><a href="houses.php">Houses</a></li>
						<li><a href="deaths.php">Deaths</a></li>
						<li><a href="killers.php">Killers</a></li>
						<li><a href="spells.php">Spells</a></li>
						<?php if ($config['items'] == true) { ?><li><a href="items.php">Items</a></li><?php } ?>
						<li><a href="forum.php">Forum</a></li>
							<li><a href="guilds.php">Guilds</a>
						<?php if ($config['guildwar_enabled'] === true) { ?>
							<ul>
								<li><a href="guilds.php">Guild List</a></li>
								<li><a href="guildwar.php">Guild Wars</a></li>
							</ul>
						<?php } ?></li>
						<li><a href="changelog.php">Changelog</a></li>
					</ul>
				<div class="widget-shop"></div>
					<ul>
						<?php if ($config['shop']['enabled']): ?>
							<li><a href="buypoints.php">Buy Points</a></li>
							<li><a href="shop.php">Shop Offers</a></li>
						<?php endif; ?>
						<?php if ($config['shop_auction']['characterAuction']): ?>
							<li><a href="auctionChar.php">Character Auction</a></li>
						<?php endif; ?>
					</ul>
			</div>
			<div class="center_cnt">
				<div class="cnt_mid">
					<div class="cnt_top"></div>
						<div class="content">
						<!--
							<div class="slider_bg">
								<div id="slides">
									<img src="layout/slides/1.jpg">
									<img src="layout/slides/2.jpg">
									<img src="layout/slides/3.jpg">
									<img src="layout/slides/4.jpg">
									<a href="#" class="slidesjs-previous slidesjs-navigation"><span class="icon icon-chevron-left"></span></a>
									<a href="#" class="slidesjs-next slidesjs-navigation"><span class="icon icon-chevron-right"></span></a>
								</div>
							</div>
						-->