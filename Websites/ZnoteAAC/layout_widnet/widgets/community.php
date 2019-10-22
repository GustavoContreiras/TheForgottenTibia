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
								<h3 class="module"><span class="color"><?PHP echo $config['site_title']; ?></span> Community</h3>
							</div>
						</div>
						<div style="overflow: hidden;">
							<ul class="menu">
								<li class="level1 item3 first"><a href="sub.php?page=characters" class="level1 item3 first"><span>Characters</span></a></li>
								<li class="level1 item7 last"><a href="onlinelist.php" class="level1 item7">Who Is Online?</a></li>
								<li class="level1 item7"><a href="highscores.php" class="level1 item7"><span>Highscores</span></a></li>
								<li class="level1 item7"><a href="killers.php" class="level1 item7">Top Frags</a></li>
								<li class="level1 item7"><a href="deaths.php" class="level1 item7">Latest Deaths</a></li>
								<li class="level1 item7"><a href="guilds.php" class="level1 item7"><span>Guilds</span></a></li>
								
								<?php if ($config['guildwar_enabled']): ?>
								<li class="level1 item7"><a href="guildwar.php" class="level1 item7"><span>Guild Wars</span></a></li>
								<?php endif; ?>
								
								<li class="level1 item7"><a href="gallery.php" class="level1 item7"><span>Gallery</span></a></li>
								<li class="level1 item7 last"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>