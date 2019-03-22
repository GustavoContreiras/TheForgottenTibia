<?php if (user_logged_in() === false) { ?>
	<h2>Login / Register</h2>
	<div class="inner">
		<form action="login.php" method="post">
		<ul id="login">
			<li>
				Username: <br>
				<input type="text" name="username">
			</li>
			<li>
				Password: <br>
				<input type="password" name="password">
			</li><?php if ($config['twoFactorAuthenticator'] == true) { ?>
			<li>
				Token: <br>
				<input type="password" name="authcode">
			</li><?php } ?>
			<li>
				<input type="submit" value="Log in">
			</li>
			<?php
				if ($config['use_token'] == true) {
					/* Form file */
					Token::create();
				}
			?>
		<h3><a href="register.php">Create new account</a><br>
		<a href="recovery.php">Account Recovery</a></h3>
		</ul>
		</form>
	</div>

<?php }else{
header('location: myaccount.php');
}

?>