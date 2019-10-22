<?PHP 
	if($config['status']['serverStatus_online'] == 1) 
		echo '<font color="limegreen"><b>Server Online</b></font>'; 
	else 
		echo '<font color="red"><b>Sever Offline</b></font>';
?><br />
Uptime: <?PHP if($config['status']['serverStatus_online'] == 1) echo $config['status']['serverStatus_uptime'].''; else echo '0h 0m'; ?><br />
Players Online: <?PHP i f($config['status']['serverStatus_online'] == 1) echo $config['status']['serverStatus_players'].''; else echo '0'; ?><br />
Record: <?PHP $record = $SQL->query('SELECT `record` FROM `server_record` ORDER BY `record` DESC LIMIT 1;'); foreach($record as $result) { echo ''.$result['record'].''; } ?><br />
<?PHP
	$plik = "online.txt";
	$czas = 60;
	$t = time();
	$ip = $HTTP_SERVER_VARS['REMOTE_ADDR'];    
	$u = explode("\n", str_replace("\r", "", @join("", @file($plik))));
	foreach($u as $i => $v) {
		$e = explode("|", $v);
		if($e[0] == $ip || $e[1] < $t) unset($u[$i]);
	}
	$u[] = $ip . "|" . ($t + $czas);
	$fp = fopen($plik, "w");
	flock($fp, 2);
	fputs($fp, join("\n", $u));
	flock($fp, 3);
	fclose($fp);
	echo 'Users on page: '.count($u);
?>
</a>