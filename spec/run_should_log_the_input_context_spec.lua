require 'busted.runner'()
require 'spec.test_factory'

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