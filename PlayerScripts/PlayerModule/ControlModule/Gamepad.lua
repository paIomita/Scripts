-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.Gamepad

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.Gamepad
-- Decompile time: 4.06 ms

local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local u26 = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsSupportTVRemoteKeycodes")
local None = Enum.UserInputType.None
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local u39 = setmetatable({}, BaseCharacterController)
u39.__index = u39

function u39.new(a1) -- Line: 26 -- upvalues: BaseCharacterController (val), u39 (val), None (val)
    local v1 = BaseCharacterController.new()
    local v2 = setmetatable(v1, u39)
    v2.CONTROL_ACTION_PRIORITY = a1
    v2.forwardValue = 0
    v2.backwardValue = 0
    v2.leftValue = 0
    v2.rightValue = 0
    v2.thumbstickVector = Vector3.new(0, 0, 0)
    v2.activeGamepad = None
    v2.gamepadConnectedConn = nil
    v2.gamepadDisconnectedConn = nil
    return v2
end

function u39.Enable(a1, a2) -- Line: 43 -- upvalues: None (val) -- types: a1: table, a2: boolean
    if a2 == a1.enabled then
        return true
    end
    a1.forwardValue = 0
    a1.backwardValue = 0
    a1.leftValue = 0
    a1.rightValue = 0
    a1.thumbstickVector = Vector3.new(0, 0, 0)
    a1.moveVector = Vector3.new(0, 0, 0)
    a1.isJumping = false
    if not a2 then
        a1:UnbindContextActions()
        a1:DisconnectGamepadConnectionListeners()
        a1.activeGamepad = None
        a1.enabled = a2
        return true
    end
    a1.activeGamepad = a1:GetHighestPriorityGamepad()
    if a1.activeGamepad == None then
        return false
    end
    a1:BindContextActions()
    a1:ConnectGamepadConnectionListeners()
    a1.enabled = a2
    return true
end

function u39.GetHighestPriorityGamepad(a1) -- Line: 80 -- upvalues: UserInputService (val), None (val)
    local v1 = None
    for k, v in pairs((UserInputService:GetConnectedGamepads())) do
        if v.Value < v1.Value then
            v1 = v
        end
    end
    return v1
end

function u39:UpdateMovement() -- Line: 91
    self.moveVector = self.thumbstickVector + Vector3.new(0, 0, self.forwardValue + self.backwardValue)
end

function u39:BindContextActions() -- Line: 95 -- upvalues: None (val), u26 (val), ContextActionService (val)
    local v1
    if self.activeGamepad == None then
        return false
    end

    local function v2(a1, a2, a3) -- Line: 102 -- upvalues: self (val)
        self.isJumping = a2 == Enum.UserInputState.Begin
        return Enum.ContextActionResult.Sink
    end

    ContextActionService:BindActivate(self.activeGamepad, Enum.KeyCode.ButtonR2)
    if not u26 then
        ContextActionService:BindActionAtPriority("jumpAction", v2, false, self.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
    else
        ContextActionService:BindActionAtPriority(
            "jumpAction",
            v2,
            false,
            self.CONTROL_ACTION_PRIORITY,
            Enum.KeyCode.ButtonA,
            Enum.KeyCode.ButtonCenter
        )
        v1 = ContextActionService
        local CONTROL_ACTION_PRIORITY_2 = self.CONTROL_ACTION_PRIORITY
        local ButtonUp = Enum.KeyCode.ButtonUp
        local ButtonDown = Enum.KeyCode.ButtonDown
        v1:BindActionAtPriority("moveDirectionalButton", function(a1, a2, a3) -- Line: 141 -- upvalues: self (val)
            if a2 == Enum.UserInputState.Cancel then
                self.forwardValue = 0
                self.backwardValue = 0
                self:UpdateMovement()
                return Enum.ContextActionResult.Sink
            end
            local Z = 0
            if 0.2 < a3.Position.magnitude then
                Z = a3.Position.Z
            end
            if a3.KeyCode == Enum.KeyCode.ButtonUp then
                self.forwardValue = -Z
            elseif a3.KeyCode == Enum.KeyCode.ButtonDown then
                self.backwardValue = Z
            end
            self:UpdateMovement()
            return Enum.ContextActionResult.Sink
        end, false, CONTROL_ACTION_PRIORITY_2, ButtonUp, ButtonDown)
    end
    v1 = ContextActionService
    local CONTROL_ACTION_PRIORITY_4 = self.CONTROL_ACTION_PRIORITY
    local Thumbstick1 = Enum.KeyCode.Thumbstick1
    v1:BindActionAtPriority("moveThumbstick", function(a1, a2, a3) -- Line: 107 -- upvalues: u26 (upval), self (val)
        if a2 == Enum.UserInputState.Cancel then
            if not u26 then
                self.moveVector = Vector3.new(0, 0, 0)
            else
                self.thumbstickVector = Vector3.new(0, 0, 0)
                self:UpdateMovement()
            end
            return Enum.ContextActionResult.Sink
        end
        if self.activeGamepad ~= a3.UserInputType then
            return Enum.ContextActionResult.Pass
        end
        if a3.KeyCode ~= Enum.KeyCode.Thumbstick1 then
            return
        end
        if u26 then
            if not (0.2 < a3.Position.magnitude) then
                self.thumbstickVector = Vector3.new(0, 0, 0)
            else
                self.thumbstickVector = Vector3.new(a3.Position.X, 0, -a3.Position.Y)
            end
            self:UpdateMovement()
        elseif not (0.2 < a3.Position.magnitude) then
            self.moveVector = Vector3.new(0, 0, 0)
        else
            self.moveVector = Vector3.new(a3.Position.X, 0, -a3.Position.Y)
        end
        return Enum.ContextActionResult.Sink
    end, false, CONTROL_ACTION_PRIORITY_4, Thumbstick1)
    return true
end

function u39:UnbindContextActions() -- Line: 180 -- upvalues: None (val), ContextActionService (val), u26 (val)
    if self.activeGamepad ~= None then
        ContextActionService:UnbindActivate(self.activeGamepad, Enum.KeyCode.ButtonR2)
    end
    if u26 then
        ContextActionService:UnbindAction("moveDirectionalButton")
    end
    ContextActionService:UnbindAction("moveThumbstick")
    ContextActionService:UnbindAction("jumpAction")
end

function u39:OnNewGamepadConnected() -- Line: 191 -- upvalues: None (val)
    local HighestPriorityGamepad = self:GetHighestPriorityGamepad()
    if HighestPriorityGamepad == self.activeGamepad then
        return
    end
    if HighestPriorityGamepad == None then
        warn("Gamepad:OnNewGamepadConnected found no connected gamepads")
        self:UnbindContextActions()
        return
    end
    if self.activeGamepad ~= None then
        self:UnbindContextActions()
    end
    self.activeGamepad = HighestPriorityGamepad
    self:BindContextActions()
end

function u39:OnCurrentGamepadDisconnected() -- Line: 218 -- upvalues: None (val), ContextActionService (val)
    if self.activeGamepad ~= None then
        ContextActionService:UnbindActivate(self.activeGamepad, Enum.KeyCode.ButtonR2)
    end
    local HighestPriorityGamepad = self:GetHighestPriorityGamepad()
    if self.activeGamepad ~= None and HighestPriorityGamepad == self.activeGamepad then
        warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.")
        self:UnbindContextActions()
        self.activeGamepad = None
        return
    end
    if HighestPriorityGamepad == None then
        self:UnbindContextActions()
        self.activeGamepad = None
        return
    end
    self.activeGamepad = HighestPriorityGamepad
    ContextActionService:BindActivate(self.activeGamepad, Enum.KeyCode.ButtonR2)
end

function u39:ConnectGamepadConnectionListeners() -- Line: 243 -- upvalues: UserInputService (val)
    self.gamepadConnectedConn = UserInputService.GamepadConnected:Connect(function(a1) -- Line: 244 -- upvalues: self (val)
        self:OnNewGamepadConnected()
    end)
    self.gamepadDisconnectedConn = UserInputService.GamepadDisconnected:Connect(function(a1) -- Line: 248 -- upvalues: self (val)
        if self.activeGamepad == a1 then
            self:OnCurrentGamepadDisconnected()
        end
    end)
end

function u39:DisconnectGamepadConnectionListeners() -- Line: 255
    if self.gamepadConnectedConn then
        self.gamepadConnectedConn:Disconnect()
        self.gamepadConnectedConn = nil
    end
    if self.gamepadDisconnectedConn then
        self.gamepadDisconnectedConn:Disconnect()
        self.gamepadDisconnectedConn = nil
    end
end

return u39