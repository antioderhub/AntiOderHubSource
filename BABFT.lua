

 

if not isfolder("AOH_BABFT") then
    makefolder("AOH_BABFT")
end

if not isfolder("AOH_BABFT/Image") then
    makefolder("AOH_BABFT/Image")
end

if not isfolder("AOH_BABFT/Build") then
    makefolder("AOH_BABFT/Build")
end

local FcMaster = true
local folderName = "ImagePreview"
local previewFolder = Workspace:FindFirstChild(folderName) or Instance.new("Folder", Workspace)
previewFolder.Name = folderName

for _, v in ipairs(previewFolder:GetChildren()) do
    v:Destroy()
end

local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local JobId = game.JobId
local PlaceId = game.PlaceId
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local tweenService = game:GetService("TweenService")
local copy = "https://t.me/aftermathscript"
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Sirius/request/library/sense/source.lua'))()

autoez=false
loop_teleport=false
ambient=game.Lighting.Ambient
outdoor_ambient=game.Lighting.OutdoorAmbient
fogstart=game.Lighting.FogStart
brightness=game.Lighting.Brightness
local clocktime=game.Lighting.ClockTime
shadows=game.Lighting.GlobalShadows
mouse=game.Players.LocalPlayer:GetMouse()
camera=game.Workspace.CurrentCamera
UserInputService=game:GetService('UserInputService')
VirtualInputManager=game:GetService('VirtualInputManager')
RunService=game:GetService('RunService')
player=game.Players.LocalPlayer
walkspeed_value=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
jumppower_value=game.Players.LocalPlayer.Character.Humanoid.JumpPower
local viewEnabled = false;





-- SPEED WALK, JUMP POWER, INFINITE JUMP
mouse.KeyDown:connect(function(i)
	key=i:byte()
	for i,v in {119, 97, 115, 100} do --WASD
		if v==key then
			player.Character.Humanoid.WalkSpeed=walkspeed_value
			return
		end
	end
	if key==32 then --Spacebar
		player.Character.Humanoid.JumpPower=jumppower_value
		game.Workspace.Gravity=gravity_value
		if infinite_jump then
			player.Character.Humanoid:ChangeState('Jumping')
			wait(0.1)
			player.Character.Humanoid:ChangeState('Seated')
		end
	end
end)
-- CTRL TP
UserInputService.InputBegan:Connect(function(i, _)
	if i.UserInputType==Enum.UserInputType.MouseButton1 then
		if ctrl_tp and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z))
		end
	end
end)








local Window = Rayfield:CreateWindow({
   Name = "AntiOder Hub 3.0 ❤️ | Executor: "..identifyexecutor(),
   Icon = 128216856751714
   LoadingTitle = "waiting the script loading",
   LoadingSubtitle = "by aftr.lua",
   Theme = "AmberGlow",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "pm Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Aftermath Key System | рџЋ„",
      Subtitle = "РїСЂСѓС„Р°РЅРё С‡С‚Рѕ С‚С‹ РЅРµ С„Р°РЅС‚РѕРј ))0)",
      Note = "РєР»СЋС‡ С‚РѕР»СЊРєРѕ РґР»СЏ РїРѕР»РёСЃРјРµРЅРѕРІ",
      FileName = "ScriptHubKey1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/texBrQXF"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})



local ABOUTTab = Window:CreateTab("Home", nil) -- Title, Image
local ABOUTSection = ABOUTTab:CreateSection("About script")

Rayfield:Notify({
   Title = "Script Executed!",
   Content = "Welcome to the Phantom Hub | Aftermath Lua Ecosystem",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Label = ABOUTTab:CreateLabel("ANTIODER HUB CREATED BY AFTERMATH WITH LOVE.")



local Button = ABOUTTab:CreateButton({
   Name = "Telegram channel",
   Callback = function()
setclipboard(tostring(copy))
   end,
})

local MainTab = Window:CreateTab("Character", "person-standing")
local MainSection = MainTab:CreateSection("Character")


local Slider = MainTab:CreateSlider({
   Name = "Walk Speed",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Jump Power",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Gravity",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Workspace.Gravity = (Value)
   end,
})

MainTab:CreateButton({
	Name='Sit',
	Callback=function()
		player.Character.Humanoid.Sit=true
	end,
})

local FuncTab = Window:CreateTab("Functions", "parentheses")
local FuncSection = FuncTab:CreateSection("ESP")

local Toggle = FuncTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.enabled = true
                   Sense.teamSettings.enemy.box = true
                   Sense.teamSettings.friendly.enabled = true
                   Sense.teamSettings.friendly.box = true
                   Sense.Load()       
           else
               Sense.Unload()
           end
    end,
})

local Toggle = FuncTab:CreateToggle({
   Name = "Box Fill",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.boxFill = true
                   Sense.teamSettings.friendly.boxFill = true    
           else
               Sense.teamSettings.enemy.boxFill = false
               Sense.teamSettings.enemy.boxFill = false 
           end
    end,
})

local Toggle = FuncTab:CreateToggle({
   Name = "Name",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.name = true
                   Sense.teamSettings.friendly.name = true    
           else
               Sense.teamSettings.enemy.name = false
               Sense.teamSettings.enemy.name = false 
           end
    end,
})

local Toggle = FuncTab:CreateToggle({
   Name = "Distance",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.distance = true
                   Sense.teamSettings.friendly.distance = true    
           else
               Sense.teamSettings.enemy.distance = false
               Sense.teamSettings.enemy.distance = false 
           end
    end,
})

local FunccSection = FuncTab:CreateSection("Functions")

local Toggle = FuncTab:CreateToggle({
	Name = "No Clip",
	CurrentValue = false,
	Flag = "universal_noclip",
	Callback = function(state)
		if state then
			noclip=RunService.Stepped:Connect(function()
				for i,v in pairs(player.Character:GetDescendants()) do
					if v:IsA('BasePart') and v.CanCollide then
						v.CanCollide=false
					end
				end
				wait()
			end)
		else
			noclip:Disconnect()
		end
	end,
})

local Toggle = FuncTab:CreateToggle({
	Name = "Infinite Jump",
	CurrentValue = false,
	Flag = "universal_infinite_jump",
	Callback = function(state)
		if state then
			player.Character.Humanoid:ChangeState('Jumping')
			wait(0.1)
			player.Character.Humanoid:ChangeState('Seated')
		end
	end,
})

local FuncccSection = FuncTab:CreateSection("View and teleport")
local viewEnabled = false
local selectedViewPlayer = nil
local characterAddedConnection = nil

-- Função para ativar ou desativar a visualização do jogador
local function toggleView(enabled)
    if enabled then
        if selectedViewPlayer then
            local player = selectedViewPlayer
            if player then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                end
                characterAddedConnection = player.CharacterAdded:Connect(function(character)
                    game.Workspace.CurrentCamera.CameraSubject = character
                end)
            else
                print("Jogador não encontrado.")
                viewEnabled = false
            end
        else
            print("Nenhum jogador selecionado para a visualização.")
            viewEnabled = false
        end
    else
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
            characterAddedConnection = nil
        end
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end

local function findPlayerByPartialNameOrNickname(partialName)
    local partial = partialName:sub(1, 2):lower()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():sub(1, 2) == partial or (player.DisplayName and player.DisplayName:lower():sub(1, 2) == partial) then
            return player
        end
    end
    return nil
end






local AdminTab = Window:CreateTab("Admin Scripts and More", "file-sliders")
local AdminSection = AdminTab:CreateSection("Admin Scripts and More")

local Button = AdminTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "System Broken",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Ragdoll-Engine-BEST-SCRIPT-WORKING-SystemBroken-7544"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "AntiOder Executor SPECIAL",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/sAVghM5x"))()
   end,
})

local OtherTab = Window:CreateTab("Universal Cool Scripts", "file-code-2")
local OtherSection = OtherTab:CreateSection("Universal Cool Scripts")

local Button = OtherTab:CreateButton({
   Name = "Fly GUI Antioder edition",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/aftermath-dev/aftermath-hubs/refs/heads/main/fly"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Chat Spy (/spy for toggle)",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Chat-spy-3000"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Walk On Walls",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/The-patience-obby-Universal-Walk-on-walls-18129"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "R6 script",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Mobile Keyboard",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "FPS Booster",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/gvUFpwQw"))()
   end,
})


local Slider = OtherTab:CreateSlider({
   Name = "Stretched Resolution (растег экрана)",
   Range = {0.01, 1.00},
   Increment = 0.01,
   Suffix = "Resolution",
   CurrentValue = 1.00,
   Flag = "slidersr", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        getgenv().Resolution = {
    [".gg/scripters"] = (Value)
}

local Camera = workspace.CurrentCamera
if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "Aori0001"
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Speed Animations Changer",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/dAnuL1X3"))()
   end,
})


local Button = OtherTab:CreateButton({
   Name = "Ambient NO FE",
   Callback = function()
loadstring(game:HttpGet('https://pastefy.app/S7xNJSXX/raw'))()execute("Script14")
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Big Jump Button (works on mobile, tablet have errors)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/p3TfEqQ2"))()
   end,
})

local Toggle = OtherTab:CreateToggle({
	Name = "Anti-AFK",
	CurrentValue = false,
	Flag = "universal_antiafk",
	Callback=function(state)
		for i,v in pairs(getconnections(player.Idled)) do
			if state then v:Disable() end
			if not state then v:Enable() end
		end
	end,
})

local Button = OtherTab:CreateButton({
   Name = "B tools (visual lol)",
   Callback = function()
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Fake Lag",
   Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/VM3b0Thg'))()
   end,
})

local Other1Section = OtherTab:CreateSection("Games XDD")

local Button = OtherTab:CreateButton({
   Name = "Tic Tac Toe with AI",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Tic%20Tac%20Toe'))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Math Problem",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Math%20Problem'))()
   end,
})

local Other2Section = OtherTab:CreateSection("New Other Scripts! (2.00)")
local Toggle = OtherTab:CreateToggle({
	Name = "AutoEZ",
	CurrentValue = false,
	Flag = "universal_autoez",
	Callback = function(state)
		autoez=state
		while autoez and wait(10) do
			local num=math.random(1, 6)
			if num==1 then
				text='ez killed by antioder hub'
			elseif num==2 then
				text='ezzzzzz'
			elseif num==3 then
				text='ezzz antioder hub on top'
			elseif num==4 then
				text='ez noobs'
			elseif num==5 then
				text='ezzed by antioder hubb'
			elseif num==6 then
				text='ezzzzz win by antioder hub'
			end
			if game.PlaceId==286090429 then -- If arsenal
				local args = {
				    [1] = "Hah!",
				    [2] = text,
				    [3] = false,
				    [5] = false,
				    [6] = true
				}
				game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(unpack(args))
				continue
			end
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({[1]=text, [2]='All'}))
		end
	end,
})



local TROLLTab = Window:CreateTab("Raid Scripts", "ban")
local TROLLSection = TROLLTab:CreateSection("Raid Scripts")


local Label = TROLLTab:CreateLabel("Check brookhaven tab if you raid brookhaven!!!", "rewind")



local Button = TROLLTab:CreateButton({
   Name = "Vfly",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/BFzqVkQX"))()
   end,
})

local Button = TROLLTab:CreateButton({
   Name = "Invisible FE",
   Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
   end,
})

local Button = TROLLTab:CreateButton({
   Name = "Touch Fling",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/rfKaavP3"))()
   end,
})

local ChatTab = Window:CreateTab("Chat", "message-square-more")
local ChatSection = ChatTab:CreateSection("Chat Scripts")

local Button = ChatTab:CreateButton({
   Name = "Censure bypass (with le le le le)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/4QdHkUA6"))()
   end,
})

local Button = ChatTab:CreateButton({
   Name = "Censure bypass (with ich ich ich ich)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/w7qBNv2D"))()
   end,
})


local Button = ChatTab:CreateButton({
   Name = "Universal Chat Edit (NEW LIBRARY)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/xSjxnwtb"))()
   end,
})

local Button = ChatTab:CreateButton({
   Name = "Chat Draw",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/Draw-To-Chat-Obfuscated/refs/heads/main/Draw%20to%20Chat"))()
   end,
})

local SkinTab = Window:CreateTab("Skin", "person-standing")
local SkinSection = SkinTab:CreateSection("Skin Scripts")

local Button = SkinTab:CreateButton({
   Name = "Headless (FE) [R6!]",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Valiant-Ui-Lib-Gazed-/refs/heads/main/Head%20Pack'))()
   end,
})

local Button = SkinTab:CreateButton({
   Name = "soon",
   Callback = function()
print("<ANTIODER HUB NOTIFICATION> soon... :>")
   end,
})

local ServerTab = Window:CreateTab("Server", "hard-drive")
local ServerSection = ServerTab:CreateSection("Server Scripts")

local Button = ServerTab:CreateButton({
   Name = "Hop to smallest server",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/n1hPD0KN"))()
   end,
})

local Button = ServerTab:CreateButton({
   Name = "Server Saver",
   Callback = function()
loadstring(game:HttpGet(('https://pastefy.app/S7xNJSXX/raw'),true))()
   end,
})

local Button = ServerTab:CreateButton({
   Name = "Rejoin",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/wQ6GFfeG"))()
   end,
})

local Button = ServerTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/wQ6GFfeG"))()
   end,
})

local NewsTab = Window:CreateTab("News and Changelog", "newspaper")
local NewsSection = NewsTab:CreateSection("News")

local Label = NewsTab:CreateLabel("Script officially released on scriptblox.com!", "newspaper")
local ChangeSection = NewsTab:CreateSection("Changelog")

local Paragraph = NewsTab:CreateParagraph({Title = "1.11 | 01.01.2025", Content = "Added new color of script, updated Server Tab, added changelog"})
local Paragraph = NewsTab:CreateParagraph({Title = "1.12 | 02.01.2025", Content = "Updated loader"})

local CameraTab = Window:CreateTab("Camera", "camera")
local CameraSection = CameraTab:CreateSection("Camera")

local Slider = CameraTab:CreateSlider({
   Name = "Field of view",
   Range = {45, 120},
   Increment = 1,
   Suffix = "field of view",
   CurrentValue = 70,
   Flag = "sliderfov", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
        tweenService:Create(camera, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { FieldOfView = value }):Play()
   end,
})

local VisualTab = Window:CreateTab("Visual", "eye")
local VisualSection = VisualTab:CreateSection("Visual")

local Toggle = VisualTab:CreateToggle({
	Name = "Pink Glasses",
	CurrentValue = false,
	Flag = "universal_pink_glasses",
	Callback=function(state)
		if state then
			game.Lighting.Ambient=Color3.fromRGB(225, 20, 147)
			game.Lighting.OutdoorAmbient=Color3.fromRGB(225, 20, 147)
		else
			game.Lighting.Ambient=ambient
			game.Lighting.OutdoorAmbient=outdoor_ambient
		end
	end,
})

local Toggle = VisualTab:CreateToggle({
	Name = "Remove Fog",
	CurrentValue = false,
	Flag = "universal_remove_fog",
	Callback = function(state)
		if state then
			game.Lighting.FogStart=9e9
		else
			game.Lighting.FogStart=fogstart
		end
	end,
})

local Toggle = VisualTab:CreateToggle({
	Name = "Full Brightness",
	CurrentValue = false,
	Flag = "universal_full_brightness",
	Callback = function(state)
		if state then
			game.Lighting.Brightness=2
			game.Lighting.ClockTime=14
			game.Lighting.GlobalShadows=false
			game.Lighting.OutdoorAmbient=Color3.fromRGB(128, 128, 128)
		else
			game.Lighting.Brightness=brightness
			game.Lighting.ClockTime=clocktime
			game.Lighting.GlobalShadows=shadows
			game.Lighting.OutdoorAmbient=outdoor_ambient
		end
	end,
})






local SexTab = Window:CreateTab("S*x", "book-heart")

local SexSection = SexTab:CreateSection("S*x R6")

local Button = SexTab:CreateButton({
   Name = "Bang V2",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/aPSHMV6K"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Banged",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zHbw7ND1"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/SymCfnAW"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/FPu4e2Qh"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Jerk Off",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
   end,
})

local Sex1Section = SexTab:CreateSection("S*x R15")

local Button = SexTab:CreateButton({
   Name = "Bang V2",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/1ePMTt9n"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Banged",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/7hvcjDnW"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/p8yxRfr4"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/DyPP2tAF"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Jerk Off",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
   end,
})

local AutoTab = Window:CreateTab("Autofarm", nil)


local Silent = false
local Label = AutoTab:CreateLabel("Thanks for @ASU", "heart")

local AutoFarm1 = AutoTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        getgenv().AF = Value
        local isFarming = false

        local function startAutoFarm()
            if Value == false then return end

            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local newPart = Instance.new("Part")
            newPart.Size = Vector3.new(5, 1, 5)
            newPart.Transparency = 1
            newPart.CanCollide = true
            newPart.Anchored = true
            newPart.Parent = workspace

            local decal = Instance.new("Decal")
            decal.Texture = "rbxassetid://139953968294114"
            decal.Face = Enum.NormalId.Top 
            decal.Parent = newPart

            local function TPAF(iteration)
            if not Silent then
                if Value == false then return end
                if iteration == 5 then
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, 0)
                    task.delay(0.8, function()
                        workspace.ClaimRiverResultsGold:FireServer()
                    end)

                    humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                else
                    if iteration == 1 then
                        humanoidRootPart.CFrame = CFrame.new(160.16104125976562, 29.595888137817383, 973.813720703125)
                    else
                    humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                    end
                end
                newPart.Position = humanoidRootPart.Position - Vector3.new(0, 2, 0)

                wait(2.3) -- if lower, it can't work every time
                if iteration == 1 then
                    wait(2.3)
                end
                if iteration == 4 then
                else
                    workspace.ClaimRiverResultsGold:FireServer()
                end
            else
                if Value == false then return end
                if iteration == 1 then
                    humanoidRootPart.CFrame = CFrame.new(160.16104125976562, 29.595888137817383, 973.813720703125)
                elseif iteration == 5 then
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, 0)
                    task.delay(0.8, function()
                        workspace.ClaimRiverResultsGold:FireServer()
                    end)
                    
                    humanoidRootPart.CFrame = CFrame.new(70.02417755126953, 138.9026336669922, 1371.6341552734375 + (iteration - 2) * 770)
                else
                    humanoidRootPart.CFrame = CFrame.new(70.02417755126953, 138.9026336669922, 1371.6341552734375 + (iteration - 2) * 770)
                end
                newPart.Position = humanoidRootPart.Position - Vector3.new(0, 2, 0)

                wait(2.3) -- if lower, it can't work every time
                if iteration == 1 then
                    wait(2.3)

                end
                if iteration == 4 then
                else
                    workspace.ClaimRiverResultsGold:FireServer()
                end
            end
            end

            for i = 1, 10 do
                if not Value then
                    break
                end
                TPAF(i)
            end

            newPart:Destroy()
        end

                local function onCharacterRespawned()
                    if getgenv().AF == true then
                        if FcMaster == false then return end
                    local character = player.Character or player.CharacterAdded:Wait()
                    character:WaitForChild("HumanoidRootPart")
                       -- wait(2)
                    startAutoFarm()
                    end
                end

        if Value then
            Rayfield:Notify({
                Title = "Auto Farm - Enabled",
                Content = "Isolation mode and Anti-afk is recommended",
                Duration = 6.5,
                Image = 124144713366592,
             })
            game.Players.LocalPlayer.Character:BreakJoints()
            wait(1)
            game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterRespawned)
        else
            Rayfield:Notify({
                Title = "Auto Farm - Disabled",
                Content = "Please, wait for the iteration to finish...",
                Duration = 6.5,
                Image = 124144713366592,
             })
            game.Players.LocalPlayer.CharacterAdded:Connect(function() end)
        end
    end,
})

local Toggle = AutoTab:CreateToggle({
    Name = "Make Autofarm Silent",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        Silent = Value
    end,
})

local FStats = AutoTab:CreateParagraph({Title = "Stats", Content = "Elapsed time: -".."\n".."GoldBlock Gained: -".."\n".."Gold Gained: -".."\n".."\n".."Gold per hour: -"})

local clockTime = 0
local running = false
local totalGoldGained = 0
local Ftime = 0 
local totalGoldBlock = 0
local GoldPerHour = 0
local lastGoldValue = game:GetService("Players").LocalPlayer.Data.Gold.Value
local IGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value

local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local sec = seconds % 60
    return hours .. " hours " .. minutes .. " minutes " .. sec .. " seconds"
end

local function startClock()
    if running then return end
    running = true

    while running do
        if getgenv().AF then
            clockTime = clockTime + 1
        else
            running = false
        end
        task.wait(1) 
    end
end

game:GetService("RunService").Stepped:Connect(function()
    if getgenv().AF and not running then
        wait(5)
        startClock()
    end
end)

function initclock()
while true do
    local FinalGold = game:GetService("Players").LocalPlayer.Data.Gold.Value
    Ftime = formatTime(clockTime)
    local GoldGained = FinalGold - lastGoldValue
    totalGoldGained = totalGoldGained + GoldGained
    local FGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value
    totalGoldBlock = FGBLOCK - IGBLOCK

    GoldPerHour = (totalGoldGained / clockTime) * 3600

    FStats:Set({
        Title = "Stats",
        Content = "Elapsed time: " .. Ftime .. "\n" ..
                  "GoldBlock Gained: " .. totalGoldBlock .. "\n" ..
                  "Gold Gained: " .. totalGoldGained .. "\n" ..
                  "Gold per hour: " .. math.floor(GoldPerHour),
    })

    lastGoldValue = FinalGold

    wait(1)
end
end

GoldPerHour = 0

local BlockId = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/BlockId.lua'))()

local ImageFiles = {}

local function updateImageFiles()

    local files = listfiles("AOH_BABFT/Image")

    ImageFiles = {}

    for _, file in ipairs(files) do
        if isfile(file) then
            table.insert(ImageFiles, file)
        end
    end

end

local Img = Window:CreateTab("Image loader", "image")

local function LPTEAM()
local teamName = player.Team.Name

local zoneMapping = {
    black = "BlackZone",
    blue = "Really blueZone",
    green = "CamoZone",
    red = "Really redZone",
    white = "WhiteZone",
    yellow = "New YellerZone",
    magenta = "MagentaZone"
}

local selectedZoneName = zoneMapping[teamName]

if selectedZoneName then
    local zone = workspace:FindFirstChild(selectedZoneName)
    if zone then
        return zone.position + Vector3.new(-100, 150, 0)
    end
end
end

local function LPTEAM3()
    local teamName = player.Team.Name
    
    local zoneMapping = {
        black = "BlackZone",
        blue = "Really blueZone",
        green = "CamoZone",
        red = "Really redZone",
        white = "WhiteZone",
        yellow = "New YellerZone",
        magenta = "MagentaZone"
    }
    
    local selectedZoneName = zoneMapping[teamName]
    
    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.position
        end
    end
    end

function BuildingTool()
    game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer("WoodBlock",58,workspace.BlackZone,CFrame.new(0, 6, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),true,CFrame.new(),false)
end

local imagePreviewFolder = workspace:FindFirstChild("ImagePreview") or Instance.new("Folder")
imagePreviewFolder.Name = "ImagePreview"
imagePreviewFolder.Parent = workspace
local UserBlockList = {}
local dataFolder = game:GetService("Players").LocalPlayer.Data
local BlockType = "PlasticBlock"
local LPBlockvalue = UserBlockList[BlockType]
local blockSize = 2
local startPosition = nil
local PreviewPart = nil
local kflxjdhgw = nil
local currentConnection = nil
local FileImage = nil
local HalfblockSize = blockSize / 2
local cooloffset = Vector3.new(0, 0, 0)
local Unit = 45
local Bdepth = 2
local angleY = 0
local ImgCenterimage = nil
local Brainrot = CFrame.identity
local rotationCFrame = CFrame.Angles(0, 0, 0)
local batchSize = 700
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0
local USEURL = nil
local TempData = {}
local BlockLoaded = true
local TASK1, TASK2, TASK3, TASK4, TASK5 = false, false, false, false, false
getgenv().ImgLoaderStat = true


local function LPTEAM2()
    local teamName = player.Team.Name
    
    local zoneMapping = {
        black = "BlackZone",
        blue = "Really blueZone",
        green = "CamoZone",
        red = "Really redZone",
        white = "WhiteZone",
        yellow = "New YellerZone",
        magenta = "MagentaZone"
    }
    
    local selectedZoneName = zoneMapping[teamName]
    
    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.Name
        end
    end
end

local function UUserBlockList()
    UserBlockList = {}
    for _, feuh in ipairs(dataFolder:GetChildren()) do
        if feuh.Value ~= nil then
            UserBlockList[feuh.Name] = feuh.Value
        end
    end
end

local function readFile(filePath)
    if not isfile(filePath) then
        return nil
    end
    return readfile(filePath)
end

local function parseColors(fileContent)
    local data = {}

    for value in string.gmatch(fileContent, "[^,]+") do
        value = value:match("^%s*(.-)%s*$")
        table.insert(data, tonumber(value) or value)
    end
    return data
end

local function calculateFrameSize(data)
    local width = 0
    local height = 0
    local currentWidth = 0

    for i = 1, #data, 3 do
        local r, g, b = data[i], data[i + 1], data[i + 2]

        if r == "B" and g == "B" and b == "B" then
            height += 1
            width = math.max(width, currentWidth)
            currentWidth = 0
        elseif r == "R" and g == "R" and b == "R" then
            currentWidth += 1
        elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
            currentWidth += 1
        end
    end
    height += 1
    width = math.max(width, currentWidth)
    return Vector3.new(width * blockSize, height * blockSize, Bdepth)
end

local function previewFrame(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if PreviewPart then
        PreviewPart:Destroy()
        PreviewPart = nil
    end

    PreviewPart = Instance.new("Part")
    PreviewPart.Size = frameSize
    PreviewPart.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0) + cooloffset
    PreviewPart.Transparency = 1
    PreviewPart.Color = Color3.new(1, 1, 1)
    PreviewPart.Anchored = true
    PreviewPart.CanCollide = false
    PreviewPart.Name = "PreviewSize"
    PreviewPart.Parent = previewFolder
    PreviewPart.Rotation = Vector3.new(0, angleY - 90, 0)

    local textureId = "rbxassetid://133978572926918"

    local function applyTextureToSurface(surface, sizeX, sizeY)
        local texture = Instance.new("Texture")
        texture.Texture = textureId
        texture.Face = surface
        texture.Parent = PreviewPart
        texture.StudsPerTileU = blockSize
        texture.StudsPerTileV = blockSize
        texture.Transparency = 0.2
    end

    applyTextureToSurface(Enum.NormalId.Front, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Back, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Left, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Right, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Top, frameSize.X, frameSize.Z)
    applyTextureToSurface(Enum.NormalId.Bottom, frameSize.X, frameSize.Z)
end

local function Centerimage(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if kflxjdhgw then
        kflxjdhgw:Destroy()
        kflxjdhgw = nil
    end

    kflxjdhgw = Instance.new("Part")
    kflxjdhgw.Size = frameSize
    kflxjdhgw.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0)
    kflxjdhgw.Transparency = 1
    kflxjdhgw.Color = Color3.new(1, 1, 1)
    kflxjdhgw.Anchored = true
    kflxjdhgw.CanCollide = false
    kflxjdhgw.Name = "Centerimage"
    kflxjdhgw.Parent = previewFolder
    return kflxjdhgw.Position
end

local function buildImageFAST()
    local folder = workspace:FindFirstChild("ImagePreview")
    if not folder then
        return
    end

    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            part.Transparency = 0.8
        end
    end

    local parts = {}
    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            table.insert(parts, part)
        end
    end

    if #parts == 0 then
        return
    end

    local paintData = {}

    UUserBlockList()
    local uszLPBlockvalue = UserBlockList[BlockType]
    local Zonesss = LPTEAM2()

    local LNplayer = nil
    if game:GetService("Players").LocalPlayer.Settings.ShareBlocks.Value == false then
        LNplayer = Nplayer
    else
        local playerteam = player.Team.Name
        local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
        LNplayer = blocktoget
    end

    for i = 1, #parts do
        if getgenv().ImgLoaderStat == false then
            break
        end
        task.spawn(function()
            local part = parts[i]
            if not part then
                return
            end
            if getgenv().ImgLoaderStat == false then
                return
            end
            local WORLDPOS = part.Position
            local partRot = part.CFrame - part.Position
            local newCFrame = CFrame.new(math.random(-69, 69), math.random(-2200000, -120000), math.random(-69, 69))

            if getgenv().ImgLoaderStat == false then
                return
            end

            local BuildPath = player.Backpack:FindFirstChild("BuildingTool") or player.Character:FindFirstChild("BuildingTool")
            BuildPath.RF:InvokeServer(
                BlockType,
                uszLPBlockvalue,
                workspace:FindFirstChild(Zonesss),
                newCFrame,
                true
            )
        end)
    end

    TASK1 = true
    local blocks = workspace.Blocks:FindFirstChild(LNplayer):GetChildren()

    while #blocks < #parts do
        task.wait(0.5)
        blocks = workspace.Blocks:FindFirstChild(LNplayer):GetChildren()
    end

    for i = 1, #parts do
        if getgenv().ImgLoaderStat == false then
            break
        end
        task.spawn(function()
            local part = parts[i]
            if not part then
                return
            end
            if getgenv().ImgLoaderStat == false then
                return
            end
            local WORLDPOS = part.Position
            local partRot = part.CFrame - part.Position
            local newwCFrame = CFrame.new(WORLDPOS) * partRot * CFrame.Angles(0, math.rad(90), 0)
            local targetBlock = blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong + i]

            if getgenv().ImgLoaderStat == false then
                return
            end
            
            local ScalePath = player.Backpack:FindFirstChild("ScalingTool") or player.Character:FindFirstChild("ScalingTool")
            ScalePath.RF:InvokeServer(
                targetBlock,
                Vector3.new(Bdepth, blockSize, blockSize),
                newwCFrame
            )
        end)
    end

    TASK2 = true
    ImgParts = workspace.ImagePreview:GetChildren()
    for i = 1, #parts + 1 do
        local color = ImgParts[i].Color
        table.insert(paintData, {
            blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong + i - 1],
            Color3.new(color.R, color.G, color.B)
        })
    end
    
    local PaintPath = player.Backpack:FindFirstChild("PaintingTool") or player.Character:FindFirstChild("PaintingTool")
    PaintPath.RF:InvokeServer(paintData)

    for _, part in ipairs(folder:GetChildren()) do
        part:destroy()
    end

    TASK3 = true
    if getgenv().ImgLoaderStat == false then
        task.delay(1, function()
            Rayfield:Notify({
                Title = "Image aborted",
                Content = "All unplaced blocks will be deleted",
                Duration = 6.5,
                Image = 124144713366592,
            })
        end)
    else
        task.delay(1, function()
            Rayfield:Notify({
                Title = "Image successfully loaded",
                Content = "You can now use your inventory again",
                Duration = 6.5,
                Image = 124144713366592,
            })
        end)
    end
    task.wait(0.15)
    TASK4 = true
    local remote = player.Character:FindFirstChild("DeleteTool") or player.Backpack:FindFirstChild("DeleteTool")
    for i = 1, #blocks do
        task.spawn(function()
            local block = blocks[i]
            if not block then
                return
            end

            local blockY = block.PrimaryPart and block.PrimaryPart.Position.Y or nil
            if blockY and blockY >= -2200000 and blockY <= -120000 then
                    remote.RF:InvokeServer(blocks[i])
            end
        end)
    end 
    TASK5 = true  
end

function onImgBlockSecChanged()
    getgenv().COCO = false
    wait(0.1)
    getgenv().COCO = true
    buildImage()
end

local function buildImagePREVIEW(data, blockSize)
    local frameSize = calculateFrameSize(data)
    startPosition = LPTEAM() + cooloffset
    ImgCenterimage = Centerimage(frameSize, startPosition, blockSize)
    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        return
    end

    rotationCFrame = CFrame.Angles(0, math.rad(angleY - 90), 0)

    Brainrot = centerImage.CFrame * rotationCFrame
    local currentX = startPosition.X
    local currentY = startPosition.Y
    local currentZ = startPosition.Z
    local initialX = startPosition.X
    local dataIndex = 1

    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        return
    end

    local centerCFrame = centerImage.CFrame

    if currentConnection then
        currentConnection:Disconnect()
    end

    currentConnection = RunService.Heartbeat:Connect(function()
        local finished = false
        for _ = 1, batchSize do
            if dataIndex > #data then
                finished = true
                break
            end

            local r, g, b = data[dataIndex], data[dataIndex + 1], data[dataIndex + 2]
            if r == "B" and g == "B" and b == "B" then
                currentX = initialX
                currentY = currentY - blockSize
            elseif r == "R" and g == "R" and b == "R" then
                currentX = currentX + blockSize
            elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then

                local block = Instance.new("Part")
                block.Size = Vector3.new(blockSize, blockSize, Bdepth)
                block.Color = Color3.fromRGB(r, g, b)
                block.Anchored = true
                block.Material = Enum.Material.SmoothPlastic
                block.CastShadow = false
                block.Parent = previewFolder

                local blockPosition = Vector3.new(currentX, currentY, currentZ) + cooloffset
                local relativeCFrame = centerCFrame:ToObjectSpace(CFrame.new(blockPosition))
                block.CFrame = Brainrot * relativeCFrame
                currentX = currentX + blockSize
            end

            dataIndex += 3
        end

        if finished then
            currentConnection:Disconnect()
            currentConnection = nil
        end
    end)
end

Section = Img:CreateSection("Import Image")

local ImageLoaderFile = Img:CreateLabel("Details will be displayed here", 72272740678757)

local URL_RESO_VALUE = 4
local TBLOCK = 0
local BLKLD = 0
local FI = 0

local Input = Img:CreateInput({
    Name = "File or Url",
    CurrentValue = "",
    PlaceholderText = "File/Url",
    RemoveTextAfterFocusLost = true,
    Flag = "Input1",
    Callback = function(Text)
        TBLOCK = 0
        BLKLD = 0
        TempData = {}
        USEURL= nil
        cooloffset = Vector3.new(0, 0, 0)
        Brainrot = CFrame.identity
        angleY = 0
        rotationCFrame = CFrame.Angles(0, 0, 0)
        local fileName = Text .. ".txt"
        local filePath = "AOH_BABFT/Image/" .. fileName

        ImageLoaderFile:Set("Fetching...", 72272740678757)

        if string.sub(Text, 1, 6) == "https:" then
            ImageLoaderFile:Set("Method: URL | Status: Fetching...", 110690411966110)

            local url = "https://therealasu.pythonanywhere.com/process_image" -- It is useless to DDOS it, all you're going to do is DDOS pythonanywhere which are protected against that, and the server doesn't cost me anything, it's free
            local headers = {
                ["Content-Type"] = "application/json"
            }

            local function getImageData(imageUrl, resolution)
                local body = HttpService:JSONEncode({
                    image_url = imageUrl,
                    resolution = resolution
                })

                local success, result = pcall(function()
                    return request({
                        Url = url,
                        Method = "POST",
                        Headers = headers,
                        Body = body
                    })
                end)

                if success then
                    if result.StatusCode == 200 then
                        local responseData = result.Body
                        return responseData
                    else
                        ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110)
                        return nil
                    end
                else
                    ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110)
                    Rayfield:Notify({
                        Title = "Error ",
                        Content = "Could not Fetch data",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })
                    return nil
                end
            end

            local response = getImageData(Text, URL_RESO_VALUE)

            if response then
                local success, result = pcall(function()
                    return HttpService:JSONDecode(response)
                end)
                if success and result then
                    if result.error then
                        ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110)
                        Rayfield:Notify({
                            Title = "Error",
                            Content = "The API may be overloaded OR Url not supported , there's an alternative and a easy fix tutorial in the Discord server",
                            Duration = 6.5,
                            Image = 124144713366592,
                        })
                    else
                        USEURL = true
                        TempData = response
                        ImageLoaderFile:Set("Method: URL | Status: Fetched | You can enable preview", nil)
                        Rayfield:Notify({
                            Title = "Success!",
                            Content = "Your URL has been converted and is ready to use",
                            Duration = 6.5,
                            Image = 124144713366592,
                        })
                    end
                else
                    TempData = response
                    USEURL = true
                    ImageLoaderFile:Set("Method: URL | Status: Fetched | You can enable preview", 110690411966110) -- how the fk
                    Rayfield:Notify({
                        Title = "Success!",
                        Content = "Your URL has been converted and is ready to use",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })
                    --[[
                    ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                    Rayfield:Notify({
                        Title = "Error",
                        Content = "Failed to decode the server response. The url may not be supported or valid",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })
                    ]]
                end
            else
                ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110)
                Rayfield:Notify({
                    Title = "Error",
                    Content = "The API may be overloaded OR Url not supported , there's an alternative and a easy fix tutorial in the Telegram channel",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            end
        else
            USEURL = false
            if isfile(filePath) then
                FileImage = fileName
                ImageLoaderFile:Set("Method: File | Status: Success | You can enable preview", 81435876451920)
                Rayfield:Notify({
                    Title = "Success!",
                    Content = "file: " .. fileName .. " found!",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            else
                FileImage = nil
                ImageLoaderFile:Set("Method: File | Status: Error", 81435876451920)
                Rayfield:Notify({
                    Title = "Error | File not found",
                    Content = "Make sure the file " .. fileName .. " exists or the URL is valid, do not put '.txt' in the TextBox",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            end
        end
    end,
})

local Input = Img:CreateInput({
    Name = "Resolution [only for URL] [Higher = less blocks]",
    CurrentValue = "4",
    PlaceholderText = "Number",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Nb)
        URL_RESO_VALUE = tostring(Nb)
    end,
})

local TogglePreview = Img:CreateToggle({
    Name = "Preview",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            BLKLD = 0
            TBLOCK = 0
            local filePath = "AOH_BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
            end
            if not fileContent then return end
            local data
                data = parseColors(fileContent)
            buildImagePREVIEW(data, blockSize)
        else
            for _, skibidi in ipairs(previewFolder:GetChildren()) do
                if skibidi.Name ~= "PreviewSize" then
                    skibidi:Destroy()
                end
            end
        end
    end,
})

local ToggleGrid = Img:CreateToggle({
    Name = "Grid",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local filePath = "AOH_BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
            end
            if not fileContent then return end
            local data = parseColors(fileContent)
            local frameSize = calculateFrameSize(data)
            startPosition = LPTEAM()
            previewFrame(frameSize, startPosition, blockSize)
        else
            if PreviewPart then
                PreviewPart:Destroy()
                PreviewPart = nil
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "No file or invalid file",
                    Duration = 6.5,
                    Image = 124144713366592,
                 })
            end
        end
    end,
})

local Slider = Img:CreateSlider({
    Name = "Preview loading speed",
    Range = {100, 4000},
    Increment = 25,
    Suffix = "block/sec",
    CurrentValue = 750,
    Flag = "",
    Callback = function(Value)
        batchSize = Value
    end,
 })

local Dropdown = Img:CreateDropdown({
    Name = "Block Type",
    Options = {
        "BrickBlock", 
        "CoalBlock", 
        "ConcreteBlock", 
        "FabricBlock", 
        "GlassBlock", 
        "GoldBlock", 
        "GrassBlock", 
        "IceBlock", 
        "MarbleBlock", 
        "MetalBlock", 
        "NeonBlock", 
        "ObsidianBlock", 
        "PlasticBlock", 
        "RustedBlock", 
        "SmoothWoodBlock", 
        "StoneBlock", 
        "TitaniumBlock", 
        "ToyBlock", 
        "WoodBlock"
    },
    CurrentOption = {"PlasticBlock"},
    MultipleOptions = false,
    Flag = "",
    Callback = function(Options)
        BlockType = Options[1]
    end,
})

local Input = Img:CreateInput({
    Name = "Move multiplier",
    CurrentValue = "45",
    PlaceholderText = "number",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
        Unit = tostring(Text)
    end,
 })

local originalCFrames = {}

local Input = Img:CreateInput({
    Name = "Rotate",
    CurrentValue = "0",
    PlaceholderText = "0 - 360",
    RemoveTextAfterFocusLost = false,
    Flag = "",
    Callback = function(Text)
        angleY = tonumber(Text)
        if not angleY then
            return
        end

        local centerImage = workspace.ImagePreview.Centerimage
        if not centerImage then
            return
        end

        local rotationCFrame = CFrame.Angles(0, math.rad(angleY), 0)

        Brainrot = centerImage.CFrame * rotationCFrame

        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            if skibidi:IsA("BasePart") and skibidi ~= centerImage then

                local centerCFrame = centerImage.CFrame

                if not originalCFrames[skibidi] then
                    originalCFrames[skibidi] = skibidi.CFrame
                end

                local originalCFrame = originalCFrames[skibidi]
                local relativeCFrame = centerCFrame:ToObjectSpace(originalCFrame)

                local ghaaa = centerCFrame * rotationCFrame * relativeCFrame
                skibidi.CFrame = ghaaa
            end
        end
    end,
})

local Input = Img:CreateInput({
    Name = "Block Depth",
    CurrentValue = "2",
    PlaceholderText = "Value",
    RemoveTextAfterFocusLost = false,
    Flag = "",
    Callback = function(Text)
        Bdepth = tonumber(Text)
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Size = Vector3.new(skibidi.Size.X, skibidi.Size.Y, Bdepth)
            end
    end,
 })

 local Slider = Img:CreateSlider({
    Name = "Size",
    Range = {0.1, 10},
    Increment = 0.1,
    Suffix = "x",
    CurrentValue = 2,
    Flag = "",
    Callback = function(Value)
        blockSize = Value
    end,
 })

 local Button = Img:CreateButton({
    Name = "Move +X",
    Callback = function()
    for _, skibidi in ipairs(previewFolder:GetChildren()) do
        skibidi.Position = skibidi.Position + Vector3.new(Unit, 0, 0)
        end
        cooloffset = cooloffset + Vector3.new(Unit, 0, 0)
    end,
 })


 local Button = Img:CreateButton({
    Name = "Move +Y",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, Unit, 0)
            end
            cooloffset = cooloffset + Vector3.new(0, Unit, 0)
    end,
 })

 local Button = Img:CreateButton({
    Name = "Move -Y",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, -Unit, 0)
            end
            cooloffset = cooloffset + Vector3.new(0, -Unit, 0)
    end,
 })

 local Button = Img:CreateButton({
    Name = "Move +Z",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, Unit)
    end,
 })

 local Button = Img:CreateButton({
    Name = "Move -Z",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, -Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, -Unit)
    end,
 })

local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneChangeLol = 0
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = 0

local ImgStatsP = Img:CreateParagraph({Title = "Information", Content = "Require PaintTool and ScalingTool"})

 local Button = Img:CreateButton({
    Name = "Build Image | Preview must be enabled",
    Callback = function()
        Rayfield:Notify({
            Title = "Image Loader",
            Content = "DO NOT place blocks until finished",
            Duration = 10,
            Image = 124144713366592,
         })
	 TBLOCK = 0
TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0

local blocksFolder = workspace:FindFirstChild("Blocks")
if blocksFolder then
    local blockssFolder = blocksFolder:FindFirstChild(Nplayer)
    if blockssFolder then
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = #blockssFolder:GetChildren()
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = #blockssFolder:GetChildren()
        local parts = {}
        local folder = workspace:FindFirstChild("ImagePreview")
        for _, part in ipairs(folder:GetChildren()) do
            if part:IsA("BasePart") and part.Name == "Part" then
                table.insert(parts, part)
            end
        end
        TBLOCK = #parts
    else
            Rayfield:Notify({
                Title = "Error",
                Content = "Folder not found, try rejoin",
                Duration = 6.5,
                Image = 124144713366592,
             })
    end
else
        Rayfield:Notify({
            Title = "Error",
            Content = "Folder not found, try rejoin",
            Duration = 6.5,
            Image = 124144713366592,
         })
end
        BlockLoaded = false
        getgenv().ImgLoaderStat = true
        task.spawn(buildImageFAST)
    end,
})

 local Button = ImageLoader:CreateButton({
    Name = "Abort",
    Callback = function()
        getgenv().ImgLoaderStat = false
        Rayfield:Notify({
            Title = "Abortion request",
            Content = "the next task will not be applied, note that this button is only useful during the task where blocks are loaded",
            Duration = 6.5,
            Image = 124144713366592,
        })
    end,
 })

function ImgStats()
    local startTime = tick()
    while true do
        local blocksFolder = workspace:FindFirstChild("Blocks")
        local blockssFolder = blocksFolder:FindFirstChild(Nplayer)
        local totalBlocks = #blockssFolder:GetChildren()
        local BLKLD = totalBlocks - TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol
        local elapsedTime = tick() - startTime
        local blocksPerSecond = BLKLD / elapsedTime
        local blocksRemaining = TBLOCK - BLKLD
        local timeRemaining = blocksRemaining / blocksPerSecond
        local FI = math.max(timeRemaining, 0)
        if not BlockLoaded then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded: "..BLKLD.."/"..TBLOCK..
                      "\nFinish in: " .. math.floor(FI) .. "s"
        })
        if BLKLD >= TBLOCK then
            BlockLoaded = true
        end
        end
        task.wait(1.2)
    end
end

function ImgStats2()
    while true do
        if BlockLoaded then
    if TASK1  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nPlacing Blocks..."
        })
        TASK1 = false
    elseif TASK2  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nPlacing Blocks..."
        })
        TASK2 = false
    elseif TASK3  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nBlocks Placed!\nColoring Blocks..."
        })
        TASK3 = false
    elseif TASK4  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nBlocks Placed!\nBlocks Colored!\ndeleting unplaced blocks..."
        })
        TASK4 = false
    elseif TASK5  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nBlocks Placed!\nBlocks Colored!\nUnplaced blocks deleted!\nProcess end"
        })
        TASK5 = false
    end
end
    wait(0.2)
end
end


local initimgfilesbool = false
 function initimgfiles()
    while initimgfilesbool == true do
        updateImageFiles()
        wait(1)
    end
end

local Divider = Img:CreateDivider()
local Paragraph = Img:CreateParagraph({Title = "Important", Content = "Preview mode must be enabled to calculate the number of blocks required"})

local LblBlockNeeded = Img:CreateLabel("No block found", 72272740678757)

local NbBlockneeded = 0
  local NbBlockmissing = 0
  local Button = Img:CreateButton({
      Name = "Refresh List",
      Callback = function()
          NbBlockneeded = 0
          local blocktypeID = BlockId[BlockType]

          for _, skibidi in ipairs(workspace.ImagePreview:GetChildren()) do
            if skibidi.Name == "Part" then

                local blockVolume = skibidi.Size.X * skibidi.Size.Y * skibidi.Size.Z

                local blockSize = (blockVolume < 8) and 8 or blockVolume

                NbBlockneeded = NbBlockneeded + blockSize
            end
        end
            UUserBlockList()
          LPBlockvalue = UserBlockList[BlockType]
          NbBlockneeded = math.ceil(NbBlockneeded / 8)
          NbBlockmissing = NbBlockneeded - LPBlockvalue
          if NbBlockmissing < 0 then
            NbBlockmissing = 0
          end
          LblBlockNeeded:Set("Need " .. tostring(NbBlockneeded) .. " " .. BlockType .. " and " .. tostring(NbBlockmissing) .. " blocks are missing", blocktypeID)
      end,
  })

local Miscellaneous = Window:CreateTab("Teleport", nil)

local Button = Miscellaneous:CreateButton({
    Name = "White",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-49.8510132, -9.7000021, -520.37085, -1, 0, 0, 0, 1, 0, 0, 0, -1))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Black",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, -69.433342, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Red",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, -64.7801361, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Blue",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 300.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Magenta",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 647.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Yellow",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 640.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Green",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 293.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

local Miscellaneous1 = Window:CreateTab("Troll", nil)
local Button = Miscellaneous1:CreateButton({
    Name = "Disable Maximum click detector distance",
    Callback = function()
        for _, object in ipairs(game:GetDescendants()) do
            if object:IsA("ClickDetector") then
                object.MaxActivationDistance = 9995649849899589
            end
        end
        Rayfield:Notify({
            Title = "Maximum click detector distance Disabled!",
            Content = "You can click on a lever, button, etc.. from anywhere",
            Duration = 6.5,
            Image = 124144713366592,
        })
    end,
 })

local Button = Miscellaneous1:CreateButton({
    Name = "Force Share Mode",
    Callback = function()
        local args = {
            [1] = "ShareBlocks",
            [2] = true
        }
        workspace.SettingFunction:InvokeServer(unpack(args))
        Rayfield:Notify({
            Title = "Share Mode",
            Content = "you can use leader's blocks now",
            Duration = 6.5,
            Image = 124144713366592,
        })
    end,
 })

local Button = Miscellaneous1:CreateButton({
    Name = "disable Share Mode",
    Callback = function()
        local args = {
            [1] = "ShareBlocks",
            [2] = false
        }
        workspace.SettingFunction:InvokeServer(unpack(args))
        Rayfield:Notify({
            Title = "Share Mode",
            Content = "Share Mode is disabled",
            Duration = 6.5,
            Image = 124144713366592,
        })
    end,
 })
 
 local Button = Miscellaneous1:CreateButton({
    Name = "Color all blocks",
    Callback = function()
        local playerteam = player.Team.Name
        local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
        local playerFolder = game.Workspace.Blocks:FindFirstChild(blocktoget)
        local paintData = {}
        local totalBlocks = #playerFolder:GetChildren()

        for _, block in ipairs(playerFolder:GetChildren()) do
            local color = Color3.new(
                math.random(0, 1000) / 1000,
                math.random(0, 1000) / 1000,
                math.random(0, 1000) / 1000
            )

            table.insert(paintData, {
                block,
                color
            })

            if #paintData >= 10000 then
                game:GetService("Players").LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
                paintData = {}
            end
        end

        if #paintData > 0 then
            game:GetService("Players").LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
        end
    end,
})

local Toggle = Miscellaneous1:CreateToggle({
    Name = "Loop Color all blocks",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
while Value do
    if Value then
    local playerteam = player.Team.Name
    local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
    local playerFolder = game.Workspace.Blocks:FindFirstChild(blocktoget)
    local paintData = {}
    local totalBlocks = #playerFolder:GetChildren()

    for _, block in ipairs(playerFolder:GetChildren()) do
        local color = Color3.new(
            math.random(0, 1000) / 1000,
            math.random(0, 1000) / 1000,
            math.random(0, 1000) / 1000
        )

        table.insert(paintData, {
            block,
            color
        })

        if #paintData >= 10000 then
            game:GetService("Players").LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
            paintData = {}
        end
    end

    if #paintData > 0 then
        game:GetService("Players").LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
    end
    task.wait()
end
end
    end,
 })

local function removeLock()
    local Teams = {"BlackZone", "CamoZone", "MagentaZone", "New YellerZone", "Really blueZone", "Really redZone", "WhiteZone"}

    for _, teamName in ipairs(Teams) do
        local teamPart = workspace:FindFirstChild(teamName)
        if teamPart then
            local lockFolder = teamPart:FindFirstChild("Lock")
            if lockFolder then
                lockFolder:Destroy()
            end
        end
    end
end

local previousPosition = nil
local counterIsoMODE = false

local function trackPlayerPosition()
    while FcMaster == true do
        if counterIsoMODE then
            removeLock()
            local character = player.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    previousPosition = humanoidRootPart.CFrame
                end
            end
        end
        task.wait(.1)
    end
end

local function onCharacterAdded(character)
    if counterIsoMODE then
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        if previousPosition then
            humanoidRootPart.CFrame = previousPosition
        end
    end
end

player.CharacterAdded:Connect(onCharacterAdded)
task.spawn(trackPlayerPosition)

local Toggle = Miscellaneous1:CreateToggle({
    Name = "Counter Isolation Mode",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        counterIsoMODE = Value
        if counterIsoMODE then
            Rayfield:Notify({
                Title = "Counter Isolation Mode",
                Content = "you will reappear where you died",
                Duration = 6.5,
                Image = 124144713366592,
             })
            else
                Rayfield:Notify({
                    Title = "Counter Isolation Mode",
                    Content = "you will no longer reappear where you died",
                    Duration = 6.5,
                    Image = 124144713366592,
                 })
        end
    end,
})

local Button = Miscellaneous1:CreateButton({
    Name = "Disable Blocks zone restriction for quest",
    Callback = function()
        workspace:FindFirstChild(LPTEAM2()).QuestNum.Value = 0
        Rayfield:Notify({
            Title = "Blocks restriction",
            Content = "the restriction zone is disabled",
            Duration = 6.5,
            Image = 124144713366592,
        })
    end,
 })

local Miscellaneous2 = Window:CreateTab("Teleport to Place", nil)
local Button = Miscellaneous2:CreateButton({
    Name = "Inner Cloud",
    Callback = function()
        TeleportService:Teleport(1930863474, game.Players.LocalPlayer)
    end,
 })


Button = Miscellaneous2:CreateButton({
    Name = "Christmas",
    Callback = function()
        TeleportService:Teleport(1930866268, game.Players.LocalPlayer)
    end,
 })

local function Init()
local initclock = coroutine.create(initclock)
local ImgStats = coroutine.create(ImgStats)
local initimgfiles = coroutine.create(initimgfiles)
local ImgStats2 = coroutine.create(ImgStats2)

coroutine.resume(initclock)
coroutine.resume(ImgStats)
coroutine.resume(initimgfiles)
coroutine.resume(ImgStats2)
end

zdzddz = Miscellaneous2:CreateButton({
    Name = "Halloween [maybe need an anti-kick]",
    Callback = function()
        TeleportService:Teleport(1930665568, game.Players.LocalPlayer) -- WARNING: YOU WILL GET KICKED WHEN YOU JOIN IT, need to try with a client-sided anti kick
    end,
 })

queueteleport(loadstring(game:HttpGet('https://antioderhub.fun'))())









