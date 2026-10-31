-- Path: Players.Drrrrrrrrragonball.PlayerScripts.SocialTrollPlaytimeClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.SocialTrollPlaytimeClient
-- Decompile time: 16.26 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SocialService = game:GetService("SocialService")
game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RewardEvent = ReplicatedStorage:WaitForChild("RewardEvent")
local TrollActionEvent = ReplicatedStorage:WaitForChild("TrollActionEvent")
local u43 = {
    "FirstFrame",
    "SecondFrame",
    "ThirdFrame",
    "FourthFrame",
    "FifthFrame",
    "SixthFrame",
    "SeventhFrame",
    "EighthFrame",
}
local u52 = nil
local u53 = nil
local u54 = {}
local u55 = {}
local u56 = nil
local u57 = nil
local u58 = nil
local u59 = nil
local u60 = nil
local u61 = nil
local u62 = nil
local u63 = nil

local function connectButton(a1, a2) -- Line: 30
    if not a1 then
        return
    end
    local u2 = 0
    a1.Activated:Connect(function(...) -- Line: 33 -- upvalues: u2 (ref), a2 (val)
        local v1 = os.clock()
        if v1 - u2 < 0.1 then
            return
        end
        u2 = v1
        a2(...)
    end)
end

local function formatTime(a1) -- Line: 41
    local v1 = math.max(0, (math.floor((tonumber(a1)) or 0)))
    return string.format("%02i:%02i:%02i", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), v1 % 60)
end

local function getRewardsButton() -- Line: 49 -- upvalues: PlayerGui (val)
    return PlayerGui:FindFirstChild("RewardsButton", true)
end

local function createNotificationDot() -- Line: 53 -- upvalues: PlayerGui (val), u62 (ref)
    local RewardsButton = PlayerGui:FindFirstChild("RewardsButton", true)
    if not RewardsButton then
        return
    end
    local NotificationDot = RewardsButton:FindFirstChild("NotificationDot")
    if NotificationDot then
        NotificationDot:Destroy()
    end
    u62 = Instance.new("TextLabel")
    u62.Name = "NotificationDot"
    u62.AnchorPoint = Vector2.new(0.5, 0.5)
    u62.Position = UDim2.new(1, -5, 0, 5)
    u62.Size = UDim2.fromOffset(24, 24)
    u62.BackgroundColor3 = Color3.fromRGB(255, 45, 75)
    u62.Text = "0"
    u62.TextColor3 = Color3.new(1, 1, 1)
    u62.TextScaled = true
    u62.Font = Enum.Font.SourceSansBold
    u62.ZIndex = RewardsButton.ZIndex + 10
    u62.Visible = false
    u62.Parent = RewardsButton
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = u62
end

local function updatePlaytimeDisplay() -- Line: 78 -- upvalues: u52 (ref), u54 (ref), u62 (ref)
    local TimeLabel, v1, v2
    if not u52 then
        return
    end
    local v3 = 0
    for i, v in ipairs(u54) do
        v1 = u52[i]
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
    if u62 then
        u62.Visible = v3 > 0
        u62.Text = tostring(v3)
    end
end

local function setupPlaytimeGui() -- Line: 109
    -- upvalues: PlayerGui (val), createNotificationDot (val), u54 (ref), u43 (val), u55 (val), RewardEvent (val)
    -- upvalues: updatePlaytimeDisplay (val)
    local TimeLabel, v1
    local PlaytimeFrame = PlayerGui:WaitForChild("PlaytimeGui"):WaitForChild("PlaytimeFrame")
    local v2 = PlaytimeFrame:WaitForChild("Frame")
    local Close = PlaytimeFrame:FindFirstChild("Close")
    PlaytimeFrame.Visible = false
    createNotificationDot()
    u54 = {}
    for i, v in ipairs(u43) do
        v1 = v2:WaitForChild(v)
        local TextButton = v1:WaitForChild("TextButton")
        TimeLabel = v1:WaitForChild("TimeLabel")
        TextButton.Visible = false
        TimeLabel.Visible = true
        TimeLabel.Text = "..."
        TimeLabel.TextColor3 = Color3.new(1, 1, 1)
        u54[i] = {Frame = v1, ClaimButton = TextButton, TimeLabel = TimeLabel}
        u55[i] = false

        local function u85() -- Line: 128 -- upvalues: u55 (upval), i (val), TextButton (val), RewardEvent (upval)
            if u55[i] then
                return
            end
            u55[i] = true
            TextButton.Interactable = false
            TextButton.Text = "..."
            RewardEvent:FireServer("Claim", i)
        end

        if TextButton then
            local u86 = 0
            TextButton.Activated:Connect(function(...) -- Line: 33 -- upvalues: u86 (ref), u85 (val)
                local v1 = os.clock()
                if v1 - u86 < 0.1 then
                    return
                end
                u86 = v1
                u85(...)
            end)
        end
    end
    local RewardsButton = PlayerGui:FindFirstChild("RewardsButton", true)

    local function u40() -- Line: 137 -- upvalues: PlaytimeFrame (val), RewardEvent (upval)
        PlaytimeFrame.Visible = not PlaytimeFrame.Visible
        if PlaytimeFrame.Visible then
            RewardEvent:FireServer("RequestInitialState")
        end
    end

    if RewardsButton then
        local u42 = 0
        RewardsButton.Activated:Connect(function(...) -- Line: 33 -- upvalues: u42 (ref), u40 (val)
            local v1 = os.clock()
            if v1 - u42 < 0.1 then
                return
            end
            u42 = v1
            u40(...)
        end)
    end

    local function u48() -- Line: 143 -- upvalues: PlaytimeFrame (val)
        PlaytimeFrame.Visible = false
    end

    if Close then
        local u52 = 0
        Close.Activated:Connect(function(...) -- Line: 33 -- upvalues: u52 (ref), u48 (val)
            local v1 = os.clock()
            if v1 - u52 < 0.1 then
                return
            end
            u52 = v1
            u48(...)
        end)
    end
    updatePlaytimeDisplay()
end

local function startCountdown() -- Line: 149
    -- upvalues: u53 (ref), RunService (val), u52 (ref), updatePlaytimeDisplay (val)
    if u53 then
        return
    end
    RunService.Heartbeat:Connect(function(a1) -- Line: 151 -- upvalues: u52 (upval), updatePlaytimeDisplay (upval)
        local v1, v2
        if not u52 then
            return
        end
        for i, v in ipairs(u52) do
            if v > 0 then
                v1 = u52
                v2 = v - a1
                v1[i] = (math.max(0, v2))
            end
        end
        updatePlaytimeDisplay()
    end)
end

local function promptInvite() -- Line: 162 -- upvalues: SocialService (val), LocalPlayer (val)
    local success, err = pcall(function() -- Line: 163 -- upvalues: SocialService (upval), LocalPlayer (upval)
        return SocialService:CanSendGameInviteAsync(LocalPlayer)
    end)
    if success and err then
        pcall(function() -- Line: 167 -- upvalues: SocialService (upval), LocalPlayer (upval)
            SocialService:PromptGameInvite(LocalPlayer)
        end)
    end
end

local function styleButton(a1, a2) -- Line: 173
    a1.BackgroundColor3 = a2
    a1.BorderSizePixel = 0
    a1.TextColor3 = Color3.new(1, 1, 1)
    a1.TextScaled = true
    a1.Font = Enum.Font.FredokaOne
    a1.AutoButtonColor = true
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = a1
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(255, 255, 255)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.35
    UIStroke.Parent = a1
end

local function requestStreamAroundCharacter(a1) -- Line: 190 -- upvalues: LocalPlayer (val)
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
    task.spawn(function() -- Line: 194 -- upvalues: LocalPlayer (upval), Position (val)
        pcall(function() -- Line: 195 -- upvalues: LocalPlayer (upval), Position (upval)
            LocalPlayer:RequestStreamAroundAsync(Position, 2)
        end)
    end)
end

local function getCameraHumanoid(a1) -- Line: 201 -- upvalues: requestStreamAroundCharacter (val)
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

local function setSpectateButtonText(a1) -- Line: 213 -- upvalues: u61 (ref)
    if u61 then
        u61.Text = a1
    end
end

local function applyCameraSubject(a1) -- Line: 219 -- upvalues: Workspace (val)
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

local function stopSpectateMonitor() -- Line: 233 -- upvalues: u63 (ref)
    if u63 then
        u63:Disconnect()
        u63 = nil
    end
end

local function stopSpectating() -- Line: 240
    -- upvalues: u57 (ref), u63 (ref), LocalPlayer (val), requestStreamAroundCharacter (val), Workspace (val), u61 (ref)
    -- upvalues: u60 (ref), u56 (ref)
    local v1 = u57
    u57 = nil
    if u63 then
        u63:Disconnect()
        u63 = nil
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
    if u61 then
        u61.Text = "SPECTATE"
    end
    if u60 then
        u60.Text = u56 and u56.Parent and "Selected: " .. u56.DisplayName or "Select a player"
    end
    return v1
end

local function startSpectating(a1) -- Line: 252
    -- upvalues: LocalPlayer (val), u57 (ref), u61 (ref), u60 (ref), u63 (ref), RunService (val)
    -- upvalues: requestStreamAroundCharacter (val), Workspace (val), u56 (ref)
    if a1 and a1 ~= LocalPlayer and a1.Parent then
        u57 = a1
        if u61 then
            u61.Text = "STOP"
        end
        if u60 then
            u60.Text = ("Spectating: @%s / %s"):format(a1.Name, a1.DisplayName)
        end
        if u63 then
            u63:Disconnect()
            u63 = nil
        end
        local u22 = os.clock()
        local u23 = 0
        RunService.RenderStepped:Connect(function() -- Line: 265
            -- upvalues: u57 (upval), a1 (val), u63 (upval), LocalPlayer (upval), requestStreamAroundCharacter (upval)
            -- upvalues: Workspace (upval), u61 (upval), u60 (upval), u56 (upval), u22 (ref), u23 (ref)
            local v1, v2
            if u57 ~= a1 then
                return
            end
            if not a1.Parent then
                u57 = nil
                if u63 then
                    u63:Disconnect()
                    u63 = nil
                end
                local v3 = LocalPlayer
                local Character = v3 and v3.Character
                if Character then
                    requestStreamAroundCharacter(Character)
                end
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                v2 = if not Humanoid then nil else if not (0 < Humanoid.Health) then nil else Humanoid
                local CurrentCamera = Workspace.CurrentCamera
                if CurrentCamera and v2 then
                    if CurrentCamera.CameraType ~= Enum.CameraType.Custom then
                        CurrentCamera.CameraType = Enum.CameraType.Custom
                    end
                    if CurrentCamera.CameraSubject ~= v2 then
                        CurrentCamera.CameraSubject = v2
                    end
                end
                if u61 then
                    u61.Text = "SPECTATE"
                end
                if u60 then
                    u60.Text = u56 and u56.Parent and "Selected: " .. u56.DisplayName or "Select a player"
                end
                return
            end
            v2 = a1
            local Character_2 = v2 and v2.Character
            if Character_2 then
                requestStreamAroundCharacter(Character_2)
            end
            local Humanoid_2 = Character_2 and Character_2:FindFirstChildOfClass("Humanoid")
            if not (if not Humanoid_2 then nil else if not (0 < Humanoid_2.Health) then nil else Humanoid_2) then
                if 3 < os.clock() - u22 then
                    requestStreamAroundCharacter(a1.Character)
                end
                return
            end
            os.clock()
            if not (0.25 <= os.clock() - u23) then
                return
            end
            local CurrentCamera_2 = Workspace.CurrentCamera
            if CurrentCamera_2 and v1 then
                if CurrentCamera_2.CameraType ~= Enum.CameraType.Custom then
                    CurrentCamera_2.CameraType = Enum.CameraType.Custom
                end
                if CurrentCamera_2.CameraSubject ~= v1 then
                    CurrentCamera_2.CameraSubject = v1
                end
            end
            os.clock()
        end)
        task.spawn(function() -- Line: 285 -- upvalues: u57 (upval), a1 (val), requestStreamAroundCharacter (upval), Workspace (upval)
            local Character, CurrentCamera, Humanoid, v1, v2
            for i = 1, 40 do
                if u57 ~= a1 then
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

local function setSelectedTarget(a1) -- Line: 300 -- upvalues: u56 (ref), u60 (ref)
    u56 = a1
    if u60 then
        u60.Text = a1 and "Selected: " .. a1.DisplayName or "Select a player"
    end
end

local function createTrollGui() -- Line: 307
    -- upvalues: PlayerGui (val), u58 (ref), styleButton (val), u57 (ref), u63 (ref), LocalPlayer (val)
    -- upvalues: requestStreamAroundCharacter (val), Workspace (val), u61 (ref), u60 (ref), u56 (ref), u59 (ref)
    -- upvalues: startSpectating (val), TrollActionEvent (val)
    local TextButton_2
    local TrollMenuGui = PlayerGui:FindFirstChild("TrollMenuGui")
    if TrollMenuGui then
        u58 = TrollMenuGui
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
    Frame.Size = UDim2.fromScale(0.46, 0.58)
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
    TextLabel.Position = UDim2.fromScale(0.04, 0.03)
    TextLabel.Size = UDim2.fromScale(0.74, 0.09)
    TextLabel.Text = "TROLL MENU"
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Frame
    local TextButton = Instance.new("TextButton")
    TextButton.Name = "Close"
    TextButton.Position = UDim2.fromScale(0.84, 0.03)
    TextButton.Size = UDim2.fromScale(0.12, 0.095)
    TextButton.Text = "X"
    styleButton(TextButton, Color3.fromRGB(255, 70, 90))
    TextButton.Parent = Frame

    local function u95() -- Line: 357
        -- upvalues: Frame (val), u57 (upval), u63 (upval), LocalPlayer (upval), requestStreamAroundCharacter (upval)
        -- upvalues: Workspace (upval), u61 (upval), u60 (upval), u56 (upval)
        Frame.Visible = false
        u57 = nil
        if u63 then
            u63:Disconnect()
            u63 = nil
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
        if u61 then
            u61.Text = "SPECTATE"
        end
        if u60 then
            u60.Text = u56 and u56.Parent and "Selected: " .. u56.DisplayName or "Select a player"
        end
    end

    if TextButton then
        local u96 = 0
        TextButton.Activated:Connect(function(...) -- Line: 33 -- upvalues: u96 (ref), u95 (val)
            local v1 = os.clock()
            if v1 - u96 < 0.1 then
                return
            end
            u96 = v1
            u95(...)
        end)
    end
    u60 = Instance.new("TextLabel")
    u60.Name = "SelectedLabel"
    u60.BackgroundTransparency = 1
    u60.Position = UDim2.fromScale(0.06, 0.13)
    u60.Size = UDim2.fromScale(0.88, 0.055)
    u60.Text = "Select a player"
    u60.TextColor3 = Color3.fromRGB(255, 245, 160)
    u60.TextScaled = true
    u60.Font = Enum.Font.FredokaOne
    u60.Parent = Frame
    u59 = Instance.new("ScrollingFrame")
    u59.Name = "TargetList"
    u59.Position = UDim2.fromScale(0.06, 0.2)
    u59.Size = UDim2.fromScale(0.88, 0.43)
    u59.BackgroundColor3 = Color3.fromRGB(245, 248, 255)
    u59.BorderSizePixel = 0
    u59.ScrollBarThickness = 6
    u59.CanvasSize = UDim2.fromScale(0, 0)
    u59.Parent = Frame
    local UICorner_2 = Instance.new("UICorner")
    UICorner_2.CornerRadius = UDim.new(0, 8)
    UICorner_2.Parent = u59
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 6)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = u59
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 8)
    UIPadding.PaddingBottom = UDim.new(0, 8)
    UIPadding.PaddingLeft = UDim.new(0, 8)
    UIPadding.PaddingRight = UDim.new(0, 8)
    UIPadding.Parent = u59
    ;(UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function() -- Line: 395 -- upvalues: u59 (upval), UIListLayout (val)
        u59.CanvasSize = UDim2.fromOffset(0, UIListLayout.AbsoluteContentSize.Y + 16)
    end)
    u61 = Instance.new("TextButton")
    u61.Name = "Spectate"
    u61.Position = UDim2.fromScale(0.05, 0.655)
    u61.Size = UDim2.fromScale(0.9, 0.105)
    u61.Text = "SPECTATE"
    styleButton(u61, Color3.fromRGB(80, 170, 255))
    u61.Parent = Frame
    local v1 = u61

    local function u236() -- Line: 406
        -- upvalues: u57 (upval), u63 (upval), LocalPlayer (upval), requestStreamAroundCharacter (upval)
        -- upvalues: Workspace (upval), u61 (upval), u60 (upval), u56 (upval), startSpectating (upval)
        if not u57 then
            if not u56 then
                return
            end
            startSpectating(u56)
            return
        end
        u57 = nil
        if u63 then
            u63:Disconnect()
            u63 = nil
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
        if u61 then
            u61.Text = "SPECTATE"
        end
        if u60 then
            u60.Text = u56 and u56.Parent and "Selected: " .. u56.DisplayName or "Select a player"
        end
    end

    if v1 then
        local u237 = 0
        v1.Activated:Connect(function(...) -- Line: 33 -- upvalues: u237 (ref), u236 (val)
            local v1 = os.clock()
            if v1 - u237 < 0.1 then
                return
            end
            u237 = v1
            u236(...)
        end)
    end
    for i, v in ipairs({
        {Name = "Freeze", Color = Color3.fromRGB(80, 190, 255)},
        {Name = "Launch", Color = Color3.fromRGB(255, 155, 70)},
        {Name = "Spin", Color = Color3.fromRGB(170, 100, 255)},
        {Name = "Sparkles", Color = Color3.fromRGB(255, 80, 190)},
    }) do
        TextButton_2 = Instance.new("TextButton")
        TextButton_2.Name = v.Name
        TextButton_2.Position = UDim2.fromScale(0.045 + (i - 1) * 0.235, 0.79)
        TextButton_2.Size = UDim2.fromScale(0.22, 0.135)
        TextButton_2.Text = string.upper(v.Name)
        styleButton(TextButton_2, v.Color)
        TextButton_2.Parent = Frame

        local function u304() -- Line: 429 -- upvalues: u56 (upval), TrollActionEvent (upval), v (val)
            if u56 then
                TrollActionEvent:FireServer(v.Name, u56.UserId)
            end
        end

        if TextButton_2 then
            local u305 = 0
            TextButton_2.Activated:Connect(function(...) -- Line: 33 -- upvalues: u305 (ref), u304 (val)
                local v1 = os.clock()
                if v1 - u305 < 0.1 then
                    return
                end
                u305 = v1
                u304(...)
            end)
        end
    end
    u58 = ScreenGui
    return ScreenGui
end

local function refreshTargetList() -- Line: 440
    -- upvalues: createTrollGui (val), u59 (ref), Players (val), LocalPlayer (val), styleButton (val), u56 (ref)
    -- upvalues: u60 (ref), u57 (ref), u63 (ref), requestStreamAroundCharacter (val), Workspace (val), u61 (ref)
    local TextButton
    createTrollGui()
    for i, v in ipairs(u59:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end
    for i2, i3 in ipairs(Players:GetPlayers()) do
        if i3 ~= LocalPlayer then
            TextButton = Instance.new("TextButton")
            TextButton.Name = tostring(i3.UserId)
            TextButton.Size = UDim2.new(1, 0, 0, 48)
            TextButton.Text = i3.DisplayName .. " (@" .. i3.Name .. ")"
            styleButton(TextButton, Color3.fromRGB(70, 95, 170))
            TextButton.Parent = u59

            local function u117() -- Line: 455 -- upvalues: i3 (val), u56 (upval), u60 (upval)
                local v1 = i3
                u56 = v1
                if u60 then
                    u60.Text = v1 and "Selected: " .. v1.DisplayName or "Select a player"
                end
            end

            if TextButton then
                local u118 = 0
                TextButton.Activated:Connect(function(...) -- Line: 33 -- upvalues: u118 (ref), u117 (val)
                    local v1 = os.clock()
                    if v1 - u118 < 0.1 then
                        return
                    end
                    u118 = v1
                    u117(...)
                end)
            end
        end
    end
    if u56 and not u56.Parent then
        u56 = nil
        if u60 then
            u60.Text = "Select a player"
        end
        u57 = nil
        if u63 then
            u63:Disconnect()
            u63 = nil
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
        if u61 then
            u61.Text = "SPECTATE"
        end
        if u60 then
            u60.Text = u56 and u56.Parent and "Selected: " .. u56.DisplayName or "Select a player"
        end
    end
end

local function toggleTrollMenu() -- Line: 466
    -- upvalues: createTrollGui (val), refreshTargetList (val), u57 (ref), u63 (ref), LocalPlayer (val)
    -- upvalues: requestStreamAroundCharacter (val), Workspace (val), u61 (ref), u60 (ref), u56 (ref)
    local TrollFrame = createTrollGui():WaitForChild("TrollFrame")
    refreshTargetList()
    TrollFrame.Visible = not TrollFrame.Visible
    if not TrollFrame.Visible then
        u57 = nil
        if u63 then
            u63:Disconnect()
            u63 = nil
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
        if u61 then
            u61.Text = "SPECTATE"
        end
        if u60 then
            u60.Text = u56 and u56.Parent and "Selected: " .. u56.DisplayName or "Select a player"
        end
    end
end

RewardEvent.OnClientEvent:Connect(function(a1, a2) -- Line: 476
    -- upvalues: u52 (ref), u55 (val), updatePlaytimeDisplay (val), u53 (ref), RunService (val)
    if a1 == "UpdateState" and type(a2) == "table" then
        u52 = a2
        for i in ipairs(u55) do
            u55[i] = false
        end
        updatePlaytimeDisplay()
        if u53 then
            return
        end
        RunService.Heartbeat:Connect(function(a1) -- Line: 151 -- upvalues: u52 (upval), updatePlaytimeDisplay (upval)
            local v1, v2
            if not u52 then
                return
            end
            for i, v in ipairs(u52) do
                if v > 0 then
                    v1 = u52
                    v2 = v - a1
                    v1[i] = (math.max(0, v2))
                end
            end
            updatePlaytimeDisplay()
        end)
    end
end)
setupPlaytimeGui()
local Invite = (((PlayerGui:WaitForChild("Main2")):WaitForChild("Right")):WaitForChild("Tools")):WaitForChild("Invite")
if Invite then
    local u107 = 0
    Invite.Activated:Connect(function(...) -- Line: 33 -- upvalues: u107 (ref), promptInvite (val)
        local v1 = os.clock()
        if v1 - u107 < 0.1 then
            return
        end
        u107 = v1
        promptInvite(...)
    end)
end
local Troll = (((PlayerGui:WaitForChild("Main2")):WaitForChild("Right")):WaitForChild("Tools")):WaitForChild("Troll")
if Troll then
    local u130 = 0
    Troll.Activated:Connect(function(...) -- Line: 33 -- upvalues: u130 (ref), toggleTrollMenu (val)
        local v1 = os.clock()
        if v1 - u130 < 0.1 then
            return
        end
        u130 = v1
        toggleTrollMenu(...)
    end)
end
Players.PlayerAdded:Connect(refreshTargetList)
Players.PlayerRemoving:Connect(refreshTargetList)
LocalPlayer.CharacterAdded:Connect(function() -- Line: 492 -- upvalues: u57 (ref), stopSpectating (val)
    if not u57 then
        task.defer(stopSpectating)
    end
end)
RewardEvent:FireServer("RequestInitialState")