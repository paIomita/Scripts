-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRCamera

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRCamera
-- Decompile time: 7.40 ms

local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
UserSettings():GetService("UserGameSettings")
require(script.Parent:WaitForChild("CameraInput"))
require(script.Parent:WaitForChild("CameraUtils"))
local VRCameraTeleportDetector = require(script.Parent:WaitForChild("VRCameraTeleportDetector"))
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local u56 = FlagUtil.getUserFlag("UserVRRecenterOnExternalTeleport")
local UserFixVRImmersionAutoRotate = FlagUtil.getUserFlag("UserFixVRImmersionAutoRotate")
local u68 = require(script.Parent:WaitForChild("VRBaseCamera"))
local u72 = setmetatable({}, u68)
u72.__index = u72

function u72.new() -- Line: 34 -- upvalues: u68 (val), u72 (val), Players (val)
    local v1 = u68.new()
    local v2 = setmetatable(v1, u72)
    v2.lastUpdate = tick()
    v2.focusOffset = CFrame.new()
    v2:Reset()
    v2.controlModule = require(Players.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"))
    v2.savedAutoRotate = true
    v2.autoRotateOverridden = false
    return v2
end

function u72:Reset() -- Line: 48 -- upvalues: u68 (val)
    self.needsReset = true
    self.needsBlackout = true
    self.motionDetTime = 0
    self.blackOutTimer = 0
    self.lastCameraResetPosition = nil
    u68.Reset(self)
end

function u72.Update(a1, a2) -- Line: 57 -- upvalues: Players (val), VRService (val)
    local CurrentCamera = workspace.CurrentCamera
    local CFrame = CurrentCamera.CFrame
    local Focus = CurrentCamera.Focus
    local LocalPlayer = Players.LocalPlayer
    a1:GetHumanoid()
    local CameraSubject = CurrentCamera.CameraSubject
    if a1.lastUpdate == nil or a2 > 1 then
        a1.lastCameraTransform = nil
    end
    a1:UpdateFadeFromBlack(a2)
    local lastSubjectPosition = a1.lastSubjectPosition
    local SubjectPosition = a1:GetSubjectPosition()
    if a1.needsBlackout then
        a1:StartFadeFromBlack()
        a1.blackOutTimer = a1.blackOutTimer + (math.clamp(a2, 0.0001, 0.1))
        if 0.1 < a1.blackOutTimer and game:IsLoaded() then
            a1.needsBlackout = false
            a1.needsReset = true
        end
    end
    if SubjectPosition and LocalPlayer and CurrentCamera then
        local v1, v2
        local v3 = a1:GetVRFocus(SubjectPosition, a2)
        if not a1:IsInFirstPerson() then
            if not VRService.ThirdPersonFollowCamEnabled then
                v1, v2 = a1:UpdateThirdPersonComfortTransform(a2, CFrame, v3, lastSubjectPosition, SubjectPosition)
            else
                v1, v2 = a1:UpdateThirdPersonFollowTransform(a2, CFrame, v3, lastSubjectPosition, SubjectPosition)
            end
        elseif not VRService.AvatarGestures then
            v1, v2 = a1:UpdateFirstPersonTransform(a2, CFrame, v3, lastSubjectPosition, SubjectPosition)
        else
            v1, v2 = a1:UpdateImmersionCamera(a2, CFrame, v3, lastSubjectPosition, SubjectPosition)
        end
        a1.lastCameraTransform = v1
        a1.lastCameraFocus = v2
    end
    a1.lastUpdate = tick()
    return CFrame, Focus
end

function u72.GetAvatarFeetWorldYValue(a1) -- Line: 118
    local CameraSubject = workspace.CurrentCamera.CameraSubject
    if not CameraSubject then
        return nil
    end
    if CameraSubject:IsA("Humanoid") and CameraSubject.RootPart then
        local RootPart = CameraSubject.RootPart
        return RootPart.Position.Y - RootPart.Size.Y / 2 - CameraSubject.HipHeight
    end
    return nil
end

function u72:UpdateFirstPersonTransform(a2, a3, a4, a5, a6) -- Line: 133
    if self.needsReset then
        self:StartFadeFromBlack()
        self.needsReset = false
    end
    local p = a4.p
    local CameraLookVector = self:GetCameraLookVector()
    return CFrame.new(
        p - 0.5 * (self:CalculateNewLookVectorFromArg(
            Vector3.new(CameraLookVector.X, 0, CameraLookVector.Z).Unit,
            (Vector2.new(self:getRotation(a2), 0))
        )),
        p
    ), a4
end

function u72:UpdateImmersionCamera(a2, a3, a4, a5, a6) -- Line: 153
    -- upvalues: Players (val), u56 (val), UserFixVRImmersionAutoRotate (val), VRService (val)
    -- upvalues: VRCameraTeleportDetector (val)
    local v1
    local SubjectCFrame = self:GetSubjectCFrame()
    local CurrentCamera = workspace.CurrentCamera
    local Character = Players.LocalPlayer.Character
    local Humanoid = self:GetHumanoid()
    if not Humanoid then
        return CurrentCamera.CFrame, CurrentCamera.Focus
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return CurrentCamera.CFrame, CurrentCamera.Focus
    end
    local Magnitude = nil
    if u56 then
        Magnitude = if not a5 then 0 else Vector3.new(a6.X - a5.X, 0, a6.Z - a5.Z).Magnitude
    end
    self.characterOrientation = HumanoidRootPart:FindFirstChild("CharacterAlignOrientation")
    if not self.characterOrientation then
        local RootAttachment = HumanoidRootPart:FindFirstChild("RootAttachment")
        if not RootAttachment then
            return
        end
        self.characterOrientation = Instance.new("AlignOrientation")
        self.characterOrientation.Name = "CharacterAlignOrientation"
        self.characterOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
        self.characterOrientation.Attachment0 = RootAttachment
        self.characterOrientation.RigidityEnabled = true
        self.characterOrientation.Parent = HumanoidRootPart
    end
    if self.characterOrientation.Enabled == false then
        self.characterOrientation.Enabled = true
    end
    if self.needsReset then
        self.needsReset = false
        if not UserFixVRImmersionAutoRotate then
            self.savedAutoRotate = Humanoid.AutoRotate
            Humanoid.AutoRotate = false
        else
            self:updateImmersionAutoRotate()
        end
        if u56 then
            VRService:RecenterUserHeadCFrame()
            self.lastTeleportRecenter = tick()
        end
        self:StartFadeFromBlack()
        v1 = SubjectCFrame
    elseif not Humanoid.Sit then
        local v2, v3, v4
        local v5 = self.controlModule:GetEstimatedVRTorsoFrame()
        self.characterOrientation.CFrame = CurrentCamera.CFrame * v5
        if 0 < self.controlModule.inputMoveVector.Magnitude then
            self.motionDetTime = 0.1
        end
        if 0 < self.controlModule.inputMoveVector.Magnitude or 0 < self.motionDetTime then
            self.motionDetTime = self.motionDetTime - a2
            v5 = VRService:GetUserCFrame(Enum.UserCFrame.Head)
            v5 = v5.Rotation + v5.Position * CurrentCamera.HeadScale
            local HumanoidRootPart_3 = Character.HumanoidRootPart
            v3 = -0.7 * HumanoidRootPart_3.Size.Y / 2
            v4 = CurrentCamera.CFrame * v5 * CFrame.new(0, v3, 0)
            local LookVector_2 = HumanoidRootPart_3.CFrame.LookVector
            v3 = a6 - (v4 - Vector3.new(LookVector_2.X, 0, LookVector_2.Z).Unit * HumanoidRootPart_3.Size.Y * 0.125).Position + CurrentCamera.CFrame.Position
            v3 = Vector3.new(v3.X, a6.Y, v3.Z)
            v1 = CurrentCamera.CFrame.Rotation + v3
        elseif not u56
            or not VRCameraTeleportDetector.shouldRecenter(self.prevSubjStep, Magnitude, self.lastTeleportRecenter, tick()) then
            v1 = CurrentCamera.CFrame.Rotation + Vector3.new(CurrentCamera.CFrame.Position.X, a6.Y, CurrentCamera.CFrame.Position.Z)
        else
            local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
            v2 = UserCFrame.Rotation + UserCFrame.Position * CurrentCamera.HeadScale
            local HumanoidRootPart_2 = Character.HumanoidRootPart
            v4 = -0.7 * HumanoidRootPart_2.Size.Y / 2
            local v6 = CurrentCamera.CFrame * v2 * CFrame.new(0, v4, 0)
            local LookVector = HumanoidRootPart_2.CFrame.LookVector
            v4 = a6 - (v6 - Vector3.new(LookVector.X, 0, LookVector.Z).Unit * HumanoidRootPart_2.Size.Y * 0.125).Position + CurrentCamera.CFrame.Position
            v4 = Vector3.new(v4.X, a6.Y, v4.Z)
            v1 = CurrentCamera.CFrame.Rotation + v4
            VRService:RecenterUserHeadCFrame()
            self:StartFadeFromBlack()
            self.lastTeleportRecenter = tick()
        end
        v2 = self:getRotation(a2)
        v3 = math.abs(v2)
        if v3 > 0 then
            local UserCFrame_2 = VRService:GetUserCFrame(Enum.UserCFrame.Head)
            v3 = UserCFrame_2.Rotation + UserCFrame_2.Position * CurrentCamera.HeadScale
            v4 = v1 * v3
            v1 = (CFrame.new(v4.Position)) * CFrame.Angles(0, -math.rad(v2 * 90), 0) * v4.Rotation * v3:Inverse()
        end
    else
        v1 = SubjectCFrame
    end
    if u56 then
        self.prevSubjStep = Magnitude
    end
    return v1, v1 * CFrame.new(0, 0, -0.5)
end

function u72:UpdateThirdPersonComfortTransform(a2, a3, a4, a5, a6) -- Line: 305
    -- upvalues: Players (val), VRService (val)
    local v1
    local CameraToSubjectDistance = self:GetCameraToSubjectDistance()
    if CameraToSubjectDistance < 0.5 then
        CameraToSubjectDistance = 0.5
    end
    if a5 == nil or self.lastCameraFocus == nil then
        v1 = a3
    else
        local lookVector
        local LocalPlayer = Players.LocalPlayer
        local v2 = a5 - a6
        local MoveVector = self.controlModule:GetMoveVector()
        local v3 = true
        if not (0.01 < v2.magnitude) then
            v3 = 0.01 < MoveVector.magnitude
        end
        if v3 then
            self.motionDetTime = 0.1
        end
        self.motionDetTime = self.motionDetTime - a2
        if 0 < self.motionDetTime then
            v3 = true
        end
        if v3 and not self.needsReset then
            local lastCameraFocus = self.lastCameraFocus
            self.VRCameraFocusFrozen = true
            return a3, lastCameraFocus
        end
        local v4 = true
        if self.lastCameraResetPosition ~= nil then
            v4 = 1 < (a6 - self.lastCameraResetPosition).Magnitude
        end
        v2 = self:getRotation(a2)
        local v5 = math.abs(v2)
        if not (v5 > 0) then
            v1 = a3
        else
            v5 = a4:ToObjectSpace(a3)
            v1 = a4 * CFrame.Angles(0, -v2, 0) * v5
        end
        if not self.VRCameraFocusFrozen then
            if self.needsReset then
                VRService:RecenterUserHeadCFrame()
                self.VRCameraFocusFrozen = false
                self.needsReset = false
                self.lastCameraResetPosition = a6
                self:ResetZoom()
                self:StartFadeFromBlack()
                v2 = self:GetHumanoid()
                lookVector = v2.Torso and v2.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
                v5 = a4.Position - (Vector3.new(lookVector.X, 0, lookVector.Z)) * CameraToSubjectDistance
                v1 = CFrame.new(v5, (Vector3.new(a4.Position.X, v5.Y, a4.Position.Z)))
            end
        elseif v4 or self.needsReset then
            VRService:RecenterUserHeadCFrame()
            self.VRCameraFocusFrozen = false
            self.needsReset = false
            self.lastCameraResetPosition = a6
            self:ResetZoom()
            self:StartFadeFromBlack()
            v2 = self:GetHumanoid()
            lookVector = v2.Torso and v2.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
            v5 = a4.Position - (Vector3.new(lookVector.X, 0, lookVector.Z)) * CameraToSubjectDistance
            v1 = CFrame.new(v5, (Vector3.new(a4.Position.X, v5.Y, a4.Position.Z)))
        end
    end
    return v1, a4
end

function u72:UpdateThirdPersonFollowTransform(a2, a3, a4, a5, a6) -- Line: 372
    -- upvalues: VRService (val), Players (val)
    local EstimatedVRTorsoFrame, LookVector, v1, v2
    local CurrentCamera = workspace.CurrentCamera
    local CameraToSubjectDistance = self:GetCameraToSubjectDistance()
    local VRFocus = self:GetVRFocus(a6, a2)
    if self.needsReset then
        self.needsReset = false
        VRService:RecenterUserHeadCFrame()
        self:ResetZoom()
        self:StartFadeFromBlack()
    end
    if self.recentered then
        local SubjectCFrame = self:GetSubjectCFrame()
        if not SubjectCFrame then
            return CurrentCamera.CFrame, CurrentCamera.Focus
        end
        v2 = VRFocus * SubjectCFrame.Rotation * CFrame.new(0, 0, CameraToSubjectDistance)
        self.focusOffset = VRFocus:ToObjectSpace(v2)
        self.recentered = false
        return v2, VRFocus
    end
    local v3 = VRFocus:ToWorldSpace(self.focusOffset)
    local LocalPlayer = Players.LocalPlayer
    local v4 = a5 - a6
    local controlModule = self.controlModule
    local MoveVector = controlModule:GetMoveVector()
    if 0.01 < v4.magnitude then
        EstimatedVRTorsoFrame = controlModule:GetEstimatedVRTorsoFrame()
        v1 = CurrentCamera.CFrame * (EstimatedVRTorsoFrame.Rotation + EstimatedVRTorsoFrame.Position * CurrentCamera.HeadScale)
        LookVector = v1.LookVector
        v2 = v3:Lerp(
            (CFrame.new(CurrentCamera.CFrame.Position + (VRFocus.Position - Vector3.new(LookVector.X, 0, LookVector.Z).Unit * CameraToSubjectDistance) - v1.Position)) * v3.Rotation,
            0.01
        )
    elseif not (0 < MoveVector.magnitude) then
        v2 = v3
    else
        EstimatedVRTorsoFrame = controlModule:GetEstimatedVRTorsoFrame()
        v1 = CurrentCamera.CFrame * (EstimatedVRTorsoFrame.Rotation + EstimatedVRTorsoFrame.Position * CurrentCamera.HeadScale)
        LookVector = v1.LookVector
        v2 = v3:Lerp(
            (CFrame.new(CurrentCamera.CFrame.Position + (VRFocus.Position - Vector3.new(LookVector.X, 0, LookVector.Z).Unit * CameraToSubjectDistance) - v1.Position)) * v3.Rotation,
            0.01
        )
    end
    local v5 = self:getRotation(a2)
    if 0 < (math.abs(v5)) then
        local v6 = VRFocus:ToObjectSpace(v2)
        v2 = VRFocus * CFrame.Angles(0, -v5, 0) * v6
    end
    self.focusOffset = VRFocus:ToObjectSpace(v2)
    return v2, v2 * CFrame.new(0, 0, -CameraToSubjectDistance)
end

function u72:updateImmersionAutoRotate() -- Line: 447 -- upvalues: VRService (val)
    local Humanoid = self:GetHumanoid()
    if not Humanoid then
        return
    end
    if self:IsInFirstPerson() and VRService.AvatarGestures then
        if not self.autoRotateOverridden then
            self.savedAutoRotate = Humanoid.AutoRotate
            self.autoRotateOverridden = true
        end
        Humanoid.AutoRotate = false
        return
    end
    if self.autoRotateOverridden then
        Humanoid.AutoRotate = self.savedAutoRotate
        self.autoRotateOverridden = false
    end
end

function u72.OnEnabledChanged(a1) -- Line: 467
    -- upvalues: u68 (val), UserFixVRImmersionAutoRotate (val), VRService (val)
    u68.OnEnabledChanged(a1)
    if not UserFixVRImmersionAutoRotate then
        return
    end
    if a1.enabled then
        if a1.avatarGesturesChangedConn then
            return
        end
        a1.avatarGesturesChangedConn = (VRService:GetPropertyChangedSignal("AvatarGestures")):Connect(function() -- Line: 476 -- upvalues: a1 (val)
            a1:updateImmersionAutoRotate()
        end)
        return
    end
    if a1.avatarGesturesChangedConn then
        a1.avatarGesturesChangedConn:Disconnect()
        a1.avatarGesturesChangedConn = nil
    end
end

function u72.LeaveFirstPerson(a1) -- Line: 486 -- upvalues: u68 (val), UserFixVRImmersionAutoRotate (val)
    u68.LeaveFirstPerson(a1)
    a1.needsReset = true
    if a1.VRBlur then
        a1.VRBlur.Visible = false
    end
    if a1.characterOrientation then
        a1.characterOrientation.Enabled = false
    end
    if UserFixVRImmersionAutoRotate then
        a1:updateImmersionAutoRotate()
        return
    end
    local Humanoid = a1:GetHumanoid()
    if Humanoid then
        Humanoid.AutoRotate = a1.savedAutoRotate
    end
end

return u72