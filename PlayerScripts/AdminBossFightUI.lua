-- Path: Players.Drrrrrrrrragonball.PlayerScripts.AdminBossFightUI

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.AdminBossFightUI
-- Decompile time: 2.81 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local v1 = Players.LocalPlayer:WaitForChild("PlayerGui")
local AdminBossUIEvent = ReplicatedStorage:WaitForChild("AdminBossUIEvent")
local v2 = Instance.new("ScreenGui")
v2.Name = "AdminBossFightGui"
v2.ResetOnSpawn = false
v2.DisplayOrder = 110
v2.IgnoreGuiInset = true
v2.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
v2.SafeAreaCompatibility = Enum.SafeAreaCompatibility.FullscreenExtension
v2.ClipToDeviceSafeArea = true
v2.Parent = v1
local u44 = Instance.new("Frame")
u44.Name = "BossBar"
u44.AnchorPoint = Vector2.new(0.5, 0.5)
u44.Position = UDim2.fromScale(0.5, -0.05)
u44.Size = UDim2.new(0.56, 0, 0, 48)
u44.BackgroundColor3 = Color3.fromRGB(30, 18, 39)
u44.BorderSizePixel = 0
u44.Visible = false
u44.Parent = v2
v2 = Instance.new("UISizeConstraint")
v2.MinSize = Vector2.new(260, 42)
v2.MaxSize = Vector2.new(720, 54)
v2.Parent = u44
v2 = Instance.new("UICorner")
v2.CornerRadius = UDim.new(0, 12)
v2.Parent = u44
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 85, 184)
UIStroke.Thickness = 3
UIStroke.Parent = u44
local Frame = Instance.new("Frame")
Frame.Name = "Shadow"
Frame.Position = UDim2.fromOffset(0, 5)
Frame.Size = UDim2.fromScale(1, 1)
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BackgroundTransparency = 0.5
Frame.BorderSizePixel = 0
Frame.ZIndex = -1
Frame.Parent = u44
v2:Clone().Parent = Frame
local Frame_2 = Instance.new("Frame")
Frame_2.Name = "FillClip"
Frame_2.Position = UDim2.fromOffset(5, 5)
Frame_2.Size = UDim2.new(1, -10, 1, -10)
Frame_2.BackgroundColor3 = Color3.fromRGB(53, 35, 60)
Frame_2.BorderSizePixel = 0
Frame_2.ClipsDescendants = true
Frame_2.Parent = u44
local v3 = Instance.new("UICorner")
v3.CornerRadius = UDim.new(0, 8)
v3.Parent = Frame_2
local u151 = Instance.new("Frame")
u151.Name = "HealthFill"
u151.Size = UDim2.fromScale(1, 1)
u151.BackgroundColor3 = Color3.fromRGB(255, 57, 153)
u151.BorderSizePixel = 0
u151.Parent = Frame_2
v3:Clone().Parent = u151
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 205, 66)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 62, 161)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(111, 62, 255))),
})
UIGradient.Parent = u151
local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "BossName"
TextLabel.AnchorPoint = Vector2.new(0.5, 1)
TextLabel.Position = UDim2.new(0.5, 0, 0, -7)
TextLabel.Size = UDim2.new(0.8, 0, 0, 28)
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "THE POP TITAN"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
TextLabel.TextStrokeTransparency = 0
TextLabel.TextScaled = true
TextLabel.Parent = u44
local u234 = Instance.new("TextLabel")
u234.Name = "Health"
u234.Size = UDim2.new(1, -100, 1, 0)
u234.Position = UDim2.fromOffset(10, 0)
u234.BackgroundTransparency = 1
u234.Font = Enum.Font.FredokaOne
u234.TextColor3 = Color3.new(1, 1, 1)
u234.TextStrokeColor3 = Color3.new(0, 0, 0)
u234.TextStrokeTransparency = 0.25
u234.TextSize = 18
u234.TextXAlignment = Enum.TextXAlignment.Center
u234.ZIndex = 3
u234.Parent = u44
local TextLabel_2 = Instance.new("TextLabel")
TextLabel_2.Name = "Timer"
TextLabel_2.AnchorPoint = Vector2.new(1, 0.5)
TextLabel_2.Position = UDim2.new(1, -8, 0.5, 0)
TextLabel_2.Size = UDim2.fromOffset(86, 34)
TextLabel_2.BackgroundColor3 = Color3.fromRGB(31, 20, 40)
TextLabel_2.BackgroundTransparency = 0.08
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = "03:00"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextStrokeColor3 = Color3.new(0, 0, 0)
TextLabel_2.TextStrokeTransparency = 0.35
TextLabel_2.TextSize = 17
TextLabel_2.ZIndex = 4
TextLabel_2.Parent = u44
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = TextLabel_2
local UIStroke_2 = Instance.new("UIStroke")
UIStroke_2.Color = Color3.fromRGB(255, 116, 209)
UIStroke_2.Thickness = 1.5
UIStroke_2.Parent = TextLabel_2
local u318 = 1
local u319 = 0
local u320 = nil
local u321 = 0

local function stopTimer() -- Line: 141 -- upvalues: u320 (ref)
    if u320 then
        u320:Disconnect()
        u320 = nil
    end
end

local function updateTimer() -- Line: 148 -- upvalues: u319 (ref), TextLabel_2 (val), u320 (ref)
    local v1 = math.max(0, u319 - (workspace:GetServerTimeNow()))
    TextLabel_2.Text = string.format("%02d:%02d", math.floor(v1 / 60), (math.floor(v1 % 60)))
    if v1 <= 0 and u320 then
        u320:Disconnect()
        u320 = nil
    end
end

AdminBossUIEvent.OnClientEvent:Connect(function(a1, a2, a3, a4, a5) -- Line: 156
    -- upvalues: u321 (ref), u318 (ref), u319 (ref), TextLabel (val), u234 (val), u151 (val), u44 (val)
    -- upvalues: TweenService (val), u320 (ref), updateTimer (val), RunService (val)
    local v1
    if a1 ~= "Show" then
        if a1 == "Update" then
            v1 = math.max(0, (tonumber(a2)) or 0)
            u234.Text = string.format("%s / %s", math.floor(v1), (math.floor(u318)))
            TweenService:Create(u151, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Size = UDim2.fromScale(math.clamp(v1 / u318, 0, 1), 1)}):Play()
            return
        end
        if a1 == "Hide" then
            u321 = u321 + 1
            local u139 = u321
            if u320 then
                u320:Disconnect()
                u320 = nil
            end
            TweenService:Create(
                u44,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Position = UDim2.fromScale(0.5, -0.05)}
            ):Play()
            task.delay(0.42, function() -- Line: 186 -- upvalues: u321 (upval), u139 (val), u44 (upval)
                if u321 == u139 then
                    u44.Visible = false
                end
            end)
        end
        return
    end
    u321 = u321 + 1
    u318 = math.max(1, (tonumber(a4)) or 1)
    v1 = math.max(0, tonumber(a3) or u318)
    u319 = tonumber(a5) or workspace:GetServerTimeNow()
    TextLabel.Text = tostring(a2 or "THE POP TITAN")
    u234.Text = string.format("%s / %s", math.floor(v1), (math.floor(u318)))
    u151.Size = UDim2.fromScale(math.clamp(v1 / u318, 0, 1), 1)
    u44.Visible = true
    u44.Position = UDim2.fromScale(0.5, -0.05)
    TweenService:Create(u44, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.fromScale(0.5, 0.1)}):Play()
    if u320 then
        u320:Disconnect()
        u320 = nil
    end
    updateTimer()
    RunService.RenderStepped:Connect(updateTimer)
end)