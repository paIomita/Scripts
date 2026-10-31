-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.MouseLockController

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.MouseLockController
-- Decompile time: 2.15 ms

local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local Value = Enum.ContextActionPriority.Medium.Value
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local GameSettings = UserSettings().GameSettings
local u41 = require(script.Parent:WaitForChild("CameraUtils"))
local UserFixStuckShiftLock = FlagUtil.getUserFlag("UserFixStuckShiftLock")
local u45 = {}
u45.__index = u45

function u45.new() -- Line: 33 -- upvalues: u45 (val), GameSettings (val), Players (val), UserInputService (val)
    local u3 = setmetatable({}, u45)
    u3.isMouseLocked = false
    u3.savedMouseCursor = nil
    u3.boundKeys = {Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift}
    u3.mouseLockToggledEvent = Instance.new("BindableEvent")
    local BoundKeys = script:FindFirstChild("BoundKeys")
    if not BoundKeys or not BoundKeys:IsA("StringValue") then
        if BoundKeys then
            BoundKeys:Destroy()
        end
        BoundKeys = Instance.new("StringValue")
        assert(BoundKeys, "")
        BoundKeys.Name = "BoundKeys"
        BoundKeys.Value = "LeftShift,RightShift"
        BoundKeys.Parent = script
    end
    if BoundKeys then
        BoundKeys.Changed:Connect(function(a1) -- Line: 58 -- upvalues: u3 (val)
            u3:OnBoundKeysObjectChanged(a1)
        end)
        u3:OnBoundKeysObjectChanged(BoundKeys.Value)
    end
    GameSettings.Changed:Connect(function(a1) -- Line: 65 -- upvalues: u3 (val)
        if a1 == "ControlMode" or a1 == "ComputerMovementMode" then
            u3:UpdateMouseLockAvailability()
        end
    end)
    ;(Players.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock")):Connect(function() -- Line: 72 -- upvalues: u3 (val)
        u3:UpdateMouseLockAvailability()
    end)
    ;(Players.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode")):Connect(function() -- Line: 77 -- upvalues: u3 (val)
        u3:UpdateMouseLockAvailability()
    end)
    ;(UserInputService:GetPropertyChangedSignal("PreferredInput")):Connect(function() -- Line: 81 -- upvalues: u3 (val)
        u3:UpdateMouseLockAvailability()
    end)
    u3:UpdateMouseLockAvailability()
    return u3
end

function u45.GetIsMouseLocked(a1) -- Line: 90
    return a1.isMouseLocked
end

function u45.GetBindableToggleEvent(a1) -- Line: 94
    return a1.mouseLockToggledEvent.Event
end

function u45.GetMouseLockOffset(a1) -- Line: 98
    return (Vector3.new(1.75, 0, 0))
end

function u45:UpdateMouseLockAvailability() -- Line: 102
    -- upvalues: Players (val), GameSettings (val), UserInputService (val)
    local DevEnableMouseLock = Players.LocalPlayer.DevEnableMouseLock
    local v1 = Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
    local v2 = GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch
    local v3 = GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
    local v4 = UserInputService.PreferredInput == Enum.PreferredInput.KeyboardAndMouse and DevEnableMouseLock and v2 and not v3 and not v1
    if v4 ~= self.enabled then
        self:EnableMouseLock(v4)
    end
end

function u45:OnBoundKeysObjectChanged(a2) -- Line: 115 -- types: self: table, a2: string
    self.boundKeys = {}
    local v1 = self
    for i in string.gmatch(a2, "[^%s,]+") do
        for k, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if i == v.Name then
                v1.boundKeys[#v1.boundKeys + 1] = v
                break
            end
        end
    end
    v1:UnbindContextActions()
    v1:BindContextActions()
end

function u45:OnMouseLockToggled() -- Line: 130 -- upvalues: u41 (val)
    self.isMouseLocked = not self.isMouseLocked
    if not self.isMouseLocked then
        u41.restoreMouseIcon()
    else
        local CursorImage = script:FindFirstChild("CursorImage")
        if not CursorImage or not CursorImage:IsA("StringValue") or not CursorImage.Value then
            if CursorImage then
                CursorImage:Destroy()
            end
            local v1 = Instance.new("StringValue")
            assert(v1, "")
            v1.Name = "CursorImage"
            v1.Value = "rbxasset://textures/MouseLockedCursor.png"
            v1.Parent = script
            u41.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png")
        else
            u41.setMouseIconOverride(CursorImage.Value)
        end
    end
    self.mouseLockToggledEvent:Fire()
end

function u45:DoMouseLockSwitch(a2, a3, a4) -- Line: 155
    if a3 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass
    end
    self:OnMouseLockToggled()
    return Enum.ContextActionResult.Sink
end

function u45:BindContextActions() -- Line: 163 -- upvalues: ContextActionService (val), Value (val)
    local v1 = ContextActionService
    local v2 = Value
    local boundKeys = self.boundKeys
    local v3 = unpack(boundKeys)
    v1:BindActionAtPriority("MouseLockSwitchAction", function(a1, a2, a3) -- Line: 164 -- upvalues: self (val)
        return self:DoMouseLockSwitch(a1, a2, a3)
    end, false, v2, v3)
end

function u45.UnbindContextActions(a1) -- Line: 169 -- upvalues: ContextActionService (val)
    ContextActionService:UnbindAction("MouseLockSwitchAction")
end

function u45.IsMouseLocked(a1) -- Line: 173
    return a1.enabled and a1.isMouseLocked
end

function u45:EnableMouseLock(a2) -- Line: 177
    -- upvalues: u41 (val), UserFixStuckShiftLock (val)
    if a2 ~= self.enabled then
        self.enabled = a2
        if self.enabled then
            self:BindContextActions()
            return
        end
        u41.restoreMouseIcon()
        self:UnbindContextActions()
        if not UserFixStuckShiftLock then
            if self.isMouseLocked then
                self.mouseLockToggledEvent:Fire()
            end
            self.isMouseLocked = false
        elseif self.isMouseLocked then
            self.isMouseLocked = false
            self.mouseLockToggledEvent:Fire()
            return
        end
    end
end

return u45