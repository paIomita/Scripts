-- Path: Players.Drrrrrrrrragonball.PlayerScripts.SpawnCameraNudgeClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.SpawnCameraNudgeClient
-- Decompile time: 2.80 ms

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local u16 = {"SpawnLocation", "SpawnLocation2"}
local u29 = (CFrame.new(120.306, 5.109, 76.138)) * CFrame.fromOrientation(-0.2483603525587931, 3.137648209480286, 0)
local u31 = Random.new()
local u32 = {}
local u33 = nil
local u34 = nil
local u35 = false
local u36 = 0
local u37 = 133.943
local u38 = 0
local u39 = 0
local Attribute = LocalPlayer:GetAttribute("SpawnCameraNudgeToken")
local Attribute_2 = LocalPlayer:GetAttribute("Teleport7CameraToken")
local u48 = 0

local function resolveSpawnParts() -- Line: 32 -- upvalues: u32 (ref), u16 (val), Workspace (val)
    local v1
    local v2 = {}
    for i, v in ipairs(u32) do
        if v and v.Parent then
            table.insert(v2, v)
        end
    end
    if #v2 > 0 then
        return v2
    end
    for i2, i3 in ipairs(u16) do
        v1 = Workspace:FindFirstChild(i3, true)
        if v1 and v1:IsA("BasePart") then
            table.insert(v2, v1)
        end
    end
    return v2
end

local function getNearestSpawnPosition(a1) -- Line: 53 -- upvalues: resolveSpawnParts (val)
    local Magnitude
    local Position_2 = Vector3.new(0, 0, 0)
    local v1 = (1 / 0)
    for i, v in ipairs((resolveSpawnParts())) do
        Magnitude = Vector3.new(a1.X - v.Position.X, 0, a1.Z - v.Position.Z).Magnitude
        if Magnitude < v1 then
            Position_2 = v.Position
        end
    end
    return Position_2
end

local function getRootPart() -- Line: 67 -- upvalues: u34 (ref), u33 (ref), LocalPlayer (val)
    if u34 and u34.Parent then
        return u34
    end
    u33 = LocalPlayer.Character
    u34 = u33 and u33:FindFirstChild("HumanoidRootPart")
    return u34
end

local function horizontalDistance(a1, a2) -- Line: 76
    return Vector3.new(a1.X - a2.X, 0, a1.Z - a2.Z).Magnitude
end

local u53 = nil

local function getSlightSpawnYaw() -- Line: 83 -- upvalues: u31 (val)
    local v1 = if u31:NextInteger(0, 1) ~= 0 then 1 else -1
    local v2 = u31:NextNumber(1.25, 2.75) * v1
    return 133.943 + v2, v2
end

local function setStartingCameraAngle(a1) -- Line: 89
    -- upvalues: u36 (ref), u31 (val), u37 (ref), u38 (ref), u39 (ref), Workspace (val), u53 (ref)
    local v1 = os.clock()
    if not a1 and v1 - u36 < 1.75 then
        return
    end
    u36 = v1
    v1 = if u31:NextInteger(0, 1) ~= 0 then 1 else -1
    local v2 = u31:NextNumber(1.25, 2.75) * v1
    u37 = 133.943 + v2
    math.max(u38, u39 + 8)
    script:SetAttribute("LastCameraYawDegrees", u37)
    script:SetAttribute("LastCameraYawOffsetDegrees", v2)
    local CurrentCamera = Workspace.CurrentCamera
    if CurrentCamera and u53 then
        u53(CurrentCamera)
    end
end

function u53(a1) -- Line: 106 -- upvalues: u37 (ref)
    local CFrame_2 = a1.CFrame
    local Magnitude = Vector3.new(CFrame_2.LookVector.X, 0, CFrame_2.LookVector.Z).Magnitude
    local v1 = 0
    if Magnitude > 0.001 then
        v1 = math.atan2(CFrame_2.LookVector.Y, Magnitude)
    end
    local v2 = math.rad(u37)
    local v3 = math.cos(v1)
    a1.CFrame = CFrame.lookAt(CFrame_2.Position, CFrame_2.Position + (Vector3.new(math.sin(v2) * v3, math.sin(v1), (math.cos(v2)) * v3)))
end

local function onCharacterAdded(a1) -- Line: 120
    -- upvalues: u33 (ref), u34 (ref), u35 (ref), setStartingCameraAngle (val)
    u34 = nil
    u35 = false
    a1:WaitForChild("HumanoidRootPart", 8)
    a1:FindFirstChild("HumanoidRootPart")
    if a1 == a1 then
        setStartingCameraAngle(true)
    end
end

if LocalPlayer.Character then
    task.defer(onCharacterAdded, LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
;(LocalPlayer:GetAttributeChangedSignal("SpawnCameraNudgeToken")):Connect(function() -- Line: 136 -- upvalues: LocalPlayer (val), Attribute (ref), setStartingCameraAngle (val)
    local Attribute_2 = LocalPlayer:GetAttribute("SpawnCameraNudgeToken")
    if Attribute_2 ~= nil and Attribute_2 ~= Attribute then
        Attribute = Attribute_2
        if LocalPlayer:GetAttribute("SpawnCameraNudgeToken") == Attribute_2 then
            setStartingCameraAngle(true)
        end
        return
    end
end)
;(LocalPlayer:GetAttributeChangedSignal("Teleport7CameraToken")):Connect(function() -- Line: 149
    -- upvalues: LocalPlayer (val), Attribute_2 (ref), u48 (ref), u39 (ref), Workspace (val), u29 (val)
    local Attribute = LocalPlayer:GetAttribute("Teleport7CameraToken")
    if Attribute ~= nil and Attribute ~= Attribute_2 then
        Attribute_2 = Attribute
        u48 = u39 + 8
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera then
            CurrentCamera.CFrame = u29
        end
        return
    end
end)
RunService:BindToRenderStep("SpawnCameraNudgeClient", Enum.RenderPriority.Camera.Value + 1, function() -- Line: 160
    -- upvalues: u39 (ref), u34 (ref), u33 (ref), LocalPlayer (val), Workspace (val), u48 (ref), u29 (val), u38 (ref)
    -- upvalues: u53 (ref)
    u39 = u39 + 1
    if not u34 or not u34.Parent then
        u33 = LocalPlayer.Character
        u34 = u33 and u33:FindFirstChild("HumanoidRootPart")
    end
    local CurrentCamera = Workspace.CurrentCamera
    if u34 and CurrentCamera then
        if u48 > 0 and u39 <= u48 then
            CurrentCamera.CFrame = u29
            return
        end
        if u38 > 0 then
            if u39 <= u38 then
                u53(CurrentCamera)
                return
            end
            u38 = 0
        end
        return
    end
end)