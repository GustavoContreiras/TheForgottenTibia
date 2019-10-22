<h1>Characters</h1>
<p>here you can search for a character, or view a list of all characters.</p>
<h2>Search for character</h2>
<form action="characterprofile.php" method="GET">
<input type="text" name="name">
<input type="submit" value="Search">
</form><br>
<h2>Character list</h2>
<?php
$players = mysql_select_multi("SELECT `name`, `level`, `lastlogin` FROM `players` ORDER BY `name` ASC;");
?>
<table>
	<tr>
		<th>Name</th>
		<th>Level</th>
		<th>Last login</th>
	</tr>
	<?php
	foreach ($players as $player) {
		?>
		<tr>
			<td><a href="characterprofile.php?name=<?php echo $player['name']; ?>"><?php echo $player['name']; ?></a></td>
			<td><?php echo $player['level']; ?></td>
			<td><?php echo getClock($player['lastlogin'], true, true); ?></td>
		</tr>
		<?php
	}
	?>
</table>