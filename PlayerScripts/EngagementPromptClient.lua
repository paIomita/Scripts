-- Path: Players.Drrrrrrrrragonball.PlayerScripts.EngagementPromptClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.EngagementPromptClient
-- Decompile time: 0.75 ms

local AvatarEditorService = game:GetService("AvatarEditorService")
local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local v1 = ReplicatedStorage:WaitForChild("EngagementPromptEvent", 30)
if not v1 then
    return
end

local function promptGroup() -- Line: 16 -- upvalues: LocalPlayer (val), GroupService (val)
    if LocalPlayer:IsInGroup(35401545) then
        return
    end
    pcall(function() -- Line: 20 -- upvalues: GroupService (upval)
        GroupService:PromptJoinAsync(35401545)
    end)
end

local function promptFavorite() -- Line: 25 -- upvalues: AvatarEditorService (val)
    pcall(function() -- Line: 26 -- upvalues: AvatarEditorService (upval)
        AvatarEditorService:PromptSetFavorite(99715891575923, Enum.AvatarItemType.Asset, true)
    end)
end

v1.OnClientEvent:Connect(function(a1) -- Line: 31 -- upvalues: LocalPlayer (val), GroupService (val), AvatarEditorService (val)
    if a1 ~= "Group" then
        if a1 == "Favorite" then
            pcall(function() -- Line: 26 -- upvalues: AvatarEditorService (upval)
                AvatarEditorService:PromptSetFavorite(99715891575923, Enum.AvatarItemType.Asset, true)
            end)
        end
        return
    end
    if LocalPlayer:IsInGroup(35401545) then
        return
    end
    pcall(function() -- Line: 20 -- upvalues: GroupService (upval)
        GroupService:PromptJoinAsync(35401545)
    end)
end)