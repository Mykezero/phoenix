require 'busted.runner'()

describe("Run", function()
    it("should log the input context", function()
        local sut = createsut()
        stub(sut, "sendcommand")
        local context = { command = "HIT!"}
        sut.run(context)
        local result = sut.getlogs()
        assert.same({ context }, result)
    end)
end)

function createsut()
    local sut = require "phoenix"
    sut.reset()
    return sut
end