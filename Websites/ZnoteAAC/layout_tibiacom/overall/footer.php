											</div>
										</div>
									</div>
									<div class="Border_1" style="background-image:url(layout/images/global/content/border-1.gif);"></div>
									<div class="CornerWrapper-b">
										<div class="Corner-bl" style="background-image:url(layout/images/global/content/corner-bl.gif);"></div>
									</div>
									<div class="CornerWrapper-b">
										<div class="Corner-br" style="background-image:url(layout/images/global/content/corner-br.gif);"></div>
									</div>
								</div>
								<div id="ThemeboxesColumn" >
									<?php include 'layout/rightside.php'; ?>
								</div>
							</div>
						</div>
						<div id="Footer">
							&copy; <?php echo $config['site_title'];?>.
							<?php
								$time = microtime();
								$time = explode(' ', $time);
								$time = $time[1] + $time[0];
								$finish = $time;
								$total_time = round(($finish - $start), 4);
								echo 'Server date and clock is: '. getClock(time(), true) .' Page generated in '. $total_time .' seconds.';
							?>
							<br /> Layout by CipSoft GmbH. Engine: <a href="credits.php">Znote AAC</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>