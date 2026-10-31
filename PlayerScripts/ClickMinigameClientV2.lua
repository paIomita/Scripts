-- Path: Players.Drrrrrrrrragonball.PlayerScripts.ClickMinigameClientV2

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.ClickMinigameClientV2
-- Decompile time: 13.98 ms

local syncStaticVisibility
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local ClickMinigameGui = PlayerGui:WaitForChild("ClickMinigameGui")
local Shade = ClickMinigameGui:WaitForChild("Shade")
local Header = Shade:WaitForChild("Header")
local Timer = Header:WaitForChild("Timer")
local CloseButton = Header:WaitForChild("CloseButton")
local ActiveArea = Shade:WaitForChild("ActiveArea")
local ClickButton = ActiveArea:WaitForChild("ClickButton")
local ButtonScale = ClickButton:WaitForChild("ButtonScale")
local Count = (ActiveArea:WaitForChild("GlobalPanel")):WaitForChild("Count")
local Count_2 = (ActiveArea:WaitForChild("PersonalPanel")):WaitForChild("Count")
local Players_2 = (Shade:WaitForChild("Leaderboard")):WaitForChild("Players")
local ResultsPanel = Shade:WaitForChild("ResultsPanel")
local Count_3 = ResultsPanel:WaitForChild("Count")
local Subtitle = ResultsPanel:WaitForChild("Subtitle")
local ClickMinigameRemotes = ReplicatedStorage:WaitForChild("ClickMinigameRemotes")
local v1 = ClickMinigameRemotes:WaitForChild("Start")
local Stop = ClickMinigameRemotes:WaitForChild("Stop")
local Update = ClickMinigameRemotes:WaitForChild("Update")
local Click = ClickMinigameRemotes:WaitForChild("Click")
local GetState = ClickMinigameRemotes:WaitForChild("GetState")
local u123 = false
local u124 = false
local u125 = false
local u126 = 0
local u127 = nil
local u128 = nil
local u129 = 0
local u130 = {}
local u131 = {}
local u132 = {}
local u133 = false
local u134 = {}
local u135 = {}
local u136 = 0
local u137 = 0
local u138 = 0
local u139 = 0
local u140 = 0
local u141 = {
    AFKAdsFrame = true,
    AFKFrame = true,
    AddBalloonsFrame = true,
    AdminFrame = true,
    BagFrame = true,
    BalloonsFrame = true,
    ClaimMethodFrame = true,
    ConfigFrame = true,
    ConfirmationFrame = true,
    ConfirmationFrameMerge = true,
    CreateBalloonFrame = true,
    CreateBattleFrame = true,
    DailyFrame = true,
    ErrorFrame = true,
    GiftingShop = true,
    HistoryFrame = true,
    InsideBattleFrame1v1 = true,
    InsideBattleFrame1v1v1 = true,
    InsideBattleFrame1v1v1v1 = true,
    InsideBattleFrame2v2 = true,
    InsideBattleFrame3v3 = true,
    Offline = true,
    PlaytimeFrame = true,
    RainbowFrame = true,
    RedeemFrame = true,
    ShopFrame = true,
    StatsFrame = true,
    SuccessErrorFrame = true,
    SuccessFrame = true,
    TitlesFrame = true,
    UpgradeFame = true,
    UpgradeFrame = true,
    WhatIsBattles = true,
}

local function clearModalBlur() -- Line: 66 -- upvalues: Lighting (val)
    for i, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") and v.Enabled and 0 < v.Size then
            v.Enabled = false
        end
    end
end

local function captureOpenUiSnapshot() -- Line: 74
    -- upvalues: u133 (ref), u130 (val), u131 (val), u132 (val), PlayerGui (val), ClickMinigameGui (val), u141 (val)
    -- upvalues: Lighting (val)
    local MainFrame, v1, v2, v3
    if u133 then
        return
    end
    u133 = true
    table.clear(u130)
    table.clear(u131)
    table.clear(u132)
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= ClickMinigameGui then
            u130[v] = v.Enabled
            for i2, i3 in ipairs(v:GetDescendants()) do
                if i3:IsA("Frame") and i3.Visible and u141[i3.Name] then
                    u131[i3] = true
                end
            end
            if v.Name == "BattlesGui" then
                MainFrame = v:FindFirstChild("MainFrame")
                if MainFrame and MainFrame:IsA("GuiObject") and MainFrame.Visible then
                    u131[MainFrame] = true
                end
            elseif v.Name == "WheelGui" then
                for i4, j in ipairs({
                    "MainFrame",
                    "RainbowFrame",
                    "CreateBalloonFrame",
                    "RedWheelFrame",
                    "RedWheelFrame2",
                    "RedWheelFrame3",
                    "RedWheelFrame4",
                }) do
                    v1 = v:FindFirstChild(j)
                    if v1 and v1:IsA("GuiObject") and v1.Visible then
                        u131[v1] = true
                    end
                end
            end
        end
    end
    for i5, k in ipairs(Lighting:GetChildren()) do
        if k:IsA("BlurEffect") then
            v2 = u132
            v3 = {enabled = k.Enabled, size = k.Size}
            v2[k] = v3
        end
    end
end

local function closeOpenFramesForTakeover() -- Line: 113
    -- upvalues: PlayerGui (val), ClickMinigameGui (val), u141 (val), clearModalBlur (val)
    local v1, v2
    local ClickMinigameSafeCloseModals = PlayerGui:FindFirstChild("ClickMinigameSafeCloseModals")
    if ClickMinigameSafeCloseModals and ClickMinigameSafeCloseModals:IsA("BindableEvent") then
        ClickMinigameSafeCloseModals:Fire()
    end
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= ClickMinigameGui then
            if v.Name == "BattlesGui" then
                v1 = v:FindFirstChild("MainFrame")
                if v1 and v1:IsA("GuiObject") then
                    v1.Visible = false
                end
            elseif v.Name == "WheelGui" then
                for i2, i3 in ipairs({
                    "MainFrame",
                    "RainbowFrame",
                    "CreateBalloonFrame",
                    "RedWheelFrame",
                    "RedWheelFrame2",
                    "RedWheelFrame3",
                    "RedWheelFrame4",
                }) do
                    v2 = v:FindFirstChild(i3)
                    if v2 and v2:IsA("GuiObject") then
                        v2.Visible = false
                    end
                end
            end
            for i4, j in ipairs(v:GetDescendants()) do
                if j:IsA("Frame") and j.Visible and u141[j.Name] then
                    j.Visible = false
                end
            end
        end
    end
    clearModalBlur()
end

function syncStaticVisibility(a1, a2) -- Line: 146 -- upvalues: syncStaticVisibility (val)
    local v1
    a2.Visible = a1.Visible
    local v2 = {}
    for i, v in ipairs(a1:GetChildren()) do
        if v:IsA("GuiObject") then
            v1 = nil
            for i2, i3 in ipairs(a2:GetChildren()) do
                if not v2[i3] and i3:IsA("GuiObject") and i3.Name == v.Name and i3.ClassName == v.ClassName then
                    v1 = i3
                    v2[i3] = true
                    break
                end
            end
            if v1 then
                syncStaticVisibility(v, v1)
            end
        end
    end
end

local function restoreClickGuiStaticVisibility() -- Line: 165 -- upvalues: syncStaticVisibility (val), Shade (val)
    local ClickMinigameGui = (game:GetService("StarterGui")):FindFirstChild("ClickMinigameGui")
    local Shade_2 = ClickMinigameGui and ClickMinigameGui:FindFirstChild("Shade")
    if Shade_2 and Shade_2:IsA("GuiObject") then
        syncStaticVisibility(Shade_2, Shade)
    end
end

local function safelyPrepareClickTakeover() -- Line: 171
    -- upvalues: captureOpenUiSnapshot (val), closeOpenFramesForTakeover (val), RunService (val), clearModalBlur (val)
    -- upvalues: restoreClickGuiStaticVisibility (val)
    captureOpenUiSnapshot()
    closeOpenFramesForTakeover()
    RunService.Heartbeat:Wait()
    closeOpenFramesForTakeover()
    clearModalBlur()
    restoreClickGuiStaticVisibility()
end

local function formatNumber(a1) -- Line: 180
    local v1, v2
    local v3 = tostring((math.max(0, (math.floor((tonumber(a1)) or 0)))))
    repeat
        v1, v2 = v3:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        v3 = v1
    until v2 == 0
    return v3
end

local function formatTimer(a1) -- Line: 190
    local v1 = math.max(0, (math.ceil((tonumber(a1)) or 0)))
    return string.format("%02d:%02d", math.floor(v1 / 60), v1 % 60)
end

local function hideOtherGuis() -- Line: 195 -- upvalues: PlayerGui (val), ClickMinigameGui (val), u130 (val)
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= ClickMinigameGui then
            if u130[v] == nil then
                u130[v] = v.Enabled
            end
            v.Enabled = false
        end
    end
end

local function restoreOtherGuis() -- Line: 206 -- upvalues: u130 (val)
    for k, v in pairs(u130) do
        if k and k.Parent then
            k.Enabled = v
        end
    end
    table.clear(u130)
end

local function ensureClickGuiVisible() -- Line: 213 -- upvalues: ClickMinigameGui (val), Shade (val), Header (val)
    ClickMinigameGui.Enabled = true
    Shade.Visible = true
    Header.Visible = true
end

local function setActiveView() -- Line: 219
    -- upvalues: ClickMinigameGui (val), Shade (val), Header (val), ActiveArea (val), ResultsPanel (val), u128 (ref)
    ClickMinigameGui.Enabled = true
    Shade.Visible = true
    Header.Visible = true
    ActiveArea.Visible = true
    ResultsPanel.Visible = false
    Header.Title.Text = if not u128 then "SERVER CLICK FRENZY!" else if not u128.globalMode then "SERVER CLICK FRENZY!" else "GLOBAL CLICK FRENZY!"
end

local function setResultsView() -- Line: 226
    -- upvalues: ClickMinigameGui (val), Shade (val), Header (val), ActiveArea (val), ResultsPanel (val), u128 (ref)
    -- upvalues: Timer (val), Count_3 (val), formatNumber (val), u136 (ref)
    ClickMinigameGui.Enabled = true
    Shade.Visible = true
    Header.Visible = true
    ActiveArea.Visible = false
    ResultsPanel.Visible = true
    Header.Title.Text = if not u128 then "SERVER FINAL RESULTS!" else if not u128.globalMode then "SERVER FINAL RESULTS!" else "GLOBAL FINAL RESULTS!"
    Timer.Text = "DONE!"
    Count_3.Text = formatNumber(u136)
end

local function createLeaderboardRow(a1) -- Line: 235 -- upvalues: Players_2 (val), u134 (val), u135 (val), Players (val)
    local u3 = tonumber(a1.userId)
    if not u3 then
        return nil
    end
    local Frame = Instance.new("Frame")
    Frame.Name = "Player_" .. u3
    Frame.Size = UDim2.new(1, -8, 0, 54)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 244, 196)
    Frame.BackgroundTransparency = 0.12
    Frame.BorderSizePixel = 0
    Frame.Parent = Players_2
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 13)
    UICorner.Parent = Frame
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(18, 18, 24)
    UIStroke.Thickness = 3
    UIStroke.Parent = Frame
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 190, 182)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 245, 142)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 241, 255))),
    })
    UIGradient.Rotation = 15
    UIGradient.Parent = Frame
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "Rank"
    TextLabel.Size = UDim2.new(0, 34, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextSize = 16
    TextLabel.Parent = Frame
    local UIStroke_2 = Instance.new("UIStroke")
    UIStroke_2.Color = Color3.fromRGB(18, 18, 24)
    UIStroke_2.Thickness = 3
    UIStroke_2.Parent = TextLabel
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "Avatar"
    ImageLabel.Size = UDim2.fromOffset(40, 40)
    ImageLabel.Position = UDim2.new(0, 34, 0.5, -20)
    ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Parent = Frame
    local v1 = Instance.new("UICorner")
    v1.CornerRadius = UDim.new(1, 0)
    v1.Parent = ImageLabel
    v1 = Instance.new("UIStroke")
    v1.Color = Color3.fromRGB(18, 18, 24)
    v1.Thickness = 2
    v1.Parent = ImageLabel
    v1 = Instance.new("TextLabel")
    v1.Name = "Username"
    v1.Size = UDim2.new(1, -154, 1, 0)
    v1.Position = UDim2.new(0, 82, 0, 0)
    v1.BackgroundTransparency = 1
    v1.Font = Enum.Font.FredokaOne
    v1.TextColor3 = Color3.new(1, 1, 1)
    v1.TextSize = 14
    v1.TextXAlignment = Enum.TextXAlignment.Left
    v1.TextTruncate = Enum.TextTruncate.AtEnd
    v1.Parent = Frame
    local UIStroke_3 = Instance.new("UIStroke")
    UIStroke_3.Color = Color3.fromRGB(18, 18, 24)
    UIStroke_3.Thickness = 3
    UIStroke_3.Parent = v1
    local TextLabel_2 = Instance.new("TextLabel")
    TextLabel_2.Name = "Clicks"
    TextLabel_2.AnchorPoint = Vector2.new(1, 0)
    TextLabel_2.Size = UDim2.new(0, 70, 1, 0)
    TextLabel_2.Position = UDim2.new(1, -9, 0, 0)
    TextLabel_2.BackgroundTransparency = 1
    TextLabel_2.Font = Enum.Font.FredokaOne
    TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
    TextLabel_2.TextSize = 16
    TextLabel_2.TextXAlignment = Enum.TextXAlignment.Right
    TextLabel_2.Parent = Frame
    v1 = Instance.new("UIStroke")
    v1.Color = Color3.fromRGB(18, 18, 24)
    v1.Thickness = 3
    v1.Parent = TextLabel_2
    u134[u3] = Frame
    if u135[u3] then
        ImageLabel.Image = u135[u3]
        return Frame
    end
    task.spawn(function() -- Line: 283 -- upvalues: Players (upval), u3 (val), u135 (upval), ImageLabel (val)
        local success, err = pcall(function() -- Line: 284 -- upvalues: Players (upval), u3 (upval)
            return Players:GetUserThumbnailAsync(u3, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)
        if success then
            u135[u3] = err
            if ImageLabel.Parent then
                ImageLabel.Image = err
            end
        end
    end)
    return Frame
end

local function applyPayload(a1, a2) -- Line: 296
    -- upvalues: u128 (ref), LocalPlayer (val), u123 (ref), u138 (ref), u139 (ref), u137 (ref), u136 (ref), u134 (val)
    -- upvalues: createLeaderboardRow (val), formatNumber (val), Count (val), Count_2 (val), Count_3 (val)
    local v1
    if type(a1) ~= "table" then
        return
    end
    u128 = a1
    local v2 = math.max(0, (math.floor((tonumber(a1.globalClicks)) or 0)))
    local v3 = 0
    local leaderboard_2 = not (type(a1.leaderboard) ~= "table") and a1.leaderboard or {}
    for i, v in ipairs(leaderboard_2) do
        if (tonumber(v.userId)) == LocalPlayer.UserId then
            v3 = math.max(0, (math.floor((tonumber(v.clicks)) or 0)))
            break
        end
    end
    if not u123 or a2 then
        u138 = v3
        u139 = 0
        u137 = v3
        u136 = v2
    else
        local v4 = math.max(0, v3 - u138)
        u139 = math.max(0, u139 - v4)
        u138 = math.max(u138, v3)
        u137 = u138 + u139
        u136 = math.max(u136, v2)
    end
    v3 = {}
    for i2, i3 in ipairs(leaderboard_2) do
        if i2 > 10 then
            break
        end
        v2 = tonumber(i3.userId)
        if v2 then
            v3[v2] = true
            v1 = u134[v2] or createLeaderboardRow(i3)
            if v1 then
                v1.Visible = true
                v1.LayoutOrder = i2
                v1.Rank.Text = "#" .. i2
                v1.Username.Text = tostring(i3.username or "Player")
                v1.Clicks.Text = formatNumber(i3.clicks)
            end
        end
    end
    for k, j in pairs(u134) do
        if not v3[k] then
            j.Visible = false
        end
    end
    Count.Text = formatNumber(u136)
    Count_2.Text = formatNumber(u137)
    Count_3.Text = formatNumber(u136)
end

local function fullyClose(a1) -- Line: 339
    -- upvalues: u126 (ref), u125 (ref), u123 (ref), u124 (ref), LocalPlayer (val), ClickMinigameGui (val), u130 (val)
    -- upvalues: u131 (val), u132 (val), u133 (ref)
    if a1 and a1 ~= u126 then
        return
    end
    u125 = false
    u123 = false
    u124 = false
    LocalPlayer:SetAttribute("ClickMinigameUiActive", false)
    ClickMinigameGui.Enabled = false
    LocalPlayer:SetAttribute("ClickMinigamePending", false)
    for k, v in pairs(u130) do
        if k and k.Parent then
            k.Enabled = v
        end
    end
    table.clear(u130)
    for k2 in pairs(u131) do
        if k2 and k2.Parent then
            k2.Visible = true
        end
    end
    for k3, i in pairs(u132) do
        if k3 and k3.Parent then
            k3.Enabled = i.enabled
            k3.Size = i.size
        end
    end
    table.clear(u131)
    table.clear(u132)
    u133 = false
end

CloseButton.Activated:Connect(function() -- Line: 359 -- upvalues: u127 (ref), u126 (ref), fullyClose (val)
    u127 = u126
    fullyClose(u126)
end)

local function openClickPhase(a1) -- Line: 364
    -- upvalues: u127 (ref), u125 (ref), u126 (ref), captureOpenUiSnapshot (val), closeOpenFramesForTakeover (val)
    -- upvalues: RunService (val), clearModalBlur (val), restoreClickGuiStaticVisibility (val), u123 (ref), u124 (ref)
    -- upvalues: LocalPlayer (val), ClickMinigameGui (val), Shade (val), Header (val), ActiveArea (val)
    -- upvalues: ResultsPanel (val), u128 (ref), applyPayload (val)
    if u127 ~= a1 and u125 and a1 == u126 then
        captureOpenUiSnapshot()
        closeOpenFramesForTakeover()
        RunService.Heartbeat:Wait()
        closeOpenFramesForTakeover()
        clearModalBlur()
        restoreClickGuiStaticVisibility()
        u123 = true
        u124 = false
        u125 = false
        LocalPlayer:SetAttribute("ClickMinigameUiActive", true)
        ClickMinigameGui.Enabled = true
        ClickMinigameGui.Enabled = true
        Shade.Visible = true
        Header.Visible = true
        ActiveArea.Visible = true
        ResultsPanel.Visible = false
        Header.Title.Text = if not u128 then "SERVER CLICK FRENZY!" else if not u128.globalMode then "SERVER CLICK FRENZY!" else "GLOBAL CLICK FRENZY!"
        if u128 then
            applyPayload(u128)
        end
        return
    end
end

local function beginMinigame(a1) -- Line: 374
    -- upvalues: u126 (ref), u127 (ref), u133 (ref), u130 (val), u131 (val), u132 (val), u138 (ref), u139 (ref)
    -- upvalues: u137 (ref), u136 (ref), u128 (ref), u124 (ref), LocalPlayer (val), applyPayload (val)
    -- upvalues: ClickMinigameGui (val), Shade (val), Header (val), ActiveArea (val), ResultsPanel (val), u123 (ref)
    -- upvalues: u125 (ref), captureOpenUiSnapshot (val), closeOpenFramesForTakeover (val), RunService (val)
    -- upvalues: clearModalBlur (val), restoreClickGuiStaticVisibility (val)
    local v1 = not (type(a1) ~= "table") and a1 or {}
    local u12 = tonumber(v1.eventId)
    if not u12 then
        u12 = u126 + 1
    end
    if u12 ~= u126 then
        u127 = nil
        u133 = false
        table.clear(u130)
        table.clear(u131)
        table.clear(u132)
        u138 = 0
        u139 = 0
        u137 = 0
        u136 = 0
    end
    u126 = u12
    u128 = v1
    u124 = false
    if u127 == u12 then
        return
    end
    LocalPlayer:SetAttribute("ClickMinigamePending", true)
    applyPayload(v1)
    ClickMinigameGui.Enabled = true
    Shade.Visible = true
    Header.Visible = true
    ActiveArea.Visible = true
    ResultsPanel.Visible = false
    Header.Title.Text = if not u128 then "SERVER CLICK FRENZY!" else if not u128.globalMode then "SERVER CLICK FRENZY!" else "GLOBAL CLICK FRENZY!"
    if not u123 then
        u125 = true
        task.spawn(function() -- Line: 399
            -- upvalues: u125 (upval), u126 (upval), u12 (val), LocalPlayer (upval), u127 (upval)
            -- upvalues: captureOpenUiSnapshot (upval), closeOpenFramesForTakeover (upval), RunService (upval)
            -- upvalues: clearModalBlur (upval), restoreClickGuiStaticVisibility (upval), u123 (upval), u124 (upval)
            -- upvalues: ClickMinigameGui (upval), Shade (upval), Header (upval), ActiveArea (upval)
            -- upvalues: ResultsPanel (upval), u128 (upval), applyPayload (upval)
            while u125 do
                if u126 ~= u12 or LocalPlayer:GetAttribute("WheelIsSpinning") ~= true then
                    break
                end
                LocalPlayer:GetAttributeChangedSignal("WheelIsSpinning"):Wait()
            end
            local v1 = u12
            if u127 ~= v1 and u125 then
                if v1 ~= u126 then
                    return
                end
                captureOpenUiSnapshot()
                closeOpenFramesForTakeover()
                RunService.Heartbeat:Wait()
                closeOpenFramesForTakeover()
                clearModalBlur()
                restoreClickGuiStaticVisibility()
                u123 = true
                u124 = false
                u125 = false
                LocalPlayer:SetAttribute("ClickMinigameUiActive", true)
                ClickMinigameGui.Enabled = true
                ClickMinigameGui.Enabled = true
                Shade.Visible = true
                Header.Visible = true
                ActiveArea.Visible = true
                ResultsPanel.Visible = false
                Header.Title.Text = if not u128 then "SERVER CLICK FRENZY!" else if not u128.globalMode then "SERVER CLICK FRENZY!" else "GLOBAL CLICK FRENZY!"
                if u128 then
                    applyPayload(u128)
                end
            end
        end)
        return
    end
    ClickMinigameGui.Enabled = true
    ClickMinigameGui.Enabled = true
    Shade.Visible = true
    Header.Visible = true
    ActiveArea.Visible = true
    ResultsPanel.Visible = false
    Header.Title.Text = if not u128 then "SERVER CLICK FRENZY!" else if not u128.globalMode then "SERVER CLICK FRENZY!" else "GLOBAL CLICK FRENZY!"
end

local function revealResults(a1, a2) -- Line: 407
    -- upvalues: u126 (ref), applyPayload (val), captureOpenUiSnapshot (val), closeOpenFramesForTakeover (val)
    -- upvalues: RunService (val), clearModalBlur (val), restoreClickGuiStaticVisibility (val), u125 (ref), u123 (ref)
    -- upvalues: u124 (ref), LocalPlayer (val), ClickMinigameGui (val), Shade (val), Header (val), ActiveArea (val)
    -- upvalues: ResultsPanel (val), u128 (ref), Timer (val), Count_3 (val), formatNumber (val), u136 (ref), u129 (ref)
    -- upvalues: fullyClose (val)
    if a2 ~= u126 then
        return
    end
    applyPayload(a1, true)
    captureOpenUiSnapshot()
    closeOpenFramesForTakeover()
    RunService.Heartbeat:Wait()
    closeOpenFramesForTakeover()
    clearModalBlur()
    restoreClickGuiStaticVisibility()
    u125 = false
    u123 = false
    u124 = true
    LocalPlayer:SetAttribute("ClickMinigameUiActive", true)
    ClickMinigameGui.Enabled = true
    LocalPlayer:SetAttribute("ClickMinigamePending", true)
    ClickMinigameGui.Enabled = true
    Shade.Visible = true
    Header.Visible = true
    ActiveArea.Visible = false
    ResultsPanel.Visible = true
    Header.Title.Text = if not u128 then "SERVER FINAL RESULTS!" else if not u128.globalMode then "SERVER FINAL RESULTS!" else "GLOBAL FINAL RESULTS!"
    Timer.Text = "DONE!"
    Count_3.Text = formatNumber(u136)
    local v1 = math.clamp(tonumber(a1.showResultsSeconds) or 5, 2, 15)
    u129 = os.clock() + v1
    task.delay(v1, function() -- Line: 418 -- upvalues: u124 (upval), u126 (upval), a2 (val), fullyClose (upval)
        if u124 and u126 == a2 then
            fullyClose(a2)
        end
    end)
end

ClickButton.Activated:Connect(function() -- Line: 436
    -- upvalues: u123 (ref), u139 (ref), u136 (ref), u137 (ref), u138 (ref), Count (val), formatNumber (val)
    -- upvalues: Count_2 (val), Click (val), u140 (ref), TweenService (val), ButtonScale (val)
    if not u123 then
        return
    end
    u139 = u139 + 1
    u136 = u136 + 1
    u137 = u138 + u139
    Count.Text = formatNumber(u136)
    Count_2.Text = formatNumber(u137)
    Click:FireServer()
    u140 = u140 + 1
    local u22 = u140
    TweenService:Create(ButtonScale, TweenInfo.new(0.055, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 0.88}):Play()
    task.delay(0.06, function() -- Line: 445 -- upvalues: u22 (val), u140 (upval), TweenService (upval), ButtonScale (upval)
        if u22 ~= u140 then
            return
        end
        TweenService:Create(ButtonScale, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
end)
v1.OnClientEvent:Connect(beginMinigame)
Stop.OnClientEvent:Connect(function(a1) -- Line: 423 -- upvalues: u126 (ref), u127 (ref), u125 (ref), LocalPlayer (val), revealResults (val)
    local u7 = not (type(a1) ~= "table") and a1 or {}
    local u11 = tonumber(u7.eventId)
    if not u11 then
        u11 = u126
    end
    if u11 == u126 and u127 ~= u11 then
        u125 = false
        task.spawn(function() -- Line: 428 -- upvalues: u126 (upval), u11 (val), LocalPlayer (upval), revealResults (upval), u7 (ref)
            while u126 == u11 do
                if LocalPlayer:GetAttribute("WheelIsSpinning") ~= true then
                    break
                end
                LocalPlayer:GetAttributeChangedSignal("WheelIsSpinning"):Wait()
            end
            revealResults(u7, u11)
        end)
        return
    end
end)
Update.OnClientEvent:Connect(applyPayload)
ClickMinigameGui.Enabled = false
ActiveArea.Visible = true
ResultsPanel.Visible = false
LocalPlayer:SetAttribute("ClickMinigameUiActive", false)
LocalPlayer:SetAttribute("ClickMinigamePending", false)
;(ClickMinigameGui:GetPropertyChangedSignal("Enabled")):Connect(function() -- Line: 458 -- upvalues: ClickMinigameGui (val), LocalPlayer (val)
    if ClickMinigameGui.Enabled and LocalPlayer:GetAttribute("ClickMinigameUiActive") ~= true then
        ClickMinigameGui.Enabled = false
    end
end)
LocalPlayer:SetAttribute("WheelIsSpinning", LocalPlayer:GetAttribute("WheelIsSpinning") == true)
task.spawn(function() -- Line: 465 -- upvalues: GetState (val), beginMinigame (val), applyPayload (val)
    local success, err = pcall(function() -- Line: 466 -- upvalues: GetState (upval)
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
task.spawn(function() -- Line: 472
    -- upvalues: u123 (ref), u124 (ref), ClickMinigameGui (val), Shade (val), Header (val), u128 (ref), Timer (val)
    -- upvalues: Subtitle (val), u129 (ref)
    local v1
    while true do
        task.wait(0.1)
        if u123 or u124 then
            ClickMinigameGui.Enabled = true
            Shade.Visible = true
            Header.Visible = true
        end
        if not u123 then
            if u124 then
                Subtitle.Text = "Final leaderboard closes in " .. (math.max(0, (math.ceil(u129 - (os.clock()))))) .. " seconds"
            end
        elseif u128 then
            v1 = math.max(0, (math.ceil((tonumber((math.max(0, (tonumber(u128.endsAt) or os.time()) - (os.time()))))) or 0)))
            Timer.Text = string.format("%02d:%02d", math.floor(v1 / 60), v1 % 60)
        elseif u124 then
            Subtitle.Text = "Final leaderboard closes in " .. (math.max(0, (math.ceil(u129 - (os.clock()))))) .. " seconds"
        end
    end
end)
RunService:BindToRenderStep("ClickMinigameHideOtherUI", Enum.RenderPriority.Last.Value + 200, function() -- Line: 484
    -- upvalues: u123 (ref), u124 (ref), clearModalBlur (val), ClickMinigameGui (val), Shade (val), Header (val)
    if u123 or u124 then
        clearModalBlur()
        ClickMinigameGui.Enabled = true
        Shade.Visible = true
        Header.Visible = true
    end
end)