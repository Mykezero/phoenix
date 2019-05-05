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
	it("should log the input context", function()
		local sut = createsut()
		local context = { command = "HIT!"}
		sut.run(context)
		local result = sut.getlogs()
		assert.same({ context }, result)
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
	it("should replay past log events", function()
		local sut = createsut()
		stub(sut, "sendcommand")
		sut.run({ aggro = true })
		sut.replay()
		assert.stub(sut.sendcommand).was.called(2)
	end)
end)

function createsut()
	local sut = require "phoenix"
	sut.reset()
	return sut
end