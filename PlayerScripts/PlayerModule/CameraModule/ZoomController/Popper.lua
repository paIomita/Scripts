-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
-- Decompile time: 8.60 ms

local NearPlaneZ, v1
local Players = game:GetService("Players")
local CommonUtils = script.Parent.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local CameraWrapper = require(CommonUtils:WaitForChild("CameraWrapper"))
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"))
local u34 = FlagUtil.getUserFlag("UserRaycastUpdateAPI2")
local UserCurrentCameraUpdate2 = FlagUtil.getUserFlag("UserCurrentCameraUpdate2")
local UserPlayerConnectionMemoryLeak = FlagUtil.getUserFlag("UserPlayerConnectionMemoryLeak")
local u44 = if not UserCurrentCameraUpdate2 then nil else CameraWrapper.new()
local CurrentCamera = if not UserCurrentCameraUpdate2 then game.Workspace.CurrentCamera else nil
if UserCurrentCameraUpdate2 then
    u44:Enable()
end
local min = math.min
local tan = math.tan
local rad = math.rad
local new = Ray.new
local u61 = RaycastParams.new()
u61.IgnoreWater = true
u61.FilterType = Enum.RaycastFilterType.Exclude
u61.RespectCanCollide = true
local u66 = RaycastParams.new()
u66.IgnoreWater = true
u66.FilterType = Enum.RaycastFilterType.Include
local u77 = if not UserPlayerConnectionMemoryLeak then nil else ConnectionUtil.new()

local function getTotalTransparency(a1) -- Line: 43
    return 1 - (1 - a1.Transparency) * (1 - a1.LocalTransparencyModifier)
end

local function eraseFromEnd(a1, a2) -- Line: 47
    local v1 = #a1
    local v2 = a2 + 1
    for i = v1, v2, -1 do
        a1[i] = nil
    end
end

local u81 = nil
local u82 = nil
if not UserCurrentCameraUpdate2 then
    local function updateProjection_2() -- Line: 79
        -- upvalues: CurrentCamera (ref), rad (val), u82 (ref), tan (val), u81 (ref)
        local v1 = rad(CurrentCamera.FieldOfView)
        local ViewportSize = CurrentCamera.ViewportSize
        local v2 = ViewportSize.X / ViewportSize.Y
        u82 = tan(v1 / 2) * 2
        u81 = v2 * u82
    end

    ;(CurrentCamera:GetPropertyChangedSignal("FieldOfView")):Connect(updateProjection_2)
    ;(CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateProjection_2)
    v1 = rad(CurrentCamera.FieldOfView)
    local ViewportSize_2 = CurrentCamera.ViewportSize
    local v2 = ViewportSize_2.X / ViewportSize_2.Y
    u82 = tan(v1 / 2) * 2
    u81 = v2 * u82
    NearPlaneZ = CurrentCamera.NearPlaneZ
    ;(CurrentCamera:GetPropertyChangedSignal("NearPlaneZ")):Connect(function() -- Line: 93 -- upvalues: NearPlaneZ (ref), CurrentCamera (ref)
        NearPlaneZ = CurrentCamera.NearPlaneZ
    end)
else
    local function updateProjection() -- Line: 57 -- upvalues: u44 (val), rad (val), u82 (ref), tan (val), u81 (ref)
        local v1 = u44:getCamera()
        local v2 = rad(v1.FieldOfView)
        local ViewportSize = v1.ViewportSize
        v1 = ViewportSize.X / ViewportSize.Y
        u82 = tan(v2 / 2) * 2
        u81 = v1 * u82
    end

    u44:Connect("FieldOfView", updateProjection)
    u44:Connect("ViewportSize", updateProjection)
    v1 = u44:getCamera()
    local v3 = rad(v1.FieldOfView)
    local ViewportSize = v1.ViewportSize
    v1 = ViewportSize.X / ViewportSize.Y
    u82 = tan(v3 / 2) * 2
    u81 = v1 * u82
    NearPlaneZ = u44:getCamera().NearPlaneZ
    u44:Connect("NearPlaneZ", function() -- Line: 73 -- upvalues: NearPlaneZ (ref), u44 (val)
        NearPlaneZ = u44:getCamera().NearPlaneZ
    end)
end
local u165 = {}
local u166 = {}

local function refreshIgnoreList() -- Line: 102 -- upvalues: u165 (ref), u166 (val)
    local v1 = 1
    u165 = {}
    for k, v in pairs(u166) do
        u165[v1] = v
        v1 = v1 + 1
    end
end

local function playerAdded(a1) -- Line: 111
    -- upvalues: u166 (val), u165 (ref), UserPlayerConnectionMemoryLeak (val), u77 (val)
    local function characterAdded(a1_2) -- Line: 112 -- upvalues: u166 (upval), a1 (val), u165 (upval)
        u166[a1] = a1_2
        local v1 = 1
        u165 = {}
        for k, v in pairs(u166) do
            u165[v1] = v
            v1 = v1 + 1
        end
    end

    local function characterRemoving() -- Line: 116 -- upvalues: u166 (upval), a1 (val), u165 (upval)
        u166[a1] = nil
        local v1 = 1
        u165 = {}
        for k, v in pairs(u166) do
            u165[v1] = v
            v1 = v1 + 1
        end
    end

    if not UserPlayerConnectionMemoryLeak then
        a1.CharacterAdded:Connect(characterAdded)
        a1.CharacterRemoving:Connect(characterRemoving)
    else
        u77:trackConnection(("%*CharacterAdded"):format(a1.UserId), (a1.CharacterAdded:Connect(characterAdded)))
        u77:trackConnection(("%*CharacterRemoving"):format(a1.UserId), (a1.CharacterRemoving:Connect(characterRemoving)))
    end
    if a1.Character then
        u166[a1] = a1.Character
        local v1 = 1
        u165 = {}
        for k, v in pairs(u166) do
            u165[v1] = v
            v1 = v1 + 1
        end
    end
end

Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(function(a1) -- Line: 134 -- upvalues: u166 (val), u165 (ref), UserPlayerConnectionMemoryLeak (val), u77 (val)
    u166[a1] = nil
    local v1 = 1
    u165 = {}
    for k, v in pairs(u166) do
        u165[v1] = v
        v1 = v1 + 1
    end
    if UserPlayerConnectionMemoryLeak then
        u77:disconnect((("%*CharacterAdded"):format(a1.UserId)))
        u77:disconnect((("%*CharacterRemoving"):format(a1.UserId)))
    end
end)
for i, v in ipairs(Players:GetPlayers()) do
    playerAdded(v)
end
local v4 = 1
u165 = {}
for k, i2 in pairs(u166) do
    u165[v4] = i2
    v4 = v4 + 1
end
local u218 = nil
local u219 = nil
if not UserCurrentCameraUpdate2 then
    (CurrentCamera:GetPropertyChangedSignal("CameraSubject")):Connect(function() -- Line: 185 -- upvalues: CurrentCamera (ref), u219 (ref)
        local CameraSubject = CurrentCamera.CameraSubject
        if CameraSubject:IsA("Humanoid") then
            u219 = CameraSubject.RootPart
            return
        end
        if CameraSubject:IsA("BasePart") then
            u219 = CameraSubject
            return
        end
        u219 = nil
    end)
else
    u44:Connect("CameraSubject", function() -- Line: 174 -- upvalues: u44 (val), u219 (ref)
        local CameraSubject = u44:getCamera().CameraSubject
        if CameraSubject and CameraSubject:IsA("Humanoid") then
            u219 = CameraSubject.RootPart
            return
        end
        if CameraSubject and CameraSubject:IsA("BasePart") then
            u219 = CameraSubject
            return
        end
        u219 = nil
    end)
end

local function canOcclude(a1) -- Line: 197 -- upvalues: u34 (val), u218 (ref)
    local CanCollide = false
    if 1 - (1 - a1.Transparency) * (1 - a1.LocalTransparencyModifier) < 0.25 then
        if u34 then
            CanCollide = false
            if u218 ~= (a1:GetRootPart() or a1) then
                CanCollide = not a1:IsA("TrussPart")
            end
        else
            CanCollide = a1.CanCollide
            if CanCollide then
                CanCollide = false
                if u218 ~= (a1:GetRootPart() or a1) then
                    CanCollide = not a1:IsA("TrussPart")
                end
            end
        end
    end
    return CanCollide
end

local u240 = {}
v4 = Vector2.new(0.4, 0)
local v5 = Vector2.new(-0.4, 0)
local v6 = Vector2.new(0, -0.4)
local v7 = Vector2.new(0, 0.4)
u240[1] = v4
u240[2] = v5
u240[3] = v6
u240[4] = v7
u240[5] = Vector2.new(0, 0.2)

local function getCollisionPoint(a1, a2) -- Line: 225 -- upvalues: u34 (val), u61 (val), u165 (ref), new (val)
    local v1, v2, v3, v4, v5, v6
    if u34 then
        u61.FilterDescendantsInstances = u165
        v1 = workspace:Raycast(a1, a2, u61)
        if v1 then
            return v1.Position, true
        end
        return a1 + a2, false
    end
    v1 = #u165
    while true do
        v2, v3 = workspace:FindPartOnRayWithIgnoreList(new(a1, a2), u165, false, true)
        if v2 then
            if v2.CanCollide then
                v4 = u165
                v6 = #v4
                v5 = v1 + 1
                for k = v6, v5, -1 do
                    v4[k] = nil
                end
                return v3, true
            end
            u165[#u165 + 1] = v2
            if not v2 then
                v2 = u165
                v5 = #v2
                v3 = v1 + 1
                for j = v5, v3, -1 do
                    v2[j] = nil
                end
                return a1 + a2, false
            end
        elseif not v2 then
            v2 = u165
            v5 = #v2
            v3 = v1 + 1
            for i = v5, v3, -1 do
                v2[i] = nil
            end
            return a1 + a2, false
        end
    end
end

local function queryPoint(a1, a2, a3, a4) -- Line: 258
    -- upvalues: u165 (ref), NearPlaneZ (ref), u34 (val), u61 (val), u218 (ref), u66 (val), new (val)
    local v1, v2, v3, v4
    debug.profilebegin("queryPoint")
    local v5 = #u165
    local v6 = a3 + NearPlaneZ
    local v7 = a1 + a2 * v6
    local v8 = (1 / 0)
    local v9 = (1 / 0)
    local v10 = a1
    local v11 = 0
    if not u34 then
        local CanCollide_2, Magnitude_2, v12, v13, v14, v15, v16
        v1, v4, v2 = a1, a4, a2
        repeat
            v3, v12 = workspace:FindPartOnRayWithIgnoreList(new(v10, v7 - v10), u165, false, true)
            v11 = v11 + 1
            if v3 then
                v13 = v11 >= 64
                CanCollide_2 = false
                if 1 - (1 - v3.Transparency) * (1 - v3.LocalTransparencyModifier) < 0.25 then
                    if u34 then
                        CanCollide_2 = false
                        if u218 ~= (v3:GetRootPart() or v3) then
                            CanCollide_2 = not v3:IsA("TrussPart")
                        end
                    else
                        CanCollide_2 = v3.CanCollide
                        if CanCollide_2 then
                            CanCollide_2 = false
                            if u218 ~= (v3:GetRootPart() or v3) then
                                CanCollide_2 = not v3:IsA("TrussPart")
                            end
                        end
                    end
                end
                if CanCollide_2 or v13 then
                    v14 = {v3}
                    v15 = workspace:FindPartOnRayWithWhitelist(new(v7, v12 - v7), v14, true)
                    Magnitude_2 = (v12 - v1).Magnitude
                    if not v15 or v13 then
                        v9 = Magnitude_2
                    else
                        v16 = false
                        if v4 then
                            v16 = workspace:FindPartOnRayWithWhitelist(new(v4, v7 - v4), v14, true) or workspace:FindPartOnRayWithWhitelist(new(v7, v4 - v7), v14, true)
                        end
                        if v16 then
                            v9 = Magnitude_2
                        elseif v6 < v8 then
                            v8 = Magnitude_2
                        end
                    end
                end
                u165[#u165 + 1] = v3
                v10 = v12 - v2 * 0.001
            end
        until v9 < (1 / 0) or not v3
        v3 = u165
        v14 = #v3
        v12 = v5 + 1
        for i = v14, v12, -1 do
            v3[i] = nil
        end
    else
        local CanCollide, Instance, Magnitude, Position
        u61.FilterDescendantsInstances = u165
        v1, v4, v2 = a1, a4, a2
        repeat
            v3 = workspace:Raycast(v10, v7 - v10, u61)
            if not v3 then
                break
            end
            v11 = v11 + 1
            Instance = v3.Instance
            Position = v3.Position
            Magnitude = (Position - v1).Magnitude
            if not (v11 >= 64) then
                CanCollide = false
                if 1 - (1 - Instance.Transparency) * (1 - Instance.LocalTransparencyModifier) < 0.25 then
                    if u34 then
                        CanCollide = false
                        if u218 ~= (Instance:GetRootPart() or Instance) then
                            CanCollide = not Instance:IsA("TrussPart")
                        end
                    else
                        CanCollide = Instance.CanCollide
                        if CanCollide then
                            CanCollide = false
                            if u218 ~= (Instance:GetRootPart() or Instance) then
                                CanCollide = not Instance:IsA("TrussPart")
                            end
                        end
                    end
                end
                if CanCollide then
                    u66.FilterDescendantsInstances = {Instance}
                    if not workspace:Raycast(v7, Position - v7, u66) then
                        v9 = Magnitude
                    elseif if not v4 then false else workspace:Raycast(v4, v7 - v4, u66) or workspace:Raycast(v7, v4 - v7, u66) then
                        v9 = Magnitude
                    elseif v6 < v8 then
                        v8 = Magnitude
                    end
                end
            else
                v9 = Magnitude
            end
            u61:AddToFilter(Instance)
            v10 = Position - v2 * 0.001
        until v9 < (1 / 0) or not Instance
    end
    debug.profileend()
    return v8 - NearPlaneZ, v9 - NearPlaneZ
end

local function queryViewport(a1, a2) -- Line: 361
    -- upvalues: CurrentCamera (ref), UserCurrentCameraUpdate2 (val), u44 (val), u81 (ref), u82 (ref), NearPlaneZ (ref)
    -- upvalues: queryPoint (val)
    local v1, v2, v3, v4
    debug.profilebegin("queryViewport")
    local p = a1.p
    local rightVector = a1.rightVector
    local upVector = a1.upVector
    local v5 = -a1.lookVector
    CurrentCamera = if not UserCurrentCameraUpdate2 then CurrentCamera else u44:getCamera()
    local ViewportSize = CurrentCamera.ViewportSize
    local v6 = (1 / 0)
    local v7 = (1 / 0)
    for i = 0, 1 do
        v1 = rightVector * ((i - 0.5) * u81)
        for j = 0, 1 do
            v2 = upVector * ((j - 0.5) * u82)
            v3, v4 = queryPoint(
                p + NearPlaneZ * (v1 + v2),
                v5,
                a2,
                (CurrentCamera:ViewportPointToRay(ViewportSize.x * i, ViewportSize.y * j)).Origin
            )
            if v4 < v6 then
                v6 = v4
            end
            if v3 < v7 then
                v7 = v3
            end
        end
    end
    debug.profileend()
    return v7, v6
end

local function testPromotion(a1, a2, a3) -- Line: 404
    -- upvalues: getCollisionPoint (val), min (val), queryPoint (val), u240 (val)
    local v1
    debug.profilebegin("testPromotion")
    local p = a1.p
    local rightVector = a1.rightVector
    local upVector = a1.upVector
    local v2 = -a1.lookVector
    debug.profilebegin("extrapolate")
    for i = 0, (min(1.25, a3.rotVelocity.magnitude + ((getCollisionPoint(p, a3.posVelocity * 1.25)) - p).Magnitude / a3.posVelocity.magnitude)), 0.0625 do
        v1 = a3.extrapolate(i)
        if a2 <= queryPoint(v1.p, -v1.lookVector, a2) then
            return false
        end
    end
    debug.profileend()
    debug.profilebegin("testOffsets")
    for i2, v in ipairs(u240) do
        v1 = getCollisionPoint(p, rightVector * v.x + upVector * v.y)
        if queryPoint(v1, (p + v2 * a2 - v1).Unit, a2) == (1 / 0) then
            return false
        end
    end
    debug.profileend()
    debug.profileend()
    return true
end

return function(a1, a2, a3) -- Line: 453 -- upvalues: u218 (ref), u219 (ref), queryViewport (val), testPromotion (val)
    debug.profilebegin("popper")
    u218 = u219 and u219:GetRootPart() or u219
    local v1 = a2
    local v2, v3 = queryViewport(a1, a2)
    if v3 < v1 then
        v1 = v3
    end
    if v2 < v1 and testPromotion(a1, a2, a3) then
        v1 = v2
    end
    u218 = nil
    debug.profileend()
    return v1
end