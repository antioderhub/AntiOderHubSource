-- LoaderGUI
-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0263157897, 0, 0.328947365, 0)
TextLabel.Size = UDim2.new(0, 777, 0, 160)
TextLabel.Font = Enum.Font.Nunito
TextLabel.Text = "Welcome to AntiOder Hub!"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
wait(5)
TextLabel.Visible = false

-- script
-- Notify Func
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
local Notify = Notification.Notify;

if game.PlaceId == 4924922222 then
  Notify({
		 Description = "Loading...";
		 Title = "Brookhaven detected!";
		 Duration = 3;
		 
  });
  loadstring(game:HttpGet("https://raw.githubusercontent.com/aftr-lua/AntiOderHub/3cd003438693662902381bf1e96b2becf5c0450c/Brookhaven.lua"))()
elseif game.PlaceId == 9872472334 then
   Notify({
		 Description = "Loading...";
		 Title = "Evade detected!";
		 Duration = 3;
		 
  });
  loadstring(game:HttpGet("https://raw.githubusercontent.com/aftr-lua/AntiOderHub/refs/heads/main/Evade.lua"))()
elseif game.PlaceId == 3101667897 then
   Notify({
		 Description = "Loading...";
		 Title = "Legends of Speed detected!";
		 Duration = 3;
		 
  });
  loadstring(game:HttpGet("https://github.com/aftr-lua/AntiOderHub/raw/refs/heads/main/NewEraOfScripts/LegendsOfSpeed.lua"))()
else
   Notify({
		 Description = "Loading universal...";
		 Title = "Not supported game!";
		 Duration = 3;
		 
  });
  loadstring(game:HttpGet("https://raw.githubusercontent.com/aftr-lua/AntiOderHub/refs/heads/main/Universal.lua"))()
end
