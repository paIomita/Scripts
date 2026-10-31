-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VehicleCamera

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VehicleCamera
-- Decompile time: 2.82 ms

local u0 = {0, 15, 30}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
require(script.Parent:WaitForChild("ZoomController"))
local VehicleCameraCore = require(script:WaitForChild("VehicleCameraCore"))
local VehicleCameraConfig = require(script:WaitForChild("VehicleCameraConfig"))
local LocalPlayer = Players.LocalPlayer
local map = CameraUtils.map
local Spring = CameraUtils.Spring
local mapClamp = CameraUtils.mapClamp
local sanitizeAngle = CameraUtils.sanitizeAngle

local function pitchVelocity(a1, a2) -- Line: 31
    return (math.abs((a2.XVector:Dot(a1))))
end

local function yawVelocity(a1, a2) -- Line: 36
    return (math.abs((a2.YVector:Dot(a1))))
end

local u67 = 0.016666666666666666
RunService.Stepped:Connect(function(a1, a2) -- Line: 42 -- upvalues: u67 (ref)
    u67 = a2
end)
local u77 = setmetatable({}, BaseCamera)
u77.__index = u77

function u77.new() -- Line: 49 -- upvalues: BaseCamera (val), u77 (val)
    local v1 = BaseCamera.new()
    local v2 = setmetatable(v1, u77)
    v2:Reset()
    return v2
end

function u77:Reset() -- Line: 55
    -- upvalues: VehicleCameraCore (val), Spring (val), VehicleCameraConfig (val), CameraUtils (val), u0 (val)
    local assemblyRadius, gamepadZoomLevels
    self.vehicleCameraCore = VehicleCameraCore.new(self:GetSubjectCFrame())
    self.pitchSpring = Spring.new(0, -math.rad(VehicleCameraConfig.pitchBaseAngle))
    self.yawSpring = Spring.new(0, 0)
    self.lastPanTick = 0
    local CurrentCamera = workspace.CurrentCamera
    local CameraSubject = CurrentCamera and CurrentCamera.CameraSubject
    assert(CurrentCamera)
    assert(CameraSubject)
    assert((CameraSubject:IsA("VehicleSeat")))
    local v1, v2 = CameraUtils.getLooseBoundingSphere((CameraSubject:GetConnectedParts(true)))
    self.assemblyRadius = math.max(v2, 5)
    self.assemblyOffset = CameraSubject.CFrame:Inverse() * v1
    self.gamepadZoomLevels = {}
    for i, j in u0 do
        gamepadZoomLevels = self.gamepadZoomLevels
        assemblyRadius = self.assemblyRadius
        table.insert(gamepadZoomLevels, j * assemblyRadius / 10)
    end
    self:SetCameraToSubjectDistance(self.gamepadZoomLevels[#self.gamepadZoomLevels])
end

function u77:_StepRotation(a2, a3) -- Line: 85
    -- upvalues: CameraInput (val), sanitizeAngle (val), VehicleCameraConfig (val), mapClamp (val)
    local yawSpring = self.yawSpring
    local pitchSpring = self.pitchSpring
    local v1 = CameraInput.getRotation(a2, true)
    local v2 = -v1.X
    local v3 = -v1.Y
    yawSpring.pos = sanitizeAngle(yawSpring.pos + v2)
    pitchSpring.pos = sanitizeAngle((math.clamp(pitchSpring.pos + v3, -1.3962634015954636, 1.3962634015954636)))
    if CameraInput.getRotationActivated() then
        self.lastPanTick = os.clock()
    end
    v3 = -math.rad(VehicleCameraConfig.pitchBaseAngle)
    v2 = math.rad(VehicleCameraConfig.pitchDeadzoneAngle)
    if not (VehicleCameraConfig.autocorrectDelay < os.clock() - self.lastPanTick) then
        yawSpring.freq = 0
        yawSpring.vel = 0
        pitchSpring.freq = 0
        pitchSpring.vel = 0
        pitchSpring.goal = v3
    else
        v1 = mapClamp(
            a3,
            VehicleCameraConfig.autocorrectMinCarSpeed,
            VehicleCameraConfig.autocorrectMaxCarSpeed,
            0,
            VehicleCameraConfig.autocorrectResponse
        )
        yawSpring.freq = v1
        pitchSpring.freq = v1
        if yawSpring.freq < 0.001 then
            yawSpring.vel = 0
        end
        if pitchSpring.freq < 0.001 then
            pitchSpring.vel = 0
        end
        if not (math.abs((sanitizeAngle(v3 - pitchSpring.pos))) <= v2) then
            pitchSpring.goal = v3
        else
            pitchSpring.goal = pitchSpring.pos
        end
    end
    return CFrame.fromEulerAnglesYXZ(pitchSpring:step(a2), yawSpring:step(a2), 0)
end

function u77:_GetThirdPersonLocalOffset() -- Line: 148 -- upvalues: VehicleCameraConfig (val)
    return self.assemblyOffset + Vector3.new(0, self.assemblyRadius * VehicleCameraConfig.verticalCenterOffset, 0)
end

function u77:_GetFirstPersonLocalOffset(a2) -- Line: 152
    -- upvalues: LocalPlayer (val)
    local Character = LocalPlayer.Character
    if Character and Character.Parent then
        local Head = Character:FindFirstChild("Head")
        if Head and Head:IsA("BasePart") then
            return (a2:Inverse()) * Head.Position
        end
    end
    return self:_GetThirdPersonLocalOffset()
end

function u77.Update(a1) -- Line: 166 -- upvalues: u67 (ref), mapClamp (val)
    local CurrentCamera = workspace.CurrentCamera
    local CameraSubject = CurrentCamera and CurrentCamera.CameraSubject
    local vehicleCameraCore = a1.vehicleCameraCore
    assert(CurrentCamera)
    assert(CameraSubject)
    assert((CameraSubject:IsA("VehicleSeat")))
    local v1 = u67
    u67 = 0
    local v2 = a1:GetSubjectCFrame()
    local SubjectVelocity = a1:GetSubjectVelocity()
    local SubjectRotVelocity = a1:GetSubjectRotVelocity()
    local v3 = math.abs((SubjectVelocity:Dot(v2.ZVector)))
    local v4 = math.abs((v2.YVector:Dot(SubjectRotVelocity)))
    local v5 = math.abs((v2.XVector:Dot(SubjectRotVelocity)))
    local v6 = a1:StepZoom()
    local v7 = a1:_StepRotation(v1, v3)
    v3 = mapClamp(v6, 0.5, a1.assemblyRadius, 1, 0)
    local v8 = (a1:_GetThirdPersonLocalOffset()):Lerp(a1:_GetFirstPersonLocalOffset(v2), v3)
    vehicleCameraCore:setTransform(v2)
    local v9 = vehicleCameraCore:step(v1, v5, v4, v3)
    local v10 = CFrame.new(v2 * v8) * v9 * v7
    return v10 * CFrame.new(0, 0, v6), v10
end

function u77.ApplyVRTransform(a1) end

return u77