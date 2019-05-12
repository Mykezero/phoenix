require 'busted.runner'()

describe("FindMob", function ()
    it("should find aggroed mobs", function()
        local sut = createsut()
        local context = { entities = {
            {  name = "sheep",  hasAggro = true },
            {  name = "bee",  hasAggro = false }
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