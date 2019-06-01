local api = {}

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

function api.queue_command(command)
    AshitaCore:GetChatManager():QueueCommand(command, CommandInputType.Typed)
end

return api;