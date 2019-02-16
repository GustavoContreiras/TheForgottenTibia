local OPCODE_LANGUAGE = 1

function onExtendedOpcode(player, opcode, buffer)
	if opcode == OPCODE_LANGUAGE then
		-- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			-- player:setStorageValue(SOME_STORAGE_ID, SOME_VALUE)
			player:setStorageValue(10666, 1)
		end
	else
		-- other opcodes can be ignored, and the server will just work fine...
	end
end
