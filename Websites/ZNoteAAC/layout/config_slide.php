<script>
	$(function() {
		$('#slides').slidesjs({
			width: 469,
			height: 115,
			navigation: true,
			play: {
			active: false,
			auto: true,
			interval: 4000,
			swap: true,
			pauseOnHover: false,
			restartDelay: 2500
		   }
		});
	});
</script>
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