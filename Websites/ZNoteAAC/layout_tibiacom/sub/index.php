<?php
if ($config['UseChangelogTicker']) {
	//////////////////////
	// Changelog ticker //
	// Load from cache
	$changelogCache = new Cache('engine/cache/changelog');
	$changelogs = $changelogCache->load();

	if (isset($changelogs) && !empty($changelogs) && $changelogs !== false) {
		?>
		<table id="changelogTable">
			<tr class="yellow">
				<td colspan="2">Latest Changelog Updates (<a href="changelog.php" style="color: darkorange;">Click here to see full changelog</a>)</td>
			</tr>
			<?php
			for ($i = 0; $i < count($changelogs) && $i < 5; $i++) {
				?>
				<tr>
					<td><?php echo getClock($changelogs[$i]['time'], true, true); ?></td>
					<td><?php echo $changelogs[$i]['text']; ?></td>
				</tr>
				<?php
			}
			?>
		</table>
		<?php
	} else echo "No changelogs submitted.";
}
$cache = new Cache('engine/cache/news');
if ($cache->hasExpired()) {
	$news = fetchAllNews();
	
	$cache->setContent($news);
	$cache->save();
} else {
	$news = $cache->load();
}

// Design and present the list
if ($news) {
	function TransformToBBCode($string) {
		$tags = array(
			'[center]{$1}[/center]' => '<center>$1</center>',
			'[b]{$1}[/b]' => '<b>$1</b>',
			'[size={$1}]{$2}[/size]' => '<font size="$1">$2</font>',
			'[img]{$1}[/img]'    => '<a href="$1" target="_BLANK"><img src="$1" alt="image" style="width: 100%"></a>',
			'[link]{$1}[/link]'    => '<a href="$1">$1</a>',
			'[link={$1}]{$2}[/link]'   => '<a href="$1" target="_BLANK">$2</a>',
			'[color={$1}]{$2}[/color]' => '<font color="$1">$2</font>',
			'[*]{$1}[/*]' => '<li>$1</li>',
			'[youtube]{$1}[/youtube]' => '<div class="youtube"><div class="aspectratio"><iframe src="//www.youtube.com/embed/$1" frameborder="0" allowfullscreen></iframe></div></div>',
		);

		foreach ($tags as $tag => $value) {
			$code = preg_replace('/placeholder([0-9]+)/', '(.*?)', preg_quote(preg_replace('/\{\$([0-9]+)\}/', 'placeholder$1', $tag), '/'));
			$string = preg_replace('/'.$code.'/i', $value, $string);
		}

		return $string;
	}
	echo '<div id="newz">';
	foreach ($news as $n) {
		?>
		<div class="BorderTitleText" style="background-image:url(layout/images/global/content/newsheadline_background.gif); color: white;"><?php echo '<font size="2">'. getClock($n['date'], true) .' by <a href="characterprofile.php?name='. $n['name'] .'">'. $n['name'] .'</a></font><font size="4" color="white"> - '. TransformToBBCode($n['title']) .'</font>'; ?></div>
		<p><?php echo TransformToBBCode(nl2br($n['text'])); ?></p>
		<?php
	}
	echo '</div>';
}
?>