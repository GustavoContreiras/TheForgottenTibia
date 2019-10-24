<h1>Bomberman Scoreboard</h1>
<?php // Creating cache
$cache = new Cache('engine/cache/bomberman');
if ($cache->hasExpired()) {
	$scores = bomberman_highscores();
	
	$cache->setContent($scores);
	$cache->save();
} else {
	$scores = $cache->load();
}
if ($scores) {
	?>
	<table>
		<tr class="yellow">
			<td>Name</td>
			<td>Wins</td>
			<td>Loss</td>
			<td>Games played</td>
			<td>Frags</td>
			<td>Deaths</td>
		</tr>
		<?php foreach ($scores as $score) { ?>
		<tr>
			<?php
			echo "<td><a href='characterprofile.php?name=". $score['name'] ."'>". $score['name'] ."</a></td>";
			echo "<td>". $score['wins'] ."</td>";
			echo "<td>". $score['losses'] ."</td>";
			echo "<td>". $score['total_games'] ."</td>";
			echo "<td>". $score['frags'] ."</td>";
			echo "<td>". $score['deaths'] ."</td>";
			?>
		</tr>
		<?php } ?>
	</table>
	<?php
} ?>