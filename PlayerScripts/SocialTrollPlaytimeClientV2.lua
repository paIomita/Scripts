-- Path: Players.Drrrrrrrrragonball.PlayerScripts.SocialTrollPlaytimeClientV2

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.SocialTrollPlaytimeClientV2
-- Decompile time: 17.49 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SocialService = game:GetService("SocialService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RewardEvent = ReplicatedStorage:WaitForChild("RewardEvent")
local TrollActionEvent = ReplicatedStorage:WaitForChild("TrollActionEvent")
local Button = (ReplicatedStorage:WaitForChild("Buttons")):WaitForChild("Button")
local u56 = {
    "FirstFrame",
    "SecondFrame",
    "ThirdFrame",
    "FourthFrame",
    "FifthFrame",
    "SixthFrame",
    "SeventhFrame",
    "EighthFrame",
}
local u69 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u74 = TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local u75 = nil
local u76 = nil
local u77 = {}
local u78 = {}
local u79 = nil
local u80 = nil
local u81 = nil
local u82 = nil
local u83 = nil
local u84 = nil
local u85 = nil
local u86 = nil
local u87 = nil
local u88 = false

local function connectButton(a1, a2) -- Line: 38
    if not a1 then
        return
    end
    local u2 = 0

    local function fire(...) -- Line: 41 -- upvalues: u2 (ref), a2 (val)
        local v1 = os.clock()
        if v1 - u2 < 0.1 then
            return
        end
        u2 = v1
        a2(...)
    end

    a1.Activated:Connect(fire)
    if a1:IsA("GuiButton") then
        a1.MouseButton1Click:Connect(fire)
    end
end

local function formatTime(a1) -- Line: 53
    local v1 = math.max(0, (math.floor((tonumber(a1)) or 0)))
    return string.format("%02i:%02i:%02i", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), v1 % 60)
end

local function setBlur(a1) -- Line: 61 -- upvalues: Lighting (val), TweenService (val)
    local SharedModalBlur = Lighting:FindFirstChild("SharedModalBlur")
    if a1 then
        if not SharedModalBlur then
            SharedModalBlur = Instance.new("BlurEffect")
            SharedModalBlur.Name = "SharedModalBlur"
            SharedModalBlur.Size = 0
            SharedModalBlur.Parent = Lighting
        end
        TweenService:Create(SharedModalBlur, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
        return
    end
    if not SharedModalBlur then
        return
    end
    local v1 = TweenService
    local v2 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    v1 = v1:Create(SharedModalBlur, v2, {Size = 0})
    v1:Play()
    v1.Completed:Connect(function() -- Line: 75 -- upvalues: SharedModalBlur (ref)
        if SharedModalBlur and SharedModalBlur.Parent and SharedModalBlur.Size <= 0.01 then
            SharedModalBlur:Destroy()
        end
    end)
end

local function getScale(a1) -- Line: 83
    local SharedModalScale = a1:FindFirstChild("SharedModalScale")
    if not SharedModalScale then
        SharedModalScale = Instance.new("UIScale")
        SharedModalScale.Name = "SharedModalScale"
        SharedModalScale.Parent = a1
    end
    return SharedModalScale
end

local function isAllowedModalObject(a1, a2, a3) -- Line: 93
    local v1 = true
    if a1 ~= a3 then
        v1 = a1:IsDescendantOf(a3) or a3:IsDescendantOf(a1) or a1 == a2
    end
    return v1
end

local function hideOtherUi(a1, a2) -- Line: 97
    -- upvalues: u87 (ref), PlayerGui (val), Lighting (val), TweenService (val)
    local Enabled, v1
    u87 = {screenGuis = {}, guiObjects = {}, modalGui = a1, modalRoot = a2}
    local v2, v3 = a1, a2
    for i, v in ipairs(PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") then
            u87.screenGuis[v] = v.Enabled
            Enabled = v.Enabled or v == v2
            if Enabled then
                v.Enabled = true
                for i2, i3 in ipairs(v:GetDescendants()) do
                    if i3:IsA("GuiObject") then
                        v1 = true
                        if i3 ~= v3 then
                            v1 = i3:IsDescendantOf(v3) or v3:IsDescendantOf(i3) or i3 == v2
                        end
                        if not v1 then
                            u87.guiObjects[i3] = i3.Visible
                            i3.Visible = false
                        end
                    end
                end
            end
        end
    end
    v2.Enabled = true
    local SharedModalBlur = Lighting:FindFirstChild("SharedModalBlur")
    if not SharedModalBlur then
        SharedModalBlur = Instance.new("BlurEffect")
        SharedModalBlur.Name = "SharedModalBlur"
        SharedModalBlur.Size = 0
        SharedModalBlur.Parent = Lighting
    end
    TweenService:Create(SharedModalBlur, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
end

local function restoreOtherUi() -- Line: 118 -- upvalues: u87 (ref), setBlur (val)
    if not u87 then
        setBlur(false)
        return
    end
    for k, v in pairs(u87.guiObjects) do
        if k and k.Parent then
            k.Visible = v
        end
    end
    for k2, i in pairs(u87.screenGuis) do
        if k2 and k2.Parent then
            k2.Enabled = i
        end
    end
    u87 = nil
    setBlur(false)
end

local function openModal(a1, a2, a3) -- Line: 137
    -- upvalues: u88 (ref), hideOtherUi (val), TweenService (val), u69 (val)
    if not u88 and not a2.Visible then
        u88 = true
        hideOtherUi(a1, a2)
        local SharedModalScale = a2:FindFirstChild("SharedModalScale")
        if not SharedModalScale then
            SharedModalScale = Instance.new("UIScale")
            SharedModalScale.Name = "SharedModalScale"
            SharedModalScale.Parent = a2
        end
        SharedModalScale.Scale = 0
        a2.Visible = true
        local v1 = TweenService:Create(SharedModalScale, u69, {Scale = 1})
        v1:Play()
        v1.Completed:Connect(function() -- Line: 146 -- upvalues: u88 (upval), a3 (val)
            u88 = false
            if a3 then
                a3()
            end
        end)
        return
    end
end

local function closeModal(a1, a2) -- Line: 152
    -- upvalues: u88 (ref), restoreOtherUi (val), TweenService (val), u74 (val)
    if u88 then
        return
    end
    if not a1.Visible then
        restoreOtherUi()
        if a2 then
            a2()
        end
        return
    end
    u88 = true
    local SharedModalScale = a1:FindFirstChild("SharedModalScale")
    if not SharedModalScale then
        SharedModalScale = Instance.new("UIScale")
        SharedModalScale.Name = "SharedModalScale"
        SharedModalScale.Parent = a1
    end
    local v1 = TweenService:Create(SharedModalScale, u74, {Scale = 0})
    v1:Play()
    v1.Completed:Connect(function() -- Line: 163 -- upvalues: a1 (val), SharedModalScale (val), restoreOtherUi (upval), u88 (upval), a2 (val)
        a1.Visible = false
        SharedModalScale.Scale = 1
        restoreOtherUi()
        u88 = false
        if a2 then
            a2()
        end
    end)
end

local function getRewardsButton() -- Line: 172 -- upvalues: PlayerGui (val)
    return PlayerGui:FindFirstChild("RewardsButton", true)
end

local function createNotificationBadge() -- Line: 176 -- upvalues: PlayerGui (val), u79 (ref)
    local RewardsButton = PlayerGui:FindFirstChild("RewardsButton", true)
    if not RewardsButton then
        return
    end
    local NotificationDot = RewardsButton:FindFirstChild("NotificationDot")
    if NotificationDot then
        NotificationDot:Destroy()
    end
    local Frame = Instance.new("Frame")
    Frame.Name = "NotificationDot"
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Position = UDim2.new(1, -2, 0, 2)
    Frame.Size = UDim2.fromOffset(30, 30)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 58, 88)
    Frame.BorderSizePixel = 0
    Frame.ZIndex = RewardsButton.ZIndex + 20
    Frame.Visible = false
    Frame.Parent = RewardsButton
    local v1 = Instance.new("UICorner")
    v1.CornerRadius = UDim.new(1, 0)
    v1.Parent = Frame
    v1 = Instance.new("UIStroke")
    v1.Color = Color3.fromRGB(255, 255, 255)
    v1.Thickness = 2
    v1.Parent = Frame
    v1 = Instance.new("UIGradient")
    v1.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 96, 120)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 20, 65))),
    })
    v1.Rotation = 90
    v1.Parent = Frame
    v1 = Instance.new("TextLabel")
    v1.Name = "Count"
    v1.BackgroundTransparency = 1
    v1.Size = UDim2.fromScale(1, 1)
    v1.Text = "0"
    v1.TextColor3 = Color3.new(1, 1, 1)
    v1.TextScaled = true
    v1.Font = Enum.Font.FredokaOne
    v1.ZIndex = Frame.ZIndex + 1
    v1.Parent = Frame
    u79 = Frame
end

local function setNotificationCount(a1) -- Line: 224 -- upvalues: u79 (ref), TweenService (val)
    if not u79 then
        return
    end
    u79.Visible = a1 > 0
    local Count = u79:FindFirstChild("Count")
    if Count then
        Count.Text = tostring(a1)
    end
    local BadgeScale = u79:FindFirstChild("BadgeScale")
    if not BadgeScale then
        BadgeScale = Instance.new("UIScale")
        BadgeScale.Name = "BadgeScale"
        BadgeScale.Parent = u79
    end
    if a1 > 0 then
        BadgeScale.Scale = 0.85
        TweenService:Create(BadgeScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end
end

local function updatePlaytimeDisplay() -- Line: 243 -- upvalues: u75 (ref), u77 (ref), setNotificationCount (val)
    local TimeLabel, v1, v2
    if not u75 then
        return
    end
    local v3 = 0
    for i, v in ipairs(u77) do
        v1 = u75[i]
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
                v2 = math.max(0, (math.floor((tonumber(v1)) or 0)))
                TimeLabel.Text = string.format("%02i:%02i:%02i", math.floor(v2 / 3600), math.floor(v2 % 3600 / 60), v2 % 60)
                v.TimeLabel.TextColor3 = Color3.new(1, 1, 1)
            else
                v3 = v3 + 1
                v.TimeLabel.Visible = false
                v.ClaimButton.Visible = true
                v.ClaimButton.Interactable = true
                v.ClaimButton.Text = "CLAIM"
            end
        end
    end
    setNotificationCount(v3)
end

local function setupPlaytimeGui() -- Line: 271
    -- upvalues: PlayerGui (val), createNotificationBadge (val), u77 (ref), u56 (val), u78 (val), connectButton (val)
    -- upvalues: RewardEvent (val), closeModal (val), openModal (val), updatePlaytimeDisplay (val)
    local TimeLabel, v1
    local PlaytimeGui = PlayerGui:WaitForChild("PlaytimeGui")
    local PlaytimeFrame = PlaytimeGui:WaitForChild("PlaytimeFrame")
    local Frame = PlaytimeFrame:WaitForChild("Frame")
    local Close = PlaytimeFrame:FindFirstChild("Close")
    PlaytimeFrame.Visible = false
    createNotificationBadge()
    u77 = {}
    for i, v in ipairs(u56) do
        v1 = Frame:WaitForChild(v)
        local TextButton = v1:WaitForChild("TextButton")
        TimeLabel = v1:WaitForChild("TimeLabel")
        TextButton.Visible = false
        TimeLabel.Visible = true
        TimeLabel.Text = "..."
        TimeLabel.TextColor3 = Color3.new(1, 1, 1)
        u77[i] = {Frame = v1, ClaimButton = TextButton, TimeLabel = TimeLabel}
        u78[i] = false
        connectButton(TextButton, function() -- Line: 290 -- upvalues: u78 (upval), i (val), TextButton (val), RewardEvent (upval)
            if u78[i] then
                return
            end
            u78[i] = true
            TextButton.Interactable = false
            TextButton.Text = "..."
            RewardEvent:FireServer("Claim", i)
        end)
    end
    connectButton(PlayerGui:FindFirstChild("RewardsButton", true), function() -- Line: 299
        -- upvalues: PlaytimeFrame (val), closeModal (upval), RewardEvent (upval), openModal (upval), PlaytimeGui (val)
        if PlaytimeFrame.Visible then
            closeModal(PlaytimeFrame)
            return
        end
        RewardEvent:FireServer("RequestInitialState")
        openModal(PlaytimeGui, PlaytimeFrame)
    end)
    connectButton(Close, function() -- Line: 307 -- upvalues: closeModal (upval), PlaytimeFrame (val)
        closeModal(PlaytimeFrame)
    end)
    updatePlaytimeDisplay()
end

local function startCountdown() -- Line: 313
    -- upvalues: u76 (ref), RunService (val), u75 (ref), updatePlaytimeDisplay (val)
    if u76 then
        return
    end
    RunService.Heartbeat:Connect(function(a1) -- Line: 315 -- upvalues: u75 (upval), updatePlaytimeDisplay (upval)
        local v1, v2
        if not u75 then
            return
        end
        for i, v in ipairs(u75) do
            if v > 0 then
                v1 = u75
                v2 = v - a1
                v1[i] = (math.max(0, v2))
            end
        end
        updatePlaytimeDisplay()
    end)
end

local function setTemplateButtonText(a1, a2) -- Line: 335
    local TextLabel = a1:FindFirstChild("TextLabel")
    if TextLabel and TextLabel:IsA("TextLabel") then
        TextLabel.Text = a2
        return
    end
    if a1:IsA("TextButton") then
        a1.Text = a2
    end
end

local function makeTemplateButton(a1, a2, a3, a4, a5) -- Line: 344 -- upvalues: Button (val)
    local v1 = Button:Clone()
    v1.Name = a1
    v1.AnchorPoint = Vector2.new(0.5, 0.5)
    v1.Position = a4
    v1.Size = a5
    v1.Visible = true
    v1.ZIndex = 20
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

local function requestStreamAroundCharacter(a1) -- Line: 362 -- upvalues: LocalPlayer (val)
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
    task.spawn(function() -- Line: 366 -- upvalues: LocalPlayer (upval), Position (val)
        pcall(function() -- Line: 367 -- upvalues: LocalPlayer (upval), Position (upval)
            LocalPlayer:RequestStreamAroundAsync(Position, 2)
        end)
    end)
end

local function getCameraHumanoid(a1) -- Line: 373 -- upvalues: requestStreamAroundCharacter (val)
    local Character = a1 and a1.Character
    if Character then
        requestStreamAroundCharacter(Character)
    end
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    if Humanoid and 0 < Humanoid.Health then
        return Humanoid
    end
    return nil
end

local function setSpectateButtonText(a1) -- Line: 385 -- upvalues: u85 (ref)
    if u85 then
        local v1 = u85
        local TextLabel = v1:FindFirstChild("TextLabel")
        if TextLabel and TextLabel:IsA("TextLabel") then
            TextLabel.Text = a1
            return
        end
        if v1:IsA("TextButton") then
            v1.Text = a1
        end
    end
end

local function applyCameraSubject(a1) -- Line: 391 -- upvalues: Workspace (val)
    local CurrentCamera = Workspace.CurrentCamera
    if CurrentCamera and a1 then
        if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
            CurrentCamera.CameraType = Enum.CameraType.Custom
        end
        if CurrentCamera.CameraSubject ~= a1 then
            CurrentCamera.CameraSubject = a1
        end
        return true
    end
    return false
end

local function stopSpectateMonitor() -- Line: 405 -- upvalues: u86 (ref)
    if u86 then
        u86:Disconnect()
        u86 = nil
    end
end

local function stopSpectating() -- Line: 412
    -- upvalues: u81 (ref), u86 (ref), LocalPlayer (val), requestStreamAroundCharacter (val), Workspace (val), u85 (ref)
    -- upvalues: u84 (ref), u80 (ref)
    local v1 = u81
    u81 = nil
    if u86 then
        u86:Disconnect()
        u86 = nil
    end
    local v2 = LocalPlayer
    local Character = v2 and v2.Character
    if Character then
        requestStreamAroundCharacter(Character)
    end
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local v3 = if not Humanoid then nil else if not (0 < Humanoid.Health) then nil else Humanoid
    local CurrentCamera = Workspace.CurrentCamera
    if CurrentCamera and v3 then
        if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
            CurrentCamera.CameraType = Enum.CameraType.Custom
        end
        if CurrentCamera.CameraSubject ~= v3 then
            CurrentCamera.CameraSubject = v3
        end
    end
    if u85 then
        v3 = u85
        local TextLabel = v3:FindFirstChild("TextLabel")
        if not TextLabel then
            if v3:IsA("TextButton") then
                v3.Text = "SPECTATE"
            end
        elseif TextLabel:IsA("TextLabel") then
            TextLabel.Text = "SPECTATE"
        elseif v3:IsA("TextButton") then
            v3.Text = "SPECTATE"
        end
    end
    if u84 then
        u84.Text = u80 and u80.Parent and "Selected: " .. u80.DisplayName or "Select a player"
    end
    return v1
end

local function startSpectating(a1) -- Line: 424
    -- upvalues: LocalPlayer (val), u81 (ref), u85 (ref), u84 (ref), u86 (ref), RunService (val)
    -- upvalues: requestStreamAroundCharacter (val), Workspace (val), u80 (ref)
    if a1 and a1 ~= LocalPlayer and a1.Parent then
        u81 = a1
        if u85 then
            local v1 = u85
            local TextLabel = v1:FindFirstChild("TextLabel")
            if not TextLabel then
                if v1:IsA("TextButton") then
                    v1.Text = "STOP"
                end
            elseif TextLabel:IsA("TextLabel") then
                TextLabel.Text = "STOP"
            elseif v1:IsA("TextButton") then
                v1.Text = "STOP"
            end
        end
        if u84 then
            u84.Text = ("Spectating: @%s / %s"):format(a1.Name, a1.DisplayName)
        end
        if u86 then
            u86:Disconnect()
            u86 = nil
        end
        local u37 = os.clock()
        local u38 = 0
        RunService.RenderStepped:Connect(function() -- Line: 437
            -- upvalues: u81 (upval), a1 (val), u86 (upval), LocalPlayer (upval), requestStreamAroundCharacter (upval)
            -- upvalues: Workspace (upval), u85 (upval), u84 (upval), u80 (upval), u37 (ref), u38 (ref)
            local v1
            if u81 ~= a1 then
                return
            end
            if a1.Parent then
                v1 = a1
                local Character_2 = v1 and v1.Character
                if Character_2 then
                    requestStreamAroundCharacter(Character_2)
                end
                local Humanoid_2 = Character_2 and Character_2:FindFirstChildOfClass("Humanoid")
                local v2 = if not Humanoid_2 then nil else if not (0 < Humanoid_2.Health) then nil else Humanoid_2
                if v2 then
                    u37 = os.clock()
                    if not (0.25 <= os.clock() - u38) then
                        return
                    end
                    local CurrentCamera_2 = Workspace.CurrentCamera
                    if CurrentCamera_2 and v2 then
                        if CurrentCamera_2.CameraType ~= Enum.CameraType.Custom then
                            CurrentCamera_2.CameraType = Enum.CameraType.Custom
                        end
                        if CurrentCamera_2.CameraSubject ~= v2 then
                            CurrentCamera_2.CameraSubject = v2
                        end
                    end
                    os.clock()
                    return
                end
                if 3 < os.clock() - u37 then
                    requestStreamAroundCharacter(a1.Character)
                end
                return
            end
            u81 = nil
            if u86 then
                u86:Disconnect()
                u86 = nil
            end
            local v3 = LocalPlayer
            local Character = v3 and v3.Character
            if Character then
                requestStreamAroundCharacter(Character)
            end
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            v1 = if not Humanoid then nil else if not (0 < Humanoid.Health) then nil else Humanoid
            local CurrentCamera = Workspace.CurrentCamera
            if CurrentCamera and v1 then
                if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
                    CurrentCamera.CameraType = Enum.CameraType.Custom
                end
                if CurrentCamera.CameraSubject ~= v1 then
                    CurrentCamera.CameraSubject = v1
                end
            end
            if u85 then
                v1 = u85
                local TextLabel = v1:FindFirstChild("TextLabel")
                if not TextLabel then
                    if v1:IsA("TextButton") then
                        v1.Text = "SPECTATE"
                    end
                elseif TextLabel:IsA("TextLabel") then
                    TextLabel.Text = "SPECTATE"
                elseif v1:IsA("TextButton") then
                    v1.Text = "SPECTATE"
                end
            end
            if u84 then
                u84.Text = u80 and u80.Parent and "Selected: " .. u80.DisplayName or "Select a player"
            end
        end)
        task.spawn(function() -- Line: 457 -- upvalues: u81 (upval), a1 (val), requestStreamAroundCharacter (upval), Workspace (upval)
            local Character, CurrentCamera, Humanoid, v1, v2
            for i = 1, 40 do
                if u81 ~= a1 then
                    return
                end
                v2 = a1
                Character = v2 and v2.Character
                if Character then
                    requestStreamAroundCharacter(Character)
                end
                Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                v1 = if not Humanoid then nil else if not (0 < Humanoid.Health) then nil else Humanoid
                if v1 then
                    CurrentCamera = Workspace.CurrentCamera
                    if not CurrentCamera then
                        v2 = false
                    elseif v1 then
                        if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
                            CurrentCamera.CameraType = Enum.CameraType.Custom
                        end
                        if CurrentCamera.CameraSubject ~= v1 then
                            CurrentCamera.CameraSubject = v1
                        end
                        v2 = true
                    else
                        v2 = false
                    end
                    if v2 then
                        return
                    end
                end
                task.wait(0.05)
            end
        end)
        return true
    end
    return false
end

local function setSelectedTarget(a1) -- Line: 472 -- upvalues: u80 (ref), u84 (ref)
    u80 = a1
    if u84 then
        u84.Text = a1 and "Selected: " .. a1.DisplayName or "Select a player"
    end
end

local function createTrollGui() -- Line: 479
    -- upvalues: PlayerGui (val), u82 (ref), makeTemplateButton (val), connectButton (val), closeModal (val)
    -- upvalues: stopSpectating (val), u84 (ref), u83 (ref), u85 (ref), u81 (ref), u86 (ref), LocalPlayer (val)
    -- upvalues: requestStreamAroundCharacter (val), Workspace (val), u80 (ref), startSpectating (val)
    -- upvalues: TrollActionEvent (val)
    local v1, v2, v3
    local TrollMenuGui = PlayerGui:FindFirstChild("TrollMenuGui")
    if TrollMenuGui then
        u82 = TrollMenuGui
        return TrollMenuGui
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TrollMenuGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Enabled = true
    ScreenGui.DisplayOrder = 250
    ScreenGui.Parent = PlayerGui
    local Frame = Instance.new("Frame")
    Frame.Name = "TrollFrame"
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Position = UDim2.fromScale(0.5, 0.5)
    Frame.Size = UDim2.fromScale(0.48, 0.6)
    Frame.BackgroundColor3 = Color3.fromRGB(35, 45, 85)
    Frame.BorderSizePixel = 0
    Frame.Visible = false
    Frame.Parent = ScreenGui
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(110, 190, 255)
    UIStroke.Thickness = 3
    UIStroke.Parent = Frame
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "Title"
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.fromScale(0.05, 0.035)
    TextLabel.Size = UDim2.fromScale(0.7, 0.09)
    TextLabel.Text = "TROLL MENU"
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.ZIndex = 20
    TextLabel.Parent = Frame
    connectButton(makeTemplateButton("Close", "X", Frame, UDim2.fromScale(0.9, 0.085), UDim2.fromScale(0.16, 0.135)), function() -- Line: 525 -- upvalues: closeModal (upval), Frame (val), stopSpectating (upval)
        closeModal(Frame, stopSpectating)
    end)
    u84 = Instance.new("TextLabel")
    u84.Name = "SelectedLabel"
    u84.BackgroundTransparency = 1
    u84.Position = UDim2.fromScale(0.06, 0.14)
    u84.Size = UDim2.fromScale(0.88, 0.055)
    u84.Text = "Select a player"
    u84.TextColor3 = Color3.fromRGB(255, 245, 160)
    u84.TextScaled = true
    u84.Font = Enum.Font.FredokaOne
    u84.ZIndex = 20
    u84.Parent = Frame
    u83 = Instance.new("ScrollingFrame")
    u83.Name = "TargetList"
    u83.Position = UDim2.fromScale(0.06, 0.21)
    u83.Size = UDim2.fromScale(0.88, 0.41)
    u83.BackgroundColor3 = Color3.fromRGB(245, 248, 255)
    u83.BorderSizePixel = 0
    u83.ScrollBarThickness = 6
    u83.CanvasSize = UDim2.fromScale(0, 0)
    u83.ZIndex = 19
    u83.Parent = Frame
    local UICorner_2 = Instance.new("UICorner")
    UICorner_2.CornerRadius = UDim.new(0, 8)
    UICorner_2.Parent = u83
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 6)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = u83
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 8)
    UIPadding.PaddingBottom = UDim.new(0, 8)
    UIPadding.PaddingLeft = UDim.new(0, 8)
    UIPadding.PaddingRight = UDim.new(0, 8)
    UIPadding.Parent = u83
    ;(UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function() -- Line: 564 -- upvalues: u83 (upval), UIListLayout (val)
        u83.CanvasSize = UDim2.fromOffset(0, UIListLayout.AbsoluteContentSize.Y + 16)
    end)
    u85 = makeTemplateButton("Spectate", "SPECTATE", Frame, UDim2.fromScale(0.5, 0.695), UDim2.fromScale(0.68, 0.125))
    connectButton(u85, function() -- Line: 569
        -- upvalues: u81 (upval), u86 (upval), LocalPlayer (upval), requestStreamAroundCharacter (upval)
        -- upvalues: Workspace (upval), u85 (upval), u84 (upval), u80 (upval), startSpectating (upval)
        if not u81 then
            if not u80 then
                return
            end
            startSpectating(u80)
            return
        end
        u81 = nil
        if u86 then
            u86:Disconnect()
            u86 = nil
        end
        local v1 = LocalPlayer
        local Character = v1 and v1.Character
        if Character then
            requestStreamAroundCharacter(Character)
        end
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local v2 = if not Humanoid then nil else if not (0 < Humanoid.Health) then nil else Humanoid
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera and v2 then
            if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
                CurrentCamera.CameraType = Enum.CameraType.Custom
            end
            if CurrentCamera.CameraSubject ~= v2 then
                CurrentCamera.CameraSubject = v2
            end
        end
        if u85 then
            v2 = u85
            local TextLabel = v2:FindFirstChild("TextLabel")
            if not TextLabel then
                if v2:IsA("TextButton") then
                    v2.Text = "SPECTATE"
                end
            elseif TextLabel:IsA("TextLabel") then
                TextLabel.Text = "SPECTATE"
            elseif v2:IsA("TextButton") then
                v2.Text = "SPECTATE"
            end
        end
        if u84 then
            u84.Text = u80 and u80.Parent and "Selected: " .. u80.DisplayName or "Select a player"
        end
    end)
    for i, v in ipairs({"Freeze", "Launch", "Spin", "Sparkles"}) do
        v3 = makeTemplateButton
        v1 = string.upper(v)
        v2 = UDim2.fromScale(0.155 + (i - 1) * 0.23, 0.84)
        v3 = v3(v, v1, Frame, v2, UDim2.fromScale(0.215, 0.135))
        connectButton(v3, function() -- Line: 581 -- upvalues: u80 (upval), TrollActionEvent (upval), v (val)
            if u80 then
                TrollActionEvent:FireServer(v, u80.UserId)
            end
        end)
    end
    u82 = ScreenGui
    return ScreenGui
end

local function refreshTargetList() -- Line: 592
    -- upvalues: createTrollGui (val), u83 (ref), Players (val), LocalPlayer (val), makeTemplateButton (val)
    -- upvalues: connectButton (val), u80 (ref), u84 (ref), u81 (ref), u86 (ref), requestStreamAroundCharacter (val)
    -- upvalues: Workspace (val), u85 (ref)
    local v1
    createTrollGui()
    for i, v in ipairs(u83:GetChildren()) do
        if v:IsA("GuiButton") then
            v:Destroy()
        end
    end
    for i2, i3 in ipairs(Players:GetPlayers()) do
        if i3 ~= LocalPlayer then
            v1 = makeTemplateButton(
                "Target_" .. i3.UserId,
                i3.DisplayName .. " (@" .. i3.Name .. ")",
                u83,
                UDim2.new(0.5, 0, 0, 0),
                UDim2.new(1, 0, 0, 48)
            )
            v1.AnchorPoint = Vector2.new(0, 0)
            v1.Position = UDim2.new(0, 0, 0, 0)
            connectButton(v1, function() -- Line: 604 -- upvalues: i3 (val), u80 (upval), u84 (upval)
                local v1 = i3
                u80 = v1
                if u84 then
                    u84.Text = v1 and "Selected: " .. v1.DisplayName or "Select a player"
                end
            end)
        end
    end
    if u80 and not u80.Parent then
        u80 = nil
        if u84 then
            u84.Text = "Select a player"
        end
        u81 = nil
        if u86 then
            u86:Disconnect()
            u86 = nil
        end
        local v2 = LocalPlayer
        local Character = v2 and v2.Character
        if Character then
            requestStreamAroundCharacter(Character)
        end
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local v3 = if not Humanoid then nil else if not (0 < Humanoid.Health) then nil else Humanoid
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera and v3 then
            if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
                CurrentCamera.CameraType = Enum.CameraType.Custom
            end
            if CurrentCamera.CameraSubject ~= v3 then
                CurrentCamera.CameraSubject = v3
            end
        end
        if u85 then
            v3 = u85
            local TextLabel = v3:FindFirstChild("TextLabel")
            if not TextLabel then
                if v3:IsA("TextButton") then
                    v3.Text = "SPECTATE"
                end
            elseif TextLabel:IsA("TextLabel") then
                TextLabel.Text = "SPECTATE"
            elseif v3:IsA("TextButton") then
                v3.Text = "SPECTATE"
            end
        end
        if u84 then
            u84.Text = u80 and u80.Parent and "Selected: " .. u80.DisplayName or "Select a player"
        end
    end
end

RewardEvent.OnClientEvent:Connect(function(a1, a2) -- Line: 626
    -- upvalues: u75 (ref), u78 (val), updatePlaytimeDisplay (val), u76 (ref), RunService (val)
    if a1 == "UpdateState" and type(a2) == "table" then
        u75 = a2
        for i in ipairs(u78) do
            u78[i] = false
        end
        updatePlaytimeDisplay()
        if u76 then
            return
        end
        RunService.Heartbeat:Connect(function(a1) -- Line: 315 -- upvalues: u75 (upval), updatePlaytimeDisplay (upval)
            local v1, v2
            if not u75 then
                return
            end
            for i, v in ipairs(u75) do
                if v > 0 then
                    v1 = u75
                    v2 = v - a1
                    v1[i] = (math.max(0, v2))
                end
            end
            updatePlaytimeDisplay()
        end)
    end
end)
setupPlaytimeGui()
connectButton((((PlayerGui:WaitForChild("Main2")):WaitForChild("Right")):WaitForChild("Tools")):WaitForChild("Invite"), function() -- Line: 326 -- upvalues: SocialService (val), LocalPlayer (val)
    local success, err = pcall(function() -- Line: 327 -- upvalues: SocialService (upval), LocalPlayer (upval)
        SocialService:PromptGameInvite(LocalPlayer)
    end)
    if not success then
        warn("[Invite] PromptGameInvite failed: " .. tostring(err))
    end
end)
connectButton((((PlayerGui:WaitForChild("Main2")):WaitForChild("Right")):WaitForChild("Tools")):WaitForChild("Troll"), function() -- Line: 615
    -- upvalues: createTrollGui (val), refreshTargetList (val), closeModal (val), stopSpectating (val), openModal (val)
    local v1 = createTrollGui()
    local TrollFrame = v1:WaitForChild("TrollFrame")
    refreshTargetList()
    if TrollFrame.Visible then
        closeModal(TrollFrame, stopSpectating)
        return
    end
    openModal(v1, TrollFrame)
end)
Players.PlayerAdded:Connect(refreshTargetList)
Players.PlayerRemoving:Connect(refreshTargetList)
LocalPlayer.CharacterAdded:Connect(function() -- Line: 642 -- upvalues: u81 (ref), stopSpectating (val)
    if not u81 then
        task.defer(stopSpectating)
    end
end)
RewardEvent:FireServer("RequestInitialState")