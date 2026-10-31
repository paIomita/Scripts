-- Path: Players.Drrrrrrrrragonball.PlayerScripts.AdminEventWheelClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.AdminEventWheelClient
-- Decompile time: 18.22 ms

local Frame_7, UITextSizeConstraint, v1, v2, v3, v4, v5, v6, v7, v8
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local v9 = Players.LocalPlayer:WaitForChild("PlayerGui")
local AdminEventWheelEvent = ReplicatedStorage:WaitForChild("AdminEventWheelEvent")
local u1527 = {}
local v10 = {
    key = "rain",
    name = "POP RAIN",
    short = "RAIN",
    image = "rbxassetid://16664715772",
    glyph = "🌧️",
    color = Color3.fromRGB(63, 215, 255),
    accent = Color3.fromRGB(255, 109, 230),
}
local v11 = {
    key = "volcano",
    name = "POP VOLCANO",
    short = "VOLCANO",
    image = "rbxassetid://11395089850",
    glyph = "🌋",
    color = Color3.fromRGB(255, 88, 24),
    accent = Color3.fromRGB(255, 220, 54),
}
local v12 = {
    key = "tsunami",
    name = "POP TSUNAMI",
    short = "TSUNAMI",
    image = "rbxassetid://16664772965",
    glyph = "🌊",
    color = Color3.fromRGB(20, 177, 255),
    accent = Color3.fromRGB(104, 255, 238),
}
local v13 = {
    key = "meteor",
    name = "POP METEOR SHOWER",
    short = "METEOR",
    image = "rbxassetid://12782553831",
    glyph = "☄️",
    color = Color3.fromRGB(255, 69, 141),
    accent = Color3.fromRGB(255, 203, 82),
}
local v14 = {
    key = "rift",
    name = "COSMIC POP RIFT",
    short = "RIFT",
    image = "rbxassetid://16951115765",
    glyph = "🌀",
    color = Color3.fromRGB(142, 63, 255),
    accent = Color3.fromRGB(38, 255, 238),
}
local v15 = {
    key = "tornado",
    name = "POP TORNADO",
    short = "TORNADO",
    image = "rbxassetid://16669803246",
    glyph = "🌪️",
    color = Color3.fromRGB(112, 225, 255),
    accent = Color3.fromRGB(255, 255, 255),
}
local v16 = {
    key = "blizzard",
    name = "POP BLIZZARD",
    short = "BLIZZARD",
    image = "rbxassetid://1851669703",
    glyph = "❄️",
    color = Color3.fromRGB(181, 235, 255),
    accent = Color3.fromRGB(255, 255, 255),
}
local v17 = {
    key = "ufo",
    name = "POP UFO",
    short = "UFO",
    image = "rbxassetid://14684195806",
    glyph = "🛸",
    color = Color3.fromRGB(87, 255, 117),
    accent = Color3.fromRGB(218, 92, 255),
}
local v18 = {
    key = "blackhole",
    name = "POP BLACK HOLE",
    short = "BLACK HOLE",
    image = "rbxassetid://6700005265",
    glyph = "⚫",
    color = Color3.fromRGB(88, 32, 194),
    accent = Color3.fromRGB(255, 89, 225),
}
local v19 = {
    key = "thunder",
    name = "POP THUNDERSTORM",
    short = "THUNDER",
    image = "rbxassetid://16676250078",
    glyph = "⚡",
    color = Color3.fromRGB(52, 117, 255),
    accent = Color3.fromRGB(255, 241, 92),
}
local v20 = {
    key = "aurora",
    name = "POP AURORA",
    short = "AURORA",
    image = "rbxassetid://16956569427",
    glyph = "🌌",
    color = Color3.fromRGB(57, 255, 179),
    accent = Color3.fromRGB(112, 141, 255),
}
local v21 = {
    key = "eclipse",
    name = "TOTAL POP ECLIPSE",
    short = "ECLIPSE",
    image = "rbxassetid://6700005265",
    glyph = "🌑",
    color = Color3.fromRGB(55, 32, 105),
    accent = Color3.fromRGB(255, 196, 70),
}
local v22 = {
    key = "moonfall",
    name = "POP MOONFALL",
    short = "MOONFALL",
    image = "rbxassetid://16956569427",
    glyph = "🌕",
    color = Color3.fromRGB(83, 105, 171),
    accent = Color3.fromRGB(205, 224, 255),
}
local v23 = {
    key = "crystal",
    name = "CRYSTAL BLOOM",
    short = "CRYSTAL",
    image = "",
    glyph = "💎",
    color = Color3.fromRGB(65, 214, 255),
    accent = Color3.fromRGB(229, 121, 255),
}
local v24 = {
    key = "fireworks",
    name = "POP FIREWORKS",
    short = "FIREWORKS",
    image = "",
    glyph = "🎆",
    color = Color3.fromRGB(255, 75, 151),
    accent = Color3.fromRGB(255, 218, 74),
}
local v25 = {
    key = "dragon",
    name = "POP DRAGON",
    short = "DRAGON",
    image = "",
    glyph = "🐉",
    color = Color3.fromRGB(255, 80, 45),
    accent = Color3.fromRGB(255, 218, 73),
}
u1527[1] = v10
u1527[2] = v11
u1527[3] = v12
u1527[4] = v13
u1527[5] = v14
u1527[6] = v15
u1527[7] = v16
u1527[8] = v17
u1527[9] = v18
u1527[10] = v19
u1527[11] = v20
u1527[12] = v21
u1527[13] = v22
u1527[14] = v23
u1527[15] = v24
u1527[16] = v25
v10 = {
    key = "jungle",
    name = "THE POP JUNGLE",
    short = "JUNGLE",
    image = "",
    glyph = "🌴",
    color = Color3.fromRGB(40, 171, 82),
    accent = Color3.fromRGB(173, 255, 86),
}
v11 = {
    key = "clockwork",
    name = "CLOCKWORK CHAOS",
    short = "CLOCKWORK",
    image = "",
    glyph = "⚙️",
    color = Color3.fromRGB(194, 119, 48),
    accent = Color3.fromRGB(255, 220, 130),
}
v12 = {
    key = "solarflare",
    name = "SOLAR FLARE",
    short = "SOLAR FLARE",
    image = "",
    glyph = "☀️",
    color = Color3.fromRGB(255, 100, 25),
    accent = Color3.fromRGB(255, 245, 89),
}
v13 = {
    key = "adminballoon",
    name = "ADMIN BALLOON",
    short = "ADMIN BALLOON",
    image = "rbxassetid://123490843567560",
    glyph = "🎈",
    color = Color3.fromRGB(255, 77, 190),
    accent = Color3.fromRGB(255, 226, 74),
}
v14 = {
    key = "bossfight",
    name = "POP TITAN BOSS FIGHT",
    short = "BOSS FIGHT",
    image = "rbxthumb://type=AvatarHeadShot&id=634947518&w=150&h=150",
    glyph = "⚔️",
    color = Color3.fromRGB(255, 62, 79),
    accent = Color3.fromRGB(129, 76, 255),
}
u1527[17] = v10
u1527[18] = v11
u1527[19] = v12
u1527[20] = v13
u1527[21] = v14
local u1599 = {}
for i, v in ipairs(u1527) do
    v.index = i
    u1599[v.key] = v
end
local AdminEventWheelGui = v9:FindFirstChild("AdminEventWheelGui")
if AdminEventWheelGui then
    AdminEventWheelGui:Destroy()
end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdminEventWheelGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 260
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = v9
local u1522 = Instance.new("Frame")
u1522.Name = "Screen"
u1522.Size = UDim2.fromScale(1, 1)
u1522.BackgroundTransparency = 1
u1522.Visible = false
u1522.Parent = ScreenGui
local Frame = Instance.new("Frame")
Frame.Name = "Display"
Frame.Size = UDim2.fromOffset(620, 440)
Frame.AnchorPoint = Vector2.new(0.5, 0)
Frame.Position = UDim2.new(0.5, 0, 0, -460)
Frame.BackgroundTransparency = 1
Frame.Parent = u1522
local UIScale = Instance.new("UIScale")
UIScale.Name = "ResponsiveScale"
UIScale.Parent = Frame

local function updateScale() -- Line: 72 -- upvalues: UIScale (val)
    local CurrentCamera = workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    UIScale.Scale = math.clamp(math.min(ViewportSize.X / 1100, ViewportSize.Y / 720), 0.56, 1.05)
end

local CurrentCamera = workspace.CurrentCamera
local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
UIScale.Scale = math.clamp(math.min(ViewportSize.X / 1100, ViewportSize.Y / 720), 0.56, 1.05)
if workspace.CurrentCamera then
    (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateScale)
end
;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 81 -- upvalues: UIScale (val)
    local CurrentCamera = workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    UIScale.Scale = math.clamp(math.min(ViewportSize.X / 1100, ViewportSize.Y / 720), 0.56, 1.05)
end)
local Frame_2 = Instance.new("Frame")
Frame_2.Name = "BackdropShadow"
Frame_2.Size = UDim2.fromOffset(604, 432)
Frame_2.AnchorPoint = Vector2.new(0.5, 0)
Frame_2.Position = UDim2.fromOffset(316, 8)
Frame_2.BackgroundColor3 = Color3.fromRGB(5, 8, 18)
Frame_2.BackgroundTransparency = 0.2
Frame_2.BorderSizePixel = 0
Frame_2.ZIndex = 0
Frame_2.Visible = false
Frame_2.Parent = Frame
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 28)
UICorner.Parent = Frame_2
local Frame_3 = Instance.new("Frame")
Frame_3.Name = "Backdrop"
Frame_3.Size = UDim2.fromOffset(604, 432)
Frame_3.AnchorPoint = Vector2.new(0.5, 0)
Frame_3.Position = UDim2.fromOffset(310, 0)
Frame_3.BackgroundColor3 = Color3.fromRGB(23, 32, 58)
Frame_3.BackgroundTransparency = 0.08
Frame_3.BorderSizePixel = 0
Frame_3.ZIndex = 1
Frame_3.Visible = false
Frame_3.Parent = Frame
local UICorner_2 = Instance.new("UICorner")
UICorner_2.CornerRadius = UDim.new(0, 28)
UICorner_2.Parent = Frame_3
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(7, 10, 23)
UIStroke.Thickness = 4
UIStroke.Parent = Frame_3
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(54, 69, 111)),
    ColorSequenceKeypoint.new(0.48, Color3.fromRGB(25, 35, 65)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 19, 39))),
})
UIGradient.Rotation = 90
UIGradient.Parent = Frame_3
local Frame_4 = Instance.new("Frame")
Frame_4.Name = "Wheel"
Frame_4.Size = UDim2.fromOffset(620, 620)
Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_4.Position = UDim2.fromOffset(310, 0)
Frame_4.BackgroundColor3 = Color3.fromRGB(28, 39, 67)
Frame_4.BorderSizePixel = 0
Frame_4.ClipsDescendants = true
Frame_4.ZIndex = 2
Frame_4.Parent = Frame
local UICorner_3 = Instance.new("UICorner")
UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Frame_4
local UIGradient_2 = Instance.new("UIGradient")
UIGradient_2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 65, 105)),
    ColorSequenceKeypoint.new(0.55, Color3.fromRGB(21, 31, 57)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 18, 37))),
})
UIGradient_2.Rotation = 90
UIGradient_2.Parent = Frame_4
local UIStroke_2 = Instance.new("UIStroke")
UIStroke_2.Color = Color3.fromRGB(10, 12, 22)
UIStroke_2.Thickness = 7
UIStroke_2.Parent = Frame_4
local UIStroke_3 = Instance.new("UIStroke")
UIStroke_3.Name = "ColorRim"
UIStroke_3.Color = Color3.fromRGB(255, 255, 255)
UIStroke_3.Thickness = 3
UIStroke_3.Transparency = 0.1
UIStroke_3.Parent = Frame_4
local UIGradient_3 = Instance.new("UIGradient")
UIGradient_3.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 92, 196)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 226, 80)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(71, 224, 255)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(167, 91, 255))),
})
UIGradient_3.Parent = UIStroke_3
local u1675 = 360 / #u1527
v19 = if not (#u1527 > 16) then 220 else 238
v21 = if not v17 then 66 else 52
v22 = (if not v17 then 96 else 70) * 0.5
v23 = if not v17 then 34 else 25
v24 = if not v17 then 26 else 20
v25 = if not v17 then 40 else 30
local v26 = if not v17 then 22 else 18
for i2, i3 in ipairs(u1527) do
    v1 = -90 + (i2 - 1) * u1675
    v2 = math.rad(v1)
    v3 = math.rad(u1675 / 2)
    v4 = i3.color:Lerp(Color3.fromRGB(18, 26, 46), 0.12)
    for j = 1, 24 do
        v6 = (j - 1) * 9.75 + 54
        v7 = v6 + 9.75
        v8 = (v6 + v7) / 2
        v6 = v7 * 2 * math.tan(v3) * 0.965
        v7 = Instance.new("Frame")
        v7.Name = i3.key .. "Wedge"
        v7.Size = UDim2.fromOffset(v6, 11.75)
        v7.AnchorPoint = Vector2.new(0.5, 0.5)
        v7.Position = UDim2.fromOffset(math.cos(v2) * v8 + 310, math.sin(v2) * v8 + 310)
        v7.Rotation = v1 + 90
        v7.BackgroundColor3 = v4:Lerp(i3.accent, j / 24 * 0.12)
        v7.BackgroundTransparency = math.clamp((j - 1) * 0.004, 0, 0.1)
        v7.BorderSizePixel = 0
        v7.ZIndex = 3
        v7.Parent = Frame_4
    end
    v4 = v1 - u1675 / 2
    v3 = math.rad(v4)
    v5 = UDim2.fromOffset(math.cos(v3) * 172 + 310, math.sin(v3) * 172 + 310)
    v3 = Instance.new("Frame")
    v3.Name = i3.key .. "DividerShadow"
    v3.Size = UDim2.fromOffset(4, 234)
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.Position = v5
    v3.Rotation = v4 + 90
    v3.BackgroundColor3 = Color3.fromRGB(5, 8, 18)
    v3.BorderSizePixel = 0
    v3.ZIndex = 5
    v3.Parent = Frame_4
    v3 = Instance.new("Frame")
    v3.Name = i3.key .. "Divider"
    v3.Size = UDim2.fromOffset(1.5, 234)
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.Position = v5
    v3.Rotation = v4 + 90
    v3.BackgroundColor3 = Color3.fromRGB(235, 250, 255)
    v3.BorderSizePixel = 0
    v3.ZIndex = 6
    v3.Parent = Frame_4
    Frame_7 = Instance.new("Frame")
    Frame_7.Name = i3.key .. "Slot"
    Frame_7.Size = UDim2.fromOffset(v20, v21)
    Frame_7.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame_7.Position = UDim2.fromOffset(310 + math.cos(v2) * v19, 310 + math.sin(v2) * v19)
    Frame_7.Rotation = v1 - 90
    Frame_7.BackgroundColor3 = i3.color:Lerp(Color3.fromRGB(10, 15, 28), 0.5)
    Frame_7.BackgroundTransparency = 0.08
    Frame_7.BorderSizePixel = 0
    Frame_7.ZIndex = 8
    Frame_7.Parent = Frame_4
    v4 = Instance.new("UICorner")
    v4.CornerRadius = UDim.new(0, if not v17 then 19 else 14)
    v4.Parent = Frame_7
    v4 = Instance.new("UIStroke")
    v4.Color = i3.accent:Lerp(Color3.fromRGB(8, 11, 22), 0.38)
    v4.Thickness = 2.5
    v4.Parent = Frame_7
    v4 = Instance.new("UIGradient")
    v4.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, i3.color:Lerp(Color3.new(1, 1, 1), 0.18)),
        (ColorSequenceKeypoint.new(1, i3.color:Lerp(Color3.fromRGB(8, 12, 24), 0.72))),
    })
    v4.Rotation = 90
    v4.Parent = Frame_7
    v4 = Instance.new("ImageLabel")
    v4.Name = "Icon"
    v4.Size = UDim2.fromOffset(v23, v23)
    v4.AnchorPoint = Vector2.new(0.5, 0)
    v4.Position = UDim2.fromOffset(v22, 3)
    v4.BackgroundTransparency = 1
    v4.Image = i3.image
    v4.ImageColor3 = Color3.new(1, 1, 1)
    v4.ImageTransparency = 0.38
    v4.ScaleType = Enum.ScaleType.Fit
    v4.ZIndex = 9
    v4.Parent = Frame_7
    v4 = Instance.new("TextLabel")
    v4.Name = "IconGlyph"
    v4.Size = UDim2.fromOffset(v23 + 4, v23 + 2)
    v4.AnchorPoint = Vector2.new(0.5, 0)
    v4.Position = UDim2.fromOffset(v22, 1)
    v4.BackgroundTransparency = 1
    v4.Font = Enum.Font.FredokaOne
    v4.Text = i3.glyph
    v4.TextColor3 = Color3.new(1, 1, 1)
    v4.TextSize = v24
    v4.TextStrokeColor3 = Color3.fromRGB(7, 10, 20)
    v4.TextStrokeTransparency = 0.3
    v4.ZIndex = 10
    v4.Parent = Frame_7
    v4 = Instance.new("TextLabel")
    v4.Name = "Name"
    v4.Size = UDim2.new(1, -6, 0, v26)
    v4.Position = UDim2.fromOffset(3, v25)
    v4.BackgroundTransparency = 1
    v4.Font = Enum.Font.FredokaOne
    v4.Text = i3.short
    v4.TextColor3 = Color3.new(1, 1, 1)
    v4.TextScaled = true
    v4.TextStrokeColor3 = Color3.fromRGB(7, 10, 20)
    v4.TextStrokeTransparency = 0
    v4.ZIndex = 9
    v4.Parent = Frame_7
    UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.MinTextSize = if not v17 then 8 else 6
    UITextSizeConstraint.MaxTextSize = if not v17 then 15 else 11
    UITextSizeConstraint.Parent = v4
end
local Frame_5 = Instance.new("Frame")
Frame_5.Name = "Hub"
Frame_5.Size = UDim2.fromOffset(104, 104)
Frame_5.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_5.Position = UDim2.fromOffset(310, 310)
Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_5.BorderSizePixel = 0
Frame_5.ZIndex = 12
Frame_5.Parent = Frame_4
v25 = Instance.new("UICorner")
v25.CornerRadius = UDim.new(1, 0)
v25.Parent = Frame_5
v25 = Instance.new("UIStroke")
v25.Color = Color3.fromRGB(10, 12, 22)
v25.Thickness = 5
v25.Parent = Frame_5
v25 = Instance.new("UIGradient")
v25.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 65, 105)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 204, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(85, 232, 112)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(45, 172, 255)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(179, 73, 255))),
})
v25.Rotation = 35
v25.Parent = Frame_5
local Frame_6 = Instance.new("Frame")
Frame_6.Name = "TitleShadow"
Frame_6.Size = UDim2.fromOffset(366, 56)
Frame_6.AnchorPoint = Vector2.new(0.5, 0)
Frame_6.Position = UDim2.fromOffset(314, 22)
Frame_6.BackgroundColor3 = Color3.fromRGB(5, 8, 18)
Frame_6.BackgroundTransparency = 0.18
Frame_6.BorderSizePixel = 0
Frame_6.ZIndex = 19
Frame_6.Parent = Frame
v25 = Instance.new("UICorner")
v25.CornerRadius = UDim.new(0, 22)
v25.Parent = Frame_6
local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "Title"
TextLabel.Size = UDim2.fromOffset(366, 56)
TextLabel.AnchorPoint = Vector2.new(0.5, 0)
TextLabel.Position = UDim2.fromOffset(310, 16)
TextLabel.BackgroundColor3 = Color3.fromRGB(20, 28, 50)
TextLabel.BackgroundTransparency = 0.08
TextLabel.BorderSizePixel = 0
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "EVENT WHEEL"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 27
TextLabel.TextStrokeColor3 = Color3.fromRGB(5, 8, 18)
TextLabel.TextStrokeTransparency = 0
TextLabel.ZIndex = 20
TextLabel.Parent = Frame
v25 = Instance.new("UICorner")
v25.CornerRadius = UDim.new(0, 22)
v25.Parent = TextLabel
v25 = Instance.new("UIStroke")
v25.Color = Color3.fromRGB(5, 8, 18)
v25.Thickness = 3.5
v25.Parent = TextLabel
v25 = Instance.new("UIGradient")
v25.Color = ColorSequence.new(Color3.fromRGB(255, 237, 84), Color3.fromRGB(255, 116, 48))
v25.Parent = TextLabel
v25 = Instance.new("Frame")
v25.Name = "PointerBack"
v25.Size = UDim2.fromOffset(58, 58)
v25.AnchorPoint = Vector2.new(0.5, 0.5)
v25.Position = UDim2.fromOffset(310, 284)
v25.BackgroundColor3 = Color3.fromRGB(21, 29, 51)
v25.BorderSizePixel = 0
v25.ZIndex = 23
v25.Parent = Frame
v24 = Instance.new("UICorner")
v24.CornerRadius = UDim.new(1, 0)
v24.Parent = v25
v24 = Instance.new("UIStroke")
v24.Color = Color3.fromRGB(7, 10, 21)
v24.Thickness = 3
v24.Parent = v25
v25 = Instance.new("TextLabel")
v25.Name = "Pointer"
v25.Size = UDim2.fromOffset(61, 60)
v25.AnchorPoint = Vector2.new(0.5, 0.5)
v25.Position = UDim2.fromOffset(310, 282)
v25.BackgroundTransparency = 1
v25.Font = Enum.Font.FredokaOne
v25.Text = "▲"
v25.TextColor3 = Color3.fromRGB(255, 235, 62)
v25.TextSize = 49
v25.TextStrokeColor3 = Color3.fromRGB(10, 12, 22)
v25.TextStrokeTransparency = 0
v25.ZIndex = 24
v25.Parent = Frame
local u926 = Instance.new("UIScale")
u926.Parent = v25
local u930 = Instance.new("Frame")
u930.Name = "ResultShadow"
u930.Size = UDim2.fromOffset(542, 72)
u930.AnchorPoint = Vector2.new(0.5, 0)
u930.Position = UDim2.fromOffset(316, 350)
u930.BackgroundColor3 = Color3.fromRGB(8, 10, 20)
u930.BorderSizePixel = 0
u930.Visible = false
u930.ZIndex = 19
u930.Parent = Frame
v23 = Instance.new("UICorner")
v23.CornerRadius = UDim.new(0, 23)
v23.Parent = u930
local u963 = Instance.new("Frame")
u963.Name = "Result"
u963.Size = UDim2.fromOffset(542, 72)
u963.AnchorPoint = Vector2.new(0.5, 0)
u963.Position = UDim2.fromOffset(310, 343)
u963.BackgroundColor3 = Color3.fromRGB(63, 215, 255)
u963.BorderSizePixel = 0
u963.Visible = false
u963.ZIndex = 20
u963.Parent = Frame
v22 = Instance.new("UICorner")
v22.CornerRadius = UDim.new(0, 23)
v22.Parent = u963
v22 = Instance.new("UIStroke")
v22.Color = Color3.fromRGB(8, 10, 20)
v22.Thickness = 4
v22.Parent = u963
local u1006 = Instance.new("UIGradient")
u1006.Rotation = 90
u1006.Parent = u963
local u1011 = Instance.new("UIScale")
u1011.Parent = u963
local u1015 = Instance.new("TextLabel")
u1015.Name = "SelectedEvent"
u1015.Size = UDim2.new(1, -20, 1, -8)
u1015.Position = UDim2.fromOffset(10, 4)
u1015.BackgroundTransparency = 1
u1015.Font = Enum.Font.FredokaOne
u1015.Text = "SELECTED: POP RAIN"
u1015.TextColor3 = Color3.new(1, 1, 1)
u1015.TextScaled = true
u1015.TextStrokeColor3 = Color3.fromRGB(8, 10, 20)
u1015.TextStrokeTransparency = 0
u1015.ZIndex = 22
u1015.Parent = u963
v19 = Instance.new("UITextSizeConstraint")
v19.MinTextSize = 16
v19.MaxTextSize = 28
v19.Parent = u1015
local u1052 = Instance.new("TextLabel")
u1052.Name = "SpinStatus"
u1052.Size = UDim2.fromOffset(300, 34)
u1052.AnchorPoint = Vector2.new(0.5, 0)
u1052.Position = UDim2.fromOffset(310, 314)
u1052.BackgroundTransparency = 1
u1052.Font = Enum.Font.FredokaOne
u1052.Text = "SPINNING..."
u1052.TextColor3 = Color3.fromRGB(221, 239, 255)
u1052.TextSize = 22
u1052.TextStrokeColor3 = Color3.fromRGB(6, 9, 19)
u1052.TextStrokeTransparency = 0
u1052.Visible = false
u1052.ZIndex = 20
u1052.Parent = Frame
local u1083 = nil
local u1084 = 0

local function burstConfetti(a1) -- Line: 488 -- upvalues: Frame (val), TweenService (val), Debris (val)
    local Frame_2, UICorner, color, v1, v2
    local v3 = a1
    for i = 1, 34 do
        Frame_2 = Instance.new("Frame")
        Frame_2.Size = UDim2.fromOffset(math.random(7, 14), math.random(10, 20))
        Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_2.Position = UDim2.fromOffset(310 + math.random(-30, 30), 294 + math.random(-8, 8))
        Frame_2.Rotation = math.random(0, 359)
        color = not (i % 2 ~= 0) and v3.color or v3.accent
        Frame_2.BackgroundColor3 = color
        Frame_2.BorderSizePixel = 0
        Frame_2.ZIndex = 30
        Frame_2.Parent = Frame
        UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = Frame_2
        v1 = math.random(-280, 280)
        v2 = math.random(70, 170)
        TweenService:Create(Frame_2, TweenInfo.new(math.random(10, 17) / 10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(310 + v1, 294 + v2),
            Rotation = Frame_2.Rotation + math.random(-260, 260),
        }):Play()
        Debris:AddItem(Frame_2, 2)
    end
end

local function resolveSelection(a1) -- Line: 514 -- upvalues: u1599 (val), u1527 (val)
    if type(a1) ~= "table" then
        return nil
    end
    local v1 = u1599[tostring(a1.selectedKey or ""):lower()]
    if v1 then
        return v1
    end
    return u1527[(math.floor((tonumber(a1.selectedIndex)) or 0))]
end

local function spin(a1) -- Line: 522
    -- upvalues: u1599 (val), u1527 (val), u1084 (ref), u1083 (ref), UIScale (val), u1522 (val), Frame (val)
    -- upvalues: Frame_4 (val), u926 (val), u963 (val), u930 (val), u1011 (val), Frame_3 (val), Frame_2 (val)
    -- upvalues: u1052 (val), TextLabel (val), TweenService (val), u1675 (val), u1006 (val), u1015 (val)
    -- upvalues: burstConfetti (val)
    local v1, v2
    if type(a1) == "table" then
        v2 = u1599[tostring(a1.selectedKey or ""):lower()]
        v1 = if not v2 then u1527[(math.floor((tonumber(a1.selectedIndex)) or 0))] else v2
    else
        v1 = nil
    end
    if not v1 then
        return
    end
    v2 = false
    if type(a1) == "table" then
        v2 = a1.isGlobal == true
    end
    u1084 = u1084 + 1
    local u34 = u1084
    if u1083 then
        u1083:Cancel()
        u1083 = nil
    end
    local CurrentCamera = workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    UIScale.Scale = math.clamp(math.min(ViewportSize.X / 1100, ViewportSize.Y / 720), 0.56, 1.05)
    u1522.Visible = true
    Frame.Position = UDim2.new(0.5, 0, 0, -460)
    Frame_4.Rotation = 0
    u926.Scale = 1
    u963.Visible = false
    u930.Visible = false
    u1011.Scale = 0.2
    Frame_3.Visible = false
    Frame_2.Visible = false
    u1052.Visible = false
    u1052.Text = if not v2 then "SPINNING..." else "GLOBAL SPINNING..."
    TextLabel.Text = if not v2 then "EVENT WHEEL" else "GLOBAL EVENT WHEEL"
    TweenService:Create(Frame, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0, 0)}):Play()
    task.wait(0.35)
    if u34 ~= u1084 then
        return
    end
    local v3 = 2160 + (90 - (-90 + (v1.index - 1) * u1675))
    u1083 = TweenService:Create(Frame_4, TweenInfo.new(5.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Rotation = v3})
    u1083:Play()
    task.spawn(function() -- Line: 561 -- upvalues: u34 (val), u1084 (upval), u1083 (upval), TweenService (upval), u926 (upval)
        local v1
        local v2 = false
        while u34 == u1084 do
            if not u1083 or u1083.PlaybackState ~= Enum.PlaybackState.Playing then
                break
            end
            v2 = not v2
            v1 = u926
            TweenService:Create(v1, TweenInfo.new(0.07), {Scale = if not v2 then 0.96 else 1.12}):Play()
            task.wait(0.1)
        end
    end)
    u1083.Completed:Wait()
    if u34 ~= u1084 then
        return
    end
    u1083 = nil
    u926.Scale = 1.18
    TweenService:Create(u926, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    u963.BackgroundColor3 = v1.color
    u1006.Color = ColorSequence.new(v1.accent, v1.color)
    u1015.Text = "SELECTED: " .. v1.name
    u1052.Visible = false
    Frame_3.Size = UDim2.fromOffset(604, 318)
    Frame_2.Size = UDim2.fromOffset(604, 318)
    Frame_3.Visible = true
    Frame_2.Visible = true
    TweenService:Create(Frame_3, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(604, 432)}):Play()
    TweenService:Create(Frame_2, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(604, 432)}):Play()
    u963.Visible = true
    u930.Visible = true
    u1011.Scale = 0.2
    TweenService:Create(u1011, TweenInfo.new(0.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    TextLabel.Text = if not v2 then "EVENT SELECTED!" else "GLOBAL EVENT SELECTED!"
    burstConfetti(v1)
    task.wait(5.5)
    if u34 ~= u1084 then
        return
    end
    v3 = TweenService:Create(Frame, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 0, -460)})
    v3:Play()
    v3.Completed:Wait()
    if u34 == u1084 then
        u1522.Visible = false
    end
end

AdminEventWheelEvent.OnClientEvent:Connect(function(a1) -- Line: 609 -- upvalues: spin (val)
    task.spawn(spin, a1)
end)