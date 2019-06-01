require 'busted.runner'
require 'spec.test_factory'

describe("Engage", function()
    it("should send attack on command", function()
        local api = mock_api()
        local sut = create_sut(api)
        sut.engage();
        assert.stub(api.queue_command).was.called()
        assert.stub(api.queue_command).was.called_with("/attack on")
    end)
end)