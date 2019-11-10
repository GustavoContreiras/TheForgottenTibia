function onTime(interval)
	local index = math.ceil(math.random() * #TIP_MESSAGES)
	broadcastMessage(TIP_MESSAGES[index])
	return true
end
