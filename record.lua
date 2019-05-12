function getTempName(info)
	local name = nil
	local open = io.open
	local filename = string.sub(info.source, 2)	
	
	if(file_exists(filename)) then

		local i = 1
		for line in io.lines(filename) do		
			if(i == info.currentline) then
				_, _, tempname = string.find(line, "local (%a)")						
				name = tempname
			end		
			i = i + 1
		end		
	end
	
	if (name == nil) then return "Unknown" end
	return name
end

function traceback()
	sendcommand("1")
	sendcommand("2")
end

function sendcommand(command)
	local a = "hit"
end

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function trace (...)
	local info = debug.getinfo(2, "nfSl")
	local name, value = debug.getlocal(2, 2)
	
	if(name == "(*temporary)") then
		name = getTempName(info)
	end
	
	print(info.name, info.namewhat, info.source, info.currentline)
	print("Locals: ", name, value)
end

debug.sethook(trace, "c")

traceback()