-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.Poppercam

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.Poppercam
-- Decompile time: 1.71 ms

local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local u21 = require(script.Parent:WaitForChild("ZoomController"))
local UserFixCameraFPError = FlagUtil.getUserFlag("UserFixCameraFPError")
local u25 = {}
u25.__index = u25
local u27 = CFrame.new()

local function cframeToAxis(a1) -- Line: 17 -- types: a1: userdata
    local v1, v2 = a1:ToAxisAngle()
    return v1 * v2
end

local function axisToCFrame(a1) -- Line: 22 -- upvalues: u27 (val) -- types: a1: vector
    local Magnitude = a1.Magnitude
    if Magnitude > 1e-05 then
        return CFrame.fromAxisAngle(a1, Magnitude)
    end
    return u27
end

local function extractRotation(a1) -- Line: 30 -- types: a1: userdata
    local Components_10, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9
    _, _, _, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9, Components_10 = a1:GetComponents()
    return CFrame.new(
        0,
        0,
        0,
        Components_2,
        Components_3,
        Components_4,
        Components_5,
        Components_6,
        Components_7,
        Components_8,
        Components_9,
        Components_10
    )
end

function u25.new() -- Line: 35 -- upvalues: u25 (val)
    return (setmetatable({}, u25))
end

function u25:Step(a2, a3) -- Line: 41 -- upvalues: u27 (val) -- types: self: table, a2: number, a3: userdata
    local Components_10, Components_11, Components_12, Components_16, Components_17, Components_18, Components_19, Components_20, Components_21, Components_22, Components_23, Components_24, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9
    local v1 = self.lastCFrame or a3
    self.lastCFrame = a3
    local Position = a3.Position
    _, _, _, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9, Components_10, Components_11, Components_12 = a3:GetComponents()
    local u34 = CFrame.new(
        0,
        0,
        0,
        Components_4,
        Components_5,
        Components_6,
        Components_7,
        Components_8,
        Components_9,
        Components_10,
        Components_11,
        Components_12
    )
    local p = v1.p
    _, _, _, Components_16, Components_17, Components_18, Components_19, Components_20, Components_21, Components_22, Components_23, Components_24 = v1:GetComponents()
    local v2 = CFrame.new(
        0,
        0,
        0,
        Components_16,
        Components_17,
        Components_18,
        Components_19,
        Components_20,
        Components_21,
        Components_22,
        Components_23,
        Components_24
    )
    local u66 = (Position - p) / a2
    local v3, v4 = (u34 * v2:inverse()):ToAxisAngle()
    local u76 = v3 * v4 / a2
    return {
        extrapolate = function(a1) -- Line: 56 -- upvalues: u66 (val), Position (val), u76 (val), u27 (upval), u34 (val)
            local v1 = u66 * a1 + Position
            local v2 = u76 * a1
            local Magnitude = v2.Magnitude
            return (if not (Magnitude > 1e-05) then u27 else CFrame.fromAxisAngle(v2, Magnitude)) * u34 + v1
        end,
        posVelocity = u66,
        rotVelocity = u76,
    }
end

function u25:Reset() -- Line: 69
    self.lastCFrame = nil
end

local BaseOcclusion = require(script.Parent:WaitForChild("BaseOcclusion"))
local u45 = setmetatable({}, BaseOcclusion)
u45.__index = u45

function u45.new() -- Line: 79 -- upvalues: BaseOcclusion (val), u45 (val), u25 (val)
    local v1 = BaseOcclusion.new()
    local v2 = setmetatable(v1, u45)
    v2.focusExtrapolator = u25.new()
    return v2
end

function u45.GetOcclusionMode(a1) -- Line: 85
    return Enum.DevCameraOcclusionMode.Zoom
end

function u45.Enable(a1, a2) -- Line: 89
    a1.focusExtrapolator:Reset()
end

function u45.Update(a1, a2, a3, a4, a5) -- Line: 93 -- upvalues: UserFixCameraFPError (val), u21 (val)
    local v1 = if not UserFixCameraFPError then (CFrame.new(a4.p, a3.p)) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1) else (CFrame.lookAlong(a4.p, -a3.LookVector)) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    return v1 * CFrame.new(0, 0, (u21.Update(a2, v1, (a1.focusExtrapolator:Step(a2, v1))))), a4
end

function u45.CharacterAdded(a1, a2, a3) end

function u45.CharacterRemoving(a1, a2, a3) end

function u45.OnCameraSubjectChanged(a1, a2) end

return u45