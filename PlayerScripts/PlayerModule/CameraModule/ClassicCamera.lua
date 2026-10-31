-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.ClassicCamera

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.ClassicCamera
-- Decompile time: 6.42 ms

Vector2.new(0, 0)
local u4 = 0
local u10 = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local u27 = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserFixCameraFPError")
local Players = game:GetService("Players")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local u60 = setmetatable({}, BaseCamera)
u60.__index = u60

function u60.new() -- Line: 39 -- upvalues: BaseCamera (val), u60 (val), CameraUtils (val)
    local v1 = BaseCamera.new()
    local v2 = setmetatable(v1, u60)
    v2.isFollowCamera = false
    v2.isCameraToggle = false
    v2.lastUpdate = tick()
    v2.cameraToggleSpring = CameraUtils.Spring.new(5, 0)
    return v2
end

function u60:GetCameraToggleOffset(a2) -- Line: 50
    -- upvalues: CameraInput (val), CameraUtils (val)
    if not self.isCameraToggle then
        return (Vector3.new())
    end
    local currentSubjectDistance = self.currentSubjectDistance
    if not CameraInput.getTogglePan() then
        self.cameraToggleSpring.goal = 0
    else
        self.cameraToggleSpring.goal = math.clamp(CameraUtils.map(currentSubjectDistance, 0.5, self.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1)
    end
    return (Vector3.new(0, self.cameraToggleSpring:step(a2) * ((math.clamp(CameraUtils.map(currentSubjectDistance, 0.5, 64, 0, 1), 0, 1)) + 1), 0))
end

function u60.SetCameraMovementMode(a1, a2) -- Line: 68 -- upvalues: BaseCamera (val)
    BaseCamera.SetCameraMovementMode(a1, a2)
    a1.isFollowCamera = a2 == Enum.ComputerCameraMovementMode.Follow
    a1.isCameraToggle = a2 == Enum.ComputerCameraMovementMode.CameraToggle
end

function u60.Update(a1, a2) -- Line: 75
    -- upvalues: u10 (val), Players (val), CameraInput (val), u4 (ref), CameraUtils (val), u27 (val)
    local CFrame_2, CameraHeight, CameraSubject, CameraToSubjectDistance, CameraToggleOffset, CurrentCamera, Focus, Humanoid, HumanoidRootPart, LocalPlayer, MouseLockOffset, SubjectPosition, lookVector, lookVector_2, p, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local dispatch = 0
    while true do
        if dispatch < 40 then
            if dispatch < 20 then
                if dispatch < 10 then
                    if dispatch < 5 then
                        if dispatch < 2 then
                            if dispatch < 1 then
                                tick()
                                CurrentCamera = workspace.CurrentCamera
                                CFrame_2 = CurrentCamera.CFrame
                                Focus = CurrentCamera.Focus
                                dispatch = if not a1.resetCameraAngle then 5 else 1
                            else
                                a1:GetHumanoidRootPart()
                            end
                        elseif dispatch < 3 then
                            lookVector = (HumanoidRootPart.CFrame * u10).lookVector
                        elseif dispatch < 4 then
                            lookVector = u10.lookVector
                        else
                            a1.resetCameraAngle = false
                        end
                    elseif dispatch < 7 then
                        if dispatch < 6 then
                            LocalPlayer = Players.LocalPlayer
                            a1:GetHumanoid()
                            dispatch = if not CurrentCamera.CameraSubject then 7 else 6
                        else
                            CameraSubject:IsA("VehicleSeat")
                        end
                    elseif not (dispatch < 8) then
                        if dispatch < 9 then
                            CameraSubject:IsA("SkateboardPlatform")
                        end
                    end
                elseif dispatch < 15 then
                    if dispatch < 12 then
                        if dispatch < 11 then
                            dispatch = if (Humanoid:GetState()) == Enum.HumanoidStateType.Climbing then 12 else 11
                        end
                    elseif not (dispatch < 13) then
                        dispatch = if dispatch < 14 then if a1.lastUpdate == nil then 15 else 14 else if not (a2 > 1) then 16 else 15
                    end
                elseif dispatch < 17 then
                    if dispatch < 16 then
                        a1.lastCameraTransform = nil
                    else
                        v4 = CameraInput.getRotation(a2)
                        a1:StepZoom()
                        a1:GetCameraHeight()
                        dispatch = if v4 == Vector2.new() then 18 else 17
                    end
                elseif dispatch < 18 then
                    u4 = 0
                    a1.lastUserPanCamera = tick()
                elseif dispatch < 19 then
                    dispatch = if v7 - a1.lastUserPanCamera < 2 then 20 else 19
                end
            elseif dispatch < 30 then
                if dispatch < 25 then
                    if dispatch < 22 then
                        if not (dispatch < 21) then
                            a1:GetSubjectPosition()
                        end
                    elseif not (dispatch < 23) then
                        if not (dispatch < 24) then
                            CameraToSubjectDistance = a1:GetCameraToSubjectDistance()
                            dispatch = if not (CameraToSubjectDistance < 0.5) then 26 else 25
                        end
                    end
                elseif dispatch < 27 then
                    if not (dispatch < 26) then
                        dispatch = if not a1:GetIsMouseLocked() then 32 else 27
                    end
                elseif dispatch < 28 then
                    dispatch = if a1:IsInFirstPerson() then 32 else 28
                elseif dispatch < 29 then
                    a1:CalculateNewLookCFrameFromArg(lookVector, v4)
                    a1:GetMouseLockOffset()
                else
                    MouseLockOffset = MouseLockOffset + Humanoid.CameraOffset
                end
            elseif dispatch < 35 then
                if dispatch < 32 then
                    if dispatch < 31 then
                        v8 = MouseLockOffset.X * v5.RightVector + MouseLockOffset.Y * v5.UpVector + MouseLockOffset.Z * v5.LookVector
                        dispatch = if not CameraUtils.IsFiniteVector3(v8) then 67 else 31
                    else
                        SubjectPosition = SubjectPosition + v8
                    end
                elseif dispatch < 33 then
                    dispatch = if v4 ~= Vector2.new() then 34 else 33
                else
                    v5 = not (dispatch < 34)
                end
            elseif dispatch < 37 then
                dispatch = if dispatch < 36 then if v5 then 67 else 36 else if not a1.lastCameraTransform then 67 else 37
            elseif dispatch < 38 then
                a1:IsInFirstPerson()
            else
                dispatch = if dispatch < 39 then if v2 then 41 else 39 else if not a1.isFollowCamera then 60 else 40
            end
        elseif dispatch < 60 then
            if dispatch < 50 then
                if dispatch < 45 then
                    dispatch = if dispatch < 42 then if dispatch < 41 then if not v3 then 60 else 41 else if not a1.lastUpdate then 60 else 42 else if dispatch < 43 then if not Humanoid then 60 else 43 else if dispatch < 44 then if not Humanoid.Torso then 60 else 44 else if not v6 then 52 else 45
                elseif dispatch < 47 then
                    dispatch = if dispatch < 46 then if not a1.lastSubjectCFrame then 67 else 46 else if v1 then 48 else 47
                elseif not (dispatch < 48) then
                    if dispatch < 49 then
                        dispatch = if not CameraSubject:IsA("BasePart") then 67 else 49
                    else
                        v8 = -CameraUtils.GetAngleBetweenXZVectors(a1.lastSubjectCFrame.lookVector, CameraSubject.CFrame.lookVector)
                        dispatch = if not CameraUtils.IsFinite(v8) then 51 else 50
                    end
                end
            elseif dispatch < 55 then
                if dispatch < 52 then
                    if dispatch < 51 then
                        v4 = v4 + Vector2.new(v8, 0)
                    else
                        u4 = 0
                    end
                elseif not (dispatch < 53) then
                    if dispatch < 54 then
                        lookVector_2 = Humanoid.Torso.CFrame.lookVector
                        u4 = math.clamp(u4 + 3.839724354387525 * a2, 0, 4.363323129985824)
                        math.clamp(u4 * a2, 0, 1)
                        dispatch = if not a1:IsInFirstPerson() then 57 else 54
                    else
                        dispatch = if not a1.isFollowCamera then 56 else 55
                    end
                end
            elseif dispatch < 57 then
                if dispatch < 56 then
                    dispatch = if a1.isClimbing then 57 else 56
                end
            elseif dispatch < 58 then
                v10 = CameraUtils.GetAngleBetweenXZVectors(lookVector_2, a1:GetCameraLookVector())
                dispatch = if not CameraUtils.IsFinite(v10) then 67 else 58
            elseif dispatch < 59 then
                dispatch = if not (0.0001 < (math.abs(v10))) then 67 else 59
            else
                v4 = v4 + Vector2.new(v10 * v9, 0)
            end
        elseif dispatch < 70 then
            if dispatch < 65 then
                if dispatch < 62 then
                    dispatch = if dispatch < 61 then if not a1.isFollowCamera then 67 else 61 else if v6 then 67 else 62
                elseif not (dispatch < 63) then
                    if dispatch < 64 then
                        v9 = CameraUtils.GetAngleBetweenXZVectors(-(a1.lastCameraTransform.p - SubjectPosition), a1:GetCameraLookVector())
                        dispatch = if not CameraUtils.IsFinite(v9) then 67 else 64
                    else
                        dispatch = if not (0.0001 < (math.abs(v9))) then 67 else 65
                    end
                end
            elseif dispatch < 67 then
                if dispatch < 66 then
                    v10 = math.abs(v9)
                    dispatch = if not (0.4 * a2 < v10) then 67 else 66
                else
                    v4 = v4 + Vector2.new(v9, 0)
                end
            elseif dispatch < 68 then
                dispatch = if a1.isFollowCamera then 71 else 68
            elseif dispatch < 69 then
                p = (CFrame.new(SubjectPosition)).p
                a1:CalculateNewLookVectorFromArg(lookVector, v4)
            else
                CFrame.lookAlong(p - CameraToSubjectDistance * v6, v6)
            end
        elseif dispatch < 75 then
            if dispatch < 72 then
                if dispatch < 71 then
                    CFrame.new(p - CameraToSubjectDistance * v6, p)
                else
                    a1:CalculateNewLookVectorFromArg(lookVector, v4)
                    CFrame.new(SubjectPosition)
                end
            elseif dispatch < 73 then
                CFrame.lookAlong(v12.p - CameraToSubjectDistance * v5, v5)
            elseif dispatch < 74 then
                v11 = (CFrame.new(v12.p - CameraToSubjectDistance * v5, v12.p)) + Vector3.new(0, CameraHeight, 0)
            else
                CameraToggleOffset = a1:GetCameraToggleOffset(a2)
                Focus = v12 + CameraToggleOffset
                CFrame_2 = v11 + CameraToggleOffset
                a1.lastCameraTransform = CFrame_2
                a1.lastCameraFocus = Focus
            end
        elseif dispatch < 77 then
            dispatch = if dispatch < 76 then if not v2 then 78 else 76 else if not CameraSubject:IsA("BasePart") then 78 else 77
        elseif dispatch < 78 then
            a1.lastSubjectCFrame = CameraSubject.CFrame
        else
            if not (dispatch < 79) then
                a1.lastUpdate = v7
                return CFrame_2, Focus
            end
            a1.lastSubjectCFrame = nil
        end
    end
end

return u60