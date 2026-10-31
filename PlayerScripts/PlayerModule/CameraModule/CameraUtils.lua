-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.CameraUtils

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.CameraUtils
-- Decompile time: 3.54 ms

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local u16 = {}

local function round(a1) -- Line: 12 -- types: a1: number
    return (math.floor(a1 + 0.5))
end

local u18 = {}
u18.__index = u18

function u18.new(a1, a2) -- Line: 21 -- upvalues: u18 (val)
    return (setmetatable({vel = 0, freq = a1, goal = a2, pos = a2}, u18))
end

function u18.step(a1, a2) -- Line: 31 -- types: a1: table, a2: number
    local v1 = a1.freq * 2 * 3.141592653589793
    local goal = a1.goal
    local pos = a1.pos
    local vel = a1.vel
    local v2 = pos - goal
    local v3 = math.exp(-v1 * a2)
    local v4 = (v2 * (v1 * a2 + 1) + vel * a2) * v3 + goal
    local v5 = (vel * (1 - v1 * a2) - v2 * (v1 * v1 * a2)) * v3
    a1.pos = v4
    a1.vel = v5
    return v4
end

u16.Spring = u18

function u16.map(a1, a2, a3, a4, a5) -- Line: 53 -- types: a1: number, a2: number, a3: number, a4: number, a5: number
    return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4
end

function u16.mapClamp(a1, a2, a3, a4, a5) -- Line: 58
    -- upvalues: 
    return (math.clamp((a1 - a2) * (a5 - a4) / (a3 - a2) + a4, math.min(a4, a5), (math.max(a4, a5))))
end

function u16.getLooseBoundingSphere(a1) -- Line: 67 -- types: a1: table
    local Magnitude, Magnitude_2, Magnitude_3
    local v1 = table.create(#a1)
    for k, v in pairs(a1) do
        v1[k] = v.Position
    end
    local v2 = v1[1]
    local v3 = v2
    local v4 = 0
    for i, i2 in ipairs(v1) do
        Magnitude_3 = (i2 - v2).Magnitude
        if v4 < Magnitude_3 then
            v3 = i2
            v4 = Magnitude_3
        end
    end
    v4 = v3
    v2 = 0
    for i3, j in ipairs(v1) do
        Magnitude_2 = (j - v3).Magnitude
        if v2 < Magnitude_2 then
            v4 = j
            v2 = Magnitude_2
        end
    end
    v2 = (v3 + v4) * 0.5
    local v5 = (v3 - v4).Magnitude * 0.5
    for i4, k2 in ipairs(v1) do
        Magnitude = (k2 - v2).Magnitude
        if v5 < Magnitude then
            v2 = v2 + (Magnitude - v5) * 0.5 * (k2 - v2).Unit
            v5 = (Magnitude + v5) * 0.5
        end
    end
    return v2, v5
end

function u16.sanitizeAngle(a1) -- Line: 123 -- types: a1: number
    return (a1 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
end

function u16.Round(a1, a2) -- Line: 128 -- types: a1: number, a2: number
    local v1 = 10 ^ a2
    return math.floor(a1 * v1 + 0.5) / v1
end

function u16.IsFinite(a1) -- Line: 133 -- types: a1: number
    local v1 = false
    if a1 == a1 then
        v1 = false
        if a1 ~= (1 / 0) then
            v1 = a1 ~= (-1 / 0)
        end
    end
    return v1
end

function u16.IsFiniteVector3(a1) -- Line: 137 -- upvalues: u16 (val) -- types: a1: vector
    return u16.IsFinite(a1.X) and u16.IsFinite(a1.Y) and u16.IsFinite(a1.Z)
end

function u16.GetAngleBetweenXZVectors(a1, a2) -- Line: 142 -- types: a1: vector, a2: vector
    return (math.atan2(a2.X * a1.Z - a2.Z * a1.X, a2.X * a1.X + a2.Z * a1.Z))
end

function u16.RotateVectorByAngleAndRound(a1, a2, a3) -- Line: 146 -- types: a1: vector, a2: number, a3: number
    if not (0 < a1.Magnitude) then
        return 0
    end
    local Unit = a1.Unit
    local v1 = math.atan2(Unit.Z, Unit.X)
    return math.floor(((math.atan2(Unit.Z, Unit.X)) + a2) / a3 + 0.5) * a3 - v1
end

local function SCurveTranform(a1) -- Line: 160 -- types: a1: number
    local v1 = math.clamp(a1, -1, 1)
    if v1 >= 0 then
        return v1 * 0.35 / (0.35 - v1 + 1)
    end
    return -(-v1 * 0.8 / (v1 + 0.8 + 1))
end

local function toSCurveSpace(a1) -- Line: 169 -- types: a1: number
    return (math.abs(a1) * 2 - 1) * 1.1 - 0.1
end

local function fromSCurveSpace(a1) -- Line: 173 -- types: a1: number
    return a1 / 2 + 0.5
end

function u16.GamepadLinearToCurve(a1) -- Line: 177 -- types: a1: userdata
    local function onAxis(a1) -- Line: 178
        local v1 = 1
        if a1 < 0 then
            v1 = -1
        end
        local v2 = math.clamp(((math.abs((math.abs(a1)))) * 2 - 1) * 1.1 - 0.1, -1, 1)
        return (math.clamp(((if not (v2 >= 0) then -(-v2 * 0.8 / (v2 + 0.8 + 1)) else v2 * 0.35 / (0.35 - v2 + 1)) / 2 + 0.5) * v1, -1, 1))
    end

    local new = Vector2.new
    local X = a1.X
    local v1 = 1
    if X < 0 then
        v1 = -1
    end
    local v2 = math.clamp(((math.abs((math.abs(X)))) * 2 - 1) * 1.1 - 0.1, -1, 1)
    local v3 = math.clamp(((if not (v2 >= 0) then -(-v2 * 0.8 / (v2 + 0.8 + 1)) else v2 * 0.35 / (0.35 - v2 + 1)) / 2 + 0.5) * v1, -1, 1)
    local Y = a1.Y
    local v4 = 1
    if Y < 0 then
        v4 = -1
    end
    local v5 = math.clamp(((math.abs((math.abs(Y)))) * 2 - 1) * 1.1 - 0.1, -1, 1)
    return new(v3, (math.clamp(((if not (v5 >= 0) then -(-v5 * 0.8 / (v5 + 0.8 + 1)) else v5 * 0.35 / (0.35 - v5 + 1)) / 2 + 0.5) * v4, -1, 1)))
end

function u16.ConvertCameraModeEnumToStandard(a1) -- Line: 191
    if a1 == Enum.TouchCameraMovementMode.Default then
        return Enum.ComputerCameraMovementMode.Follow
    end
    if a1 == Enum.ComputerCameraMovementMode.Default then
        return Enum.ComputerCameraMovementMode.Classic
    end
    if a1 ~= Enum.TouchCameraMovementMode.Classic
        and a1 ~= Enum.DevTouchCameraMovementMode.Classic
        and a1 ~= Enum.DevComputerCameraMovementMode.Classic
        and a1 ~= Enum.ComputerCameraMovementMode.Classic then
        if a1 ~= Enum.TouchCameraMovementMode.Follow
            and a1 ~= Enum.DevTouchCameraMovementMode.Follow
            and a1 ~= Enum.DevComputerCameraMovementMode.Follow
            and a1 ~= Enum.ComputerCameraMovementMode.Follow then
            if a1 ~= Enum.TouchCameraMovementMode.Orbital
                and a1 ~= Enum.DevTouchCameraMovementMode.Orbital
                and a1 ~= Enum.DevComputerCameraMovementMode.Orbital
                and a1 ~= Enum.ComputerCameraMovementMode.Orbital then
                if a1 ~= Enum.ComputerCameraMovementMode.CameraToggle
                    and a1 ~= Enum.DevComputerCameraMovementMode.CameraToggle then
                    if a1 ~= Enum.DevTouchCameraMovementMode.UserChoice
                        and a1 ~= Enum.DevComputerCameraMovementMode.UserChoice then
                        return Enum.ComputerCameraMovementMode.Classic
                    end
                    return Enum.DevComputerCameraMovementMode.UserChoice
                end
                return Enum.ComputerCameraMovementMode.CameraToggle
            end
            return Enum.ComputerCameraMovementMode.Orbital
        end
        return Enum.ComputerCameraMovementMode.Follow
    end
    return Enum.ComputerCameraMovementMode.Classic
end

local function getMouse() -- Line: 240 -- upvalues: Players (val)
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end
    assert(LocalPlayer)
    return LocalPlayer:GetMouse()
end

local u36 = ""
local u37 = nil

function u16.setMouseIconOverride(a1) -- Line: 252 -- upvalues: Players (val), u37 (ref), u36 (ref) -- types: a1: string
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end
    assert(LocalPlayer)
    local v1 = LocalPlayer:GetMouse()
    if v1.Icon ~= u37 then
        u36 = v1.Icon
    end
    v1.Icon = a1
    u37 = a1
end

function u16.restoreMouseIcon() -- Line: 263 -- upvalues: Players (val), u37 (ref), u36 (ref)
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end
    assert(LocalPlayer)
    local v1 = LocalPlayer:GetMouse()
    if v1.Icon == u37 then
        v1.Icon = u36
    end
    u37 = nil
end

local Default = Enum.MouseBehavior.Default
local u41 = nil

function u16.setMouseBehaviorOverride(a1) -- Line: 274 -- upvalues: UserInputService (val), u41 (ref), Default (ref)
    if UserInputService.MouseBehavior ~= u41 then
        Default = UserInputService.MouseBehavior
    end
    UserInputService.MouseBehavior = a1
    u41 = a1
end

function u16.restoreMouseBehavior() -- Line: 283 -- upvalues: UserInputService (val), u41 (ref), Default (ref)
    if UserInputService.MouseBehavior == u41 then
        UserInputService.MouseBehavior = Default
    end
    u41 = nil
end

local MovementRelative = Enum.RotationType.MovementRelative
local u45 = nil

function u16.setRotationTypeOverride(a1) -- Line: 292
    -- upvalues: UserGameSettings (val), u45 (ref), MovementRelative (ref)
    if UserGameSettings.RotationType ~= u45 then
        MovementRelative = UserGameSettings.RotationType
    end
    UserGameSettings.RotationType = a1
    u45 = a1
end

function u16.restoreRotationType() -- Line: 301 -- upvalues: UserGameSettings (val), u45 (ref), MovementRelative (ref)
    if UserGameSettings.RotationType == u45 then
        UserGameSettings.RotationType = MovementRelative
    end
    u45 = nil
end

return u16