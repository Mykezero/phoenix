require 'busted.runner'()
require 'spec.test_factory'

describe("Replay", function()
	it("should replay past log events", function()
		local sut = createsut()
		stub(sut, "sendcommand")
		sut.run({ aggro = true })
		sut.replay()
		assert.stub(sut.sendcommand).was.called(2)
	end)
end)