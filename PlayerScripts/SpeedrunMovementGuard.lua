-- Path: Players.Drrrrrrrrragonball.PlayerScripts.SpeedrunMovementGuard

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.SpeedrunMovementGuard
-- Decompile time: 0.63 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local u26 = require((ReplicatedStorage:WaitForChild("Speedrun")):WaitForChild("SpeedrunMovementPolicy"))
local u27 = 0
RunService.Heartbeat:Connect(function(a1) -- Line: 9 -- upvalues: u27 (ref), u26 (val), LocalPlayer (val)
    u27 = u27 + a1
    if u27 < 0.1 then
        return
    end
    u27 = 0
    u26.RemoveOutsideBoost(LocalPlayer, LocalPlayer.Character)
end)