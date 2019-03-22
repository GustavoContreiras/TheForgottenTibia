						</div>
					<div class="cnt_bot"></div>
				</div>
				
				<div class="footer">
					<?php
					$domain = explode('//', $config['site_url']);
					$domain = str_replace('/', '', $domain[1]);
					?>
					<p>Copyright &copy; <?php echo date('Y'); ?>, <span style="color:#9C502F;"><?php echo $domain; ?></span>. All rights reserved.</p><span style="font-size: 9px; color: #522619;"> Layout by <a style="opacity: 0.4;" href="https://otland.net/members/hemrenus321.88336/" target="_blank">Hemrenus321</a>. Engine: <a style="opacity: 0.4;" href="/credits.php">Znote AAC</a></span>
					<div class="links"><a href="index.php">HOME</a> | <a href="forum.php">FORUMS</a> | <a href="register.php">REGISTER</a> | <a href="sub.php?page=login">LOGIN</a> | <a href="serverinfo.php">SERVER INFO</a></div>
					<?php // If you are logged in as an admin, display SQL queries below footer.
					if (user_logged_in() && is_admin($user_data)): ?>
						<div id="query_box">
							<label id="query_toggle" for="query_checkbox">[SHOW QUERIES]</label>
							<input type="checkbox" name="query_checkbox" id="query_checkbox">
							<?php global $accQueriesData;
							data_dump($accQueriesData, false, "Logged in as Admin: SQL queries executed:"); ?>
						</div>
						<style type="text/css">
							#query_toggle {
								position: absolute;
								display: block;
								left: 0px;
								top: 0px;
								height: 24px;
								width: 132px;
								padding: 10px;
								background-color: red;
								color: white;
								font-size: 16px;
								opacity: 0.2;
							}
							#query_toggle:hover {
								color: black;
								opacity: 1;
							}
							#query_box {
								position: absolute;
								left: 0;
								top: 0;
								background-color: black;
								z-index: 11;
							}
							#query_checkbox {
								display: none;
							}
							#query_checkbox:checked + pre {
								display: block;
							}
							div.footer pre { 
								border: 4px solid red;
								overflow: hidden; 
								display: none;
								margin: 0;
								color: white;
								z-index: 1;
							}
						</style>
					<?php endif; ?>
				</div>
			</div>
			<div class="right_cnt">
				<div class="widget-quicklogin"></div>
				<?php if (user_logged_in() === false) { ?>
				<form method="post" action="login.php">
					<div class="loginbox">
						<input name="username" type="text" class="hemrenus" placeholder="Account">
						<input name="password" type="password" class="hemrenus" placeholder="Password">
							<?php if ($config['twoFactorAuthenticator'] == true) { ?><input type="password" class="hemrenus" placeholder="Token" name="authcode"><?php } ?>
						<input name="Submit" type="submit" class="hemrenus_subm" value="Login">
						<a href="register.php" class="hemrenus_subm">Register</a>
						<br>Lost your account? <a href="recovery.php"><small>RECOVER</small></a>
						<?php
							if ($config['use_token'] == true) {
								/* Form file */
								Token::create();
							}
						?>
					</div>
				</form>
				<?php }else{ ?>
					
					<ul style="list-style: none;margin: 0;padding: 10px;">
								<h3 style="margin: 5px 0;">Welcome, <?php if ($config['ServerEngine'] !== 'OTHIRE') echo $user_data['name']; else echo $user_data['id'];?>.</h3>
									<li>
										<a href='myaccount.php'>» My Account</a>
									</li>
									<li>
										<a href='createcharacter.php'>» Create Character</a>
									</li>
									<li>
										<a href='changepassword.php'>» Change Password</a>
									</li>
									<li>
										<a href='settings.php'>» Settings</a>
									</li>
									<li>
										<a href='logout.php'>» Logout</a>
									</li>
									<?php if (user_logged_in() && is_admin($user_data)) include 'layout/Wadmin.php'; ?>
					</ul>
				<?php }?>
				<div class="widget-serverinfo"></div>
					<ul>
						<?php
						$status = true;
						if ($config['status']['status_check']) {
							@$sock = fsockopen ($config['status']['status_ip'], $config['status']['status_port'], $errno, $errstr, 1);
							if(!$sock) {
								echo '<li>Status: <img style="vertical-align:middle;" src="layout/img/off.png"></li>';
								$status = false;
							}
							else {
								$info = chr(6).chr(0).chr(255).chr(255).'info';
								fwrite($sock, $info);
								$data='';
								while (!feof($sock))$data .= fgets($sock, 1024);
								fclose($sock);
								echo '<li>Status: <img style="vertical-align:middle;" src="layout/img/on.png"></li>';
							}
						}
						if ($status) {
							?>
							<li><a href="onlinelist.php">Players online: 
								<?php echo user_count_online(); ?></a></li>
							<?php
						}
						?>
						<li>Registered accounts: <?php echo user_count_accounts();?></li>
						<li class="last">Client: <span><?php echo ($config['client'] / 100); ?></span></li>
					</ul>
						
				<div class="widget-top10"></div>
				<ul class="top10">

					<?php

					$cache = new Cache('engine/cache/topPlayer');
					if ($cache->hasExpired()) {
						$players = mysql_select_multi('SELECT `name`, `level`, `experience` FROM `players` WHERE `group_id` < ' . $config['highscore']['ignoreGroupId'] . ' ORDER BY `experience` DESC LIMIT 10;');
						
						$cache->setContent($players);
						$cache->save();
					} else {
						$players = $cache->load();
					}

					if ($players) {
						$count = 1;
						foreach($players as $player) {
							echo "<li>$count - <a class='playerlink' href='characterprofile.php?name=". $player['name']. "'>". $player['name']. "</a> <span class='lvl'>". $player['level'] ." lvl</span></li>";
							$count++;
						}
					}
					?>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>