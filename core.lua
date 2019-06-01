local phoenix = { }
local factory = { }
local _api

function factory.create(api)
    _api = api
    return phoenix
end

function phoenix.reset()
    phoenix.logs = {}
end

function phoenix.run(context)
    table.insert(phoenix.logs, context)
    phoenix.tick(context)
end

function phoenix.tick(context)
    phoenix.engage()
end

function phoenix.engage()
    _api.queue_command("/attack on")
end

function phoenix.load()
    phoenix.queue_command("/echo hi!")
end

function phoenix.replay()
    for _, context in pairs(phoenix.logs) do
        phoenix.tick(v)
    end
end

function phoenix.get_logs()
    return phoenix.logs
end

return factory;