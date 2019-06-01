require 'busted.runner'()
require 'spec.test_factory'

describe("Run", function()
    it("should log the input context", function()
        local api = mock_api()
        local sut = create_sut(api)
        local context = { command = "HIT!"}
        sut.run(context)
        local result = sut.get_logs()
        assert.same({ context }, result)
    end)
end)