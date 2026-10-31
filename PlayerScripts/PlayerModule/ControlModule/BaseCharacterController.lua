-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.BaseCharacterController

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.BaseCharacterController
-- Decompile time: 0.50 ms

local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"))
local u15 = Vector3.new()
local u16 = {}
u16.__index = u16

function u16.new() -- Line: 33 -- upvalues: u16 (val), u15 (val), ConnectionUtil (val)
    local v1 = setmetatable({}, u16)
    v1.enabled = false
    v1.moveVector = u15
    v1.moveVectorIsCameraRelative = true
    v1.isJumping = false
    v1._connectionUtil = ConnectionUtil.new()
    return v1
end

function u16.GetMoveVector(a1) -- Line: 45
    return a1.moveVector
end

function u16.IsMoveVectorCameraRelative(a1) -- Line: 49
    return a1.moveVectorIsCameraRelative
end

function u16.GetIsJumping(a1) -- Line: 53
    return a1.isJumping
end

function u16.Enable(a1, a2) -- Line: 59 -- types: a1: table, a2: boolean
    error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
    return false
end

return u16