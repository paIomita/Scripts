-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.AvatarAbilitiesInterface

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.AvatarAbilitiesInterface
-- Decompile time: 0.97 ms

local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
if not require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserAllowAbilityControls") then
    return
end
local Players = game:GetService("Players")
local v1 = {}
local u23 = nil
local u24 = nil
local BindableEvent = Instance.new("BindableEvent")
local u28 = nil
local u29 = false

local function characterAdded(a1) -- Line: 16 -- upvalues: u23 (ref), u24 (ref), u28 (ref), BindableEvent (val)
    u23 = nil
    u24 = nil
    if u28 then
        u28:Disconnect()
        u28 = nil
    end
    if a1 then
        a1:FindFirstChild("AbilityManagerActor")
        u24 = a1:FindFirstChildOfClass("Humanoid")
        while not u24 do
            a1.ChildAdded:wait()
            u24 = a1:FindFirstChildOfClass("Humanoid")
        end
        BindableEvent:Fire()
        ;(u24:GetPropertyChangedSignal("EvaluateStateMachine")):Connect(function() -- Line: 33 -- upvalues: BindableEvent (upval)
            BindableEvent:Fire()
        end)
    end
end

local function lazyInit() -- Line: 39 -- upvalues: u29 (ref), Players (val), characterAdded (val)
    if u29 then
        return
    end
    u29 = true
    local LocalPlayer = Players.LocalPlayer
    if LocalPlayer then
        LocalPlayer.characterAdded:Connect(characterAdded)
        if LocalPlayer.Character then
            characterAdded(LocalPlayer.Character)
        end
    end
end

function v1.isEnabled() -- Line: 54 -- upvalues: u29 (ref), Players (val), characterAdded (val), u23 (ref), u24 (ref)
    if not u29 then
        u29 = true
        local LocalPlayer = Players.LocalPlayer
        if LocalPlayer then
            LocalPlayer.characterAdded:Connect(characterAdded)
            if LocalPlayer.Character then
                characterAdded(LocalPlayer.Character)
            end
        end
    end
    local v1 = false
    if u23 ~= nil then
        v1 = u24 and not u24.EvaluateStateMachine
    end
    return v1
end

function v1.GetEnabledChangedSignal() -- Line: 59
    -- upvalues: u29 (ref), Players (val), characterAdded (val), BindableEvent (val)
    if not u29 then
        u29 = true
        local LocalPlayer = Players.LocalPlayer
        if LocalPlayer then
            LocalPlayer.characterAdded:Connect(characterAdded)
            if LocalPlayer.Character then
                characterAdded(LocalPlayer.Character)
            end
        end
    end
    return BindableEvent.Event
end

return v1