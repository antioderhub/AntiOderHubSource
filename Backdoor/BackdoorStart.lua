local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "AntiOder Hub Loader | Backdoor | Executor: "..identifyexecutor(),
    SubTitle = "by aftr",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Backdoor", Icon = "" }),
}

Tabs.Main:AddParagraph({
        Title = "Info",
        Content = "Welcome to AntiOder Hub Backdoor. You must execute backdoor checker by LALOL for using the script!"
    })
