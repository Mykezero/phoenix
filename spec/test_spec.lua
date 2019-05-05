require 'busted.runner'()

describe("Engage", function()
    it("should send '/attack on' command", function()
        local sut = createsut()
        stub(sut, "sendcommand")
        sut.engage();
        assert.stub(sut.sendcommand).was.called()
        assert.stub(sut.sendcommand).was.called_with("/attack on")
    end)
end)

describe("Run", function()
    it("should execute behavior", function ()
        local sut = createsut()
        sut.run({ execute = function() sut.status = 1 end})
        assert.are.equal(1, sut.status)
    end)
end)

describe("FindMob", function ()
    it("should find the closest mob", function()
        local sut = createsut()
        local context = { entities = {
            {  name = "sheep",  distance = 15.0 },
            {  name = "bee",  distance = 17.0 }
        } }
        local mob = sut.findmob(context)
        assert.are.equal("sheep", mob.name)
    end)
end)

describe("Replay", function()
	it("should execute method with string argument", function()
		local sut = createsut()
		stub(sut, "sendcommand")		
		sut.replay({ 
			method = "sendcommand", 
			inputs = "/attack on" 
			}
		)
		assert.stub(sut.sendcommand).was.called_with("/attack on")
	end)
end)

describe("Record", function()
	it("record method call with one argument", function() 
		local sut = createsut()
		sut.sendcommand("/attack on")
		local result = sut.getlogs()
		assert.are.equal("sendcommand", result.method)
		assert.are.equal("/attack on", result.inputs)
	end)
end)

function findlog()
	return [[
	[
	   {
		  "start":"2019-05-04 18:00:00.000Z",
		  "end":"2019-05-04 18:00:01.000Z",
		  "name":"testmethod",
		  "input":{ "name":"player" },
		  "locals":{ "a":2 },
		  "output": { "hit" },
		  "calls": { }
	   }
	]
	]]
end


function createsut()
    return require("phoenix")
end