require 'busted.runner'()

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

function createsut()
    local sut = require "phoenix"
    sut.reset()
    return sut
end