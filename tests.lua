require('luaunit')
local sut = require("luafarm")


TestLuaFarm = {}

function TestLuaFarm:testMethod()
	sut.Load()
	
end

os.exit(LuaUnit:run())