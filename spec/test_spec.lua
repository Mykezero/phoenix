require 'busted.runner'()

describe("Engage", function()
    it("should send '/attack on' command", function()
        local sut = creatsut()
        stub(sut, "sendcommand")
        sut.engage();
        assert.stub(sut.sendcommand).was.called()
        assert.stub(sut.sendcommand).was.called_with("/attack on")
    end)
end)

describe("Run", function()
    it("should execute behavior", function ()
        local sut = creatsut()
        sut.run({ execute = function() sut.status = 1 end})
        assert.are.equal(1, sut.status)
    end)
end)

describe("FindMob", function ()
    it("should find the closest mob", function()
        local sut = creatsut()
        local context = { entities = {
            {  name = "sheep",  distance = 15.0 },
            {  name = "bee",  distance = 17.0 }
        } }
        local mob = sut.findmob(context)
        assert.are.equal("sheep", mob.name)
    end)
end)

describe("Replay", function()
	it("should replay the given logs", function()
		local sut = creatsut();
		stub(sut, "sendcommand")		
		sut.replay({ 
			method = "sendcommand", 
			inputs = "/attack on" 
			}
		)
		assert.stub(sut.sendcommand).was.called_with("/attack on")
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


function creatsut()
    return require("phoenix")
end