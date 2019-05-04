
function main()
	_addon.author   = 'Mykezero'
	_addon.name     = 'luafarm'
	_addon.version  = '1.0.0'

	require "common"

	ashita.register_event('load', Load)
end

-- Do not throw errors when run outside Ashita
pcall(main)

function Load()
	print("Hi!")
end