local mock = require "luassert.mock"

function create_sut(api)
    local factory = require "core"
    local sut = factory.create(api)
    sut.reset()
    return sut
end

function mock_api()
    local api = require "api"
    local mock_api = mock(api, true)
    return mock_api
end