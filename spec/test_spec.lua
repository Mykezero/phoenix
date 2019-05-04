require 'busted.runner'()

describe("Engage", function()
    it("should send '/attack on' command", function()
        local sut = createSut()
        stub(sut, "sendcommand")
        sut.engage();
        assert.stub(sut.sendcommand).was.called()
        assert.stub(sut.sendcommand).was.called_with("/attack on")
    end)
end)

describe("Run", function()
    it("should execute behavior", function ()
        local sut = createSut()
        sut.run({ execute = function() sut.status = 1 end})
        assert.are.equal(1, sut.status)
    end)
end)

describe("FindMob", function ()
    it("should find the closest mob", function()
        local sut = createSut()
        local context = { entities = {
            {  name = "sheep",  distance = 15.0 },
            {  name = "bee",  distance = 17.0 }
        } }
        local mob = sut.findmob(context)
        assert.are.equal("sheep", mob.name)
    end)
end)


function createSut()
    return require("phoenix");
end