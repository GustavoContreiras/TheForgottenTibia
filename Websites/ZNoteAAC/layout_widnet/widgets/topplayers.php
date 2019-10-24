<div class="mod-tab">
	<div class="module">
		<div class="module-2">
			<div class="module-3">
				<div class="module-4">
					<div class="module-5 deepest">
						<div class="header-container-1">
							<div class="header-container-2">
								<div class="header-l"></div>
								<div class="header-r"></div>
								<h3 class="module"><span class="color">Top 5</span> Players</h3>
							</div>
						</div>
						<div style="overflow: hidden;">
							<div>
								<div>
									<?php
									$limitt = 5;
									$skills = mysql_select_multi("SELECT `name`,`level`,`experience` FROM `players` WHERE `group_id` < '2' AND `name` != 'Account Manager' ORDER BY `level` DESC, `experience` DESC LIMIT $limitt");
									$number_of_rows = 0;
									foreach($skills as $skillss) {
										$number_of_rows++;
										echo '+ <b></b><a href="characterprofile.php?name='.urlencode($skillss['name']).'" class="menu">'.$skillss['name'].'</a><br>';
										echo '<em class="style2">Level: <b>'.urlencode($skillss['level']).'</b></em></li><br />';
									}
									?>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>