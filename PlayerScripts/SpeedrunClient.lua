-- Path: Players.Drrrrrrrrragonball.PlayerScripts.SpeedrunClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.SpeedrunClient
-- Decompile time: 20.25 ms

local u148
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Speedrun = ReplicatedStorage:WaitForChild("Speedrun")
local SpeedrunConfig = require(Speedrun:WaitForChild("SpeedrunConfig"))
local SpeedrunStageEvent = Speedrun:WaitForChild("SpeedrunStageEvent")
local SpeedrunStageReady = Speedrun:WaitForChild("SpeedrunStageReady")
local SpeedrunStartLine = Speedrun:WaitForChild("SpeedrunStartLine")
local SpeedrunFinishStage = Speedrun:WaitForChild("SpeedrunFinishStage")
local SpeedrunLeaveRequest = Speedrun:WaitForChild("SpeedrunLeaveRequest")
local RequestDevProductPrompt = ReplicatedStorage:WaitForChild("RequestDevProductPrompt")
local Button = (ReplicatedStorage:WaitForChild("Buttons")):WaitForChild("Button")
local v1 = workspace:WaitForChild("StartPart8")
local Prize = v1:WaitForChild("Prize")
local SurfaceGui = v1:WaitForChild("SurfaceGui")
local Cooldown = v1:WaitForChild("Cooldown")
local u94 = Cooldown:WaitForChild("TextLabel")

local function updateCooldownDisplay() -- Line: 28
    -- upvalues: LocalPlayer (val), Prize (val), SurfaceGui (val), Cooldown (val), u94 (val)
    local v1
    local v2 = math.max(0, (math.floor((tonumber((LocalPlayer:GetAttribute("SpeedrunCooldownEndsAt")))) or 0)) - (os.time()))
    Prize.Enabled = not (v2 > 0)
    SurfaceGui.Enabled = not v1
    Cooldown.Enabled = v1
    if v1 then
        u94.Text = ("Cooldown - %02d:%02d"):format(math.floor(v2 / 60), v2 % 60)
    end
end

;(LocalPlayer:GetAttributeChangedSignal("SpeedrunCooldownEndsAt")):Connect(updateCooldownDisplay)
task.spawn(function() -- Line: 43 -- upvalues: LocalPlayer (val), updateCooldownDisplay (val)
    while LocalPlayer.Parent do
        updateCooldownDisplay()
        task.wait(1)
    end
end)
local v2 = workspace:FindFirstChild("LocalSpeedrun_" .. (tostring(LocalPlayer.UserId)))
if v2 then
    v2:Destroy()
end
local u122 = Instance.new("Folder")
u122.Name = "LocalSpeedrun_" .. tostring(LocalPlayer.UserId)
u122.Parent = workspace
local u130 = nil
local u131 = nil
local u132 = nil
local u133 = false
local u134 = {}
local u135 = nil
local Sky = Lighting:FindFirstChild("Sky")
if not Sky or not Sky:IsA("Sky") then
    u148 = nil
else
    u148 = Sky:Clone()
    if not u148 then
        u148 = nil
    end
end
local u149 = 0
local u150 = nil
local u151 = 0
local v3 = PlayerGui:FindFirstChild("SpeedrunActionGui")
if v3 then
    v3:Destroy()
end
local u166 = Instance.new("ScreenGui")
u166.Name = "SpeedrunActionGui"
u166.DisplayOrder = 90
u166.IgnoreGuiInset = false
u166.ResetOnSpawn = false
u166.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
u166.Enabled = false
u166.Parent = PlayerGui
local u177 = Instance.new("Frame")
u177.Name = "TopActions"
u177.AnchorPoint = Vector2.new(0.5, 0)
u177.Position = UDim2.new(0.5, 0, 0, 10)
u177.Size = UDim2.fromOffset(420, 46)
u177.BackgroundTransparency = 1
u177.ZIndex = 90
u177.Parent = u166
local UIScale = Instance.new("UIScale")
UIScale.Name = "ResponsiveScale"
UIScale.Parent = u177
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0, 12)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = u177

local function updateActionScale() -- Line: 105 -- upvalues: UIScale (val)
    local CurrentCamera = workspace.CurrentCamera
    UIScale.Scale = math.clamp((CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)).X / 900, 0.72, 1)
end

local CurrentCamera = workspace.CurrentCamera
UIScale.Scale = math.clamp((CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)).X / 900, 0.72, 1)
;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(updateActionScale)
if workspace.CurrentCamera then
    (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateActionScale)
end

local function configureActionButton(a1, a2, a3) -- Line: 117 -- upvalues: Button (val), u177 (val)
    local v1 = Button:Clone()
    v1.Name = a1
    v1.LayoutOrder = a3
    v1.Size = UDim2.fromOffset(204, 42)
    v1.Visible = true
    v1.ZIndex = 91
    local TextLabel = v1:FindFirstChild("TextLabel")
    if TextLabel and TextLabel:IsA("TextLabel") then
        TextLabel.Text = a2
        TextLabel.ZIndex = 92
    end
    for i, v in ipairs(v1:GetDescendants()) do
        if v:IsA("GuiObject") then
            v.ZIndex = math.max(v.ZIndex, 92)
        end
    end
    v1.Parent = u177
    return v1
end

local u265 = configureActionButton("LeaveObbyButton", "LEAVE OBBY", 1)
local UIGradient = u265:FindFirstChildOfClass("UIGradient")
if UIGradient then
    UIGradient.Name = "LeaveRedGradient"
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 95, 95)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 0, 0))),
    })
    UIGradient.Rotation = 90
end
local u296 = configureActionButton("SkipStageButton", "SKIP STAGE", 2)
task.spawn(function() -- Line: 150 -- upvalues: MarketplaceService (val), u296 (val)
    local success, err = pcall(function() -- Line: 151 -- upvalues: MarketplaceService (upval)
        return MarketplaceService:GetProductInfo(3665045410, Enum.InfoType.Product)
    end)
    local v1 = success and type(err) == "table" and math.floor((tonumber(err.PriceInRobux)) or 0) or 0
    local v2 = u296:FindFirstChild("TextLabel")
    if v1 > 0 and v2 and v2:IsA("TextLabel") then
        v2.Text = ("SKIP STAGE - %d R$"):format(v1)
    end
end)

local function updateActionButtons() -- Line: 161
    -- upvalues: LocalPlayer (val), u131 (ref), u166 (val), u265 (val), u296 (val)
    local v1 = false
    if LocalPlayer:GetAttribute("SpeedrunActive") == true then
        v1 = u131 ~= nil
    end
    u166.Enabled = v1
    u265.Visible = v1
    u296.Visible = v1
end

local u328 = false
u265.Activated:Connect(function() -- Line: 169 -- upvalues: u328 (ref), u166 (val), SpeedrunLeaveRequest (val)
    if not u328 and u166.Enabled then
        u328 = true
        SpeedrunLeaveRequest:FireServer()
        task.delay(1, function() -- Line: 173 -- upvalues: u328 (upval)
            u328 = false
        end)
        return
    end
end)
local u342 = false
u296.Activated:Connect(function() -- Line: 179 -- upvalues: u342 (ref), u166 (val), RequestDevProductPrompt (val)
    if not u342 and u166.Enabled then
        u342 = true
        RequestDevProductPrompt:FireServer(3665045410)
        task.delay(1.5, function() -- Line: 183 -- upvalues: u342 (upval)
            u342 = false
        end)
        return
    end
end)

local function disconnectTouches() -- Line: 188 -- upvalues: u134 (val)
    for i, v in ipairs(u134) do
        v:Disconnect()
    end
    table.clear(u134)
end

local function destroyCurrentMap() -- Line: 195 -- upvalues: u134 (val), u130 (ref), u132 (ref)
    for i, v in ipairs(u134) do
        v:Disconnect()
    end
    table.clear(u134)
    if u130 then
        u130:Destroy()
        u130 = nil
    end
    u132 = nil
end

local function captureOriginalSkies() -- Line: 204 -- upvalues: u135 (ref), Lighting (val)
    if u135 then
        return
    end
    u135 = {}
    for i, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            table.insert(u135, (v:Clone()))
        end
    end
end

local function removeLightingSkies() -- Line: 214 -- upvalues: Lighting (val)
    for i, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            v:Destroy()
        end
    end
end

local function applyStageSky(a1) -- Line: 222
    -- upvalues: captureOriginalSkies (val), removeLightingSkies (val), Speedrun (val), Lighting (val)
    captureOriginalSkies()
    removeLightingSkies()
    local v1 = Speedrun:FindFirstChild("Skybox" .. (tostring(a1)))
    if v1 and v1:IsA("Sky") then
        local v2 = v1:Clone()
        v2.Name = "SpeedrunSky"
        v2.Parent = Lighting
    end
end

local function restoreOriginalSkies() -- Line: 233
    -- upvalues: removeLightingSkies (val), u135 (ref), Lighting (val), u148 (val)
    local v1
    removeLightingSkies()
    local v2 = false
    local v3 = ipairs
    for i, v in v3(u135 or {}) do
        v1 = v:Clone()
        v1.Parent = Lighting
        v2 = v2 or v1.Name == "Sky"
    end
    if not v2 and u148 then
        v3 = u148:Clone()
        v3.Name = "Sky"
        v3.Parent = Lighting
    end
    u135 = nil
end

local function stopStageMusic() -- Line: 249 -- upvalues: u150 (ref)
    if not u150 then
        return
    end
    u150:Stop()
    u150:Destroy()
    u150 = nil
end

local function playStageMusic(a1) -- Line: 256 -- upvalues: u150 (ref), SpeedrunConfig (val), SoundService (val)
    if u150 then
        u150:Stop()
        u150:Destroy()
        u150 = nil
    end
    local MusicIds = SpeedrunConfig.MusicIds and SpeedrunConfig.MusicIds[a1]
    if not MusicIds then
        return
    end
    local Sound = Instance.new("Sound")
    Sound.Name = "SpeedrunStageMusic"
    Sound.SoundId = "rbxassetid://" .. tostring(MusicIds)
    Sound.Volume = SpeedrunConfig.MusicVolume or 0.35
    Sound.Looped = true
    Sound.Parent = SoundService
    u150 = Sound
    Sound:Play()
end

local function isCharacterTouch(a1) -- Line: 271 -- upvalues: LocalPlayer (val)
    local Character = LocalPlayer.Character
    local v1 = false
    if Character ~= nil then
        v1 = false
        if a1 ~= nil then
            v1 = a1:IsDescendantOf(Character)
        end
    end
    return v1
end

local function alignCameraBehindCharacter(a1, a2) -- Line: 276 -- upvalues: u151 (ref), LocalPlayer (val)
    u151 = u151 + 1
    local u4 = u151

    local function applyCameraDirection() -- Line: 279
        -- upvalues: u4 (val), u151 (upval), a1 (val), LocalPlayer (upval), a2 (val)
        if u4 == u151 and a1 == LocalPlayer.Character and a2.Parent then
            local CurrentCamera = workspace.CurrentCamera
            local Humanoid = a1:FindFirstChildOfClass("Humanoid")
            if CurrentCamera and Humanoid then
                local v1 = a2.Position - a2.CFrame.LookVector * 8 + Vector3.new(0, 4, 0)
                local v2 = a2.Position + Vector3.new(0, 2, 0)
                CurrentCamera.CameraSubject = Humanoid
                CurrentCamera.CameraType = Enum.CameraType.Custom
                CurrentCamera.CFrame = CFrame.lookAt(v1, v2)
                CurrentCamera.Focus = CFrame.new(v2)
                return
            end
            return
        end
    end

    applyCameraDirection()
    task.delay(0.05, applyCameraDirection)
end

local function teleportToStageStart() -- Line: 296 -- upvalues: LocalPlayer (val), u132 (ref), u151 (ref)
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    if Character and HumanoidRootPart and u132 then
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        Character:PivotTo(u132)
        u151 = u151 + 1
        local u18 = u151

        local function applyCameraDirection() -- Line: 279
            -- upvalues: u18 (val), u151 (upval), Character (val), LocalPlayer (upval), HumanoidRootPart (val)
            if u18 == u151 and Character == LocalPlayer.Character and HumanoidRootPart.Parent then
                local CurrentCamera = workspace.CurrentCamera
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                if CurrentCamera and Humanoid then
                    local v1 = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * 8 + Vector3.new(0, 4, 0)
                    local v2 = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                    CurrentCamera.CameraSubject = Humanoid
                    CurrentCamera.CameraType = Enum.CameraType.Custom
                    CurrentCamera.CFrame = CFrame.lookAt(v1, v2)
                    CurrentCamera.Focus = CFrame.new(v2)
                    return
                end
                return
            end
        end

        applyCameraDirection()
        task.delay(0.05, applyCameraDirection)
        return
    end
end

local function connectKillPart(a1) -- Line: 306 -- upvalues: u134 (val), LocalPlayer (val), u132 (ref), u151 (ref)
    a1.CanTouch = true
    local u2 = false
    table.insert(u134, (a1.Touched:Connect(function(a1) -- Line: 309 -- upvalues: u2 (ref), LocalPlayer (upval), u132 (upval), u151 (upval)
        if not u2 then
            local Character_2 = LocalPlayer.Character
            local v1 = false
            if Character_2 ~= nil then
                v1 = false
                if a1 ~= nil then
                    v1 = a1:IsDescendantOf(Character_2)
                end
            end
            if v1 then
                u2 = true
                local Character = LocalPlayer.Character
                local HumanoidRootPart = Character
                if HumanoidRootPart then
                    HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                end
                if Character and HumanoidRootPart and u132 then
                    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    Character:PivotTo(u132)
                    u151 = u151 + 1
                    local u31 = u151

                    local function applyCameraDirection() -- Line: 279
                        -- upvalues: u31 (val), u151 (upval), Character (val), LocalPlayer (upval)
                        -- upvalues: HumanoidRootPart (val)
                        if u31 == u151 and Character == LocalPlayer.Character and HumanoidRootPart.Parent then
                            local CurrentCamera = workspace.CurrentCamera
                            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                            if CurrentCamera and Humanoid then
                                local v1 = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * 8 + Vector3.new(0, 4, 0)
                                local v2 = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                                CurrentCamera.CameraSubject = Humanoid
                                CurrentCamera.CameraType = Enum.CameraType.Custom
                                CurrentCamera.CFrame = CFrame.lookAt(v1, v2)
                                CurrentCamera.Focus = CFrame.new(v2)
                                return
                            end
                            return
                        end
                    end

                    applyCameraDirection()
                    task.delay(0.05, applyCameraDirection)
                end
                task.delay(0.45, function() -- Line: 313 -- upvalues: u2 (upval)
                    u2 = false
                end)
                return
            end
        end
    end)))
end

local function connectStartLine(a1, a2) -- Line: 319
    -- upvalues: u134 (val), u131 (ref), LocalPlayer (val), SpeedrunStartLine (val)
    a1.CanTouch = true
    local u3 = false
    table.insert(u134, (a1.Touched:Connect(function(a1) -- Line: 322 -- upvalues: u3 (ref), u131 (upval), a2 (val), LocalPlayer (upval), SpeedrunStartLine (upval)
        if not u3 and u131 == a2 then
            local Character = LocalPlayer.Character
            local v1 = false
            if Character ~= nil then
                v1 = false
                if a1 ~= nil then
                    v1 = a1:IsDescendantOf(Character)
                end
            end
            if v1 then
                u3 = true
                SpeedrunStartLine:FireServer(a2)
                task.delay(0.75, function() -- Line: 328 -- upvalues: u3 (upval)
                    u3 = false
                end)
                return
            end
        end
    end)))
end

local function connectEndPortal(a1, a2) -- Line: 334
    -- upvalues: u134 (val), u133 (ref), u131 (ref), LocalPlayer (val), SpeedrunConfig (val), u166 (val), u265 (val)
    -- upvalues: u296 (val), SpeedrunFinishStage (val)
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanTouch = true
            table.insert(u134, (v.Touched:Connect(function(a1) -- Line: 338
                -- upvalues: u133 (upval), u131 (upval), a2 (val), LocalPlayer (upval), SpeedrunConfig (upval)
                -- upvalues: u166 (upval), u265 (upval), u296 (upval), SpeedrunFinishStage (upval)
                if not u133 and u131 == a2 then
                    local Character = LocalPlayer.Character
                    local v1 = false
                    if Character ~= nil then
                        v1 = false
                        if a1 ~= nil then
                            v1 = a1:IsDescendantOf(Character)
                        end
                    end
                    if v1 then
                        u133 = true
                        if a2 == SpeedrunConfig.LevelCount then
                            u166.Enabled = false
                            u265.Visible = false
                            u296.Visible = false
                        end
                        SpeedrunFinishStage:FireServer(a2)
                        if a2 == 1 then
                            for i, v in ipairs({0.25, 0.65, 1.1}) do
                                task.delay(v, function() -- Line: 354 -- upvalues: u133 (upval), u131 (upval), a2 (upval), SpeedrunFinishStage (upval)
                                    if u133 and u131 == a2 then
                                        SpeedrunFinishStage:FireServer(a2)
                                    end
                                end)
                            end
                        end
                        task.delay(1.5, function() -- Line: 361 -- upvalues: u131 (upval), a2 (upval), u133 (upval)
                            if u131 == a2 then
                                u133 = false
                            end
                        end)
                        return
                    end
                end
            end)))
        end
    end
end

local function loadStage(a1) -- Line: 371
    -- upvalues: SpeedrunConfig (val), u149 (ref), u133 (ref), u134 (val), u130 (ref), u132 (ref), u131 (ref)
    -- upvalues: LocalPlayer (val), u166 (val), u265 (val), u296 (val), captureOriginalSkies (val)
    -- upvalues: removeLightingSkies (val), Speedrun (val), Lighting (val), playStageMusic (val), u122 (ref), u151 (ref)
    -- upvalues: SpeedrunStartLine (val), connectEndPortal (val), SpeedrunStageReady (val)
    local u6 = math.floor((tonumber(a1.stage)) or 0)
    if not (u6 < 1) and not (SpeedrunConfig.LevelCount < u6) then
        local v1
        u149 = u149 + 1
        local u12 = u149
        u133 = false
        for i, v in ipairs(u134) do
            v:Disconnect()
        end
        table.clear(u134)
        if u130 then
            u130:Destroy()
            u130 = nil
        end
        u132 = nil
        u131 = u6
        local v2 = false
        if LocalPlayer:GetAttribute("SpeedrunActive") == true then
            v2 = u131 ~= nil
        end
        u166.Enabled = v2
        u265.Visible = v2
        u296.Visible = v2
        captureOriginalSkies()
        removeLightingSkies()
        v2 = Speedrun:FindFirstChild("Skybox" .. (tostring(u6)))
        if v2 and v2:IsA("Sky") then
            v1 = v2:Clone()
            v1.Name = "SpeedrunSky"
            v1.Parent = Lighting
        end
        playStageMusic(u6)
        v2 = Speedrun:FindFirstChild("Level" .. (tostring(u6)))
        if v2 and v2:IsA("Model") then
            v1 = v2:Clone()
            for i2, i3 in ipairs(v1:GetDescendants()) do
                if i3:IsA("LuaSourceContainer") then
                    i3:Destroy()
                elseif i3:IsA("BasePart") then
                    i3.Anchored = true
                    i3.CanTouch = false
                    if i3:IsA("SpawnLocation") then
                        i3.Enabled = false
                    end
                end
            end
            if u12 ~= u149 then
                v1:Destroy()
                return
            end
            v1:PivotTo(not (typeof(a1.zonePivot) ~= "CFrame") and a1.zonePivot or SpeedrunConfig.ZonePivot)
            v1.Name = "CurrentLevel" .. tostring(u6)
            v1.Parent = u122
            u130 = v1
            v2 = v1:FindFirstChild("SpawnLocation", true)
            if not v2 or not v2:IsA("BasePart") then
                warn("SpeedrunClient: Level" .. (tostring(u6)) .. " has no SpawnLocation")
            else
                u132 = v2.CFrame + Vector3.new(0, SpeedrunConfig.StartHeightOffset, 0)
            end
            for i4, j in ipairs(v1:GetDescendants()) do
                if j:IsA("BasePart") and string.find(string.lower(j.Name), "kill", 1, true) then
                    j.CanTouch = true
                    local u259 = false
                    table.insert(u134, (j.Touched:Connect(function(a1) -- Line: 309 -- upvalues: u259 (ref), LocalPlayer (upval), u132 (upval), u151 (upval)
                        if not u259 then
                            local Character_2 = LocalPlayer.Character
                            local v1 = false
                            if Character_2 ~= nil then
                                v1 = false
                                if a1 ~= nil then
                                    v1 = a1:IsDescendantOf(Character_2)
                                end
                            end
                            if v1 then
                                u259 = true
                                local Character = LocalPlayer.Character
                                local HumanoidRootPart = Character
                                if HumanoidRootPart then
                                    HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                                end
                                if Character and HumanoidRootPart and u132 then
                                    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                    HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                    Character:PivotTo(u132)
                                    u151 = u151 + 1
                                    local u31 = u151

                                    local function applyCameraDirection() -- Line: 279
                                        -- upvalues: u31 (val), u151 (upval), Character (val), LocalPlayer (upval)
                                        -- upvalues: HumanoidRootPart (val)
                                        if u31 == u151
                                            and Character == LocalPlayer.Character
                                            and HumanoidRootPart.Parent then
                                            local CurrentCamera = workspace.CurrentCamera
                                            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                                            if CurrentCamera and Humanoid then
                                                local v1 = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * 8 + Vector3.new(0, 4, 0)
                                                local v2 = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                                                CurrentCamera.CameraSubject = Humanoid
                                                CurrentCamera.CameraType = Enum.CameraType.Custom
                                                CurrentCamera.CFrame = CFrame.lookAt(v1, v2)
                                                CurrentCamera.Focus = CFrame.new(v2)
                                                return
                                            end
                                            return
                                        end
                                    end

                                    applyCameraDirection()
                                    task.delay(0.05, applyCameraDirection)
                                end
                                task.delay(0.45, function() -- Line: 313 -- upvalues: u259 (upval)
                                    u259 = false
                                end)
                                return
                            end
                        end
                    end)))
                end
            end
            v2 = v1:FindFirstChild("Start line", true)
            if not v2 or not v2:IsA("BasePart") then
                warn("SpeedrunClient: Level" .. (tostring(u6)) .. " has no Start line")
            else
                v2.CanTouch = true
                local u192 = false
                table.insert(u134, (v2.Touched:Connect(function(a1) -- Line: 322
                    -- upvalues: u192 (ref), u131 (upval), u6 (val), LocalPlayer (upval), SpeedrunStartLine (upval)
                    if not u192 and u131 == u6 then
                        local Character = LocalPlayer.Character
                        local v1 = false
                        if Character ~= nil then
                            v1 = false
                            if a1 ~= nil then
                                v1 = a1:IsDescendantOf(Character)
                            end
                        end
                        if v1 then
                            u192 = true
                            SpeedrunStartLine:FireServer(u6)
                            task.delay(0.75, function() -- Line: 328 -- upvalues: u192 (upval)
                                u192 = false
                            end)
                            return
                        end
                    end
                end)))
            end
            v2 = v1:FindFirstChild("End Portal", true)
            if not v2 or not v2:IsA("Model") then
                warn("SpeedrunClient: Level" .. (tostring(u6)) .. " has no End Portal model")
            else
                connectEndPortal(v2, u6)
            end
            task.defer(function() -- Line: 441
                -- upvalues: u131 (upval), u6 (val), u12 (val), u149 (upval), LocalPlayer (upval), u132 (upval)
                -- upvalues: u151 (upval), SpeedrunStageReady (upval)
                if u131 == u6 and u12 == u149 then
                    local Character = LocalPlayer.Character
                    local HumanoidRootPart = Character
                    if HumanoidRootPart then
                        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    end
                    if Character and HumanoidRootPart and u132 then
                        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        Character:PivotTo(u132)
                        u151 = u151 + 1
                        local u22 = u151

                        local function applyCameraDirection() -- Line: 279
                            -- upvalues: u22 (val), u151 (upval), Character (val), LocalPlayer (upval)
                            -- upvalues: HumanoidRootPart (val)
                            if u22 == u151 and Character == LocalPlayer.Character and HumanoidRootPart.Parent then
                                local CurrentCamera = workspace.CurrentCamera
                                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                                if CurrentCamera and Humanoid then
                                    local v1 = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * 8 + Vector3.new(0, 4, 0)
                                    local v2 = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                                    CurrentCamera.CameraSubject = Humanoid
                                    CurrentCamera.CameraType = Enum.CameraType.Custom
                                    CurrentCamera.CFrame = CFrame.lookAt(v1, v2)
                                    CurrentCamera.Focus = CFrame.new(v2)
                                    return
                                end
                                return
                            end
                        end

                        applyCameraDirection()
                        task.delay(0.05, applyCameraDirection)
                    end
                    SpeedrunStageReady:FireServer(u6)
                    return
                end
            end)
            return
        end
        warn("SpeedrunClient: missing Level" .. tostring(u6))
        return
    end
end

local u489 = nil
local u490 = nil
local u491 = nil
local u492 = {}
local u493 = nil

local function isToggleVisual(a1) -- Line: 456
    return a1:IsA("ParticleEmitter") or a1:IsA("Trail") or a1:IsA("Beam") or a1:IsA("Smoke") or a1:IsA("Fire") or a1:IsA("Sparkles") or a1:IsA("BillboardGui") or a1:IsA("SurfaceGui")
end

local function restoreVisualState(a1) -- Line: 467
    if not a1 then
        return
    end
    local v1 = pairs
    local partModifiers = a1.partModifiers or {}
    for k, v in v1(partModifiers) do
        if k.Parent then
            k.LocalTransparencyModifier = v
        end
    end
    v1 = pairs
    local enabledValues = a1.enabledValues or {}
    for k2, i in v1(enabledValues) do
        if k2.Parent then
            k2.Enabled = i
        end
    end
end

local function hideModelVisuals(a1) -- Line: 481 -- upvalues: isToggleVisual (val)
    local v1 = {model = a1, partModifiers = {}, enabledValues = {}}
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("BasePart") then
            v1.partModifiers[v] = v.LocalTransparencyModifier
            v.LocalTransparencyModifier = 1
        elseif isToggleVisual(v) then
            v1.enabledValues[v] = v.Enabled
            v.Enabled = false
        end
    end
    return v1
end

local function setCurrentMapHidden(a1) -- Line: 499
    -- upvalues: u491 (ref), u130 (ref), restoreVisualState (val), hideModelVisuals (val)
    if u491 and u491.model ~= u130 then
        restoreVisualState(u491)
        u491 = nil
    end
    if not a1 then
        if u491 then
            restoreVisualState(u491)
            u491 = nil
        end
        return
    end
    if u130 and not u491 then
        hideModelVisuals(u130)
        return
    end
end

local function destroySpectateMap() -- Line: 514 -- upvalues: u489 (ref), u490 (ref)
    if u489 then
        u489:Destroy()
        u489 = nil
    end
    u490 = nil
end

local function buildSpectateMap(a1) -- Line: 522
    -- upvalues: u489 (ref), u490 (ref), Speedrun (val), SpeedrunConfig (val), u122 (ref)
    if u489 and u490 == a1 then
        return
    end
    if u489 then
        u489:Destroy()
        u489 = nil
    end
    u490 = nil
    local v1 = Speedrun:FindFirstChild("Level" .. (tostring(a1)))
    if v1 and v1:IsA("Model") then
        local v2 = v1:Clone()
        v2.Name = "SpectatedLevel" .. tostring(a1)
        for i, v in ipairs(v2:GetDescendants()) do
            if v:IsA("LuaSourceContainer") then
                v:Destroy()
            elseif v:IsA("BasePart") then
                v.Anchored = true
                v.CanCollide = false
                v.CanTouch = false
                v.CanQuery = false
                if v:IsA("SpawnLocation") then
                    v.Enabled = false
                end
            end
        end
        v2:PivotTo(SpeedrunConfig.ZonePivot)
        v2.Parent = u122
        u489 = v2
        u490 = a1
        return
    end
end

local function restoreCharacterVisibility(a1) -- Line: 554 -- upvalues: u492 (val), restoreVisualState (val)
    local v1 = u492[a1]
    if a1:GetAttribute("ObbyTimeHackerHiddenLocally") == true then
        return
    end
    if v1 then
        u492[a1] = nil
        restoreVisualState(v1)
    end
    local Character = a1.Character
    if Character then
        if not v1 then
            for i, v in ipairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.LocalTransparencyModifier = 0
                end
            end
        elseif Character == v1.character then
            for i2, i3 in ipairs(Character:GetDescendants()) do
                if i3:IsA("BasePart") then
                    i3.LocalTransparencyModifier = 0
                end
            end
        end
    end
    local humanoid = v1 and v1.humanoid or Character and Character:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Parent then
        if v1 and humanoid == v1.humanoid then
            humanoid.DisplayDistanceType = v1.displayDistanceType
            humanoid.HealthDisplayType = v1.healthDisplayType
            return
        end
        humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
        humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.DisplayWhenDamaged
    end
end

local function hideCharacter(a1) -- Line: 593
    -- upvalues: u492 (val), restoreCharacterVisibility (val), isToggleVisual (val)
    local Character = a1.Character
    local v1 = u492[a1]
    if v1 and v1.character ~= Character then
        restoreCharacterVisibility(a1)
        v1 = nil
    end
    if not Character then
        return
    end
    if not v1 then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local v2 = {character = Character}
        v2.partModifiers = {}
        v2.enabledValues = {}
        v2.humanoid = Humanoid
        v2.displayDistanceType = Humanoid and Humanoid.DisplayDistanceType or Enum.HumanoidDisplayDistanceType.Viewer
        v2.healthDisplayType = Humanoid and Humanoid.HealthDisplayType or Enum.HumanoidHealthDisplayType.DisplayWhenDamaged
        u492[a1] = v2
    end
    for i, v in ipairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            if v1.partModifiers[v] == nil then
                v1.partModifiers[v] = v.LocalTransparencyModifier
            end
            v.LocalTransparencyModifier = 1
        elseif isToggleVisual(v) then
            if v1.enabledValues[v] == nil then
                v1.enabledValues[v] = v.Enabled
            end
            v.Enabled = false
        end
    end
    local humanoid = v1.humanoid
    if humanoid and humanoid.Parent then
        humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
    end
end

local function getPlayerStage(a1) -- Line: 636 -- upvalues: SpeedrunConfig (val)
    if not (a1 and a1:GetAttribute("SpeedrunActive") == true) then
        return nil, false
    end
    local v1 = math.floor((tonumber((a1:GetAttribute("SpeedrunLevel")))) or 0)
    if not (v1 < 1) and not (SpeedrunConfig.LevelCount < v1) then
        return v1, true
    end
    return nil, true
end

local function getSpectateState() -- Line: 648 -- upvalues: LocalPlayer (val), Players (val), getPlayerStage (val)
    local v1 = math.floor((tonumber((LocalPlayer:GetAttribute("LocalSpectateTargetUserId")))) or 0)
    if v1 <= 0 then
        return nil, nil, false
    end
    local PlayerByUserId = Players:GetPlayerByUserId(v1)
    if PlayerByUserId and PlayerByUserId ~= LocalPlayer then
        return PlayerByUserId, (select(1, getPlayerStage(PlayerByUserId))), true
    end
    return nil, nil, false
end

local function restoreLocalStagePresentation() -- Line: 661
    -- upvalues: u131 (ref), captureOriginalSkies (val), removeLightingSkies (val), Speedrun (val), Lighting (val)
    -- upvalues: playStageMusic (val), restoreOriginalSkies (val), u150 (ref)
    if not u131 then
        restoreOriginalSkies()
        if not u150 then
            return
        end
        u150:Stop()
        u150:Destroy()
        u150 = nil
        return
    end
    local v1 = u131
    captureOriginalSkies()
    removeLightingSkies()
    local v2 = Speedrun:FindFirstChild("Skybox" .. (tostring(v1)))
    if v2 and v2:IsA("Sky") then
        local v3 = v2:Clone()
        v3.Name = "SpeedrunSky"
        v3.Parent = Lighting
    end
    playStageMusic(u131)
end

local function refreshSpeedrunView() -- Line: 671
    -- upvalues: getSpectateState (val), u131 (ref), u493 (ref), captureOriginalSkies (val), removeLightingSkies (val)
    -- upvalues: Speedrun (val), Lighting (val), playStageMusic (val), restoreOriginalSkies (val), u150 (ref)
    -- upvalues: u130 (ref), u491 (ref), restoreVisualState (val), hideModelVisuals (val), buildSpectateMap (val)
    -- upvalues: u489 (ref), u490 (ref), Players (val), LocalPlayer (val), SpeedrunConfig (val)
    -- upvalues: restoreCharacterVisibility (val), hideCharacter (val), u492 (val)
    local v1, v2, v3
    local v4, v5, v6 = getSpectateState()
    local v7 = v6 and v5 or u131
    if v5 ~= u493 then
        if v5 then
            captureOriginalSkies()
            removeLightingSkies()
            v6 = Speedrun:FindFirstChild("Skybox" .. (tostring(v5)))
            if v6 and v6:IsA("Sky") then
                v3 = v6:Clone()
                v3.Name = "SpeedrunSky"
                v3.Parent = Lighting
            end
            playStageMusic(v5)
        elseif u493 then
            if not u131 then
                restoreOriginalSkies()
                if u150 then
                    u150:Stop()
                    u150:Destroy()
                    u150 = nil
                end
            else
                v3 = u131
                captureOriginalSkies()
                removeLightingSkies()
                local v8 = Speedrun:FindFirstChild("Skybox" .. (tostring(v3)))
                if v8 and v8:IsA("Sky") then
                    local v9 = v8:Clone()
                    v9.Name = "SpeedrunSky"
                    v9.Parent = Lighting
                end
                playStageMusic(u131)
            end
        end
        u493 = v5
    end
    v3 = false
    if v5 ~= nil then
        v3 = true
        if u131 == v5 then
            v3 = u130 == nil
        end
    end
    if u491 and u491.model ~= u130 then
        restoreVisualState(u491)
        u491 = nil
    end
    if not v3 then
        if u491 then
            restoreVisualState(u491)
            u491 = nil
        end
    elseif u130 and not u491 then
        hideModelVisuals(u130)
    end
    if not v3 then
        if u489 then
            u489:Destroy()
            u489 = nil
        end
        u490 = nil
    else
        buildSpectateMap(v5)
    end
    for i, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            v3 = v and v:GetAttribute("SpeedrunActive") == true
            if v3 then
                v3 = math.floor((tonumber((v:GetAttribute("SpeedrunLevel")))) or 0)
                v1 = if v3 < 1 then nil else if not (SpeedrunConfig.LevelCount < v3) then v3 else nil
                v2 = true
            else
                v1 = nil
                v2 = false
            end
            if not (if not v7 then not v2 else v2 and v1 == v7) then
                hideCharacter(v)
            else
                restoreCharacterVisibility(v)
            end
        end
    end
    for k in pairs(u492) do
        if not k.Parent then
            restoreCharacterVisibility(k)
        end
    end
    if v4 and v4.Parent and v5 == v7 then
        restoreCharacterVisibility(v4)
    end
end

local function restoreMainWorldCharacters() -- Line: 722
    -- upvalues: Players (val), LocalPlayer (val), SpeedrunConfig (val), restoreCharacterVisibility (val)
    local v1, v2
    for i, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            v2 = v and v:GetAttribute("SpeedrunActive") == true
            if v2 then
                v2 = math.floor((tonumber((v:GetAttribute("SpeedrunLevel")))) or 0)
                v1 = if v2 < 1 then true else if not (SpeedrunConfig.LevelCount < v2) then true else true
            else
                v1 = false
            end
            if not v1 then
                restoreCharacterVisibility(v)
            end
        end
    end
end

;(LocalPlayer:GetAttributeChangedSignal("LocalSpectateTargetUserId")):Connect(function() -- Line: 733 -- upvalues: refreshSpeedrunView (val)
    task.defer(refreshSpeedrunView)
end)
task.spawn(function() -- Line: 737
    -- upvalues: LocalPlayer (val), refreshSpeedrunView (val), u492 (val), restoreCharacterVisibility (val), u491 (ref)
    -- upvalues: u130 (ref), restoreVisualState (val), u489 (ref), u490 (ref)
    while LocalPlayer.Parent do
        refreshSpeedrunView()
        task.wait(0.15)
    end
    for k in pairs(u492) do
        restoreCharacterVisibility(k)
    end
    if u491 and u491.model ~= u130 then
        restoreVisualState(u491)
        u491 = nil
    end
    if u491 then
        restoreVisualState(u491)
        u491 = nil
    end
    if u489 then
        u489:Destroy()
        u489 = nil
    end
    u490 = nil
end)

local function completeSpeedrun() -- Line: 749
    -- upvalues: u149 (ref), u151 (ref), u131 (ref), LocalPlayer (val), u166 (val), u265 (val), u296 (val), u133 (ref)
    -- upvalues: u491 (ref), u130 (ref), restoreVisualState (val), u489 (ref), u490 (ref)
    -- upvalues: restoreMainWorldCharacters (val), u134 (val), u132 (ref), restoreOriginalSkies (val), u150 (ref)
    -- upvalues: refreshSpeedrunView (val)
    u149 = u149 + 1
    u151 = u151 + 1
    u131 = nil
    local v1 = false
    if LocalPlayer:GetAttribute("SpeedrunActive") == true then
        v1 = u131 ~= nil
    end
    u166.Enabled = v1
    u265.Visible = v1
    u296.Visible = v1
    u133 = false
    if u491 and u491.model ~= u130 then
        restoreVisualState(u491)
        u491 = nil
    end
    if u491 then
        restoreVisualState(u491)
        u491 = nil
    end
    if u489 then
        u489:Destroy()
        u489 = nil
    end
    u490 = nil
    restoreMainWorldCharacters()
    for i, v in ipairs(u134) do
        v:Disconnect()
    end
    table.clear(u134)
    if u130 then
        u130:Destroy()
        u130 = nil
    end
    u132 = nil
    restoreOriginalSkies()
    if u150 then
        u150:Stop()
        u150:Destroy()
        u150 = nil
    end
    task.defer(refreshSpeedrunView)
end

SpeedrunStageEvent.OnClientEvent:Connect(function(a1) -- Line: 767 -- upvalues: loadStage (val), completeSpeedrun (val)
    if type(a1) ~= "table" then
        return
    end
    if a1.action == "Load" then
        loadStage(a1)
        return
    end
    if a1.action == "Complete" or a1.action == "Exit" then
        completeSpeedrun(a1.reward)
    end
end)
;(LocalPlayer:GetAttributeChangedSignal("SpeedrunActive")):Connect(function() -- Line: 776
    -- upvalues: LocalPlayer (val), u131 (ref), u166 (val), u265 (val), u296 (val), completeSpeedrun (val)
    -- upvalues: refreshSpeedrunView (val)
    local v1 = false
    if LocalPlayer:GetAttribute("SpeedrunActive") == true then
        v1 = u131 ~= nil
    end
    u166.Enabled = v1
    u265.Visible = v1
    u296.Visible = v1
    if LocalPlayer:GetAttribute("SpeedrunActive") ~= true and u131 ~= nil then
        completeSpeedrun()
        return
    end
    task.defer(refreshSpeedrunView)
end)
local v4 = false
if LocalPlayer:GetAttribute("SpeedrunActive") == true then
    v4 = u131 ~= nil
end
u166.Enabled = v4
u265.Visible = v4
u296.Visible = v4
LocalPlayer.CharacterAdded:Connect(function() -- Line: 786 -- upvalues: u131 (ref), LocalPlayer (val), u132 (ref), u151 (ref), SpeedrunStageReady (val)
    if not u131 then
        return
    end
    task.wait(0.5)
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    if Character and HumanoidRootPart and u132 then
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        Character:PivotTo(u132)
        u151 = u151 + 1
        local u22 = u151

        local function applyCameraDirection() -- Line: 279
            -- upvalues: u22 (val), u151 (upval), Character (val), LocalPlayer (upval), HumanoidRootPart (val)
            if u22 == u151 and Character == LocalPlayer.Character and HumanoidRootPart.Parent then
                local CurrentCamera = workspace.CurrentCamera
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                if CurrentCamera and Humanoid then
                    local v1 = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * 8 + Vector3.new(0, 4, 0)
                    local v2 = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                    CurrentCamera.CameraSubject = Humanoid
                    CurrentCamera.CameraType = Enum.CameraType.Custom
                    CurrentCamera.CFrame = CFrame.lookAt(v1, v2)
                    CurrentCamera.Focus = CFrame.new(v2)
                    return
                end
                return
            end
        end

        applyCameraDirection()
        task.delay(0.05, applyCameraDirection)
    end
    SpeedrunStageReady:FireServer(u131)
end)
if LocalPlayer:GetAttribute("SpeedrunActive") == true then
    local v5 = math.floor((tonumber((LocalPlayer:GetAttribute("SpeedrunLevel")))) or 0)
    if v5 >= 1 and v5 <= SpeedrunConfig.LevelCount then
        loadStage({stage = v5, zonePivot = SpeedrunConfig.ZonePivot})
    end
end