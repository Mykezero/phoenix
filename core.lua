local phoenix = { }

CommandInputType = {
    Typed = 1
}

LogLevel = {
    None = 0,
    Information = 1,
    Warning = 2,
    Error = 3,
    Debug = 4
};

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
    phoenix.sendcommand("/attack on")
end

function phoenix.sendcommand(command)
    AshitaCore:GetChatManager():QueueCommand(command, CommandInputType.Typed)
end

function phoenix.load()
    phoenix.sendcommand("/echo hi!")
end

function phoenix.replay()
    for _, context in pairs(phoenix.logs) do
        phoenix.tick(v)
    end
end

function phoenix.getlogs()
    return phoenix.logs
end

return phoenix;