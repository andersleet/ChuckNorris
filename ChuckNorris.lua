SLASH_NORRIS1 = "/cn"
SLASH_NORRIS2 = "/chuck"
SLASH_NORRIS3 = "/norris"
SLASH_NORRIS4 = "/chucknorris"

function GetFact(i)
	return facts[i]
end

function GetRandomFact(i)
	return GetFact(random(1, i-1))
end

function PostFact(input)
	local sS, sE, cmd, arg = strfind(input, "%s?(%w+)%s?(%d*)")
	local channel, n, fact = "CHANNEL", 0, ""
	
	local totalFactCount = arrLen(facts)
	
	if (cmd == nil) then									-- just slash command sent, send to general chat
		cmd = "GENERAL"
		n = 1
		arg = 0
	else													-- slash command sent with or without arguments
		if (arg == nil) then								-- no argument
			arg = 0
		elseif (tonumber(arg) == nil) then					-- non-numeric argument
			arg = 0
		else												-- numeric argument (get a specific fact index)
			arg = tonumber(arg)
		end		
		
		if (arg > totalFactCount) then						-- if argument is larger than fact array, reset to random fact
			arg = 0
		end
	end
		
	if (arg > 0) then										-- specific fact number specified by arg
		fact = GetFact(arg)
	else													-- random fact from fact array
		fact = GetRandomFact(totalFactCount)
	end

	i = strupper(cmd)

	if (i == "1" or i == "GENERAL" or i == 1) then
		n = 1
	elseif (i == "2" or i == "TRADE" or i == 2) then
		n = 2
	elseif (i == "3" or i == "LOCALDEFENSE" or i == 3) then
		n = 3
	elseif (i == "4" or i == "WORLD" or i == 4) then
		n = 4
	elseif (i == "S" or i == "SAY") then
		channel = "SAY"
		n = -2
	elseif (i == "Y" or i == "YELL") then
		channel = "YELL"
		n = -2
	elseif (i == "P" or i == "PARTY") then
		channel = "PARTY"
		n = -2
	elseif (i == "G" or i == "GUILD") then
		channel = "GUILD"
		n = -2
	elseif (i == "O" or i == "OFFICER") then
		channel = "OFFICER"
		n = -2
	elseif (i == "T" or i == "TEST") then
		print(fact)
		do return end
	else
		n = 1	
	end

	SendChatMessage(fact, channel, nil, n)
end

function SlashCmdList.NORRIS(args)
	PostFact(args)
end