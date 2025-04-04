bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end

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
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local players = game:GetService("Players")
local wrk = game:GetService("Workspace")
local plr = players.LocalPlayer
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local humanoid = plr.Character:FindFirstChild("Humanoid")

local function onCharacterAdded(character)
    hrp = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
end

plr.CharacterAdded:Connect(onCharacterAdded)

if plr.Character then
    onCharacterAdded(plr.Character)
end

local camera = wrk.CurrentCamera
local mouse = plr:GetMouse()

local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local hue = 0
local rainbowFov = false
local rainbowSpeed = 0.005

local aimFov = 100
local aimParts = {"Head"}
local aiming = false
local predictionStrength = 0.065
local smoothing = 0.05

local aimbotEnabled = false
local wallCheck = true
local stickyAimEnabled = false
local teamCheck = false
local healthCheck = false
local minHealth = 0

local antiAim = false

local antiAimAmountX = 0
local antiAimAmountY = -100
local antiAimAmountZ = 0

local antiAimMethod = "Reset Velo"

local randomVeloRange = 100

local spinBot = false
local spinBotSpeed = 20

local circleColor = Color3.fromRGB(255, 0, 0)
local targetedCircleColor = Color3.fromRGB(0, 255, 0)

local aimViewerEnabled = false
local ignoreSelf = true

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.Radius = aimFov
fovCircle.Filled = false
fovCircle.Color = circleColor
fovCircle.Visible = false

local currentTarget = nil

local function checkTeam(player)
    if teamCheck and player.Team == plr.Team then
        return true
    end
    return false
end

local function checkWall(targetCharacter)
    local targetHead = targetCharacter:FindFirstChild("Head")
    if not targetHead then return true end

    local origin = camera.CFrame.Position
    local direction = (targetHead.Position - origin).unit * (targetHead.Position - origin).magnitude
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {plr.Character, targetCharacter}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = wrk:Raycast(origin, direction, raycastParams)
    return raycastResult and raycastResult.Instance ~= nil
end

local function getClosestPart(character)
    local closestPart = nil
    local shortestCursorDistance = aimFov
    local cameraPos = camera.CFrame.Position

    for _, partName in ipairs(aimParts) do
        local part = character:FindFirstChild(partName)
        if part then
            local partPos = camera:WorldToViewportPoint(part.Position)
            local screenPos = Vector2.new(partPos.X, partPos.Y)
            local cursorDistance = (screenPos - Vector2.new(mouse.X, mouse.Y)).Magnitude

            if cursorDistance < shortestCursorDistance and partPos.Z > 0 then
                shortestCursorDistance = cursorDistance
                closestPart = part
            end
        end
    end

    return closestPart
end

local function getTarget()
    local nearestPlayer = nil
    local closestPart = nil
    local shortestCursorDistance = aimFov
	for _, player in ipairs(players:GetPlayers()) do
        if player ~= plr and player.Character and not checkTeam(player) then
            if player.Character.Humanoid.Health >= minHealth or not healthCheck then
                local targetPart = getClosestPart(player.Character)
                if targetPart then
                    local screenPos = camera:WorldToViewportPoint(targetPart.Position)
                    local cursorDistance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

                    if cursorDistance < shortestCursorDistance then
                        if not wallCheck or not checkWall(player.Character) then
                            shortestCursorDistance = cursorDistance
                            nearestPlayer = player
                            closestPart = targetPart
                        end
                    end
                end
            end
        end
    end

    return nearestPlayer, closestPart
end

local function predict(player, part)
    if player and part then
        local velocity = player.Character.HumanoidRootPart.Velocity
        local predictedPosition = part.Position + (velocity * predictionStrength)
        return predictedPosition
    end
    return nil
end

local function smooth(from, to)
    return from:Lerp(to, smoothing)
end

local function aimAt(player, part)
    local predictedPosition = predict(player, part)
    if predictedPosition then
        if player.Character.Humanoid.Health >= minHealth or not healthCheck then
            local targetCFrame = CFrame.new(camera.CFrame.Position, predictedPosition)
            camera.CFrame = smooth(camera.CFrame, targetCFrame)
        end
    end
end

RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local offset = 50
        fovCircle.Position = Vector2.new(mouse.X, mouse.Y + offset)

        if rainbowFov then
            hue = hue + rainbowSpeed
            if hue > 1 then hue = 0 end
            fovCircle.Color = Color3.fromHSV(hue, 1, 1)
        else
            if aiming and currentTarget then
                fovCircle.Color = targetedCircleColor
            else
                fovCircle.Color = circleColor
            end
        end

        if aiming then
            if stickyAimEnabled and currentTarget then
                local headPos = camera:WorldToViewportPoint(currentTarget.Character.Head.Position)
                local screenPos = Vector2.new(headPos.X, headPos.Y)
                local cursorDistance = (screenPos - Vector2.new(mouse.X, mouse.Y)).Magnitude

                if cursorDistance > aimFov or (wallCheck and checkWall(currentTarget.Character)) or checkTeam(currentTarget) then
                    currentTarget = nil
                end
            end

            if not stickyAimEnabled or not currentTarget then
                local target, targetPart = getTarget()
                currentTarget = target
                currentTargetPart = targetPart
            end

            if currentTarget and currentTargetPart then
                aimAt(currentTarget, currentTargetPart)
            end
        else
            currentTarget = nil
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if antiAim then
        if antiAimMethod == "Reset Velo" then
            local vel = hrp.Velocity
            hrp.Velocity = Vector3.new(antiAimAmountX, antiAimAmountY, antiAimAmountZ)
            RunService.RenderStepped:Wait()
            hrp.Velocity = vel
        elseif antiAimMethod == "Reset Pos [BROKEN]" then
            local pos = hrp.CFrame
            hrp.Velocity = Vector3.new(antiAimAmountX, antiAimAmountY, antiAimAmountZ)
            RunService.RenderStepped:Wait()
            hrp.CFrame = pos
        elseif antiAimMethod == "Random Velo" then
            local vel = hrp.Velocity
            local a = math.random(-randomVeloRange,randomVeloRange)
            local s = math.random(-randomVeloRange,randomVeloRange)
            local d = math.random(-randomVeloRange,randomVeloRange)
            hrp.Velocity = Vector3.new(a,s,d)
            RunService.RenderStepped:Wait()
            hrp.Velocity = vel
        end
    end
end)

mouse.Button2Down:Connect(function()
    if aimbotEnabled then
        aiming = true
    end
end)

mouse.Button2Up:Connect(function()
    if aimbotEnabled then
        aiming = false
    end
end)







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
   Name = "AntiOder Hub 3.30 | Executor: "..identifyexecutor(),
   Icon = 128216856751714,
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

local FuncccSection = FuncTab:CreateSection("Aimbot")
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

local aimbot = FuncTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(Value)
        aimbotEnabled = Value
        fovCircle.Visible = Value
    end
})

local aimpart = FuncTab:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head","HumanoidRootPart","Left Arm","Right Arm","Torso","Left Leg","Right Leg"},
    CurrentOption = {"Head"},
    MultipleOptions = true,
    Flag = "AimPart",
    Callback = function(Options)
        aimParts = Options
    end,
 })

local smoothingslider = FuncTab:CreateSlider({
    Name = "Smoothing",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 5,
    Flag = "Smoothing",
    Callback = function(Value)
        smoothing = 1 - (Value / 100)
    end,
})

local predictionstrength = FuncTab:CreateSlider({
    Name = "Prediction Strength",
    Range = {0, 0.2},
    Increment = 0.001,
    CurrentValue = 0.065,
    Flag = "PredictionStrength",
    Callback = function(Value)
        predictionStrength = Value
    end,
})

local fovvisibility = FuncTab:CreateToggle({
    Name = "Fov Visibility",
    CurrentValue = true,
    Flag = "FovVisibility",
    Callback = function(Value)
        fovCircle.Visible = Value
    end
})

local aimbotfov = FuncTab:CreateSlider({
    Name = "Aimbot Fov",
    Range = {0, 1000},
    Increment = 1,
    CurrentValue = 100,
    Flag = "AimbotFov",
    Callback = function(Value)
        aimFov = Value
        fovCircle.Radius = aimFov
    end,
})

local wallcheck = FuncTab:CreateToggle({
    Name = "Wall Check",
    CurrentValue = true,
    Flag = "WallCheck",
    Callback = function(Value)
        wallCheck = Value
    end
})

local stickyaim = FuncTab:CreateToggle({
    Name = "Sticky Aim",
    CurrentValue = false,
    Flag = "StickyAim",
    Callback = function(Value)
        stickyAimEnabled = Value
    end
})

local teamchecktoggle = FuncTab:CreateToggle({
    Name = "Team check",
    CurrentValue = false,
    Flag = "TeamCheck",
    Callback = function(Value)
        teamCheck = Value
    end
})

local healthchecktoggle = FuncTab:CreateToggle({
    Name = "Health Check",
    CurrentValue = false,
    Flag = "HealthCheck",
    Callback = function(Value)
        healthCheck = Value
    end
})

local minhealth = FuncTab:CreateSlider({
    Name = "Min Health",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 0,
    Flag = "MinHealth",
    Callback = function(Value)
        minHealth = Value
    end,
})

local circlecolor = FuncTab:CreateColorPicker({
    Name = "Fov Color",
    Color = circleColor,
    Callback = function(Color)
        circleColor = Color
        fovCircle.Color = Color
    end
})

local targetedcirclecolor = FuncTab:CreateColorPicker({
    Name = "Targeted Fov Color",
    Color = targetedCircleColor,
    Callback = function(Color)
        targetedCircleColor = Color
    end
})

local circlerainbow = FuncTab:CreateToggle({
    Name = "Rainbow Fov",
    CurrentValue = false,
    Flag = "RainbowFov",
    Callback = function(Value)
        rainbowFov = Value
    end
})

local ffghhggfhfgggfbg = FuncTab:CreateSection("Anti-Aim")

local antiaimtoggle = FuncTab:CreateToggle({
    Name = "Anti-Aim",
    CurrentValue = false,
    Flag = "AntiAim",
    Callback = function(Value)
        antiAim = Value
        if Value then
            Rayfield:Notify({Title = "Anti-Aim", Content = "Enabled!", Duration = 1, Image = 4483362458,})
        else
            Rayfield:Notify({Title = "Anti-Aim", Content = "Disabled!", Duration = 1, Image = 4483362458,})
        end
    end
})

local antiaimmethod = FuncTab:CreateDropdown({
    Name = "Anti-Aim Method",
    Options = {"Reset Velo","Random Velo","Reset Pos [BROKEN]"},
    CurrentOption = "Reset Velo",
    Flag = "AntiAimMethod",
    Callback = function(Option)
        antiAimMethod = type(Option) == "table" and Option[1] or Option
        if antiAimMethod == "Reset Velo" then
            Rayfield:Notify({Title = "Reset Velocity", Content = "Nobody will see it, but exploiters will aim in the wrong place.", Duration = 5, Image = 4483362458,})
        elseif antiAimMethod == "Reset Pos [BROKEN]" then
            Rayfield:Notify({Title = "Reset Pos [BROKEN]", Content = "This is a bit buggy right now, so idk if it works that well", Duration = 5, Image = 4483362458,})
        elseif antiAimMethod == "Random Velo" then
            Rayfield:Notify({Title = "Random Velocity", Content = "Depending on ping some peoplev will see u 'teleporting' around but you are actually in the same spot the entire time.", Duration = 5, Image = 4483362458,})
        end
    end,
})


local antiaimamountx = FuncTab:CreateSlider({
    Name = "Anti-Aim Amount X",
    Range = {-1000, 1000},
    Increment = 10,
    CurrentValue = 0,
    Flag = "AntiAimAmountX",
    Callback = function(Value)
        antiAimAmountX = Value
    end,
})

local antiaimamounty = FuncTab:CreateSlider({
    Name = "Anti-Aim Amount Y",
    Range = {-1000, 1000},
    Increment = 10,
    CurrentValue = -100,
    Flag = "AntiAimAmountY",
    Callback = function(Value)
        antiAimAmountY = Value
    end,
})

local antiaimamountz = FuncTab:CreateSlider({
    Name = "Anti-Aim Amount Z",
    Range = {-1000, 1000},
    Increment = 10,
    CurrentValue = 0,
    Flag = "AntiAimAmountZ",
    Callback = function(Value)
        antiAimAmountZ = Value
    end,
})

local randomvelorange = FuncTab:CreateSlider({
    Name = "Random Velo Range",
    Range = {0, 1000},
    Increment = 10,
    CurrentValue = 100,
    Flag = "RandomVeloRange",
    Callback = function(Value)
        randomVeloRange = Value
    end,
})

local jvhghgfhhgfgghfg = FuncTab:CreateSection("Spin bot")
local spinbottoggle = FuncTab:CreateToggle({
    Name = "Spin-Bot",
    CurrentValue = false,
    Flag = "SpinBot",
    Callback = function(Value)
        spinBot = Value
        if Value then
            for i,v in pairs(hrp:GetChildren()) do
                if v.Name == "Spinning" then
                    v:Destroy()
                end
            end
            plr.Character.Humanoid.AutoRotate = false
            local Spin = Instance.new("BodyAngularVelocity")
            Spin.Name = "Spinning"
            Spin.Parent = hrp
            Spin.MaxTorque = Vector3.new(0, math.huge, 0)
            Spin.AngularVelocity = Vector3.new(0,spinBotSpeed,0)
            Rayfield:Notify({Title = "Spin Bot", Content = "Enabled!", Duration = 1, Image = 4483362458,})
        else
            for i,v in pairs(hrp:GetChildren()) do
                if v.Name == "Spinning" then
                    v:Destroy()
                end
            end
            plr.Character.Humanoid.AutoRotate = true
            Rayfield:Notify({Title = "Spin Bot", Content = "Disabled!", Duration = 1, Image = 4483362458,})
        end
    end
})

local spinbotspeed = FuncTab:CreateSlider({
    Name = "Spin-Bot Speed",
    Range = {0, 1000},
    Increment = 1,
    CurrentValue = 20,
    Flag = "SpinBotSpeed",
    Callback = function(Value)
        spinBotSpeed = Value
        if spinBot then
            for i,v in pairs(hrp:GetChildren()) do
                if v.Name == "Spinning" then
                    v:Destroy()
                end
            end
            local Spin = Instance.new("BodyAngularVelocity")
            Spin.Name = "Spinning"
            Spin.Parent = hrp
            Spin.MaxTorque = Vector3.new(0, math.huge, 0)
            Spin.AngularVelocity = Vector3.new(0,Value,0)
        end
    end,
})


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









