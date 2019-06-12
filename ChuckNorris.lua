SLASH_NORRIS1 = "/cn"
SLASH_NORRIS2 = "/chuck"
SLASH_NORRIS3 = "/norris"
SLASH_NORRIS4 = "/chucknorris"

function arrlen(a)
	local i = 1
	for _ in pairs(a) do i = i + 1 end
	return i
end

function NorrisFact()
	return facts[random(1,arrlen(facts))]
end

function SlashCmdList.NORRIS()
	GeneralChannelMessage(NorrisFact())
end

function SlashCmdList.NORRIS(n)
	i = string.upper(n)
	f = NorrisFact()
	c = nil
	n = nil
	
 	if i == "1" then				-- General
		c = "CHANNEL"
		n = 1
 	elseif i == "2" then				-- Trade
		c = "CHANNEL"
		n = 2
	elseif i == "3" then				-- LocalDefense
		c = "CHANNEL"
		n = 3
	elseif i == "4" then				-- World
		c = "CHANNEL"
		n = 4
 	elseif i == "S" or i == "SAY" then		-- Say
		c = "SAY"
		n = nil
	elseif i == "Y" or i == "YELL" then		-- Yell
		c = "YELL"
		n = nil
	elseif i == "P" or i == "PARTY" then		-- Party
		c = "PARTY"
		n = nil
	elseif i == "G" or i == "GUILD" then		-- Guild
		c = "GUILD"
		n = nil
 	else						-- Default: General
		c = "CHANNEL"
		n = 1	
 	end
 	 	
 	SendChatMessage(f,c,nil,n)
end