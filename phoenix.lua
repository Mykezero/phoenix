local phoenix = {}

function main()
	_addon.author   = 'Mykezero'
	_addon.name     = 'phoenix'
	_addon.version  = '1.0.0'

	require "common"

	ashita.register_event('load', load)
end

CommandInputType = { Typed = 1 }

-- Do not throw errors when run outside Ashita
pcall(main)

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

function phoenix.run(behavior)
	behavior.execute()
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

function phoenix.testmethod(input)
	local a = 2
	if(2 == testmethod2()) then return "hit!" end
	return "no hit!"
end

function testmethod2()
	return 2
end

function phoenix.getlogs()
	return ""
end

function phoenix.replay(frame)
	phoenix[frame.method](frame.inputs)
end

return phoenix;