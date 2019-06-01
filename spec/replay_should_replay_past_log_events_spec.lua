require 'busted.runner'()
require 'spec.test_factory'

describe("Replay", function()
	it("should replay past log events", function()
		local api = mock_api()
		local sut = create_sut(api)
		sut.run({ aggro = true })
		sut.replay()
		assert.stub(api.queue_command).was.called(2)
	end)
end)