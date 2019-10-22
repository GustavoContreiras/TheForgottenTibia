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
								<h3 class="module"><span class="color">Manage</span> Account</h3>
							</div>
						</div>
						<div style="overflow: hidden;">
							<?PHP if(user_logged_in()) {
								echo '+ <b><a href="myaccount.php" class="menu">My Account</a><br />
								+ <b><a href="createcharacter.php" class="menu">Create character</a><br />
								+ <a href="changelog.php" class="menu">Bug Tracker</a><br />
								+ <a href="helpdesk.php" class="menu">Helpdesk</a><br />
								+ <a href="forum.php" class="menu">Forum</a><br />
								+ <a href="logout.php" class="menu">Log out</a></b><br />';
								if(is_admin($user_data)) {
									?>
										<center><br /><h6>Admin Panel</h6></center>
										+ <a href='admin.php'>Admin Page</a><br />
										+ <a href='admin_news.php'>Admin News</a><br />
										+ <a href='admin_gallery.php'>Admin Gallery</a><br />
										+ <a href='admin_skills.php'>Admin Skills</a><br />
										+ <a href='admin_reports.php'>Admin Reports</a><br />
										+ <a href='admin_helpdesk.php'>Admin Helpdesk</a><br />
										+ <a href='admin_shop.php'>Admin Shop</a><br />
										<?php
										$new = 0;
										$cat = 4; //Category ID for feedback section
										$threads = mysql_select_multi("SELECT `id`, `player_id` FROM `znote_forum_threads` WHERE `forum_id`='$cat' AND `closed`='0';");
										if ($threads !== false) {
											$staffs = mysql_select_multi("SELECT `id` FROM `players` WHERE `group_id` > '1';");
											
											foreach($threads as $thread) {
												$response = false;
												$posts = mysql_select_multi("SELECT `id`, `player_id` FROM `znote_forum_posts` WHERE `thread_id`='". $thread['id'] ."';");
												if ($posts !== false) {
													foreach($posts as $post) {
														foreach ($staffs as $staff) {
															if ($post['player_id'] == $staff['id']) $response = true;
														}
													}
												}

												if (!$response) $new++;
											}
										}
										?>
										+ <a href='forum.php?cat=4'>Feedback: [<?php echo $new; ?>] new</a><br />
									<?php
								}
							} else {
								?>
								<form action="login.php" method="post" >
									<font color="white">Account:<br></font>
									<input class="menuForm" type="password" name="username" SIZE="18" maxlength="10" ><br>
									<font color="white">Password:<br></font>
									<input class="menuForm" type="password" name="password" size="18" maxlength="29" ><br><br>
									<input type="image" src="layout/images/login.gif" value="Login" />
									<?php Token::create(); ?>
								</form>
								+ <b><a href="register.php" class="menu">Create Account</a></b><br />
								+ <a href="recovery.php" class="menu">Recover account</a><br />';
								<?php
							}
							?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>