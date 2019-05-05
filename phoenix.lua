--[[
	Ashita specific functionality
--]]
function main()
	_addon.author   = 'Mykezero'
	_addon.name     = 'phoenix'
	_addon.version  = '1.0.0'

	require "common"

	ashita.register_event('load', load)
end

local phoenix = { }

CommandInputType = { Typed = 1 }

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
	local Typed = 1
	QueueCommand(command, 1)
end

function phoenix.load()
	phoenix.sendcommand("hi!")
end

function phoenix.replay()
	for _, context in pairs(phoenix.logs) do
		phoenix.tick(v)
	end
end

function phoenix.getlogs()
	return phoenix.logs
end

-- Do not throw errors when run outside Ashita
pcall(main)

return phoenix;