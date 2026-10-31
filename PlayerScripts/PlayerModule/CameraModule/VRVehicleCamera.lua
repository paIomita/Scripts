-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRVehicleCamera

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRVehicleCamera
-- Decompile time: 5.53 ms

local u0 = {0, 30}
local VRBaseCamera = require(script.Parent:WaitForChild("VRBaseCamera"))
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local mapClamp = CameraUtils.mapClamp
local VehicleCameraConfig = require((script.Parent:WaitForChild("VehicleCamera")):FindFirstChild("VehicleCameraConfig"))
local u62 = RaycastParams.new()
u62.FilterType = Enum.RaycastFilterType.Exclude
u62.IgnoreWater = true

local function yawVelocity(a1, a2) -- Line: 36 -- types: a1: vector, a2: userdata
    return (math.abs((a2.YVector:Dot(a1))))
end

local function computeCameraCFrame(a1, a2, a3) -- Line: 40 -- types: a1: userdata, a2: vector, a3: number
    local v1 = math.atan2(a2.X, a2.Z)
    return (CFrame.new(a1.Position + a2 * a3)) * CFrame.Angles(0, v1, 0)
end

local function vrOccludeDisplace(a1, a2, a3, a4) -- Line: 45
    -- upvalues: LocalPlayer (val), u62 (val)
    local v1 = math.atan2(a2.X, a2.Z)
    local v2 = (CFrame.new(a1.Position + a2 * a3)) * CFrame.Angles(0, v1, 0)
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return v2
    end
    local Position = a1.Position
    local v3 = (v2.Position - Position) * Vector3.new(1, 0, 1)
    local Magnitude = v3.Magnitude
    if Magnitude < 0.5 then
        return v2
    end
    local v4 = {CurrentCamera}
    if a4 then
        table.insert(v4, a4)
    end
    local Character = LocalPlayer and LocalPlayer.Character
    if Character then
        table.insert(v4, Character)
    end
    u62.FilterDescendantsInstances = v4
    local Unit = v3.Unit
    v1 = workspace:Raycast(Position, v3, u62)
    if v1 and (v1.Normal:Dot(Unit)) < 0 then
        v3 = (v1.Position - Position).Magnitude - 0.5
        if v3 < Magnitude then
            return (CFrame.new(a1.Position + Unit * (math.max(v3, 0.5)))) * v2.Rotation
        end
    end
    return v2
end

local u69 = OverlapParams.new()
u69.FilterType = Enum.RaycastFilterType.Exclude

local function findObstructions(a1, a2, a3, a4) -- Line: 81
    -- upvalues: VRService (val), LocalPlayer (val), u62 (val), u69 (val)
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return 0, {}
    end
    local Position = a2.Position
    local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
    local v1 = a1 * ((CFrame.new(UserCFrame.Position * CurrentCamera.HeadScale)) * UserCFrame.Rotation)
    local v2 = v1.Position - Position
    local Magnitude = v2.Magnitude
    if Magnitude < 0.5 then
        return 0, {}
    end
    local v3 = {CurrentCamera}
    if a4 then
        table.insert(v3, a4)
    end
    local Character = LocalPlayer and LocalPlayer.Character
    if Character then
        table.insert(v3, Character)
    end
    u62.FilterDescendantsInstances = v3
    local v4 = workspace:Raycast(Position, v2, u62)
    if v4 then
        local Magnitude_2 = (v4.Position - Position).Magnitude
        if Magnitude_2 < Magnitude then
            local v5 = math.max(math.clamp((1 - -v2.Unit:Dot(v1.LookVector)) / 0.1339745962155613, 0, 1), 1 - Magnitude_2 / a3, 0.15)
            local Position_2 = v4.Position
            local Position_3 = v1.Position
            local v6 = (Position_2 + Position_3) / 2
            local v7 = Vector3.new(2, 2, (Position_3 - Position_2).Magnitude)
            local v8 = CFrame.lookAt(v6, Position_3)
            u69.FilterDescendantsInstances = v3
            return v5, (workspace:GetPartBoundsInBox(v8, v7, u69))
        end
    end
    return 0, {}
end

local u72 = 0.016666666666666666
local u76 = setmetatable({}, VRBaseCamera)
u76.__index = u76

function u76.new() -- Line: 133 -- upvalues: VRBaseCamera (val), u76 (val), RunService (val), u72 (ref)
    local v1 = VRBaseCamera.new()
    local v2 = setmetatable(v1, u76)
    v2.skipOcclusion = true
    v2:Reset()
    if v2.thirdPersonOptionChanged then
        v2.thirdPersonOptionChanged:Disconnect()
        v2.thirdPersonOptionChanged = nil
    end
    RunService.Stepped:Connect(function(a1, a2) -- Line: 143 -- upvalues: u72 (upval) -- types: a1: number, a2: number
        u72 = a2
    end)
    return v2
end

function u76:Reset() -- Line: 150 -- upvalues: CameraUtils (val), u0 (val)
    local CurrentCamera = workspace.CurrentCamera
    local CameraSubject = CurrentCamera and CurrentCamera.CameraSubject
    assert(CurrentCamera, "VRVehicleCamera initialization error")
    assert(CameraSubject)
    assert((CameraSubject:IsA("VehicleSeat")))
    self.lastOrbitalDir = nil
    self.wasInFirstPerson = nil
    local v1 = CameraSubject:GetConnectedParts(true)
    table.insert(v1, CameraSubject)
    local v2, v3 = CameraUtils.getLooseBoundingSphere(v1)
    self.vehicleModel = CameraSubject:FindFirstAncestorOfClass("Model") or CameraSubject.Parent
    self.assemblyRadius = math.max(v3, 5)
    self.assemblyOffset = CameraSubject.CFrame:Inverse() * v2
    self.gamepadZoomLevels = {}
    for i, j in u0 do
        table.insert(self.gamepadZoomLevels, j * self.headScale * self.assemblyRadius / 10)
    end
    self.lastCameraFocus = nil
    if not self:IsInFirstPerson() then
        self:SetCameraToSubjectDistance(self.gamepadZoomLevels[#self.gamepadZoomLevels])
    end
    self.needsReset = false
end

function u76:_getThirdPersonLocalOffset() -- Line: 184 -- upvalues: VehicleCameraConfig (val)
    return self.assemblyOffset + Vector3.new(0, self.assemblyRadius * VehicleCameraConfig.verticalCenterOffset, 0)
end

function u76:_getFirstPersonLocalOffset(a2) -- Line: 188
    -- upvalues: LocalPlayer (val)
    local Character = LocalPlayer.Character
    if Character and Character.Parent then
        local Head = Character:FindFirstChild("Head")
        if Head and Head:IsA("BasePart") then
            return (a2:Inverse()) * Head.Position
        end
    end
    return self:_getThirdPersonLocalOffset()
end

function u76._vrOccludeVignette(a1, a2, a3, a4) -- Line: 202
    -- upvalues: findObstructions (val), Lighting (val), LocalPlayer (val)
    local v1
    local v2 = math.atan2(a3.X, a3.Z)
    local v3 = (CFrame.new(a2.Position + a3 * a4)) * CFrame.Angles(0, v2, 0)
    v2, v1 = findObstructions(v3, a2, a4, a1.vehicleModel)
    local VRFade = Lighting:FindFirstChild("VRFade")
    if not VRFade then
        VRFade = Instance.new("ColorCorrectionEffect")
        VRFade.Name = "VRFade"
        VRFade.Parent = Lighting
    end
    VRFade.Brightness = -v2
    if a1.lastOccludedParts then
        for i, j in a1.lastOccludedParts do
            j.LocalTransparencyModifier = 0
        end
    end
    if #v1 > 0 then
        for k, n in v1 do
            n.LocalTransparencyModifier = 1
        end
        a1:StartVREdgeBlur(LocalPlayer, true)
    end
    a1.lastOccludedParts = v1
    return v3
end

function u76.Update(a1) -- Line: 229 -- upvalues: u72 (ref), LocalPlayer (val)
    local v1 = u72
    u72 = 0
    a1:UpdateFadeFromBlack(v1)
    a1:UpdateEdgeBlur(LocalPlayer, v1)
    local v2, v3 = a1:_updateStepRotation(v1)
    return v2, v3
end

function u76:_updateStepRotation(a2) -- Line: 241
    -- upvalues: mapClamp (val), CameraInput (val), VehicleCameraConfig (val), vrOccludeDisplace (val)
    local v1
    local SubjectCFrame = self:GetSubjectCFrame()
    local CameraToSubjectDistance = self:GetCameraToSubjectDistance()
    local v2 = mapClamp(CameraToSubjectDistance, 0.5, self.assemblyRadius, 1, 0)
    local v3 = CFrame.new(SubjectCFrame * (self:_getThirdPersonLocalOffset()):Lerp(self:_getFirstPersonLocalOffset(SubjectCFrame), v2) + Vector3.new(0, self:GetCameraHeight(), 0))
    if self.needsReset or self.recentered then
        self.lastOrbitalDir = nil
        self.needsReset = false
        self.recentered = false
    end
    local lastOrbitalDir = self.lastOrbitalDir
    if not lastOrbitalDir then
        lastOrbitalDir = (SubjectCFrame.LookVector * Vector3.new(-1, 0, -1)).Unit
        self:StartFadeFromBlack()
    end
    if 2 < ((self:GetSubjectVelocity()) * Vector3.new(1, 0, 1)).Magnitude then
        CameraInput.getRotation(a2)
    else
        local v4 = self:getRotation(a2)
        if 0 < (math.abs(v4)) then
            lastOrbitalDir = ((CFrame.Angles(0, -v4, 0)) * CFrame.new(lastOrbitalDir)).Position.Unit
            self.lastRotateTime = os.clock()
        end
    end
    if not self:IsInFirstPerson() then
        self.wasInFirstPerson = false
        self.lastVehicleYaw = nil
        local lastRotateTime = self.lastRotateTime and os.clock() - self.lastRotateTime < VehicleCameraConfig.autocorrectDelay
        if v2 and not lastRotateTime then
            local Unit = (SubjectCFrame.LookVector * Vector3.new(-1, 0, -1)).Unit
            local v5 = math.acos((math.clamp(lastOrbitalDir:Dot(Unit), -1, 1)))
            local v6 = math.abs((SubjectCFrame.YVector:Dot((self:GetSubjectRotVelocity()))))
            v6 = 0.01 + v5 / 3.141592653589793 * 0.05 + v6 * 0.02
            lastOrbitalDir = lastOrbitalDir:Lerp(Unit, (math.min(v6, 0.15)))
        end
        v1 = vrOccludeDisplace(v3, lastOrbitalDir, CameraToSubjectDistance, self.vehicleModel)
    else
        if not self.wasInFirstPerson or v2 then
            lastOrbitalDir = (SubjectCFrame.LookVector * Vector3.new(-1, 0, -1)).Unit
            self.wasInFirstPerson = true
        end
        local v7 = math.atan2(-SubjectCFrame.LookVector.X, -SubjectCFrame.LookVector.Z)
        if self.lastVehicleYaw then
            local v8 = (v7 - self.lastVehicleYaw + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
            if 0.001 < (math.abs(v8)) then
                lastOrbitalDir = ((CFrame.Angles(0, v8, 0)) * CFrame.new(lastOrbitalDir)).Position.Unit
            end
        end
        self.lastVehicleYaw = v7
        v7 = math.atan2(lastOrbitalDir.X, lastOrbitalDir.Z)
        v1 = (CFrame.new(v3.Position + lastOrbitalDir * CameraToSubjectDistance)) * CFrame.Angles(0, v7, 0)
    end
    self.lastOrbitalDir = lastOrbitalDir
    return v1, v1 * CFrame.new(0, 0, -CameraToSubjectDistance)
end

return u76