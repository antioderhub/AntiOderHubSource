-- AntiOder Loader
-- Version: 1.1 made by Aftr special for AntiOder Hub

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")

--Properties:

ScreenGui.Parent = game.CoreGui

ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.3800000, 0, 0.100000000, 0)
ImageLabel.Size = UDim2.new(0, 314, 0, 296)
ImageLabel.Image = "rbxassetid://128216856751714"
wait(4)
ImageLabel:Destroy()
setclipboard("https://t.me/aftermathscript")
loadstring(game:HttpGet("https://raw.githubusercontent.com/aftr-lua/AntiOderHub/refs/heads/main/loader1.lua"))()
