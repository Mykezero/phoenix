local phoenix = { }

CommandInputType = 
{ 
	Typed = 1 
}

LogLevel = {
	None = 0,
	Information = 1,
	Warning = 2,
	Error = 3,
	Debug = 4
};

function phoenix.reset()
	phoenix.logs = {}	
end

function phoenix.findmob(context)
	table.sort(context.entities, function(a,b)
		return a.distance < b.distance
	end)

	for _, v in ipairs(context.entities) do
		if(v.distance < 25) then
			return v
		end
	end
	return nil
end

function phoenix.run(context)
	table.insert(phoenix.logs, context)	
	phoenix.tick(context)
end

function phoenix.tick(context)
	phoenix.engage()
end

function phoenix.engage()
	phoenix.sendcommand("/attack on")
end

function phoenix.sendcommand(command)
	AshitaCore:GetChatManager():QueueCommand(command, CommandInputType.Typed)
end

function phoenix.load()
	phoenix.sendcommand("/echo hi!")
end

function phoenix.replay()
	for _, context in pairs(phoenix.logs) do
		phoenix.tick(v)
	end
end

function phoenix.getlogs()
	return phoenix.logs
end

--[[
	Ashita specific functionality
--]]
function main()
	_addon.author   = 'Mykezero'
	_addon.name     = 'phoenix'
	_addon.version  = '1.0.0'

	require "common"

	ashita.register_event('load', function()
		phoenix.load()
	end)
	
	ashita.register_event('command', function(cmd, nType)	
		LogManager:Log(LogLevel.Debug, "Phoenix",  "hit!")
		print('Command event fired!')
		return false
	end)
end

-- Do not throw errors when run outside Ashita
pcall(main)

return phoenix;