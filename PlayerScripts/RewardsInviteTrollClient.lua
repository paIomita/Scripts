-- Path: Players.Drrrrrrrrragonball.PlayerScripts.RewardsInviteTrollClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.RewardsInviteTrollClient
-- Decompile time: 16.83 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SocialService = game:GetService("SocialService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local CurrentCamera = Workspace.CurrentCamera
LocalPlayer:SetAttribute("LocalSpectateTargetUserId", nil)
local RewardEvent = ReplicatedStorage:WaitForChild("RewardEvent")
local InitiateTrollPurchase = ReplicatedStorage:WaitForChild("InitiateTrollPurchase")
local TriggerTrollFX = ReplicatedStorage:WaitForChild("TriggerTrollFX")
local Button = (ReplicatedStorage:WaitForChild("Buttons")):WaitForChild("Button")
local u76 = {
    "FirstFrame",
    "SecondFrame",
    "ThirdFrame",
    "FourthFrame",
    "FifthFrame",
    "SixthFrame",
    "SeventhFrame",
    "EighthFrame",
}
local u89 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u94 = TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local u95 = {
    {Name = "Bring to Spawn", Price = 9, ProductId = 3603131056},
    {Name = "Slow", Price = 5, ProductId = 3603131040},
    {Name = "Annoy", Price = 3, ProductId = 3603131026},
}
local u99 = nil
local u100 = nil
local u101 = {}
local u102 = {}
local u103 = nil
local u104 = nil
local u105 = {}
local u106 = {}
local u107 = false
local u108 = false
local u109 = {}
local u110 = 1
local u111 = nil
local u112 = nil
local u113 = nil
local u114 = nil
local u115 = nil
local u116 = nil
local u117 = nil
local u118 = nil
local u119 = nil

local function connectButton(a1, a2) -- Line: 58
    if not a1 then
        return
    end
    local u2 = 0
    a1.Activated:Connect(function(...) -- Line: 61 -- upvalues: u2 (ref), a2 (val)
        local v1 = os.clock()
        if v1 - u2 < 0.1 then
            return
        end
        u2 = v1
        a2(...)
    end)
end

local function setButtonText(a1, a2) -- Line: 70
    local TextLabel = a1:FindFirstChild("TextLabel")
    if TextLabel and TextLabel:IsA("TextLabel") then
        TextLabel.Text = a2
        return
    end
    if a1:IsA("TextButton") then
        a1.Text = a2
    end
end

local function makeTemplateButton(a1, a2, a3, a4) -- Line: 79 -- upvalues: Button (val)
    local v1 = Button:Clone()
    v1.Name = a1
    v1.Size = a4
    v1.Visible = true
    v1.ZIndex = 50
    local TextLabel = v1:FindFirstChild("TextLabel")
    if not TextLabel then
        if v1:IsA("TextButton") then
            v1.Text = a2
        end
    elseif TextLabel:IsA("TextLabel") then
        TextLabel.Text = a2
    elseif v1:IsA("TextButton") then
        v1.Text = a2
    end
    for i, v in ipairs(v1:GetDescendants()) do
        if v:IsA("GuiObject") then
            v.ZIndex = v1.ZIndex + 1
        end
    end
    v1.Parent = a3
    return v1
end

local function addSizeConstraint(a1, a2, a3) -- Line: 95
    local UISizeConstraint = Instance.new("UISizeConstraint")
    UISizeConstraint.MinSize = a2
    UISizeConstraint.MaxSize = a3
    UISizeConstraint.Parent = a1
end

local function addResponsiveScale(a1, a2, a3) -- Line: 102 -- upvalues: Workspace (val)
    local UIScale = Instance.new("UIScale")
    UIScale.Name = "ResponsiveScale"
    UIScale.Parent = a1

    local function updateScale() -- Line: 106 -- upvalues: Workspace (upval), UIScale (val), a2 (val), a3 (val)
        local CurrentCamera = Workspace.CurrentCamera
        local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
        UIScale.Scale = math.clamp(math.min(ViewportSize.X / 1280, ViewportSize.Y / 720), a2 or 0.82, a3 or 1.18)
    end

    local CurrentCamera = Workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    UIScale.Scale = math.clamp(math.min(ViewportSize.X / 1280, ViewportSize.Y / 720), a2 or 0.82, a3 or 1.18)
    if Workspace.CurrentCamera then
        (Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateScale)
    end
    ;(Workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(updateScale)
    return UIScale
end

local function applyRedGradient(a1) -- Line: 120
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("UIGradient") then
            v:Destroy()
        end
    end
    local UIGradient = a1:FindFirstChildOfClass("UIGradient")
    if UIGradient then
        UIGradient:Destroy()
    end
    local UIGradient_2 = Instance.new("UIGradient")
    UIGradient_2.Name = "LeaveRedGradient"
    UIGradient_2.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 95, 95)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 0, 0))),
    })
    UIGradient_2.Rotation = 90
    UIGradient_2.Parent = a1
end

local function formatTime(a1) -- Line: 138
    local v1 = math.max(0, (math.floor((tonumber(a1)) or 0)))
    return string.format("%02i:%02i:%02i", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), v1 % 60)
end

local function setBlur(a1) -- Line: 146 -- upvalues: Lighting (val), TweenService (val)
    local RewardsModalBlur = Lighting:FindFirstChild("RewardsModalBlur")
    if a1 then
        if not RewardsModalBlur then
            RewardsModalBlur = Instance.new("BlurEffect")
            RewardsModalBlur.Name = "RewardsModalBlur"
            RewardsModalBlur.Size = 0
            RewardsModalBlur.Parent = Lighting
        end
        TweenService:Create(RewardsModalBlur, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
        return
    end
    if not RewardsModalBlur then
        return
    end
    local v1 = TweenService
    local v2 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    v1 = v1:Create(RewardsModalBlur, v2, {Size = 0})
    v1:Play()
    v1.Completed:Connect(function() -- Line: 160 -- upvalues: RewardsModalBlur (ref)
        if RewardsModalBlur and RewardsModalBlur.Parent and RewardsModalBlur.Size <= 0.01 then
            RewardsModalBlur:Destroy()
        end
    end)
end

local function getScale(a1) -- Line: 168
    local RewardsModalScale = a1:FindFirstChild("RewardsModalScale")
    if not RewardsModalScale then
        RewardsModalScale = Instance.new("UIScale")
        RewardsModalScale.Name = "RewardsModalScale"
        RewardsModalScale.Parent = a1
    end
    return RewardsModalScale
end

local function hideOtherUi(a1, a2) -- Line: 178
    -- upvalues: u105 (ref), u106 (ref), PlayerGui (val), Lighting (val), TweenService (val)
    local Enabled
    u105 = {}
    u106 = {}
    local v1, v2 = a1, a2
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") then
            u105[v] = v.Enabled
            Enabled = v.Enabled or v == v1
            if Enabled then
                v.Enabled = true
                for i2, i3 in ipairs(v:GetDescendants()) do
                    if i3:IsA("GuiObject")
                        and i3 ~= v2
                        and not i3:IsDescendantOf(v2)
                        and not v2:IsDescendantOf(i3) then
                        u106[i3] = i3.Visible
                        i3.Visible = false
                    end
                end
            end
        end
    end
    v1.Enabled = true
    local RewardsModalBlur = Lighting:FindFirstChild("RewardsModalBlur")
    if not RewardsModalBlur then
        RewardsModalBlur = Instance.new("BlurEffect")
        RewardsModalBlur.Name = "RewardsModalBlur"
        RewardsModalBlur.Size = 0
        RewardsModalBlur.Parent = Lighting
    end
    TweenService:Create(RewardsModalBlur, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
end

local u130 = {
    ClickMinigameGui = "ClickMinigameUiActive",
    BalloonEventGui = "BalloonHuntOverlayActive",
    ObbyEventGui = "ObbyEventOverlayActive",
}

local function restoreOtherUi() -- Line: 206
    -- upvalues: u106 (ref), u105 (ref), u130 (val), LocalPlayer (val), setBlur (val)
    local v1, v2
    for k, v in pairs(u106) do
        if k and k.Parent then
            k.Visible = v
        end
    end
    for k2, i in pairs(u105) do
        if k2 and k2.Parent then
            v1 = u130[k2.Name]
            if not v1 then
                k2.Enabled = i
            else
                v2 = LocalPlayer:GetAttribute(v1) == true
                k2.Enabled = v2
            end
        end
    end
    u105 = {}
    u106 = {}
    setBlur(false)
end

local function openModal(a1, a2) -- Line: 227 -- upvalues: u107 (ref), hideOtherUi (val), TweenService (val), u89 (val)
    if not u107 and not a2.Visible then
        u107 = true
        hideOtherUi(a1, a2)
        local RewardsModalScale = a2:FindFirstChild("RewardsModalScale")
        if not RewardsModalScale then
            RewardsModalScale = Instance.new("UIScale")
            RewardsModalScale.Name = "RewardsModalScale"
            RewardsModalScale.Parent = a2
        end
        RewardsModalScale.Scale = 0
        a2.Visible = true
        local v1 = TweenService:Create(RewardsModalScale, u89, {Scale = 1})
        v1:Play()
        v1.Completed:Connect(function() -- Line: 236 -- upvalues: u107 (upval)
            u107 = false
        end)
        return
    end
end

local function closeModal(a1) -- Line: 241 -- upvalues: u107 (ref), restoreOtherUi (val), TweenService (val), u94 (val)
    if u107 then
        return
    end
    if not a1.Visible then
        restoreOtherUi()
        return
    end
    u107 = true
    local RewardsModalScale = a1:FindFirstChild("RewardsModalScale")
    if not RewardsModalScale then
        RewardsModalScale = Instance.new("UIScale")
        RewardsModalScale.Name = "RewardsModalScale"
        RewardsModalScale.Parent = a1
    end
    local v1 = TweenService:Create(RewardsModalScale, u94, {Scale = 0})
    v1:Play()
    v1.Completed:Connect(function() -- Line: 251 -- upvalues: a1 (val), RewardsModalScale (val), restoreOtherUi (upval), u107 (upval)
        a1.Visible = false
        RewardsModalScale.Scale = 1
        restoreOtherUi()
        u107 = false
    end)
end

local ClickMinigameSafeCloseModals = PlayerGui:FindFirstChild("ClickMinigameSafeCloseModals")
if not ClickMinigameSafeCloseModals then
    ClickMinigameSafeCloseModals = Instance.new("BindableEvent")
    ClickMinigameSafeCloseModals.Name = "ClickMinigameSafeCloseModals"
    ClickMinigameSafeCloseModals.Parent = PlayerGui
end
ClickMinigameSafeCloseModals.Event:Connect(function() -- Line: 267 -- upvalues: u107 (ref), restoreOtherUi (val), PlayerGui (val), setBlur (val)
    u107 = false
    restoreOtherUi()
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") then
            for i2, i3 in ipairs(v:GetDescendants()) do
                if i3:IsA("GuiObject") then
                    if i3.Name == "PlaytimeFrame"
                        or i3.Name == "TrollFrame"
                        or i3.Name == "InviteFrame"
                        or i3.Name == "RewardsFrame" then
                        i3.Visible = false
                    end
                end
            end
        end
    end
    setBlur(false)
end)

local function getRewardsButton() -- Line: 287 -- upvalues: PlayerGui (val)
    return PlayerGui:FindFirstChild("RewardsButton", true)
end

local function createNotificationBadge() -- Line: 291 -- upvalues: PlayerGui (val), u103 (ref)
    local RewardsButton = PlayerGui:FindFirstChild("RewardsButton", true)
    if not RewardsButton then
        return
    end
    local NotificationDot = RewardsButton:FindFirstChild("NotificationDot")
    if NotificationDot then
        NotificationDot:Destroy()
    end
    local Thumbnail = RewardsButton:FindFirstChild("Thumbnail")
    u103 = Thumbnail and Thumbnail:FindFirstChild("NotificationOne") or RewardsButton:FindFirstChild("NotificationOne", true)
    if u103 then
        u103.Visible = false
        u103.Rotation = 0
    end
end

local function setNotificationCount(a1) -- Line: 305 -- upvalues: u103 (ref), u104 (ref), TweenService (val)
    if not u103 then
        return
    end
    local v1 = a1 > 0
    u103.Visible = v1
    if not v1 then
        if u104 then
            u104:Cancel()
            u103.Rotation = 0
        end
        return
    end
    if not u104 then
        u104 = TweenService:Create(u103, TweenInfo.new(0.85, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Rotation = 7})
    end
    if u104.PlaybackState == Enum.PlaybackState.Playing then
        return
    end
    u103.Rotation = -7
    u104:Play()
end

local function updatePlaytimeDisplay() -- Line: 323
    -- upvalues: u99 (ref), u101 (val), u102 (val), setNotificationCount (val)
    local TimeLabel, v1, v2, v3
    if not u99 then
        return
    end
    local v4 = 0
    for i, v in ipairs(u101) do
        v1 = u99[i]
        if v.ClaimButton and v.TimeLabel and v1 then
            if v1 == -1 then
                v.TimeLabel.Visible = true
                v.TimeLabel.Text = "CLAIMED"
                v.TimeLabel.TextColor3 = Color3.fromRGB(120, 255, 120)
                v.ClaimButton.Visible = false
            elseif not (v1 <= 0) then
                v.ClaimButton.Visible = false
                v.TimeLabel.Visible = true
                TimeLabel = v.TimeLabel
                v3 = math.max(0, (math.floor((tonumber(v1)) or 0)))
                TimeLabel.Text = string.format("%02i:%02i:%02i", math.floor(v3 / 3600), math.floor(v3 % 3600 / 60), v3 % 60)
                v.TimeLabel.TextColor3 = Color3.new(1, 1, 1)
            else
                v4 = v4 + 1
                v2 = u102[i] == true
                v.TimeLabel.Visible = false
                v.ClaimButton.Visible = true
                v.ClaimButton.Interactable = not v2
                v3 = if not v2 then "CLAIM" else "..."
                v.ClaimButton.Text = v3
            end
        end
    end
    setNotificationCount(v4)
end

local function setupPlaytimeGui() -- Line: 352
    -- upvalues: PlayerGui (val), createNotificationBadge (val), u76 (val), u101 (val), u102 (val), RewardEvent (val)
    -- upvalues: updatePlaytimeDisplay (val), closeModal (val), openModal (val)
    local TimeLabel, v1
    local PlaytimeGui = PlayerGui:WaitForChild("PlaytimeGui")
    local PlaytimeFrame = PlaytimeGui:WaitForChild("PlaytimeFrame")
    local Frame = PlaytimeFrame:WaitForChild("Frame")
    local Close = PlaytimeFrame:FindFirstChild("Close")
    PlaytimeFrame.Visible = false
    createNotificationBadge()
    for i, v in ipairs(u76) do
        v1 = Frame:WaitForChild(v)
        local TextButton = v1:WaitForChild("TextButton")
        TimeLabel = v1:WaitForChild("TimeLabel")
        TextButton.Visible = false
        TimeLabel.Visible = true
        TimeLabel.Text = "..."
        u101[i] = {ClaimButton = TextButton, TimeLabel = TimeLabel}
        u102[i] = false

        local function u79() -- Line: 369
            -- upvalues: u102 (upval), i (val), TextButton (val), RewardEvent (upval), updatePlaytimeDisplay (upval)
            if u102[i] then
                return
            end
            u102[i] = true
            TextButton.Interactable = false
            TextButton.Text = "..."
            RewardEvent:FireServer("Claim", i)
            task.delay(5, function() -- Line: 377 -- upvalues: u102 (upval), i (upval), RewardEvent (upval), updatePlaytimeDisplay (upval)
                if u102[i] then
                    u102[i] = false
                    RewardEvent:FireServer("RequestInitialState")
                    updatePlaytimeDisplay()
                end
            end)
        end

        if TextButton then
            local u80 = 0
            TextButton.Activated:Connect(function(...) -- Line: 61 -- upvalues: u80 (ref), u79 (val)
                local v1 = os.clock()
                if v1 - u80 < 0.1 then
                    return
                end
                u80 = v1
                u79(...)
            end)
        end
    end
    local RewardsButton = PlayerGui:FindFirstChild("RewardsButton", true)

    local function u38() -- Line: 387
        -- upvalues: PlaytimeFrame (val), closeModal (upval), RewardEvent (upval), openModal (upval), PlaytimeGui (val)
        if PlaytimeFrame.Visible then
            closeModal(PlaytimeFrame)
            return
        end
        RewardEvent:FireServer("RequestInitialState")
        openModal(PlaytimeGui, PlaytimeFrame)
    end

    if RewardsButton then
        local u41 = 0
        RewardsButton.Activated:Connect(function(...) -- Line: 61 -- upvalues: u41 (ref), u38 (val)
            local v1 = os.clock()
            if v1 - u41 < 0.1 then
                return
            end
            u41 = v1
            u38(...)
        end)
    end

    local function u48() -- Line: 395 -- upvalues: closeModal (upval), PlaytimeFrame (val)
        closeModal(PlaytimeFrame)
    end

    if not Close then
        return
    end
    local u52 = 0
    Close.Activated:Connect(function(...) -- Line: 61 -- upvalues: u52 (ref), u48 (val)
        local v1 = os.clock()
        if v1 - u52 < 0.1 then
            return
        end
        u52 = v1
        u48(...)
    end)
end

local function startCountdown() -- Line: 400
    -- upvalues: u100 (ref), RunService (val), u99 (ref), updatePlaytimeDisplay (val)
    if u100 then
        return
    end
    local u1 = 0
    RunService.Heartbeat:Connect(function(a1) -- Line: 403 -- upvalues: u99 (upval), u1 (ref), updatePlaytimeDisplay (upval)
        local v1, v2
        if not u99 then
            return
        end
        u1 = u1 + a1
        if u1 < 0.25 then
            return
        end
        local v3 = u1
        u1 = 0
        for i, v in ipairs(u99) do
            if v > 0 then
                v2 = u99
                v1 = v - v3
                v2[i] = (math.max(0, v1))
            end
        end
        updatePlaytimeDisplay()
    end)
end

local function promptInvite() -- Line: 420 -- upvalues: SocialService (val), LocalPlayer (val)
    pcall(function() -- Line: 421 -- upvalues: SocialService (upval), LocalPlayer (upval)
        SocialService:PromptGameInvite(LocalPlayer)
    end)
end

local function showNotification(a1) -- Line: 426 -- upvalues: ReplicatedStorage (val)
    local v1 = {colorMode = "red", text = a1}
    if _G.ShowFeedbackMessage then
        _G.ShowFeedbackMessage(v1)
        return
    end
    local ShowFeedbackMessage = ReplicatedStorage:FindFirstChild("ShowFeedbackMessage")
    if ShowFeedbackMessage and ShowFeedbackMessage:IsA("BindableEvent") then
        ShowFeedbackMessage:Fire(v1)
    end
end

local function showAnnoyEffect() -- Line: 439 -- upvalues: PlayerGui (val), TweenService (val), Debris (val)
    local v1
    local AnnoyEffectGUI = PlayerGui:FindFirstChild("AnnoyEffectGUI")
    if AnnoyEffectGUI then
        AnnoyEffectGUI:Destroy()
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AnnoyEffectGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.DisplayOrder = 1200
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = PlayerGui
    local Frame = Instance.new("Frame")
    Frame.Name = "AnnoyFlash"
    Frame.BackgroundColor3 = Color3.fromRGB(255, 45, 210)
    Frame.BackgroundTransparency = 0.55
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.Parent = ScreenGui
    TweenService:Create(
        Frame,
        TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 9, true),
        {BackgroundTransparency = 0.9}
    ):Play()
    for i = 1, 110 do
        v1 = Instance.new("TextLabel")
        v1.Text = "!"
        v1.Font = Enum.Font.ArialBold
        v1.TextSize = math.random(44, 140)
        v1.TextColor3 = Color3.fromHSV(math.random(), 0.9, 1)
        v1.TextStrokeTransparency = 0
        v1.TextStrokeColor3 = Color3.new(0, 0, 0)
        v1.BackgroundTransparency = 1
        v1.Size = UDim2.fromOffset(120, 120)
        v1.Position = UDim2.fromScale(math.random(), math.random())
        v1.AnchorPoint = Vector2.new(0.5, 0.5)
        v1.Rotation = math.random(-55, 55)
        v1.Parent = ScreenGui
        Debris:AddItem(v1, 1.2)
        task.wait(0.03)
    end
    Debris:AddItem(ScreenGui, 3)
end

local function setOtherGuisEnabled(a1) -- Line: 478 -- upvalues: PlayerGui (val)
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui")
            and v.Name ~= "TrollSpectateGui"
            and v.Name ~= "AnnoyEffectGUI"
            and v.Name ~= "FeedbackGui" then
            v.Enabled = a1
        end
    end
    local FeedbackGui = PlayerGui:FindFirstChild("FeedbackGui")
    if FeedbackGui and FeedbackGui:IsA("ScreenGui") then
        FeedbackGui.Enabled = true
        FeedbackGui.DisplayOrder = math.max(FeedbackGui.DisplayOrder, 1000)
    end
end

local function updateSpectateList() -- Line: 494 -- upvalues: u109 (ref), Players (val), LocalPlayer (val)
    u109 = {}
    for i, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            table.insert(u109, v)
        end
    end
end

local u182 = nil

local function publishSpeedrunSpectateTarget(a1) -- Line: 505 -- upvalues: LocalPlayer (val)
    LocalPlayer:SetAttribute("LocalSpectateTargetUserId", a1 and a1.Parent and a1.UserId or nil)
end

local function cyclePlayer(a1) -- Line: 510
    -- upvalues: u109 (ref), u111 (ref), LocalPlayer (val), u115 (ref), u110 (ref), u182 (ref)
    if #u109 == 0 then
        u111 = nil
        LocalPlayer:SetAttribute("LocalSpectateTargetUserId", nil)
        u115.Text = "No other players in server"
        return
    end
    u110 = u110 + a1
    local v1 = u110
    if #u109 < v1 then
        u110 = 1
    end
    if u110 < 1 then
        u110 = #u109
    end
    u111 = u109[u110]
    v1 = u111
    LocalPlayer:SetAttribute("LocalSpectateTargetUserId", v1 and v1.Parent and v1.UserId or nil)
    u115.Text = ("Spectating: @%s / %s"):format(u111.Name, u111.DisplayName)
    if u182 then
        u182()
    end
end

local function requestStreamAroundCharacter(a1) -- Line: 528 -- upvalues: LocalPlayer (val)
    local Position
    if not a1 then
        return
    end
    local HumanoidRootPart = a1:FindFirstChild("HumanoidRootPart") or a1:FindFirstChild("Head") or a1.PrimaryPart
    if not HumanoidRootPart then
        Position = a1:GetPivot().Position
    else
        Position = HumanoidRootPart.Position
        if not Position then
            Position = a1:GetPivot().Position
        end
    end
    task.spawn(function() -- Line: 532 -- upvalues: LocalPlayer (upval), Position (val)
        pcall(function() -- Line: 533 -- upvalues: LocalPlayer (upval), Position (upval)
            LocalPlayer:RequestStreamAroundAsync(Position, 2)
        end)
    end)
end

function u182() -- Line: 539 -- upvalues: u111 (ref), requestStreamAroundCharacter (val), CurrentCamera (val)
    if u111 and u111.Parent and u111.Character then
        local Character = u111.Character
        requestStreamAroundCharacter(Character)
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid and 0 < Humanoid.Health then
            if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
                CurrentCamera.CameraType = Enum.CameraType.Custom
            end
            if CurrentCamera.CameraSubject ~= Humanoid then
                CurrentCamera.CameraSubject = Humanoid
            end
        end
        return
    end
end

local function disableSpectateShiftLock() -- Line: 554 -- upvalues: u119 (ref)
    if u119 then
        u119:Disconnect()
        u119 = nil
    end
end

local function restoreSpectateShiftLock() -- Line: 562
    -- upvalues: u119 (ref), u117 (ref), LocalPlayer (val), u118 (ref), UserInputService (val)
    if u119 then
        u119:Disconnect()
        u119 = nil
    end
    if u117 ~= nil then
        local u7 = u117
        u117 = nil
        pcall(function() -- Line: 570 -- upvalues: LocalPlayer (upval), u7 (val)
            LocalPlayer.DevEnableMouseLock = u7
        end)
    end
    if u118 ~= nil then
        UserInputService.MouseBehavior = u118
        u118 = nil
    end
end

local function setSpectateMovementBlocked(a1) -- Line: 582 -- upvalues: RunService (val), LocalPlayer (val)
    RunService:UnbindFromRenderStep("TrollSpectateBlockMovement")
    if not a1 then
        return
    end
    RunService:BindToRenderStep("TrollSpectateBlockMovement", Enum.RenderPriority.Input.Value + 1, function() -- Line: 588 -- upvalues: LocalPlayer (upval)
        local Character = LocalPlayer.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid:Move(Vector3.new(0, 0, 0), false)
            Humanoid.Jump = false
        end
    end)
end

local function stopSpectate() -- Line: 598
    -- upvalues: u108 (ref), RunService (val), u116 (ref), u114 (ref), u113 (ref), CurrentCamera (val), u111 (ref)
    -- upvalues: LocalPlayer (val), setOtherGuisEnabled (val), u112 (ref), u119 (ref), u117 (ref), u118 (ref)
    -- upvalues: UserInputService (val)
    u108 = false
    RunService:UnbindFromRenderStep("TrollSpectateBlockMovement")
    if u116 then
        u116.Text = "TROLL"
    end
    if u114 then
        u114.Visible = false
    end
    if u113 then
        local LeaveButton = u113:FindFirstChild("LeaveButton", true)
        if LeaveButton and LeaveButton:IsA("GuiObject") then
            LeaveButton.Visible = false
        end
    end
    CurrentCamera.CameraType = Enum.CameraType.Custom
    u111 = nil
    LocalPlayer:SetAttribute("LocalSpectateTargetUserId", nil)
    setOtherGuisEnabled(true)
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        CurrentCamera.CameraSubject = Humanoid
    end
    if u112 then
        u112:Disconnect()
        u112 = nil
    end
    if u119 then
        u119:Disconnect()
        u119 = nil
    end
    if u117 ~= nil then
        local u58 = u117
        u117 = nil
        pcall(function() -- Line: 570 -- upvalues: LocalPlayer (upval), u58 (val)
            LocalPlayer.DevEnableMouseLock = u58
        end)
    end
    if u118 ~= nil then
        UserInputService.MouseBehavior = u118
        u118 = nil
    end
end

local function startSpectate() -- Line: 625
    -- upvalues: u108 (ref), updateSpectateList (val), u109 (ref), showNotification (val), u119 (ref), u116 (ref)
    -- upvalues: u114 (ref), u113 (ref), CurrentCamera (val), setOtherGuisEnabled (val), RunService (val)
    -- upvalues: LocalPlayer (val), u112 (ref), u182 (ref), cyclePlayer (val)
    if u108 then
        return
    end
    updateSpectateList()
    if #u109 == 0 then
        showNotification("Not enough players")
        return
    end
    u108 = true
    if u119 then
        u119:Disconnect()
        u119 = nil
    end
    if u116 then
        u116.Text = "EXIT"
    end
    u114.Visible = true
    if u113 then
        local LeaveButton = u113:FindFirstChild("LeaveButton", true)
        if LeaveButton and LeaveButton:IsA("GuiObject") then
            LeaveButton.Visible = true
        end
    end
    CurrentCamera.CameraType = Enum.CameraType.Custom
    setOtherGuisEnabled(false)
    RunService:UnbindFromRenderStep("TrollSpectateBlockMovement")
    RunService:BindToRenderStep("TrollSpectateBlockMovement", Enum.RenderPriority.Input.Value + 1, function() -- Line: 588 -- upvalues: LocalPlayer (upval)
        local Character = LocalPlayer.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid:Move(Vector3.new(0, 0, 0), false)
            Humanoid.Jump = false
        end
    end)
    if not u112 then
        RunService.RenderStepped:Connect(u182)
    end
    cyclePlayer(0)
end

local function setupTrollOverlay() -- Line: 651
    -- upvalues: PlayerGui (val), u116 (ref), u113 (ref), u114 (ref), u115 (ref), makeTemplateButton (val)
    -- upvalues: applyRedGradient (val), stopSpectate (val), cyclePlayer (val), u95 (val), u111 (ref)
    -- upvalues: InitiateTrollPurchase (val), u108 (ref), startSpectate (val)
    local Troll = (((PlayerGui:WaitForChild("Main2")):WaitForChild("Right")):WaitForChild("Tools")):WaitForChild("Troll")
    u116 = Troll:FindFirstChildOfClass("TextLabel") or Troll:FindFirstChild("TextLabel", true)
    u113 = Instance.new("ScreenGui")
    u113.Name = "TrollSpectateGui"
    u113.ResetOnSpawn = false
    u113.Enabled = true
    u113.DisplayOrder = 900
    u113.Parent = PlayerGui
    u114 = Instance.new("Frame")
    u114.Name = "SpectateFrame"
    u114.BackgroundTransparency = 1
    u114.AnchorPoint = Vector2.new(0.5, 1)
    u114.Position = UDim2.new(0.5, 0, 1, -24)
    u114.Size = UDim2.new(0.78, 0, 0.24, 0)
    u114.Visible = false
    u114.Parent = u113
    u115 = Instance.new("TextLabel")
    u115.Name = "SpectateLabel"
    u115.Text = "Spectating: Nobody"
    u115.Font = Enum.Font.SourceSansBold
    u115.TextSize = 28
    u115.TextColor3 = Color3.new(1, 1, 1)
    u115.BackgroundTransparency = 1
    u115.TextStrokeTransparency = 0
    u115.Size = UDim2.new(1, 0, 0, 30)
    u115.Parent = u114
    local v1 = makeTemplateButton("LeaveButton", "LEAVE", u113, UDim2.new(0.11, 0, 0.065, 0))
    v1.AnchorPoint = Vector2.new(1, 0)
    v1.Position = UDim2.new(1, -30, 0, 30)
    v1.Visible = false
    applyRedGradient(v1)
    local u125 = stopSpectate
    if v1 then
        local u126 = 0
        v1.Activated:Connect(function(...) -- Line: 61 -- upvalues: u126 (ref), u125 (val)
            local v1 = os.clock()
            if v1 - u126 < 0.1 then
                return
            end
            u126 = v1
            u125(...)
        end)
    end
    local Frame = Instance.new("Frame")
    Frame.Name = "TrollButtonContainer"
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.new(1, 0, 1, -44)
    Frame.Position = UDim2.new(0, 0, 0, 44)
    Frame.Parent = u114
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0.018, 0)
    UIListLayout.Parent = Frame
    local v2 = makeTemplateButton("PrevButton", "<", u114, UDim2.new(0.075, 0, 0.45, 0))
    v2.AnchorPoint = Vector2.new(1, 0.5)
    v2.Position = UDim2.new(0, -10, 0.6, 0)
    local v3 = makeTemplateButton("NextButton", ">", u114, UDim2.new(0.075, 0, 0.45, 0))
    v3.AnchorPoint = Vector2.new(0, 0.5)
    v3.Position = UDim2.new(1, 10, 0.6, 0)

    local function u204() -- Line: 709 -- upvalues: cyclePlayer (upval)
        cyclePlayer(-1)
    end

    if v2 then
        local u205 = 0
        v2.Activated:Connect(function(...) -- Line: 61 -- upvalues: u205 (ref), u204 (val)
            local v1 = os.clock()
            if v1 - u205 < 0.1 then
                return
            end
            u205 = v1
            u204(...)
        end)
    end

    local function u212() -- Line: 710 -- upvalues: cyclePlayer (upval)
        cyclePlayer(1)
    end

    if v3 then
        local u214 = 0
        v3.Activated:Connect(function(...) -- Line: 61 -- upvalues: u214 (ref), u212 (val)
            local v1 = os.clock()
            if v1 - u214 < 0.1 then
                return
            end
            u214 = v1
            u212(...)
        end)
    end
    for i, v in ipairs(u95) do
        v3 = makeTemplateButton(v.Name, v.Name .. "\n(" .. v.Price .. " R$)", Frame, UDim2.new(0.23, 0, 0.62, 0))

        local function u259() -- Line: 714 -- upvalues: u111 (upval), InitiateTrollPurchase (upval), v (val)
            if u111 then
                InitiateTrollPurchase:FireServer(v.ProductId, u111.UserId)
            end
        end

        if v3 then
            local u260 = 0
            v3.Activated:Connect(function(...) -- Line: 61 -- upvalues: u260 (ref), u259 (val)
                local v1 = os.clock()
                if v1 - u260 < 0.1 then
                    return
                end
                u260 = v1
                u259(...)
            end)
        end
    end

    local function u233() -- Line: 721 -- upvalues: u108 (upval), stopSpectate (upval), startSpectate (upval)
        if u108 then
            stopSpectate()
            return
        end
        startSpectate()
    end

    if not Troll then
        return
    end
    local u235 = 0
    Troll.Activated:Connect(function(...) -- Line: 61 -- upvalues: u235 (ref), u233 (val)
        local v1 = os.clock()
        if v1 - u235 < 0.1 then
            return
        end
        u235 = v1
        u233(...)
    end)
end

RewardEvent.OnClientEvent:Connect(function(a1, a2) -- Line: 730
    -- upvalues: u99 (ref), u102 (val), updatePlaytimeDisplay (val), u100 (ref), RunService (val), u101 (val)
    -- upvalues: RewardEvent (val)
    if a1 == "UpdateState" and type(a2) == "table" then
        u99 = a2
        for i in ipairs(u102) do
            u102[i] = false
        end
        updatePlaytimeDisplay()
        if u100 then
            return
        end
        local u19 = 0
        RunService.Heartbeat:Connect(function(a1) -- Line: 403 -- upvalues: u99 (upval), u19 (ref), updatePlaytimeDisplay (upval)
            local v1, v2
            if not u99 then
                return
            end
            u19 = u19 + a1
            if u19 < 0.25 then
                return
            end
            local v3 = u19
            u19 = 0
            for i, v in ipairs(u99) do
                if v > 0 then
                    v2 = u99
                    v1 = v - v3
                    v2[i] = (math.max(0, v1))
                end
            end
            updatePlaytimeDisplay()
        end)
        return
    end
    if a1 == "ClaimResult" and type(a2) == "table" then
        local v1 = math.floor((tonumber(a2.index)) or 0)
        if u101[v1] then
            u102[v1] = false
            updatePlaytimeDisplay()
        end
        if a2.success ~= true then
            RewardEvent:FireServer("RequestInitialState")
        end
    end
end)
TriggerTrollFX.OnClientEvent:Connect(function(a1) -- Line: 750 -- upvalues: showAnnoyEffect (val)
    if a1 == "Annoy" then
        showAnnoyEffect()
    end
end)
setupPlaytimeGui()
local Invite = (((PlayerGui:WaitForChild("Main2")):WaitForChild("Right")):WaitForChild("Tools")):WaitForChild("Invite")
if Invite then
    local u239 = 0
    Invite.Activated:Connect(function(...) -- Line: 61 -- upvalues: u239 (ref), promptInvite (val)
        local v1 = os.clock()
        if v1 - u239 < 0.1 then
            return
        end
        u239 = v1
        promptInvite(...)
    end)
end
setupTrollOverlay()
Players.PlayerAdded:Connect(function() -- Line: 759 -- upvalues: u108 (ref), updateSpectateList (val)
    if u108 then
        updateSpectateList()
    end
end)
Players.PlayerRemoving:Connect(function(a1) -- Line: 762 -- upvalues: u108 (ref), updateSpectateList (val), u111 (ref), cyclePlayer (val)
    if u108 then
        updateSpectateList()
        if a1 == u111 then
            cyclePlayer(1)
        end
    end
end)
LocalPlayer.CharacterAdded:Connect(function() -- Line: 768 -- upvalues: u108 (ref), stopSpectate (val)
    if not u108 then
        task.defer(stopSpectate)
    end
end)
RewardEvent:FireServer("RequestInitialState")