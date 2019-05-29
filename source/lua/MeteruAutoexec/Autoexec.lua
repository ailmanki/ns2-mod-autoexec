do
    local autoexecFileName = "Autoexec.json"
    local autoexecDefaultConfig = {commands = {"fps on"}}
    local autoexecJson = LoadConfigFile(autoexecFileName, autoexecDefaultConfig) or {}
    local function OnLoadComplete()
        for commandIndex = 1, #autoexecJson.commands do
            Shared.ConsoleCommand(autoexecJson.commands[commandIndex])
            Print("Autoexec executed command #%s: %s", commandIndex, autoexecJson.commands[commandIndex])
        end
    end
    Event.Hook("LoadComplete", OnLoadComplete)
end