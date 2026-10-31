-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRBaseCamera

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRBaseCamera
-- Decompile time: 4.28 ms

local VRService = game:GetService("VRService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Lighting = game:GetService("Lighting")
local u21 = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local ZoomController = require(script.Parent:WaitForChild("ZoomController"))
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
require(CommonUtils:WaitForChild("FlagUtil"))
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local u69 = setmetatable({}, BaseCamera)
u69.__index = u69

function u69.new() -- Line: 32 -- upvalues: BaseCamera (val), u69 (val)
    local v1 = BaseCamera.new()
    local v2 = setmetatable(v1, u69)
    v2.gamepadZoomLevels = {0, 7}
    v2.headScale = 1
    v2:SetCameraToSubjectDistance(7)
    v2.VRFadeResetTimer = 0
    v2.VREdgeBlurTimer = 0
    v2.gamepadResetConnection = nil
    v2.needsReset = true
    v2.recentered = false
    v2:Reset()
    return v2
end

function u69:Reset() -- Line: 58
    self.stepRotateTimeout = 0
end

function u69.GetModuleName(a1) -- Line: 62
    return "VRBaseCamera"
end

function u69:GamepadZoomPress() -- Line: 66 -- upvalues: BaseCamera (val)
    BaseCamera.GamepadZoomPress(self)
    self:GamepadReset()
    self:ResetZoom()
end

function u69:GamepadReset() -- Line: 74
    self.stepRotateTimeout = 0
    self.needsReset = true
end

function u69:ResetZoom() -- Line: 79 -- upvalues: ZoomController (val)
    ZoomController.SetZoomParameters(self.currentSubjectDistance, 0)
    ZoomController.ReleaseSpring()
end

function u69.OnEnabledChanged(a1) -- Line: 84
    -- upvalues: BaseCamera (val), CameraInput (val), VRService (val), Lighting (val)
    BaseCamera.OnEnabledChanged(a1)
    if a1.enabled then
        a1.gamepadResetConnection = CameraInput.gamepadReset:Connect(function() -- Line: 88 -- upvalues: a1 (val)
            a1:GamepadReset()
        end)
        a1.thirdPersonOptionChanged = (VRService:GetPropertyChangedSignal("ThirdPersonFollowCamEnabled")):Connect(function() -- Line: 93 -- upvalues: a1 (val)
            a1:Reset()
        end)
        a1.vrRecentered = VRService.UserCFrameChanged:Connect(function(a1_2, a2) -- Line: 97 -- upvalues: a1 (val)
            if a1_2 == Enum.UserCFrame.Floor then
                a1.recentered = true
            end
        end)
        return
    end
    if a1.inFirstPerson then
        a1:GamepadZoomPress()
    end
    if a1.thirdPersonOptionChanged then
        a1.thirdPersonOptionChanged:Disconnect()
        a1.thirdPersonOptionChanged = nil
    end
    if a1.vrRecentered then
        a1.vrRecentered:Disconnect()
        a1.vrRecentered = nil
    end
    if a1.cameraHeadScaleChangedConn then
        a1.cameraHeadScaleChangedConn:Disconnect()
        a1.cameraHeadScaleChangedConn = nil
    end
    if a1.gamepadResetConnection then
        a1.gamepadResetConnection:Disconnect()
        a1.gamepadResetConnection = nil
    end
    local VRFade = Lighting:FindFirstChild("VRFade")
    if VRFade then
        VRFade.Brightness = 0
    end
end

function u69.OnCurrentCameraChanged(a1) -- Line: 137 -- upvalues: BaseCamera (val)
    BaseCamera.OnCurrentCameraChanged(a1)
    if a1.cameraHeadScaleChangedConn then
        a1.cameraHeadScaleChangedConn:Disconnect()
        a1.cameraHeadScaleChangedConn = nil
    end
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera then
        a1.cameraHeadScaleChangedConn = (CurrentCamera:GetPropertyChangedSignal("HeadScale")):Connect(function() -- Line: 149 -- upvalues: a1 (val)
            a1:OnHeadScaleChanged()
        end)
        a1:OnHeadScaleChanged()
    end
end

function u69:OnHeadScaleChanged() -- Line: 154
    local HeadScale = workspace.CurrentCamera.HeadScale
    for i, j in self.gamepadZoomLevels do
        self.gamepadZoomLevels[i] = j * HeadScale / self.headScale
    end
    self:SetCameraToSubjectDistance(self:GetCameraToSubjectDistance() * HeadScale / self.headScale)
    self.headScale = HeadScale
end

function u69.GetVRFocus(a1, a2, a3) -- Line: 170
    local v1 = a1.lastCameraFocus or a2
    a1.cameraTranslationConstraints = Vector3.new(a1.cameraTranslationConstraints.x, math.min(1, a1.cameraTranslationConstraints.y + a3), a1.cameraTranslationConstraints.z)
    return (CFrame.new((Vector3.new(a2.x, v1.y, a2.z)):Lerp(a2 + (Vector3.new(0, a1:GetCameraHeight(), 0)), a1.cameraTranslationConstraints.y)))
end

function u69:StartFadeFromBlack() -- Line: 186 -- upvalues: UserGameSettings (val), Lighting (val)
    if UserGameSettings.VignetteEnabled == false then
        return
    end
    local VRFade = Lighting:FindFirstChild("VRFade")
    if not VRFade then
        VRFade = Instance.new("ColorCorrectionEffect")
        VRFade.Name = "VRFade"
        VRFade.Parent = Lighting
    end
    VRFade.Brightness = -1
    self.VRFadeResetTimer = 0.1
end

function u69.UpdateFadeFromBlack(a1, a2) -- Line: 201 -- upvalues: Lighting (val) -- types: a1: table, a2: number
    local VRFade = Lighting:FindFirstChild("VRFade")
    if not (0 < a1.VRFadeResetTimer) then
        if VRFade then
            VRFade.Brightness = 0
        end
        return
    end
    a1.VRFadeResetTimer = math.max(a1.VRFadeResetTimer - a2, 0)
    local VRFade_2 = Lighting:FindFirstChild("VRFade")
    if VRFade_2 and VRFade_2.Brightness < 0 then
        VRFade_2.Brightness = math.min(VRFade_2.Brightness + a2 * 10, 0)
        return
    end
end

function u69.StartVREdgeBlur(a1, a2, a3) -- Line: 217 -- upvalues: UserGameSettings (val), u21 (val), VRService (val)
    if not a3 and UserGameSettings.VignetteEnabled == false then
        return
    end
    local u16 = workspace.CurrentCamera:FindFirstChild("VRBlurPart")
    if not u16 then
        u16 = Instance.new("Part")
        u16.Name = "VRBlurPart"
        u16.Parent = workspace.CurrentCamera
        u16.CanTouch = false
        u16.CanCollide = false
        u16.CanQuery = false
        u16.Anchored = true
        u16.Size = Vector3.new(0.4399999976158142, 0.4699999988079071, 1)
        u16.Transparency = 1
        u16.CastShadow = false
        u21.RenderStepped:Connect(function(a1) -- Line: 237 -- upvalues: VRService (upval), u16 (ref)
            local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
            local v1 = workspace.CurrentCamera.CFrame * ((CFrame.new(UserCFrame.p * workspace.CurrentCamera.HeadScale)) * (UserCFrame - UserCFrame.p))
            u16.CFrame = v1 * CFrame.Angles(0, 3.141592653589793, 0) + v1.LookVector * (1.05 * workspace.CurrentCamera.HeadScale)
            u16.Size = Vector3.new(0.4399999976158142, 0.4699999988079071, 1) * workspace.CurrentCamera.HeadScale
        end)
    end
    local VRBlurScreen = a2.PlayerGui:FindFirstChild("VRBlurScreen")
    local v1 = nil
    if VRBlurScreen then
        v1 = VRBlurScreen:FindFirstChild("VRBlur")
    end
    if not v1 then
        if not VRBlurScreen then
            VRBlurScreen = Instance.new("SurfaceGui") or Instance.new("ScreenGui")
        end
        VRBlurScreen.Name = "VRBlurScreen"
        VRBlurScreen.Parent = a2.PlayerGui
        VRBlurScreen.Adornee = u16
        v1 = Instance.new("ImageLabel")
        v1.Name = "VRBlur"
        v1.Parent = VRBlurScreen
        v1.Image = "rbxasset://textures/ui/VR/edgeBlur.png"
        v1.AnchorPoint = Vector2.new(0.5, 0.5)
        v1.Position = UDim2.new(0.5, 0, 0.5, 0)
        v1.Size = UDim2.fromScale(workspace.CurrentCamera.ViewportSize.X * 2.3 / 512, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512)
        v1.BackgroundTransparency = 1
        v1.Active = true
        v1.ScaleType = Enum.ScaleType.Stretch
    end
    v1.Visible = true
    v1.ImageTransparency = 0
    a1.VREdgeBlurTimer = 0.14
end

function u69.UpdateEdgeBlur(a1, a2, a3) -- Line: 286
    local VRBlurScreen = a2.PlayerGui:FindFirstChild("VRBlurScreen")
    local v1 = nil
    if VRBlurScreen then
        v1 = VRBlurScreen:FindFirstChild("VRBlur")
    end
    if v1 then
        if not (0 < a1.VREdgeBlurTimer) then
            v1.Visible = false
        else
            a1.VREdgeBlurTimer = a1.VREdgeBlurTimer - a3
            local v2 = a2.PlayerGui:FindFirstChild("VRBlurScreen")
            if v2 then
                local VRBlur = v2:FindFirstChild("VRBlur")
                if VRBlur then
                    VRBlur.ImageTransparency = 1 - math.clamp(a1.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142
                    return
                end
            end
        end
    end
end

function u69:GetCameraHeight() -- Line: 311
    if not self.inFirstPerson then
        return 0.25881904510252074 * self.currentSubjectDistance
    end
    return 0
end

function u69.GetSubjectCFrame(a1) -- Line: 318 -- upvalues: BaseCamera (val)
    local lastSubjectCFrame = BaseCamera.GetSubjectCFrame(a1)
    local CurrentCamera = workspace.CurrentCamera
    local CameraSubject = CurrentCamera and CurrentCamera.CameraSubject
    if not CameraSubject then
        return lastSubjectCFrame
    end
    if CameraSubject:IsA("Humanoid")
        and (CameraSubject:GetState()) == Enum.HumanoidStateType.Dead
        and CameraSubject == a1.lastSubject then
        lastSubjectCFrame = a1.lastSubjectCFrame
    end
    if lastSubjectCFrame then
        a1.lastSubjectCFrame = lastSubjectCFrame
    end
    return lastSubjectCFrame
end

function u69.GetSubjectPosition(a1) -- Line: 344 -- upvalues: BaseCamera (val)
    local lastSubjectPosition = BaseCamera.GetSubjectPosition(a1)
    local CurrentCamera = game.Workspace.CurrentCamera
    local CameraSubject = CurrentCamera and CurrentCamera.CameraSubject
    if not CameraSubject then
        return nil
    end
    if not CameraSubject:IsA("Humanoid") then
        if CameraSubject:IsA("VehicleSeat") then
            lastSubjectPosition = CameraSubject.CFrame.p + CameraSubject.CFrame:vectorToWorldSpace((Vector3.new(0, 4, 0)))
        end
    elseif (CameraSubject:GetState()) == Enum.HumanoidStateType.Dead and CameraSubject == a1.lastSubject then
        lastSubjectPosition = a1.lastSubjectPosition
    end
    a1.lastSubjectPosition = lastSubjectPosition
    return lastSubjectPosition
end

function u69.getRotation(a1, a2) -- Line: 373 -- upvalues: CameraInput (val), UserGameSettings (val)
    local v1 = CameraInput.getRotation(a2)
    local v2 = 0
    if UserGameSettings.VRSmoothRotationEnabled then
        return v1.X
    end
    if not (0.03 < (math.abs(v1.X))) then
        if (math.abs(v1.X)) < 0.02 then
            a1.stepRotateTimeout = 0
        end
        return v2
    end
    if 0 < a1.stepRotateTimeout then
        a1.stepRotateTimeout = a1.stepRotateTimeout - a2
    end
    if not (a1.stepRotateTimeout <= 0) then
        return v2
    end
    v2 = 1
    if v1.X < 0 then
        v2 = -1
    end
    v2 = v2 * 0.5235987755982988
    a1:StartFadeFromBlack()
    a1.stepRotateTimeout = 0.25
    return v2
end

function u69.HandleSubjectDistance(a1, a2) -- Line: 408
    if a2 and a2.IsInFirstPerson and a2:IsInFirstPerson() then
        a1:SetCameraToSubjectDistance(0)
    end
end

return u69