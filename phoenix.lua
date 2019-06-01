_addon.author   = 'Mykezero'
_addon.name     = 'phoenix'
_addon.version  = '1.0.0'

require "common"
require "core"

ashita.register_event('load', function()
    phoenix.load()
end)

ashita.register_event('command', function(cmd, nType)
    LogManager:Log(LogLevel.Debug, "Phoenix",  "hit!")
    print('Command event fired!')
    return false
end)