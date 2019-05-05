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
	it("should execute method with string argument", function()
		local sut = createsut()
		stub(sut, "sendcommand")		
		sut.replay({ 
			method = "sendcommand", 
			inputs = "/attack on" 
		})
		assert.stub(sut.sendcommand).was.called_with("/attack on")
	end)
end)

function createsut()
    return require("phoenix")
end