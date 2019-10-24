<div class="mod-tab mod-menu">
	<div class="module">
		<div class="module-2">
			<div class="module-3">
				<div class="module-4">
					<div class="module-5 deepest">
						<div class="header-container-1">
							<div class="header-container-2">
								<div class="header-l"></div>
								<div class="header-r"></div>
								<h3 class="module"><span class="color">SMS</span> Shop</h3>
							</div>
						</div>
						<div style="overflow: hidden;">
							<ul class="menu">
								<li class="level1 item7 first"><a href="buypoints.php" class="level1 item7"><font color="green"><b>Buy Points</b></font></a></li>
								<li class="level1 item7 last"><a href="shop.php" class="level1 item7"><font color="red"><b><blink>Shop Offer</blink></b></font></a></li>
								<?PHP if(user_logged_in())
									echo '<li class="level1 item7 last"><a href="?subtopic=shopsystem&action=show_history" class="level1 item7"><font color="yellow"><b>Shop History</b></font></a></li>';
								?>
							</ul>									
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>