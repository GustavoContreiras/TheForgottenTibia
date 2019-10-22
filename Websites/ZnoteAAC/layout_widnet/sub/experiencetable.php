<h1>Experience Table</h1>
<table>
	<tr>
		<th>Level</th>
		<th>Experience</th>
	</tr>
	<?php
	for ($i = 1; $i < 501; $i++) {
		?>
		<tr>
			<td><?php echo $i; ?></td>
			<td><?php echo level_to_experience($i); ?></td>
		</tr>
		<?php
	}
	?>
</table>