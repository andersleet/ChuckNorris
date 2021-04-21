SLASH_NORRIS1 = "/cn"
SLASH_NORRIS2 = "/chuck"
SLASH_NORRIS3 = "/norris"
SLASH_NORRIS4 = "/chucknorris"
SLASH_NORRIS5 = "/cnf"

function PostFact(input)
	local sS, sE, cmd, arg = strfind(input, "%s?(%w+)%s?(%d*)")
	--local channel, channelID, fact = "CHANNEL", 0, ""
	--local channel, channelID, fact, totalFactCount = "CHANNEL", 0, "", arrLen(facts)	
	--local totalFactCount = arrLen(facts)
	local channel = "CHANNEL"
	local channelID = 0
	local fact = ""
	local totalFactCount = arrLen(facts)
	
	if (cmd == nil) then									-- just slash command sent, send to general chat
		cmd = "GENERAL"
		channelID = 1
		arg = 0
	else													-- slash command sent with or without arguments
		if (arg == nil) then								-- no argument
			arg = 0
		elseif (tonumber(arg) == nil) then					-- non-numeric argument, reset to no argument
			arg = 0
		else												-- numeric argument to get a specific fact from the array
			arg = tonumber(arg)
		end		
		
		if (arg >= totalFactCount) then						-- if argument is larger than fact array, reset to no argument
			arg = 0
		end
	end
		
	if (arg > 0) then										-- specific fact number specified by arg
		fact = GetFact(arg)
	else													-- random fact from fact array
		fact = GetRandomFact(totalFactCount)
	end

	cmd = strupper(cmd)

	if (cmd == "1" or cmd == "GENERAL") then
		channelID = 1
	elseif (cmd == "2" or cmd == "TRADE") then
		channelID = 2
	elseif (cmd == "3" or cmd == "LOCALDEFENSE") then
		channelID = 3
	elseif (cmd == "S" or cmd == "SAY") then
		channel = "SAY"
	elseif (cmd == "Y" or cmd == "YELL") then
		channel = "YELL"
	elseif (cmd == "P" or cmd == "PARTY") then
		channel = "PARTY"
	elseif (cmd == "G" or cmd == "GUILD") then
		channel = "GUILD"
	elseif (cmd == "O" or cmd == "OFFICER") then
		channel = "OFFICER"
	
	--elseif (cmd == "W" or cmd = "WHISPER") then
		--print("maybe?")
		---- looks like I may need to capture another arg for whispers to get this bit to work; channelID var may need to be set to whisper target
		---- also errors thrown when this conditional is uncommented?
	
	elseif (cmd == "T" or cmd == "TEST") then				-- mostly for debugging
		print(fact)
		do return end
	else
		channelID = tonumber(cmd)
		local id, name = GetChannelName(channelID)
		if (id == 0 or name == nil) then					-- if channel doesnt exist, send to general chat
			channelID = 1
		end
	end

	SendChatMessage(fact, channel, nil, channelID)
end

function SlashCmdList.NORRIS(args)
	PostFact(args)
end
