<div class="sidebar">
	<h2>Welcome, <?php echo $user_data['name']; ?>.</h2>
	<div class="inner">
		<ul>
			<?php
			// If admin
			if (is_admin($user_data)) {
			?>
			<li>
				<a href='admin.php'>Admin Page</a>
			</li>
			<li>
				<a href='admin_news.php'>Admin News</a>
			</li>
			<?php
			}
			// end if admin
			?>
			<li>
				<a href='myaccount.php'>My Account</a>
			</li>
			<li>
				<a href='createcharacter.php'>Create Character</a>
			</li>
			<li>
				<a href='changepassword.php'>Change Password</a>
			</li>
			<li>
				<a href='settings.php'>Settings</a>
			</li>
			<li>
				<a href='logout.php'>Logout</a>
			</li>
		</ul>
	</div>
</div>