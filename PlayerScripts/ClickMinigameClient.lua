-- Path: Players.Drrrrrrrrragonball.PlayerScripts.ClickMinigameClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.ClickMinigameClient
-- Decompile time: 5.10 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local ClickMinigameGui = PlayerGui:WaitForChild("ClickMinigameGui")
local Shade = ClickMinigameGui:WaitForChild("Shade")
local ClickButton = Shade:WaitForChild("ClickButton")
local ButtonScale = ClickButton:WaitForChild("ButtonScale")
local Count = (Shade:WaitForChild("GlobalPanel")):WaitForChild("Count")
local Count_2 = (Shade:WaitForChild("PersonalPanel")):WaitForChild("Count")
local Players_2 = (Shade:WaitForChild("Leaderboard")):WaitForChild("Players")
local v1 = ReplicatedStorage:WaitForChild("ClickMinigameRemotes")
local v2 = v1:WaitForChild("Start")
local Stop = v1:WaitForChild("Stop")
local Update = v1:WaitForChild("Update")
local Click = v1:WaitForChild("Click")
local GetState = v1:WaitForChild("GetState")
local u86 = false
local u87 = false
local u88 = 0
local u89 = nil
local u90 = {}
local u91 = {}
local u92 = {}
local u93 = 0
local u94 = 0
local u95 = 0

local function formatNumber(a1) -- Line: 34
    local v1, v2
    local v3 = tostring((math.max(0, (math.floor((tonumber(a1)) or 0)))))
    repeat
        v1, v2 = v3:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        v3 = v1
    until v2 == 0
    return v3
end

local function hideOtherGuis() -- Line: 44 -- upvalues: PlayerGui (val), ClickMinigameGui (val), u90 (val)
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= ClickMinigameGui then
            if u90[v] == nil then
                u90[v] = v.Enabled
            end
            v.Enabled = false
        end
    end
end

local function restoreOtherGuis() -- Line: 55 -- upvalues: u90 (val)
    for k, v in pairs(u90) do
        if k and k.Parent then
            k.Enabled = v
        end
    end
    table.clear(u90)
end

local function createLeaderboardRow(a1) -- Line: 64 -- upvalues: Players_2 (val), u91 (val), u92 (val), Players (val)
    local u3 = tonumber(a1.userId)
    if not u3 then
        return nil
    end
    local Frame = Instance.new("Frame")
    Frame.Name = "Player_" .. u3
    Frame.Size = UDim2.new(1, -6, 0, 58)
    Frame.BackgroundColor3 = Color3.fromRGB(45, 54, 88)
    Frame.BorderSizePixel = 0
    Frame.Parent = Players_2
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Frame
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "Rank"
    TextLabel.Size = UDim2.new(0, 34, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Font = Enum.Font.GothamBlack
    TextLabel.TextColor3 = Color3.fromRGB(255, 220, 66)
    TextLabel.TextSize = 17
    TextLabel.Parent = Frame
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "Avatar"
    ImageLabel.Size = UDim2.fromOffset(44, 44)
    ImageLabel.Position = UDim2.new(0, 36, 0.5, -22)
    ImageLabel.BackgroundColor3 = Color3.fromRGB(25, 31, 55)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Parent = Frame
    local UICorner_2 = Instance.new("UICorner")
    UICorner_2.CornerRadius = UDim.new(1, 0)
    UICorner_2.Parent = ImageLabel
    local TextLabel_2 = Instance.new("TextLabel")
    TextLabel_2.Name = "Username"
    TextLabel_2.Size = UDim2.new(1, -154, 1, 0)
    TextLabel_2.Position = UDim2.new(0, 88, 0, 0)
    TextLabel_2.BackgroundTransparency = 1
    TextLabel_2.Font = Enum.Font.GothamBold
    TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
    TextLabel_2.TextSize = 16
    TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd
    TextLabel_2.Parent = Frame
    local TextLabel_3 = Instance.new("TextLabel")
    TextLabel_3.Name = "Clicks"
    TextLabel_3.AnchorPoint = Vector2.new(1, 0)
    TextLabel_3.Size = UDim2.new(0, 64, 1, 0)
    TextLabel_3.Position = UDim2.new(1, -8, 0, 0)
    TextLabel_3.BackgroundTransparency = 1
    TextLabel_3.Font = Enum.Font.GothamBlack
    TextLabel_3.TextColor3 = Color3.fromRGB(82, 232, 128)
    TextLabel_3.TextSize = 16
    TextLabel_3.TextXAlignment = Enum.TextXAlignment.Right
    TextLabel_3.Parent = Frame
    u91[u3] = Frame
    if u92[u3] then
        ImageLabel.Image = u92[u3]
        return Frame
    end
    task.spawn(function() -- Line: 128 -- upvalues: Players (upval), u3 (val), u92 (upval), ImageLabel (val)
        local success, err = pcall(function() -- Line: 129 -- upvalues: Players (upval), u3 (upval)
            return Players:GetUserThumbnailAsync(u3, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)
        if success then
            u92[u3] = err
            if ImageLabel.Parent then
                ImageLabel.Image = err
            end
        end
    end)
    return Frame
end

local function applyPayload(a1) -- Line: 146
    -- upvalues: u89 (ref), u93 (ref), u94 (ref), u91 (val), createLeaderboardRow (val), formatNumber (val)
    -- upvalues: LocalPlayer (val), Count (val), Count_2 (val)
    local v1, v2
    if type(a1) ~= "table" then
        return
    end
    u89 = a1
    u93 = math.max(0, (math.floor((tonumber(a1.globalClicks)) or 0)))
    u94 = 0
    local v3 = {}
    local v4 = ipairs
    for i, v in v4(not (type(a1.leaderboard) ~= "table") and a1.leaderboard or {}) do
        v1 = tonumber(v.userId)
        if v1 then
            v3[v1] = true
            v2 = u91[v1] or createLeaderboardRow(v)
            if v2 then
                v2.Visible = true
                v2.LayoutOrder = i
                v2.Rank.Text = "#" .. i
                v2.Username.Text = tostring(v.username or "Player")
                v2.Clicks.Text = formatNumber(v.clicks)
            end
            if v1 == LocalPlayer.UserId then
                u94 = math.max(0, (math.floor((tonumber(v.clicks)) or 0)))
            end
        end
    end
    for k, i2 in pairs(u91) do
        if not v3[k] then
            i2.Visible = false
        end
    end
    Count.Text = formatNumber(u93)
    Count_2.Text = formatNumber(u94)
end

local function openMinigame(a1) -- Line: 179
    -- upvalues: u87 (ref), u88 (ref), hideOtherGuis (val), ClickMinigameGui (val), u86 (ref), u89 (ref)
    -- upvalues: applyPayload (val)
    if u87 and a1 == u88 then
        hideOtherGuis()
        ClickMinigameGui.Enabled = true
        u86 = true
        u87 = false
        if u89 then
            applyPayload(u89)
        end
        return
    end
end

local function beginMinigame(a1) -- Line: 188
    -- upvalues: u88 (ref), u89 (ref), LocalPlayer (val), applyPayload (val), u86 (ref), hideOtherGuis (val)
    -- upvalues: ClickMinigameGui (val), u87 (ref)
    local v1 = not (type(a1) ~= "table") and a1 or {}
    local u12 = tonumber(v1.eventId)
    if not u12 then
        u12 = u88 + 1
    end
    u88 = u12
    u89 = v1
    LocalPlayer:SetAttribute("ClickMinigamePending", true)
    applyPayload(v1)
    if u86 then
        hideOtherGuis()
        ClickMinigameGui.Enabled = true
        return
    end
    u87 = true
    task.spawn(function() -- Line: 203
        -- upvalues: u87 (upval), u88 (upval), u12 (val), LocalPlayer (upval), hideOtherGuis (upval)
        -- upvalues: ClickMinigameGui (upval), u86 (upval), u89 (upval), applyPayload (upval)
        while u87 do
            if u88 ~= u12 or LocalPlayer:GetAttribute("WheelIsSpinning") ~= true then
                break
            end
            LocalPlayer:GetAttributeChangedSignal("WheelIsSpinning"):Wait()
        end
        if u87 then
            if u12 ~= u88 then
                return
            end
            hideOtherGuis()
            ClickMinigameGui.Enabled = true
            u86 = true
            u87 = false
            if u89 then
                applyPayload(u89)
            end
        end
    end)
end

ClickButton.Activated:Connect(function() -- Line: 225
    -- upvalues: u86 (ref), u93 (ref), u94 (ref), Count (val), formatNumber (val), Count_2 (val), Click (val), u95 (ref)
    -- upvalues: TweenService (val), ButtonScale (val)
    if not u86 then
        return
    end
    u93 = u93 + 1
    u94 = u94 + 1
    Count.Text = formatNumber(u93)
    Count_2.Text = formatNumber(u94)
    Click:FireServer()
    u95 = u95 + 1
    local u19 = u95
    TweenService:Create(ButtonScale, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 0.91}):Play()
    task.delay(0.065, function() -- Line: 241 -- upvalues: u19 (val), u95 (upval), TweenService (upval), ButtonScale (upval)
        if u19 ~= u95 then
            return
        end
        TweenService:Create(ButtonScale, TweenInfo.new(0.11, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
end)
v2.OnClientEvent:Connect(beginMinigame)
Stop.OnClientEvent:Connect(function(a1) -- Line: 213
    -- upvalues: u88 (ref), u87 (ref), u86 (ref), ClickMinigameGui (val), LocalPlayer (val), u90 (val)
    if type(a1) == "table" and a1.eventId and (tonumber(a1.eventId)) ~= u88 then
        return
    end
    u87 = false
    u86 = false
    ClickMinigameGui.Enabled = false
    LocalPlayer:SetAttribute("ClickMinigamePending", false)
    for k, v in pairs(u90) do
        if k and k.Parent then
            k.Enabled = v
        end
    end
    table.clear(u90)
end)
Update.OnClientEvent:Connect(function(a1) -- Line: 253
    -- upvalues: applyPayload (val), u86 (ref), u88 (ref), u87 (ref), ClickMinigameGui (val), LocalPlayer (val)
    -- upvalues: u90 (val)
    applyPayload(a1)
    if type(a1) == "table" and a1.active == false and u86 then
        if type(a1) == "table" and a1.eventId and (tonumber(a1.eventId)) ~= u88 then
            return
        end
        u87 = false
        u86 = false
        ClickMinigameGui.Enabled = false
        LocalPlayer:SetAttribute("ClickMinigamePending", false)
        for k, v in pairs(u90) do
            if k and k.Parent then
                k.Enabled = v
            end
        end
        table.clear(u90)
    end
end)
ClickMinigameGui.Enabled = false
LocalPlayer:SetAttribute("ClickMinigamePending", false)
LocalPlayer:SetAttribute("WheelIsSpinning", LocalPlayer:GetAttribute("WheelIsSpinning") == true)
task.spawn(function() -- Line: 264 -- upvalues: GetState (val), beginMinigame (val), applyPayload (val)
    local success, err = pcall(function() -- Line: 265 -- upvalues: GetState (upval)
        return GetState:InvokeServer()
    end)
    if success and type(err) == "table" then
        if err.active then
            beginMinigame(err)
            return
        end
        applyPayload(err)
    end
end)
task.spawn(function() -- Line: 277 -- upvalues: u86 (ref), hideOtherGuis (val), ClickMinigameGui (val)
    while true do
        task.wait(0.1)
        if u86 then
            hideOtherGuis()
            ClickMinigameGui.Enabled = true
        end
    end
end)