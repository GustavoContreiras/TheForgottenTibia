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
								<h3 class="module"><span class="color">Infor</span>mation</h3>
							</div>
						</div>
						<div style="overflow: hidden;">
							<?php
							$status = true;
							if ($config['status']['status_check']) {
								@$sock = fsockopen ($config['status']['status_ip'], $config['status']['status_port'], $errno, $errstr, 1);
								if(!$sock) {
									echo "<span style='color:red;font-weight:bold;'><center>Server Offline!</center></span><br/>";
									$status = false;
								}
								else {
									$info = chr(6).chr(0).chr(255).chr(255).'info';
									fwrite($sock, $info);
									$data='';
									while (!feof($sock))$data .= fgets($sock, 1024);
									fclose($sock);
									echo "<span style='color:green;font-weight:bold;'><center>Server Online!</center></span><br />";
								}
							}
							if ($status) {
								?>
								<a href="onlinelist.php">Players online: 
									<?php echo user_count_online(); ?></a>
								<?php
							}
							?>
							Registered accounts: <?php echo user_count_accounts();?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>