-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.VRNavigation

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.VRNavigation
-- Decompile time: 6.94 ms

local VRService = game:GetService("VRService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local PathfindingService = game:GetService("PathfindingService")
local ContextActionService = game:GetService("ContextActionService")
local StarterGui = game:GetService("StarterGui")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local u48 = nil
local LocalPlayer = Players.LocalPlayer
local u52 = RaycastParams.new()
u52.FilterType = Enum.RaycastFilterType.Exclude
local UserRaycastUpdateAPI2 = FlagUtil.getUserFlag("UserRaycastUpdateAPI2")

local function IsFinite(a1) -- Line: 42 -- types: a1: number
    local v1 = false
    if a1 == a1 then
        v1 = false
        if a1 ~= (1 / 0) then
            v1 = a1 ~= (-1 / 0)
        end
    end
    return v1
end

local function IsFiniteVector3(a1) -- Line: 46
    local x = a1.x
    local v1 = false
    if x == x then
        v1 = false
        if x ~= (1 / 0) then
            v1 = x ~= (-1 / 0)
        end
    end
    if v1 then
        local y = a1.y
        v1 = false
        if y == y then
            v1 = false
            if y ~= (1 / 0) then
                v1 = y ~= (-1 / 0)
            end
        end
        if v1 then
            local z = a1.z
            v1 = false
            if z == z then
                v1 = false
                if z ~= (1 / 0) then
                    v1 = z ~= (-1 / 0)
                end
            end
        end
    end
    return v1
end

local BindableEvent = Instance.new("BindableEvent")
BindableEvent.Name = "MovementUpdate"
BindableEvent.Parent = script
coroutine.wrap(function() -- Line: 54 -- upvalues: u48 (ref)
    local PathDisplay = script.Parent:WaitForChild("PathDisplay")
    if PathDisplay then
        require(PathDisplay)
    end
end)()
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local u79 = setmetatable({}, BaseCharacterController)
u79.__index = u79

function u79.new(a1) -- Line: 67 -- upvalues: BaseCharacterController (val), u79 (val)
    local v1 = BaseCharacterController.new()
    local v2 = setmetatable(v1, u79)
    v2.CONTROL_ACTION_PRIORITY = a1
    v2.navigationRequestedConn = nil
    v2.heartbeatConn = nil
    v2.currentDestination = nil
    v2.currentPath = nil
    v2.currentPoints = nil
    v2.currentPointIdx = 0
    v2.expectedTimeToNextPoint = 0
    v2.timeReachedLastPoint = tick()
    v2.moving = false
    v2.isJumpBound = false
    v2.moveLatch = false
    v2.userCFrameEnabledConn = nil
    return v2
end

function u79.SetLaserPointerMode(a1, a2) -- Line: 92 -- upvalues: StarterGui (val)
    pcall(function() -- Line: 93 -- upvalues: StarterGui (upval), a2 (val)
        StarterGui:SetCore("VRLaserPointerMode", a2)
    end)
end

function u79.GetLocalHumanoid(a1) -- Line: 98 -- upvalues: LocalPlayer (val)
    local Character = LocalPlayer.Character
    if not Character then
        return
    end
    for k, v in pairs(Character:GetChildren()) do
        if v:IsA("Humanoid") then
            return v
        end
    end
    return nil
end

function u79.HasBothHandControllers(a1) -- Line: 112 -- upvalues: VRService (val)
    return VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
end

function u79.HasAnyHandControllers(a1) -- Line: 116 -- upvalues: VRService (val)
    return VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
end

function u79.IsMobileVR(a1) -- Line: 120 -- upvalues: UserInputService (val)
    return UserInputService.TouchEnabled
end

function u79.HasGamepad(a1) -- Line: 124 -- upvalues: UserInputService (val)
    return UserInputService.GamepadEnabled
end

function u79:ShouldUseNavigationLaser() -- Line: 128
    if self:IsMobileVR() then
        return true
    end
    if self:HasBothHandControllers() then
        return false
    end
    if not self:HasAnyHandControllers() then
        return not self:HasGamepad()
    end
    return true
end

function u79:StartFollowingPath(a2) -- Line: 150 -- upvalues: BindableEvent (val)
    currentPath = a2
    currentPoints = currentPath:GetPointCoordinates()
    currentPointIdx = 1
    moving = true
    timeReachedLastPoint = tick()
    local LocalHumanoid = self:GetLocalHumanoid()
    if LocalHumanoid and LocalHumanoid.Torso and #currentPoints >= 1 then
        expectedTimeToNextPoint = (currentPoints[1] - LocalHumanoid.Torso.Position).magnitude / LocalHumanoid.WalkSpeed
    end
    BindableEvent:Fire("targetPoint", self.currentDestination)
end

function u79:GoToPoint(a2) -- Line: 167 -- upvalues: BindableEvent (val)
    currentPath = true
    currentPoints = {a2}
    currentPointIdx = 1
    moving = true
    local LocalHumanoid = self:GetLocalHumanoid()
    local v1 = (LocalHumanoid.Torso.Position - a2).magnitude / LocalHumanoid.WalkSpeed
    timeReachedLastPoint = tick()
    expectedTimeToNextPoint = v1
    BindableEvent:Fire("targetPoint", a2)
end

function u79:StopFollowingPath() -- Line: 183
    currentPath = nil
    currentPoints = nil
    currentPointIdx = 0
    moving = false
    self.moveVector = Vector3.new(0, 0, 0)
end

function u79.TryComputePath(a1, a2, a3) -- Line: 191
    -- upvalues: PathfindingService (val)
    local v1 = 0
    local v2 = nil
    local v3, v4 = a2, a3
    while not v2 do
        if not (v1 < 5) then
            break
        end
        v2 = PathfindingService:ComputeSmoothPathAsync(v3, v4, 200)
        v1 = v1 + 1
        if v2.Status ~= Enum.PathStatus.ClosestNoPath and v2.Status ~= Enum.PathStatus.ClosestOutOfRange then
            if v2 and v2.Status == Enum.PathStatus.FailStartNotEmpty then
                v3 = v3 + (v4 - v3).Unit
                v2 = nil
            end
            if v2 and v2.Status == Enum.PathStatus.FailFinishNotEmpty then
                v4 = v4 + Vector3.new(0, 1, 0)
                v2 = nil
            end
            continue
        end
        return nil
    end
    return v2
end

function u79:OnNavigationRequest(a2, a3) -- Line: 218
    -- upvalues: u48 (ref)
    local Position = a2.Position
    local currentDestination = self.currentDestination
    local x = Position.x
    local v1 = false
    if x == x then
        v1 = false
        if x ~= (1 / 0) then
            v1 = x ~= (-1 / 0)
        end
    end
    if v1 then
        local y = Position.y
        v1 = false
        if y == y then
            v1 = false
            if y ~= (1 / 0) then
                v1 = y ~= (-1 / 0)
            end
        end
        if v1 then
            local z = Position.z
            v1 = false
            if z == z then
                v1 = false
                if z ~= (1 / 0) then
                    v1 = z ~= (-1 / 0)
                end
            end
        end
    end
    if not v1 then
        return
    end
    self.currentDestination = Position
    local v2 = self:GetLocalHumanoid()
    if v2 and v2.Torso then
        local Position_2 = v2.Torso.Position
        if (self.currentDestination - Position_2).magnitude < 12 then
            self:GoToPoint(self.currentDestination)
            return
        end
        if currentDestination and not (4 < (self.currentDestination - currentDestination).magnitude) then
            if not moving then
                self:GoToPoint(self.currentDestination)
                return
            end
            local currentPoints_2 = self.currentPoints
            local v3 = #currentPoints
            currentPoints_2[v3] = self.currentDestination
            return
        end
        v2 = self:TryComputePath(Position_2, self.currentDestination)
        if not v2 then
            self:StopFollowingPath()
            if u48 then
                u48.clearRenderedPath()
                return
            end
            return
        end
        self:StartFollowingPath(v2)
        if not u48 then
            return
        end
        u48.setCurrentPoints(self.currentPoints)
        u48.renderPath()
        return
    end
end

function u79:OnJumpAction(a2, a3, a4) -- Line: 264
    if a3 == Enum.UserInputState.Begin then
        self.isJumping = true
    end
    return Enum.ContextActionResult.Sink
end

function u79:BindJumpAction(a2) -- Line: 270 -- upvalues: ContextActionService (val)
    if not a2 then
        if self.isJumpBound then
            self.isJumpBound = false
            ContextActionService:UnbindAction("VRJumpAction")
        end
        return
    end
    if self.isJumpBound then
        return
    end
    self.isJumpBound = true
    local v1 = ContextActionService
    local CONTROL_ACTION_PRIORITY = self.CONTROL_ACTION_PRIORITY
    local ButtonA = Enum.KeyCode.ButtonA
    v1:BindActionAtPriority("VRJumpAction", function() -- Line: 274 -- upvalues: self (val)
        return self:OnJumpAction()
    end, false, CONTROL_ACTION_PRIORITY, ButtonA)
end

function u79:ControlCharacterGamepad(a2, a3, a4) -- Line: 285 -- upvalues: u48 (ref), BindableEvent (val)
    if a4.KeyCode ~= Enum.KeyCode.Thumbstick1 then
        return
    end
    if a3 == Enum.UserInputState.Cancel then
        self.moveVector = Vector3.new(0, 0, 0)
        return
    end
    if a3 == Enum.UserInputState.End then
        self.moveVector = Vector3.new(0, 0, 0)
        if self:ShouldUseNavigationLaser() then
            self:BindJumpAction(false)
            self:SetLaserPointerMode("Navigation")
        end
        if self.moveLatch then
            self.moveLatch = false
            BindableEvent:Fire("offtrack")
        end
    else
        self:StopFollowingPath()
        if u48 then
            u48.clearRenderedPath()
        end
        if self:ShouldUseNavigationLaser() then
            self:BindJumpAction(true)
            self:SetLaserPointerMode("Hidden")
        end
        if 0.22 < a4.Position.magnitude then
            self.moveVector = Vector3.new(a4.Position.X, 0, -a4.Position.Y)
            if 0 < self.moveVector.magnitude then
                self.moveVector = self.moveVector.unit * math.min(1, a4.Position.magnitude)
            end
            self.moveLatch = true
        end
    end
    return Enum.ContextActionResult.Sink
end

function u79:OnHeartbeat(a2) -- Line: 328
    -- upvalues: u48 (ref), UserRaycastUpdateAPI2 (val), u52 (val), BindableEvent (val)
    local moveVector = self.moveVector
    local LocalHumanoid = self:GetLocalHumanoid()
    if LocalHumanoid and LocalHumanoid.Torso then
        if self.moving and self.currentPoints then
            local v1
            local Position = LocalHumanoid.Torso.Position
            local v2 = (currentPoints[1] - Position) * Vector3.new(1, 0, 1)
            local magnitude = v2.magnitude
            local v3 = v2 / magnitude
            if not (magnitude < 1) then
                local v4
                if not UserRaycastUpdateAPI2 then
                    v1 = {
                        game.Players.LocalPlayer.Character,
                        workspace.CurrentCamera,
                    }
                    v4 = Ray.new(Position - Vector3.new(0, 1, 0), v3 * 3)
                    local v5, v6 = workspace:FindPartOnRayWithIgnoreList(v4, v1)
                    if v5 then
                        local v7
                        local v8 = Ray.new(v6 + v3 * 0.5 + Vector3.new(0, 100, 0), (Vector3.new(-0, -100, -0)))
                        _, v7 = workspace:FindPartOnRayWithIgnoreList(v8, v1)
                        local v9 = v7.Y - Position.Y
                        if v9 < 6 and v9 > -2 then
                            LocalHumanoid.Jump = true
                        end
                    end
                else
                    v1 = u52
                    v4 = {
                        game.Players.LocalPlayer.Character,
                        workspace.CurrentCamera,
                    }
                    v1.FilterDescendantsInstances = v4
                    v1 = workspace:Raycast(Position - Vector3.new(0, 1, 0), v3 * 3, u52)
                    if v1 then
                        v4 = workspace:Raycast(v1.Position + v3 * 0.5 + Vector3.new(0, 100, 0), Vector3.new(-0, -100, -0), u52).Position.Y - Position.Y
                        if v4 < 6 and v4 > -2 then
                            LocalHumanoid.Jump = true
                        end
                    end
                end
                v1 = tick() - timeReachedLastPoint
                if expectedTimeToNextPoint + 2 < v1 then
                    self:StopFollowingPath()
                    if u48 then
                        u48.clearRenderedPath()
                    end
                    BindableEvent:Fire("offtrack")
                end
                moveVector = self.moveVector:Lerp(v3, a2 * 10)
            else
                v2 = 0
                v1 = currentPoints[1]
                for k, v in pairs(currentPoints) do
                    if k ~= 1 then
                        v1 = v
                        v2 = v2 + (v - v1).magnitude / LocalHumanoid.WalkSpeed
                    end
                end
                table.remove(currentPoints, 1)
                currentPointIdx = currentPointIdx + 1
                if #currentPoints == 0 then
                    self:StopFollowingPath()
                    if u48 then
                        u48.clearRenderedPath()
                    end
                    return
                end
                if u48 then
                    u48.setCurrentPoints(currentPoints)
                    u48.renderPath()
                end
                expectedTimeToNextPoint = (currentPoints[1] - Position).magnitude / LocalHumanoid.WalkSpeed
                timeReachedLastPoint = tick()
            end
        end
        local x = moveVector.x
        local v10 = false
        if x == x then
            v10 = false
            if x ~= (1 / 0) then
                v10 = x ~= (-1 / 0)
            end
        end
        if v10 then
            local y = moveVector.y
            v10 = false
            if y == y then
                v10 = false
                if y ~= (1 / 0) then
                    v10 = y ~= (-1 / 0)
                end
            end
            if v10 then
                local z = moveVector.z
                v10 = false
                if z == z then
                    v10 = false
                    if z ~= (1 / 0) then
                        v10 = z ~= (-1 / 0)
                    end
                end
            end
        end
        if v10 then
            self.moveVector = moveVector
        end
        return
    end
end

function u79:OnUserCFrameEnabled() -- Line: 426
    if self:ShouldUseNavigationLaser() then
        self:BindJumpAction(false)
        self:SetLaserPointerMode("Navigation")
        return
    end
    self:BindJumpAction(true)
    self:SetLaserPointerMode("Hidden")
end

function u79.Enable(a1, a2) -- Line: 436 -- upvalues: VRService (val), RunService (val), ContextActionService (val)
    a1.moveVector = Vector3.new(0, 0, 0)
    a1.isJumping = false
    if a2 then
        a1.navigationRequestedConn = VRService.NavigationRequested:Connect(function(a1_2, a2) -- Line: 442 -- upvalues: a1 (val)
            a1:OnNavigationRequest(a1_2, a2)
        end)
        a1.heartbeatConn = RunService.Heartbeat:Connect(function(a1_2) -- Line: 443 -- upvalues: a1 (val)
            a1:OnHeartbeat(a1_2)
        end)
        local v1 = ContextActionService
        local CONTROL_ACTION_PRIORITY = a1.CONTROL_ACTION_PRIORITY
        local Thumbstick1 = Enum.KeyCode.Thumbstick1
        v1:BindAction("MoveThumbstick", function(a1_2, a2, a3) -- Line: 445 -- upvalues: a1 (val)
            return a1:ControlCharacterGamepad(a1_2, a2, a3)
        end, false, CONTROL_ACTION_PRIORITY, Thumbstick1)
        ContextActionService:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
        a1.userCFrameEnabledConn = VRService.UserCFrameEnabled:Connect(function() -- Line: 449 -- upvalues: a1 (val)
            a1:OnUserCFrameEnabled()
        end)
        a1:OnUserCFrameEnabled()
        VRService:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick)
        VRService:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY)
        a1.enabled = true
        return
    end
    a1:StopFollowingPath()
    ContextActionService:UnbindAction("MoveThumbstick")
    ContextActionService:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
    a1:BindJumpAction(false)
    a1:SetLaserPointerMode("Disabled")
    if a1.navigationRequestedConn then
        a1.navigationRequestedConn:Disconnect()
        a1.navigationRequestedConn = nil
    end
    if a1.heartbeatConn then
        a1.heartbeatConn:Disconnect()
        a1.heartbeatConn = nil
    end
    if a1.userCFrameEnabledConn then
        a1.userCFrameEnabledConn:Disconnect()
        a1.userCFrameEnabledConn = nil
    end
    a1.enabled = false
end

return u79