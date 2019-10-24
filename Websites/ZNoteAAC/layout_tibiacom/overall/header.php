<html><?php
	$time = microtime();
	$time = explode(' ', $time);
	$time = $time[1] + $time[0];
	$start = $time; ?>
	<head>
		<title><?php echo $config['site_title']; ?></title>
		<link rel="shortcut icon" href="layout/images/global/general/favicon.ico" type="image/x-icon">
		<link rel="icon" href="layout/images/global/general/favicon.ico" type="image/x-icon">
		<link href="layout/styles/basic.css" rel="stylesheet" type="text/css">
		<link href="layout/styles/news.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="layout/javascripts/generic.js"></script>
		<script type='text/javascript'>
			var loginStatus=0;
			loginStatus='false';
			var activeSubmenuItem='latestnews';
			var IMAGES=0; IMAGES='layout/images';
			var LINK_ACCOUNT=0;
			LINK_ACCOUNT='{$path}/index.php/account';
			var g_FormName='';
			var g_FormField='';
			var g_Deactivated=false;
		</script>
		<SCRIPT TYPE="text/javascript">
			<!-- // Framekiller
			setTimeout ("changePage()", 6000);
			function changePage()
			{
			  if (parent.frames.length > 2) {
				if (browserTyp == "ie") {
				  parent.location=document.location;
				} else {
				  self.top.location=document.location;
				}
			  }
			}
			// -->
		</SCRIPT>
		<script type="text/javascript" src="layout/javascripts/initialize.js"></script>
	</head>
	<body onBeforeUnLoad="SaveMenu();" onUnload="SaveMenu();" onLoad="SetFormFocus()">
		<a name="top" ></a>
		<div id="ArtworkHelper" style="background-image:url(layout/images/global/header/background-artwork.jpg);">
			<div id="DeactivationContainer" ></div>
			<div id="Bodycontainer" >
				<div id="ContentRow">
					<?php include 'layout/leftside.php'; ?>
					<div id="ContentColumn">
						<div id="Content" class="Content">
							<div id="ContentHelper">
								<div id="news" class="Box">
									<div class="Corner-tl" style="background-image:url(layout/images/global/content/corner-tl.gif);"></div>
									<div class="Corner-tr" style="background-image:url(layout/images/global/content/corner-tr.gif);"></div>
									<div class="Border_1" style="background-image:url(layout/images/global/content/border-1.gif);"></div>
									<div class="BorderTitleText" style="background-image:url(layout/images/global/content/title-background-green.gif);"></div>
									<!-- <img id="ContentBoxHeadline" class="Title" src="layout/images/global/strings/headline-news.gif" alt="Contentbox headline" /> -->
									<div class="Border_2">
										<div class="Border_3">
											<div class="BoxContent" style="background-image:url(layout/images/global/content/scroll.gif);">