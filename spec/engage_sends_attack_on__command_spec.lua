require 'busted.runner'()

describe("Engage", function()
    it("should send attack on command", function()
        local sut = createsut()
        stub(sut, "sendcommand")
        sut.engage();
        assert.stub(sut.sendcommand).was.called()
        assert.stub(sut.sendcommand).was.called_with("/attack on")
    end)
end)

function createsut()
    local sut = require "phoenix"
    sut.reset()
    return sut
end