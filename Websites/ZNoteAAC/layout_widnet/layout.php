<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<title><?PHP echo $title ?></title>
		<link href="<?PHP echo $layout_name; ?>/imagess/fav.ico" rel="shortcut icon" type="image/x-icon" />
		<link rel="stylesheet" href="<?PHP echo $layout_name; ?>/imagess/shadowbox.css" type="text/css" />
		<link rel="stylesheet" href="<?PHP echo $layout_name; ?>/imagess/templatep.css" type="text/css" />
		<link rel="stylesheet" href="<?PHP echo $layout_name; ?>/imagess/mod_yoo_slider.css" type="text/css" />
		<link rel="stylesheet" href="<?PHP echo $layout_name; ?>/imagess/mod_yoo_drawer.css" type="text/css" />
		<link rel="stylesheet" href="<?PHP echo $layout_name; ?>/imagess/mod_yoo_search.css" type="text/css" />
		<link rel="stylesheet" href="<?PHP echo $layout_name; ?>/imagess/mod_yoo_carousel.css" type="text/css" />
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/jquery.js"></script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/mootools.js"></script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/caption.js"></script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/mod_yoo_slider.js"></script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/mod_yoo_drawer.js"></script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/mod_yoo_search.js"></script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/mod_yoo_carousel.js"></script>
		<script type="text/javascript">
			var YtSettings = { tplurl: '<?PHP echo $config['server']['serverName']; ?>', color: 'concrete', layout: 'left', fontDefault: 'font-medium', widthDefault: 'width-wide', widthThinPx: 790, widthWidePx: 960, widthFluidPx: 0.9 };
		</script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/ajax.js"></script>
		<link rel="stylesheet" type="text/css" href="<?PHP echo $layout_name; ?>/imagess/style.css"/>
		<link rel="stylesheet" type="text/css" href="<?PHP echo $layout_name; ?>/imagess/comment_style.css"/>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/plugins/system/yoo_effects/yoo_effects.js.php@lb=1&re=1&sl=1"></script>
		<script type="text/javascript" src="<?PHP echo $layout_name; ?>/imagess/template.js"></script>
	</head>
	<body id="page" class="yoopage font-medium width-wide left showright default yootools-black">
		<div id="page-body">
			<div class="page-body-m">
				<div class="page-body-t">
					<div class="page-body-b">
						<div class="page-body-h">
							<div class="wrapper floatholder">
								<!-- header start -->
								<?php include 'header.php'; ?>
								<!-- header end -->
								<div id="top">
									<div class="floatbox ie_fix_floats">
										<div class="topblock width100 float-left">
											<div class="module deepest blank">
												<div class="slideshow">
													<div id="yoo-carousel-1" class="yoo-carousel" style="width: 960px;height: 200px;">
														<div style="overflow: hidden; height: 200px;">
															<div class="frame" style="width: 960px;">
																<div class="prev">
																	<a class="button-prev" href="javascript:void(0)" title="Previous slide" style="height: 200px;"></a>
																</div>
																<div class="panel-container" style="width: 960px;">
																	<div class="panel-container-bl">
																		<div class="panel-container-br" style="height: 200px;">
																			<div class="panel" style="width: 960px;">
																				<div style="width: 5763px;">
																					<div class="floatbox" style="background: transparent url('<?PHP echo $layout_name; ?>/imagess/logo/1.png') repeat scroll 0% 0%; width: 960px; height: 200px; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;"><br /></div>		
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="next">
																	<a class="button-next" href="javascript:void(0)" title="Next slide" style="height: 200px;"></a>
																</div>
															</div>
														</div>
													</div>
												</div><?php include 'yoocarousel.php'; ?>
											</div>
										</div>
								 	 </div>
								</div>
								<!-- top end -->
								<div id="middle">
									<div class="middle-container-t">
										<div class="middle-tl"></div>
										<div class="middle-tr"></div>
										<div class="middle-t"></div>
									</div>
									<div class="middle-l">
										<div class="middle-l-ie6"></div>
										<div class="middle-r-ie6"></div>
										<div class="middle-r">
											<div class="middle-m">
												<div class="background">
													<?php include 'left.php'; ?>
													<!-- left end -->
													<div id="main">
														<div id="main_container" class="clearfix">
															<div id="mainmiddle" class="floatbox">
																<?php include 'right.php'; ?>
																<!-- right end -->		
																<div id="content">
																	<div id="content_container" class="clearfix">
																		<div id="contenttop" class="floatbox">
																			<div class="contenttopbox left width100  float-left">
																				<div class="module deepest blank">
																					<?php include 'yoocarousel2.php'; ?>
																				</div>
																			</div>
																		</div>
																		<!-- contenttop end -->
																		<div id="breadcrumb"><span class="breadcrumbs pathway"></span></div>
																		<!-- main content here-->
																		<div class="floatbox">
																			<div class="post">
																				<?PHP echo $main_content; ?>
																			</div>                                                                   
																		</div>
																	</div>
																</div>
																<!-- content end -->
															</div>
															<!-- mainmiddle end -->
														</div>
													</div>
													<!-- main end -->
												</div>
											</div>
										</div>
									</div>
									<div class="middle-container-b">
										<div class="middle-bl"></div>
										<div class="middle-br"></div>
										<div class="middle-b"></div>
									</div>
								</div>
								<!-- middle end -->
								<div id="footer">
									<center>
										Copyright 2010. All rights reserved. <?PHP echo $config['server']['serverName']; ?> and <a href="http://otland.net/members/widnet/">widnet</a><br />
									</center>
								</div>
								<!-- footer end -->
								<div id="debug"></div>
								<!-- debug end -->
							</div>
						</div>
					</div>		
				</div>
			</div>		
		</div>
		<!-- page-body end -->
	</body>
</html>
