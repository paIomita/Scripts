-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.ClickToMoveController

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.ClickToMoveController
-- Decompile time: 20.30 ms

local success, err = pcall(function() -- Line: 10
    return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding")
end)
local u4 = success and err
local success_2, err_2 = pcall(function() -- Line: 14
    return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2")
end)
local u9 = success_2 and err_2
local UserInputService = game:GetService("UserInputService")
local u20 = game:GetService("PathfindingService")
local u26 = game:GetService("Players")
game:GetService("Debris")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")
local CollectionService = game:GetService("CollectionService")
local GuiService = game:GetService("GuiService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local u68 = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI2")
local u69 = true
local u70 = true
local u71 = false
local u72 = 1
local u73 = 8
local u74 = {
    [Enum.KeyCode.W] = true,
    [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true,
    [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Up] = true,
    [Enum.KeyCode.Down] = true,
}
local LocalPlayer = u26.LocalPlayer
local ClickToMoveDisplay = require(script.Parent:WaitForChild("ClickToMoveDisplay"))
local u97 = RaycastParams.new()
u97.FilterType = Enum.RaycastFilterType.Exclude
local u99 = {}
if not u68 then
    local FindCharacterAncestor, Raycast

    function FindCharacterAncestor(a1) -- Line: 65 -- upvalues: FindCharacterAncestor (val)
        if not a1 then
            return
        end
        local Humanoid = a1:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            return a1, Humanoid
        end
        return FindCharacterAncestor(a1.Parent)
    end

    u99.FindCharacterAncestor = FindCharacterAncestor

    function Raycast(a1, a2, a3) -- Line: 77
        -- upvalues: Workspace (val), FindCharacterAncestor (val), Raycast (val)
        local v1 = a3 or {}
        local v2, v3, v4, v5 = Workspace:FindPartOnRayWithIgnoreList(a1, v1)
        if not v2 then
            return nil, nil
        end
        if a2 and v2.CanCollide == false then
            local v6
            if not v2 then
                v6 = nil
            else
                local Humanoid = v2:FindFirstChildOfClass("Humanoid")
                if not Humanoid then
                    local v7, v8 = FindCharacterAncestor(v2.Parent)
                    v6 = v8
                else
                    v6 = Humanoid
                end
            end
            if v6 == nil then
                table.insert(v1, v2)
                return Raycast(a1, a2, v1)
            end
        end
        return v2, v3, v4, v5
    end

    u99.Raycast = Raycast
end
local u102 = {}

local function findPlayerHumanoid(a1) -- Line: 99 -- upvalues: u102 (val) -- types: a1: userdata
    local Character = a1 and a1.Character
    if not Character then
        return
    end
    local v1 = u102[a1]
    if v1 and v1.Parent == Character then
        return v1
    end
    u102[a1] = nil
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        u102[a1] = Humanoid
    end
    return Humanoid
end

local u104 = nil
local u105 = nil
local u106 = nil
local u107 = nil

local function GetCharacter() -- Line: 123 -- upvalues: LocalPlayer (val)
    return LocalPlayer and LocalPlayer.Character
end

local function UpdateIgnoreTag(a1) -- Line: 127
    -- upvalues: u105 (ref), u106 (ref), u107 (ref), u104 (ref), LocalPlayer (val), CollectionService (val)
    if a1 == u105 then
        return
    end
    if u106 then
        u106:Disconnect()
        u106 = nil
    end
    if u107 then
        u107:Disconnect()
        u107 = nil
    end
    u105 = a1
    u104 = {LocalPlayer and LocalPlayer.Character}
    if u105 ~= nil then
        for i, v in ipairs((CollectionService:GetTagged(u105))) do
            table.insert(u104, v)
        end
        ;(CollectionService:GetInstanceAddedSignal(u105)):Connect(function(a1) -- Line: 147 -- upvalues: u104 (upval)
            table.insert(u104, a1)
        end)
        ;(CollectionService:GetInstanceRemovedSignal(u105)):Connect(function(a1) -- Line: 151 -- upvalues: u104 (upval)
            local v1 = #u104
            for i = 1, v1 do
                if u104[i] == a1 then
                    u104[i] = u104[#u104]
                    table.remove(u104)
                    return
                end
            end
        end)
    end
end

local function getIgnoreList() -- Line: 163 -- upvalues: u104 (ref), LocalPlayer (val)
    if u104 then
        return u104
    end
    u104 = {}
    assert(u104, "")
    local Character = LocalPlayer and LocalPlayer.Character
    table.insert(u104, Character)
    return u104
end

local function minV(a1, a2) -- Line: 173 -- types: a1: vector, a2: vector
    return (Vector3.new(math.min(a1.X, a2.X), math.min(a1.Y, a2.Y), (math.min(a1.Z, a2.Z))))
end

local function maxV(a1, a2) -- Line: 176
    return (Vector3.new(math.max(a1.X, a2.X), math.max(a1.Y, a2.Y), (math.max(a1.Z, a2.Z))))
end

local function getCollidableExtentsSize(a1) -- Line: 179 -- types: a1: userdata?
    if a1 ~= nil and a1.PrimaryPart ~= nil then
        local v1, v2, v3
        assert(a1, "")
        assert(a1.PrimaryPart, "")
        local v4 = a1.PrimaryPart.CFrame:Inverse()
        local v5 = Vector3.new((1 / 0), (1 / 0), (1 / 0))
        local v6 = Vector3.new((-1 / 0), (-1 / 0), (-1 / 0))
        for k, v in pairs(a1:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v3 = v4 * v.CFrame
                v1 = Vector3.new(v.Size.X / 2, v.Size.Y / 2, v.Size.Z / 2)
                for i, i2 in ipairs({
                    Vector3.new(v1.X, v1.Y, v1.Z),
                    Vector3.new(v1.X, v1.Y, -v1.Z),
                    Vector3.new(v1.X, -v1.Y, v1.Z),
                    Vector3.new(v1.X, -v1.Y, -v1.Z),
                    Vector3.new(-v1.X, v1.Y, v1.Z),
                    Vector3.new(-v1.X, v1.Y, -v1.Z),
                    Vector3.new(-v1.X, -v1.Y, v1.Z),
                    (Vector3.new(-v1.X, -v1.Y, -v1.Z)),
                }) do
                    v1 = v3 * i2
                    v2 = v5
                    v5 = Vector3.new(math.min(v2.X, v1.X), math.min(v2.Y, v1.Y), (math.min(v2.Z, v1.Z)))
                    v2 = v6
                    v6 = Vector3.new(math.max(v2.X, v1.X), math.max(v2.Y, v1.Y), (math.max(v2.Z, v1.Z)))
                end
            end
        end
        v4 = v6 - v5
        if not (v4.X < 0) and not (v4.Y < 0) and not (v4.Z < 0) then
            return v4
        end
        return nil
    end
end

local function Pather(a1, a2, a3) -- Line: 214
    -- upvalues: u71 (ref), LocalPlayer (val), u102 (val), u72 (ref), u4 (val), getCollidableExtentsSize (val), u9 (val)
    -- upvalues: u20 (val), u69 (ref), ClickToMoveDisplay (val), u73 (ref), u68 (val), u97 (val), u104 (ref)
    -- upvalues: Workspace (val)
    local v1, v2, v3, v4, v5
    local u3 = {}
    if a3 == nil then
        v1 = u71
        v2 = true
    else
        v1 = a3
        v2 = a3
    end
    u3.Cancelled = false
    u3.Started = false
    u3.Finished = Instance.new("BindableEvent")
    u3.PathFailed = Instance.new("BindableEvent")
    u3.PathComputing = false
    u3.PathComputed = false
    u3.OriginalTargetPoint = a1
    u3.TargetPoint = a1
    u3.TargetSurfaceNormal = a2
    u3.DiedConn = nil
    u3.SeatedConn = nil
    u3.BlockedConn = nil
    u3.TeleportedConn = nil
    u3.CurrentPoint = 0
    u3.HumanoidOffsetFromPath = Vector3.new(0, 0, 0)
    u3.CurrentWaypointPosition = nil
    u3.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
    u3.CurrentWaypointPlaneDistance = 0
    u3.CurrentWaypointNeedsJump = false
    u3.CurrentHumanoidPosition = Vector3.new(0, 0, 0)
    u3.CurrentHumanoidVelocity = 0
    u3.NextActionMoveDirection = Vector3.new(0, 0, 0)
    u3.NextActionJump = false
    u3.Timeout = 0
    local v6 = LocalPlayer
    local Character = v6 and v6.Character
    if not Character then
        v3 = nil
    else
        v5 = u102[v6]
        if not v5 or v5.Parent ~= Character then
            u102[v6] = nil
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                u102[v6] = Humanoid
            end
            v3 = Humanoid
        else
            v3 = v5
        end
    end
    u3.Humanoid = v3
    u3.OriginPoint = nil
    u3.AgentCanFollowPath = false
    u3.DirectPath = false
    u3.DirectPathRiseFirst = false
    u3.stopTraverseFunc = nil
    u3.setPointFunc = nil
    u3.pointList = nil
    local Humanoid_2 = u3.Humanoid and u3.Humanoid.RootPart
    if Humanoid_2 then
        local v7
        u3.OriginPoint = Humanoid_2.CFrame.Position
        v6 = 2
        v4 = 5
        v5 = true
        local SeatPart = u3.Humanoid.SeatPart
        if not SeatPart or not SeatPart:IsA("VehicleSeat") then
            v7 = nil
            if u4 then
                local Character_2 = LocalPlayer and LocalPlayer.Character
                if Character_2 ~= nil then
                    v7 = getCollidableExtentsSize(Character_2)
                end
            end
            if v7 == nil then
                v7 = (LocalPlayer and LocalPlayer.Character):GetExtentsSize()
            end
            assert(v7, "")
            v6 = u72 * 0.5 * math.sqrt(v7.X * v7.X + v7.Z * v7.Z)
            v4 = u72 * v7.Y
            v5 = 0 < u3.Humanoid.JumpPower
            u3.AgentCanFollowPath = true
            u3.DirectPath = v1
            u3.DirectPathRiseFirst = u3.Humanoid.Sit
        else
            v7 = SeatPart:FindFirstAncestorOfClass("Model")
            if v7 then
                local PrimaryPart = v7.PrimaryPart
                v7.PrimaryPart = SeatPart
                if v2 then
                    local ExtentsSize = v7:GetExtentsSize()
                    v6 = u72 * 0.5 * math.sqrt(ExtentsSize.X * ExtentsSize.X + ExtentsSize.Z * ExtentsSize.Z)
                    v4 = u72 * ExtentsSize.Y
                    v5 = false
                    u3.AgentCanFollowPath = true
                    u3.DirectPath = v2
                end
                v7.PrimaryPart = PrimaryPart
            end
        end
        if not u9 then
            u3.pathResult = u20:CreatePath({AgentRadius = v6, AgentHeight = v4, AgentCanJump = v5})
        else
            u3.pathResult = u20:CreatePath({AgentCanClimb = true, AgentRadius = v6, AgentHeight = v4, AgentCanJump = v5})
        end
    end

    function u3.Cleanup(a1) -- Line: 332 -- upvalues: u3 (val)
        if u3.stopTraverseFunc then
            u3.stopTraverseFunc()
            u3.stopTraverseFunc = nil
        end
        if u3.BlockedConn then
            u3.BlockedConn:Disconnect()
            u3.BlockedConn = nil
        end
        if u3.DiedConn then
            u3.DiedConn:Disconnect()
            u3.DiedConn = nil
        end
        if u3.SeatedConn then
            u3.SeatedConn:Disconnect()
            u3.SeatedConn = nil
        end
        if u3.TeleportedConn then
            u3.TeleportedConn:Disconnect()
            u3.TeleportedConn = nil
        end
        u3.Started = false
    end

    function u3.Cancel(a1) -- Line: 361 -- upvalues: u3 (val)
        u3.Cancelled = true
        u3:Cleanup()
    end

    function u3.IsActive(a1) -- Line: 366 -- upvalues: u3 (val)
        return u3.AgentCanFollowPath and u3.Started and not u3.Cancelled
    end

    function u3.OnPathInterrupted(a1) -- Line: 370 -- upvalues: u3 (val)
        u3.Cancelled = true
        u3:OnPointReached(false)
    end

    function u3.ComputePath(a1) -- Line: 376 -- upvalues: u3 (val)
        if not u3.OriginPoint then
            return
        end
        if not u3.PathComputed and not u3.PathComputing then
            u3.PathComputing = true
            if u3.AgentCanFollowPath then
                if not u3.DirectPath then
                    u3.pathResult:ComputeAsync(u3.OriginPoint, u3.TargetPoint)
                    u3.pointList = u3.pathResult:GetWaypoints()
                    u3.BlockedConn = u3.pathResult.Blocked:Connect(function(a1) -- Line: 390 -- upvalues: u3 (upval)
                        u3:OnPathBlocked(a1)
                    end)
                    u3.PathComputed = u3.pathResult.Status == Enum.PathStatus.Success
                else
                    u3.pointList = {
                        PathWaypoint.new(u3.OriginPoint, Enum.PathWaypointAction.Walk),
                        (PathWaypoint.new(
                            u3.TargetPoint,
                            u3.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk
                        )),
                    }
                    u3.PathComputed = true
                end
            end
            u3.PathComputing = false
            return
        end
    end

    function u3.IsValidPath(a1) -- Line: 398 -- upvalues: u3 (val)
        u3:ComputePath()
        return u3.PathComputed and u3.AgentCanFollowPath
    end

    u3.Recomputing = false

    function u3.OnPathBlocked(a1, a2) -- Line: 404 -- upvalues: u3 (val), u69 (upval), ClickToMoveDisplay (upval)
        if u3.CurrentPoint <= a2 and not u3.Recomputing then
            u3.Recomputing = true
            if u3.stopTraverseFunc then
                u3.stopTraverseFunc()
                u3.stopTraverseFunc = nil
            end
            u3.OriginPoint = u3.Humanoid.RootPart.CFrame.p
            u3.pathResult:ComputeAsync(u3.OriginPoint, u3.TargetPoint)
            u3.pointList = u3.pathResult:GetWaypoints()
            if #u3.pointList > 0 then
                u3.HumanoidOffsetFromPath = u3.pointList[1].Position - u3.OriginPoint
            end
            u3.PathComputed = u3.pathResult.Status == Enum.PathStatus.Success
            if u69 then
                local v1 = u3
                local v2 = u3
                local v3, v4 = ClickToMoveDisplay.CreatePathDisplay(u3.pointList)
                v1.stopTraverseFunc = v3
                v2.setPointFunc = v4
            end
            if not u3.PathComputed then
                u3.PathFailed:Fire()
                u3:Cleanup()
            else
                u3.CurrentPoint = 1
                u3:OnPointReached(true)
            end
            u3.Recomputing = false
            return
        end
    end

    function u3.OnRenderStepped(a1, a2) -- Line: 440 -- upvalues: u3 (val), u73 (upval) -- types: a1: table, a2: number
        if u3.Started and not u3.Cancelled then
            u3.Timeout = u3.Timeout + a2
            local Timeout = u3.Timeout
            if u73 < Timeout then
                u3:OnPointReached(false)
                return
            end
            u3.CurrentHumanoidPosition = u3.Humanoid.RootPart.Position + u3.HumanoidOffsetFromPath
            u3.CurrentHumanoidVelocity = u3.Humanoid.RootPart.Velocity
            while u3.Started do
                if not u3:IsCurrentWaypointReached() then
                    break
                end
                u3:OnPointReached(true)
            end
            if u3.Started then
                u3.NextActionMoveDirection = u3.CurrentWaypointPosition - u3.CurrentHumanoidPosition
                if not (1e-06 < u3.NextActionMoveDirection.Magnitude) then
                    u3.NextActionMoveDirection = Vector3.new(0, 0, 0)
                else
                    u3.NextActionMoveDirection = u3.NextActionMoveDirection.Unit
                end
                if u3.CurrentWaypointNeedsJump then
                    u3.NextActionJump = true
                    u3.CurrentWaypointNeedsJump = false
                    return
                end
                u3.NextActionJump = false
            end
        end
    end

    function u3.IsCurrentWaypointReached(a1) -- Line: 478 -- upvalues: u3 (val)
        local v1
        if if u3.CurrentWaypointPlaneNormal == Vector3.new(0, 0, 0) then true else (u3.CurrentWaypointPlaneNormal:Dot(u3.CurrentHumanoidPosition)) - u3.CurrentWaypointPlaneDistance < math.max(1, 0.0625 * -(u3.CurrentWaypointPlaneNormal:Dot(u3.CurrentHumanoidVelocity))) then
            u3.CurrentWaypointPosition = nil
            u3.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
            u3.CurrentWaypointPlaneDistance = 0
        end
        return v1
    end

    function u3.OnPointReached(a1, a2) -- Line: 504 -- upvalues: u3 (val)
        if a2 and not u3.Cancelled then
            if u3.setPointFunc then
                u3.setPointFunc(u3.CurrentPoint)
            end
            local v1 = u3.CurrentPoint + 1
            if #u3.pointList < v1 then
                if u3.stopTraverseFunc then
                    u3.stopTraverseFunc()
                end
                u3.Finished:Fire()
                u3:Cleanup()
                return
            end
            local v2 = u3.pointList[u3.CurrentPoint]
            local v3 = u3.pointList[v1]
            local State = u3.Humanoid:GetState()
            local v4 = true
            if State ~= Enum.HumanoidStateType.FallingDown then
                v4 = true
                if State ~= Enum.HumanoidStateType.Freefall then
                    v4 = State == Enum.HumanoidStateType.Jumping
                end
            end
            if v4 then
                local v5 = v3.Action == Enum.PathWaypointAction.Jump
                if not v5 and 1 < u3.CurrentPoint then
                    local v6 = v2.Position - u3.pointList[u3.CurrentPoint - 1].Position
                    local v7 = v3.Position - v2.Position
                    v5 = ((Vector2.new(v6.x, v6.z)).Unit:Dot((Vector2.new(v7.x, v7.z)).Unit)) < 0.996
                end
                if v5 then
                    u3.Humanoid.FreeFalling:Wait()
                    wait(0.1)
                end
            end
            u3:MoveToNextWayPoint(v2, v3, v1)
            return
        end
        u3.PathFailed:Fire()
        u3:Cleanup()
    end

    function u3.MoveToNextWayPoint(a1, a2, a3, a4) -- Line: 567
        -- upvalues: u3 (val), u9 (upval)
        u3.CurrentWaypointPlaneNormal = a2.Position - a3.Position
        if not u9 or a3.Label ~= "Climb" then
            u3.CurrentWaypointPlaneNormal = Vector3.new(u3.CurrentWaypointPlaneNormal.X, 0, u3.CurrentWaypointPlaneNormal.Z)
        end
        if not (1e-06 < u3.CurrentWaypointPlaneNormal.Magnitude) then
            u3.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
            u3.CurrentWaypointPlaneDistance = 0
        else
            u3.CurrentWaypointPlaneNormal = u3.CurrentWaypointPlaneNormal.Unit
            u3.CurrentWaypointPlaneDistance = u3.CurrentWaypointPlaneNormal:Dot(a3.Position)
        end
        u3.CurrentWaypointNeedsJump = a3.Action == Enum.PathWaypointAction.Jump
        u3.CurrentWaypointPosition = a3.Position
        u3.CurrentPoint = a4
        u3.Timeout = 0
    end

    function u3.Start(a1, a2) -- Line: 599 -- upvalues: u3 (val), ClickToMoveDisplay (upval), u69 (upval)
        if not u3.AgentCanFollowPath then
            u3.PathFailed:Fire()
            return
        end
        if u3.Started then
            return
        end
        u3.Started = true
        ClickToMoveDisplay.CancelFailureAnimation()
        if u69 then
            if a2 == nil or a2 then
                local v1 = u3
                local v2 = u3
                local v3, v4 = ClickToMoveDisplay.CreatePathDisplay(u3.pointList, u3.OriginalTargetPoint)
                v1.stopTraverseFunc = v3
                v2.setPointFunc = v4
            end
        end
        if not (#u3.pointList > 0) then
            u3.PathFailed:Fire()
            if u3.stopTraverseFunc then
                u3.stopTraverseFunc()
            end
            return
        end
        u3.HumanoidOffsetFromPath = Vector3.new(0, u3.pointList[1].Position.Y - u3.OriginPoint.Y, 0)
        u3.CurrentHumanoidPosition = u3.Humanoid.RootPart.Position + u3.HumanoidOffsetFromPath
        u3.CurrentHumanoidVelocity = u3.Humanoid.RootPart.Velocity
        u3.SeatedConn = u3.Humanoid.Seated:Connect(function(a1, a2) -- Line: 626 -- upvalues: u3 (upval)
            u3:OnPathInterrupted()
        end)
        u3.DiedConn = u3.Humanoid.Died:Connect(function() -- Line: 627 -- upvalues: u3 (upval)
            u3:OnPathInterrupted()
        end)
        u3.TeleportedConn = (u3.Humanoid.RootPart:GetPropertyChangedSignal("CFrame")):Connect(function() -- Line: 628 -- upvalues: u3 (upval)
            u3:OnPathInterrupted()
        end)
        u3.CurrentPoint = 1
        u3:OnPointReached(true)
    end

    v3 = u3.TargetPoint + u3.TargetSurfaceNormal * 1.5
    if not u68 then
        v5 = (Ray.new(v3, (Vector3.new(0, -50, 0))))
        if not u104 then
            u104 = {}
            assert(u104, "")
            local Character_5 = LocalPlayer and LocalPlayer.Character
            table.insert(u104, Character_5)
        end
        v6, v4 = Workspace:FindPartOnRayWithIgnoreList(v5, u104)
        if v6 then
            u3.TargetPoint = v4
        end
    else
        if not u104 then
            u104 = {}
            assert(u104, "")
            local Character_4 = LocalPlayer and LocalPlayer.Character
            table.insert(u104, Character_4)
        end
        u97.FilterDescendantsInstances = u104
        v2 = Workspace:Raycast(v3, Vector3.new(-0, -50, -0), u97)
        if v2 then
            u3.TargetPoint = v2.Position
        end
    end
    u3:ComputePath()
    return u3
end

local function CheckAlive() -- Line: 664 -- upvalues: LocalPlayer (val), u102 (val)
    local v1
    local v2 = LocalPlayer
    local Character = v2 and v2.Character
    if not Character then
        v1 = nil
    else
        local v3 = u102[v2]
        if not v3 or v3.Parent ~= Character then
            u102[v2] = nil
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                u102[v2] = Humanoid
            end
            v1 = Humanoid
        else
            v1 = v3
        end
    end
    v2 = false
    if v1 ~= nil then
        v2 = 0 < v1.Health
    end
    return v2
end

local function GetEquippedTool(a1) -- Line: 669 -- types: a1: userdata?
    if a1 ~= nil then
        for k, v in pairs(a1:GetChildren()) do
            if v:IsA("Tool") then
                return v
            end
        end
    end
end

local u130 = nil
local u131 = nil
local u132 = nil

local function CleanupPath() -- Line: 684 -- upvalues: u130 (ref), u131 (ref), u132 (ref)
    if u130 then
        u130:Cancel()
        u130 = nil
    end
    if u131 then
        u131:Disconnect()
        u131 = nil
    end
    if u132 then
        u132:Disconnect()
        u132 = nil
    end
end

local function HandleMoveTo(a1, a2, a3, a4, a5) -- Line: 702
    -- upvalues: u130 (ref), u131 (ref), u132 (ref), GetEquippedTool (val), u70 (ref), ClickToMoveDisplay (val)
    if u130 then
        if u130 then
            u130:Cancel()
            u130 = nil
        end
        if u131 then
            u131:Disconnect()
            u131 = nil
        end
        if u132 then
            u132:Disconnect()
            u132 = nil
        end
    end
    u130 = a1
    a1:Start(a5)
    u131 = a1.Finished.Event:Connect(function() -- Line: 709
        -- upvalues: u130 (upval), u131 (upval), u132 (upval), a3 (val), GetEquippedTool (upval), a4 (val)
        if u130 then
            u130:Cancel()
            u130 = nil
        end
        if u131 then
            u131:Disconnect()
            u131 = nil
        end
        if u132 then
            u132:Disconnect()
            u132 = nil
        end
        if a3 then
            local v1 = GetEquippedTool(a4)
            if v1 then
                v1:Activate()
            end
        end
    end)
    a1.PathFailed.Event:Connect(function() -- Line: 718
        -- upvalues: u130 (upval), u131 (upval), u132 (upval), a5 (val), u70 (upval), ClickToMoveDisplay (upval)
        -- upvalues: a2 (val)
        if u130 then
            u130:Cancel()
            u130 = nil
        end
        if u131 then
            u131:Disconnect()
            u131 = nil
        end
        if u132 then
            u132:Disconnect()
            u132 = nil
        end
        if a5 == nil or a5 then
            if u70 and not (u130 and u130:IsActive()) then
                ClickToMoveDisplay.PlayFailureAnimation()
            end
            ClickToMoveDisplay.DisplayFailureWaypoint(a2)
        end
    end)
end

local function ShowPathFailedFeedback(a1) -- Line: 730 -- upvalues: u130 (ref), u70 (ref), ClickToMoveDisplay (val)
    if u130 and u130:IsActive() then
        u130:Cancel()
    end
    if u70 then
        ClickToMoveDisplay.PlayFailureAnimation()
    end
    ClickToMoveDisplay.DisplayFailureWaypoint(a1)
end

function OnTap(a1, a2, a3) -- Line: 740
    -- upvalues: Workspace (val), LocalPlayer (val), u102 (val), u68 (val), u104 (ref), u97 (val), StarterGui (val)
    -- upvalues: u26 (val), u130 (ref), u131 (ref), u132 (ref), Pather (val), HandleMoveTo (val), u70 (ref)
    -- upvalues: ClickToMoveDisplay (val), u99 (val), GetEquippedTool (val)
    local v1, v2
    local CurrentCamera = Workspace.CurrentCamera
    local Character = LocalPlayer.Character
    local v3 = LocalPlayer
    local Character_2 = v3 and v3.Character
    if not Character_2 then
        v1 = nil
    else
        v2 = u102[v3]
        if not v2 or v2.Parent ~= Character_2 then
            u102[v3] = nil
            local Humanoid = Character_2:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                u102[v3] = Humanoid
            end
            v1 = Humanoid
        else
            v1 = v2
        end
    end
    local v4 = false
    if v1 ~= nil then
        v4 = 0 < v1.Health
    end
    if not v4 then
        return
    end
    if #a1 ~= 1 and not a2 then
        if #a1 >= 2 and CurrentCamera then
            v4 = GetEquippedTool(Character)
            if v4 then
                v4:Activate()
            end
        end
        return
    end
    if CurrentCamera then
        local v5, v6, v7
        v4 = CurrentCamera:ScreenPointToRay(a1[1].X, a1[1].Y)
        if u68 then
            local Instance
            v1 = nil
            v3 = nil
            if not u104 then
                u104 = {}
                assert(u104, "")
                local Character_3 = LocalPlayer and LocalPlayer.Character
                table.insert(u104, Character_3)
            end
            v2 = u104 or {}
            local v8, v9 = a3, a2
            repeat
                v5 = true
                u97.FilterDescendantsInstances = v2
                v7 = Workspace:Raycast(v4.Origin, v4.Direction * 1000, u97)
                if v7 then
                    Instance = v7.Instance
                    if not Instance.CanCollide then
                        repeat
                            v1 = Instance:FindFirstChildOfClass("Humanoid")
                            v3 = Instance
                            Instance = Instance.Parent
                        until v1 or not Instance
                        if not v1 and Instance then
                            v3 = nil
                            v5 = false
                            table.insert(v2, Instance)
                        end
                    end
                end
            until v5
            if v8
                and v1
                and StarterGui:GetCore("AvatarContextMenuEnabled")
                and u26:GetPlayerFromCharacter(v1.Parent) then
                if u130 then
                    u130:Cancel()
                    u130 = nil
                end
                if u131 then
                    u131:Disconnect()
                    u131 = nil
                end
                if u132 then
                    u132:Disconnect()
                    u132 = nil
                end
                return
            end
            if v7 and Character then
                local Position = v7.Position
                if v9 then
                    Position = v9
                    v3 = nil
                end
                if u130 then
                    u130:Cancel()
                    u130 = nil
                end
                if u131 then
                    u131:Disconnect()
                    u131 = nil
                end
                if u132 then
                    u132:Disconnect()
                    u132 = nil
                end
                v5 = Pather(Position, v7.Normal)
                if v5:IsValidPath() then
                    HandleMoveTo(v5, Position, v3, Character)
                    return
                end
                v5:Cleanup()
                if u130 and u130:IsActive() then
                    u130:Cancel()
                end
                if u70 then
                    ClickToMoveDisplay.PlayFailureAnimation()
                end
                ClickToMoveDisplay.DisplayFailureWaypoint(Position)
                return
            end
            return
        end
        v1 = Ray.new(v4.Origin, v4.Direction * 1000)
        local Raycast = u99.Raycast
        if not u104 then
            u104 = {}
            assert(u104, "")
            local Character_4 = LocalPlayer and LocalPlayer.Character
            table.insert(u104, Character_4)
        end
        v3, v7, v2 = Raycast(v1, true, u104)
        v5, v6 = u99.FindCharacterAncestor(v3)
        if a3 and v6 and StarterGui:GetCore("AvatarContextMenuEnabled") and u26:GetPlayerFromCharacter(v6.Parent) then
            if u130 then
                u130:Cancel()
                u130 = nil
            end
            if u131 then
                u131:Disconnect()
                u131 = nil
            end
            if u132 then
                u132:Disconnect()
                u132 = nil
            end
            return
        end
        if a2 then
            v7 = a2
            v5 = nil
        end
        if v7 and Character then
            if u130 then
                u130:Cancel()
                u130 = nil
            end
            if u131 then
                u131:Disconnect()
                u131 = nil
            end
            if u132 then
                u132:Disconnect()
                u132 = nil
            end
            v6 = Pather(v7, v2)
            if v6:IsValidPath() then
                HandleMoveTo(v6, v7, v5, Character)
                return
            end
            v6:Cleanup()
            if u130 and u130:IsActive() then
                u130:Cancel()
            end
            if u70 then
                ClickToMoveDisplay.PlayFailureAnimation()
            end
            ClickToMoveDisplay.DisplayFailureWaypoint(v7)
            return
        end
    end
end

local function DisconnectEvent(a1) -- Line: 850
    if a1 then
        a1:Disconnect()
    end
end

local Keyboard = require(script.Parent:WaitForChild("Keyboard"))
local u153 = setmetatable({}, Keyboard)
u153.__index = u153

function u153.new(a1) -- Line: 861 -- upvalues: Keyboard (val), u153 (val)
    local v1 = Keyboard.new(a1)
    local v2 = setmetatable(v1, u153)
    v2.fingerTouches = {}
    v2.numUnsunkTouches = 0
    v2.mouse2DownTime = tick()
    v2.mouse2DownPos = Vector2.new()
    v2.mouse2UpTime = tick()
    v2.keyboardMoveVector = Vector3.new(0, 0, 0)
    v2.tapConn = nil
    v2.inputBeganConn = nil
    v2.inputChangedConn = nil
    v2.inputEndedConn = nil
    v2.humanoidDiedConn = nil
    v2.characterChildAddedConn = nil
    v2.onCharacterAddedConn = nil
    v2.characterChildRemovedConn = nil
    v2.renderSteppedConn = nil
    v2.menuOpenedConnection = nil
    v2.preferredInputChangedConnection = nil
    v2.running = false
    v2.wasdEnabled = false
    return v2
end

function u153:DisconnectEvents() -- Line: 892
    local tapConn = self.tapConn
    if tapConn then
        tapConn:Disconnect()
    end
    local inputBeganConn = self.inputBeganConn
    if inputBeganConn then
        inputBeganConn:Disconnect()
    end
    local inputChangedConn = self.inputChangedConn
    if inputChangedConn then
        inputChangedConn:Disconnect()
    end
    local inputEndedConn = self.inputEndedConn
    if inputEndedConn then
        inputEndedConn:Disconnect()
    end
    local humanoidDiedConn = self.humanoidDiedConn
    if humanoidDiedConn then
        humanoidDiedConn:Disconnect()
    end
    local characterChildAddedConn = self.characterChildAddedConn
    if characterChildAddedConn then
        characterChildAddedConn:Disconnect()
    end
    local onCharacterAddedConn = self.onCharacterAddedConn
    if onCharacterAddedConn then
        onCharacterAddedConn:Disconnect()
    end
    local renderSteppedConn = self.renderSteppedConn
    if renderSteppedConn then
        renderSteppedConn:Disconnect()
    end
    local characterChildRemovedConn = self.characterChildRemovedConn
    if characterChildRemovedConn then
        characterChildRemovedConn:Disconnect()
    end
    local menuOpenedConnection = self.menuOpenedConnection
    if menuOpenedConnection then
        menuOpenedConnection:Disconnect()
    end
    local preferredInputChangedConnection = self.preferredInputChangedConnection
    if preferredInputChangedConnection then
        preferredInputChangedConnection:Disconnect()
    end
end

function u153:OnTouchBegan(a2, a3) -- Line: 906
    if self.fingerTouches[a2] == nil and not a3 then
        self.numUnsunkTouches = self.numUnsunkTouches + 1
    end
    self.fingerTouches[a2] = a3
end

function u153:OnTouchChanged(a2, a3) -- Line: 913
    if self.fingerTouches[a2] == nil then
        self.fingerTouches[a2] = a3
        if not a3 then
            self.numUnsunkTouches = self.numUnsunkTouches + 1
        end
    end
end

function u153:OnTouchEnded(a2, a3) -- Line: 922
    if self.fingerTouches[a2] ~= nil and self.fingerTouches[a2] == false then
        self.numUnsunkTouches = self.numUnsunkTouches - 1
    end
    self.fingerTouches[a2] = nil
end

function u153.OnPreferredInputChanged(a1) -- Line: 929 -- upvalues: LocalPlayer (val), UserInputService (val)
    local Character = LocalPlayer.Character
    if Character then
        local v1 = UserInputService.PreferredInput == Enum.PreferredInput.Touch
        for k, v in pairs(Character:GetChildren()) do
            if v:IsA("Tool") then
                v.ManualActivationOnly = v1
            end
        end
    end
end

function u153:OnCharacterAdded(a2) -- Line: 941
    -- upvalues: UserInputService (val), u74 (val), u130 (ref), u131 (ref), u132 (ref), ClickToMoveDisplay (val)
    -- upvalues: GuiService (val)
    self:DisconnectEvents()
    self.inputBeganConn = UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 944
        -- upvalues: self (val), u74 (upval), u130 (upval), u131 (upval), u132 (upval), ClickToMoveDisplay (upval)
        if a1.UserInputType == Enum.UserInputType.Touch then
            self:OnTouchBegan(a1, a2)
        end
        if self.wasdEnabled
            and a2 == false
            and a1.UserInputType == Enum.UserInputType.Keyboard
            and u74[a1.KeyCode] then
            if u130 then
                u130:Cancel()
                u130 = nil
            end
            if u131 then
                u131:Disconnect()
                u131 = nil
            end
            if u132 then
                u132:Disconnect()
                u132 = nil
            end
            ClickToMoveDisplay.CancelFailureAnimation()
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton2 then
            self.mouse2DownTime = tick()
            self.mouse2DownPos = a1.Position
        end
    end)
    self.inputChangedConn = UserInputService.InputChanged:Connect(function(a1, a2) -- Line: 961 -- upvalues: self (val)
        if a1.UserInputType == Enum.UserInputType.Touch then
            self:OnTouchChanged(a1, a2)
        end
    end)
    self.inputEndedConn = UserInputService.InputEnded:Connect(function(a1, a2) -- Line: 967 -- upvalues: self (val), u130 (upval)
        if a1.UserInputType == Enum.UserInputType.Touch then
            self:OnTouchEnded(a1, a2)
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton2 then
            self.mouse2UpTime = tick()
            local Position = a1.Position
            local v1 = u130 or self.keyboardMoveVector.Magnitude <= 0
            local v2 = self.mouse2UpTime - self.mouse2DownTime
            if v2 < 0.25 and (Position - self.mouse2DownPos).magnitude < 5 and v1 then
                v2 = {Position}
                OnTap(v2)
            end
        end
    end)
    self.tapConn = UserInputService.TouchTap:Connect(function(a1, a2) -- Line: 984
        if not a2 then
            OnTap(a1, nil, true)
        end
    end)
    self.menuOpenedConnection = GuiService.MenuOpened:Connect(function() -- Line: 990 -- upvalues: u130 (upval), u131 (upval), u132 (upval)
        if u130 then
            u130:Cancel()
            u130 = nil
        end
        if u131 then
            u131:Disconnect()
            u131 = nil
        end
        if u132 then
            u132:Disconnect()
            u132 = nil
        end
    end)

    local function OnCharacterChildAdded(a1) -- Line: 994 -- upvalues: UserInputService (upval), self (val)
        if UserInputService.PreferredInput == Enum.PreferredInput.Touch and a1:IsA("Tool") then
            a1.ManualActivationOnly = true
        end
        if a1:IsA("Humanoid") then
            local humanoidDiedConn = self.humanoidDiedConn
            if humanoidDiedConn then
                humanoidDiedConn:Disconnect()
            end
            self.humanoidDiedConn = a1.Died:Connect(function() end)
        end
    end

    self.characterChildAddedConn = a2.ChildAdded:Connect(function(a1) -- Line: 1010 -- upvalues: OnCharacterChildAdded (val)
        OnCharacterChildAdded(a1)
    end)
    self.characterChildRemovedConn = a2.ChildRemoved:Connect(function(a1) -- Line: 1013 -- upvalues: UserInputService (upval)
        if UserInputService.PreferredInput == Enum.PreferredInput.Touch and a1:IsA("Tool") then
            a1.ManualActivationOnly = false
        end
    end)
    for k, v in pairs(a2:GetChildren()) do
        OnCharacterChildAdded(v)
    end
    self.preferredInputChangedConnection = (UserInputService:GetPropertyChangedSignal("PreferredInput")):Connect(function() -- Line: 1024 -- upvalues: self (val)
        self:OnPreferredInputChanged()
    end)
end

function u153:Start() -- Line: 1029
    self:Enable(true)
end

function u153.Stop(a1) -- Line: 1033
    a1:Enable(false)
end

function u153.CleanupPath(a1) -- Line: 1037 -- upvalues: u130 (ref), u131 (ref), u132 (ref)
    if u130 then
        u130:Cancel()
        u130 = nil
    end
    if u131 then
        u131:Disconnect()
        u131 = nil
    end
    if u132 then
        u132:Disconnect()
        u132 = nil
    end
end

function u153:Enable(a2, a3, a4) -- Line: 1041
    -- upvalues: LocalPlayer (val), u130 (ref), u131 (ref), u132 (ref), UserInputService (val), Keyboard (val)
    if not a2 then
        if self.running then
            self:DisconnectEvents()
            if u130 then
                u130:Cancel()
                u130 = nil
            end
            if u131 then
                u131:Disconnect()
                u131 = nil
            end
            if u132 then
                u132:Disconnect()
                u132 = nil
            end
            if UserInputService.PreferredInput == Enum.PreferredInput.Touch then
                local Character_2 = LocalPlayer.Character
                if Character_2 then
                    for k, v in pairs(Character_2:GetChildren()) do
                        if v:IsA("Tool") then
                            v.ManualActivationOnly = false
                        end
                    end
                end
            end
            self.running = false
        end
        if self.touchJumpController and not self.jumpEnabled then
            self.touchJumpController:Enable(true)
        end
        self.touchJumpController = nil
    else
        if not self.running then
            if LocalPlayer.Character then
                self:OnCharacterAdded(LocalPlayer.Character)
            end
            self.onCharacterAddedConn = LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 1047 -- upvalues: self (val)
                self:OnCharacterAdded(a1)
            end)
            self.running = true
        end
        self.touchJumpController = a4
        if self.touchJumpController then
            self.touchJumpController:Enable(self.jumpEnabled)
        end
    end
    Keyboard.Enable(self, a2)
    self.wasdEnabled = a2 and a3 or false
    self.enabled = a2
end

function u153:OnRenderStepped(a2) -- Line: 1086 -- upvalues: u130 (ref)
    self.isJumping = false
    if not u130 then
        self.moveVector = self.keyboardMoveVector
        self.moveVectorIsCameraRelative = true
    else
        u130:OnRenderStepped(a2)
        if not u130 then
            self.moveVector = self.keyboardMoveVector
            self.moveVectorIsCameraRelative = true
        else
            self.moveVector = u130.NextActionMoveDirection
            self.moveVectorIsCameraRelative = false
            if u130.NextActionJump then
                self.isJumping = true
            end
        end
    end
    if self.jumpRequested then
        self.isJumping = true
    end
end

function u153.UpdateMovement(a1, a2) -- Line: 1121
    if a2 == Enum.UserInputState.Cancel then
        a1.keyboardMoveVector = Vector3.new(0, 0, 0)
        return
    end
    if a1.wasdEnabled then
        a1.keyboardMoveVector = Vector3.new(a1.leftValue + a1.rightValue, 0, a1.forwardValue + a1.backwardValue)
    end
end

function u153.UpdateJump(a1) end

function u153.SetShowPath(a1, a2) -- Line: 1135 -- upvalues: u69 (ref)
    u69 = a2
end

function u153.GetShowPath(a1) -- Line: 1139 -- upvalues: u69 (ref)
    return u69
end

function u153.SetWaypointTexture(a1, a2) -- Line: 1143 -- upvalues: ClickToMoveDisplay (val)
    ClickToMoveDisplay.SetWaypointTexture(a2)
end

function u153.GetWaypointTexture(a1) -- Line: 1147 -- upvalues: ClickToMoveDisplay (val)
    return ClickToMoveDisplay.GetWaypointTexture()
end

function u153.SetWaypointRadius(a1, a2) -- Line: 1151 -- upvalues: ClickToMoveDisplay (val)
    ClickToMoveDisplay.SetWaypointRadius(a2)
end

function u153.GetWaypointRadius(a1) -- Line: 1155 -- upvalues: ClickToMoveDisplay (val)
    return ClickToMoveDisplay.GetWaypointRadius()
end

function u153.SetEndWaypointTexture(a1, a2) -- Line: 1159 -- upvalues: ClickToMoveDisplay (val)
    ClickToMoveDisplay.SetEndWaypointTexture(a2)
end

function u153.GetEndWaypointTexture(a1) -- Line: 1163 -- upvalues: ClickToMoveDisplay (val)
    return ClickToMoveDisplay.GetEndWaypointTexture()
end

function u153.SetWaypointsAlwaysOnTop(a1, a2) -- Line: 1167 -- upvalues: ClickToMoveDisplay (val)
    ClickToMoveDisplay.SetWaypointsAlwaysOnTop(a2)
end

function u153.GetWaypointsAlwaysOnTop(a1) -- Line: 1171 -- upvalues: ClickToMoveDisplay (val)
    return ClickToMoveDisplay.GetWaypointsAlwaysOnTop()
end

function u153.SetFailureAnimationEnabled(a1, a2) -- Line: 1175 -- upvalues: u70 (ref)
    u70 = a2
end

function u153.GetFailureAnimationEnabled(a1) -- Line: 1179 -- upvalues: u70 (ref)
    return u70
end

function u153.SetIgnoredPartsTag(a1, a2) -- Line: 1183 -- upvalues: UpdateIgnoreTag (val)
    UpdateIgnoreTag(a2)
end

function u153.GetIgnoredPartsTag(a1) -- Line: 1187 -- upvalues: u105 (ref)
    return u105
end

function u153.SetUseDirectPath(a1, a2) -- Line: 1191 -- upvalues: u71 (ref)
    u71 = a2
end

function u153.GetUseDirectPath(a1) -- Line: 1195 -- upvalues: u71 (ref)
    return u71
end

function u153.SetAgentSizeIncreaseFactor(a1, a2) -- Line: 1199 -- upvalues: u72 (ref) -- types: a1: table, a2: number
    u72 = a2 / 100 + 1
end

function u153.GetAgentSizeIncreaseFactor(a1) -- Line: 1203 -- upvalues: u72 (ref)
    return (u72 - 1) * 100
end

function u153.SetUnreachableWaypointTimeout(a1, a2) -- Line: 1207 -- upvalues: u73 (ref)
    u73 = a2
end

function u153.GetUnreachableWaypointTimeout(a1) -- Line: 1211 -- upvalues: u73 (ref)
    return u73
end

function u153.SetUserJumpEnabled(a1, a2) -- Line: 1215
    a1.jumpEnabled = a2
    if a1.touchJumpController then
        a1.touchJumpController:Enable(a2)
    end
end

function u153.GetUserJumpEnabled(a1) -- Line: 1222
    return a1.jumpEnabled
end

function u153.MoveTo(a1, a2, a3, a4) -- Line: 1226 -- upvalues: LocalPlayer (val), Pather (val), HandleMoveTo (val)
    local Character = LocalPlayer.Character
    if Character == nil then
        return false
    end
    local v1 = Pather(a2, Vector3.new(0, 1, 0), a4)
    if v1 and v1:IsValidPath() then
        HandleMoveTo(v1, a2, nil, Character, a3)
        return true
    end
    return false
end

return u153