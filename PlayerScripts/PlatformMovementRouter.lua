-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlatformMovementRouter

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlatformMovementRouter
-- Decompile time: 1.98 ms

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerModule = LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
local Controls = require(PlayerModule):GetControls()
local v1 = PlayerModule:WaitForChild("ControlModule")
local u48 = require(v1:WaitForChild("Keyboard"))
local Gamepad = require(v1:WaitForChild("Gamepad"))

local function isConsoleDevice() -- Line: 17 -- upvalues: GuiService (val), UserInputService (val)
    local success, err = pcall(function() -- Line: 18 -- upvalues: GuiService (upval)
        return GuiService:IsTenFootInterface()
    end)
    if success and err then
        return true
    end
    return UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled and not UserInputService.TouchEnabled
end

local function chooseController() -- Line: 31
    -- upvalues: RunService (val), u48 (val), UserInputService (val), Gamepad (val), GuiService (val)
    if RunService:IsStudio() then
        local Attribute = script:GetAttribute("StudioControllerOverride")
        if Attribute == "Keyboard" then
            return u48, "Keyboard"
        end
        if Attribute == "Gamepad" and UserInputService.GamepadEnabled then
            return Gamepad, "Gamepad"
        end
    end
    if not UserInputService.GamepadEnabled then
        if not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
            return nil, nil
        end
        return u48, "Keyboard"
    end
    local success, err = pcall(function() -- Line: 18 -- upvalues: GuiService (upval)
        return GuiService:IsTenFootInterface()
    end)
    if not (if not success then UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled and not UserInputService.TouchEnabled else if not err then UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled and not UserInputService.TouchEnabled else true)
        and UserInputService.PreferredInput ~= Enum.PreferredInput.Gamepad then
        if not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
            return nil, nil
        end
        return u48, "Keyboard"
    end
    return Gamepad, "Gamepad"
end

local function enforceController() -- Line: 54 -- upvalues: chooseController (val), Controls (val), LocalPlayer (val)
    local u1, v1 = chooseController()
    if not u1 then
        return
    end
    if Controls.activeControlModule ~= u1 then
        local success, err = pcall(function() -- Line: 61 -- upvalues: Controls (upval), u1 (val)
            Controls:SwitchToController(u1)
        end)
        if not success then
            warn("[PlatformMovementRouter] Failed to switch movement controller:", err)
            return
        end
    end
    LocalPlayer:SetAttribute("PlatformMovementController", v1)
end

local function deferEnforcement() -- Line: 73 -- upvalues: enforceController (val)
    task.defer(enforceController)
end

enforceController()
task.delay(1, enforceController)

local function connectPropertySignal(a1, a2) -- Line: 80 -- upvalues: deferEnforcement (val)
    pcall(function() -- Line: 81 -- upvalues: a1 (val), a2 (val), deferEnforcement (upval)
        (a1:GetPropertyChangedSignal(a2)):Connect(deferEnforcement)
    end)
end

local u66 = "PreferredInput"
pcall(function() -- Line: 81 -- upvalues: UserInputService (val), u66 (val), deferEnforcement (val)
    (UserInputService:GetPropertyChangedSignal(u66)):Connect(deferEnforcement)
end)
local u70 = "KeyboardEnabled"
pcall(function() -- Line: 81 -- upvalues: UserInputService (val), u70 (val), deferEnforcement (val)
    (UserInputService:GetPropertyChangedSignal(u70)):Connect(deferEnforcement)
end)
local u74 = "MouseEnabled"
pcall(function() -- Line: 81 -- upvalues: UserInputService (val), u74 (val), deferEnforcement (val)
    (UserInputService:GetPropertyChangedSignal(u74)):Connect(deferEnforcement)
end)
local u78 = "TouchEnabled"
pcall(function() -- Line: 81 -- upvalues: UserInputService (val), u78 (val), deferEnforcement (val)
    (UserInputService:GetPropertyChangedSignal(u78)):Connect(deferEnforcement)
end)
local u82 = "GamepadEnabled"
pcall(function() -- Line: 81 -- upvalues: UserInputService (val), u82 (val), deferEnforcement (val)
    (UserInputService:GetPropertyChangedSignal(u82)):Connect(deferEnforcement)
end)
UserInputService.GamepadConnected:Connect(deferEnforcement)
UserInputService.GamepadDisconnected:Connect(deferEnforcement)
LocalPlayer.CharacterAdded:Connect(deferEnforcement)
pcall(function() -- Line: 95 -- upvalues: deferEnforcement (val)
    (UserSettings():GetService("UserGameSettings"):GetPropertyChangedSignal("ComputerMovementMode")):Connect(deferEnforcement)
end)
if RunService:IsStudio() then
    (script:GetAttributeChangedSignal("StudioControllerOverride")):Connect(deferEnforcement)
end