-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerVisibilityClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerVisibilityClient
-- Decompile time: 3.97 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer
local PlayerVisibilitySync = ReplicatedStorage:WaitForChild("PlayerVisibilitySync")
local u20 = {}
local u21 = {}
local u25 = setmetatable({}, {__mode = "k"})
local u29 = setmetatable({}, {__mode = "k"})

function TextChatService.OnBubbleAdded(a1) -- Line: 13 -- upvalues: u20 (val)
    local TextSource = a1 and a1.TextSource
    if TextSource and u20[TextSource.UserId] == true then
        local BubbleChatMessageProperties = Instance.new("BubbleChatMessageProperties")
        BubbleChatMessageProperties.Text = ""
        BubbleChatMessageProperties.PrefixText = ""
        BubbleChatMessageProperties.Translation = ""
        BubbleChatMessageProperties.BackgroundTransparency = 1
        BubbleChatMessageProperties.TailVisible = false
        BubbleChatMessageProperties.TextSize = 1
        return BubbleChatMessageProperties
    end
    return nil
end

local function shouldHideHumanoid(a1) -- Line: 29 -- upvalues: Players (val), u20 (val)
    local Parent = a1 and a1.Parent
    local PlayerFromCharacter = Parent and Players:GetPlayerFromCharacter(Parent)
    local v1 = false
    if PlayerFromCharacter ~= nil then
        v1 = u20[PlayerFromCharacter.UserId] == true
    end
    return v1
end

local function disconnectHiddenHumanoid(a1) -- Line: 35 -- upvalues: u25 (val)
    local v1 = u25[a1]
    if not v1 then
        return
    end
    u25[a1] = nil
    for i, v in ipairs(v1) do
        v:Disconnect()
    end
end

local function enforceHiddenHumanoid(a1) -- Line: 44 -- upvalues: u29 (val), Players (val), u20 (val)
    if not u29[a1] then
        local Parent = a1 and a1.Parent
        local PlayerFromCharacter = Parent and Players:GetPlayerFromCharacter(Parent)
        local v1 = false
        if PlayerFromCharacter ~= nil then
            v1 = u20[PlayerFromCharacter.UserId] == true
        end
        if v1 then
            u29[a1] = true
            a1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            a1.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
            a1.NameDisplayDistance = 0
            a1.HealthDisplayDistance = 0
            u29[a1] = nil
            return
        end
    end
end

local function bindHiddenHumanoid(a1) -- Line: 54 -- upvalues: u29 (val), Players (val), u20 (val), u25 (val)
    local v1
    if not u29[a1] then
        local Parent = a1 and a1.Parent
        local PlayerFromCharacter = Parent and Players:GetPlayerFromCharacter(Parent)
        v1 = false
        if PlayerFromCharacter ~= nil then
            v1 = u20[PlayerFromCharacter.UserId] == true
        end
        if v1 then
            u29[a1] = true
            a1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            a1.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
            a1.NameDisplayDistance = 0
            a1.HealthDisplayDistance = 0
            u29[a1] = nil
        end
    end
    if u25[a1] then
        return
    end
    v1 = {}
    u25[a1] = v1
    for i, v in ipairs({"DisplayDistanceType", "HealthDisplayType", "NameDisplayDistance", "HealthDisplayDistance"}) do
        table.insert(v1, ((a1:GetPropertyChangedSignal(v)):Connect(function() -- Line: 60 -- upvalues: u29 (upval), a1 (val), Players (upval), u20 (upval), u25 (upval)
            if u29[a1] then
                return
            end
            task.defer(function() -- Line: 62 -- upvalues: a1 (upval), Players (upval), u20 (upval), u29 (upval), u25 (upval)
                local v1 = a1
                local Parent = v1 and v1.Parent
                local PlayerFromCharacter = Parent and Players:GetPlayerFromCharacter(Parent)
                local v2 = false
                if PlayerFromCharacter ~= nil then
                    v2 = u20[PlayerFromCharacter.UserId] == true
                end
                if not v2 then
                    v2 = a1
                    v1 = u25[v2]
                    if not v1 then
                        return
                    end
                    u25[v2] = nil
                    for i, v in ipairs(v1) do
                        v:Disconnect()
                    end
                    return
                end
                v2 = a1
                if u29[v2] then
                    return
                end
                local Parent_2 = v2 and v2.Parent
                local PlayerFromCharacter_2 = Parent_2 and Players:GetPlayerFromCharacter(Parent_2)
                v1 = false
                if PlayerFromCharacter_2 ~= nil then
                    v1 = u20[PlayerFromCharacter_2.UserId] == true
                end
                if not v1 then
                    return
                end
                u29[v2] = true
                v2.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                v2.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
                v2.NameDisplayDistance = 0
                v2.HealthDisplayDistance = 0
                u29[v2] = nil
            end)
        end)))
    end
    table.insert(v1, (a1.AncestryChanged:Connect(function(a1_2, a2) -- Line: 79 -- upvalues: a1 (val), u25 (upval)
        if a2 == nil then
            local v1 = a1
            local v2 = u25[v1]
            if not v2 then
                return
            end
            u25[v1] = nil
            for i, v in ipairs(v2) do
                v:Disconnect()
            end
        end
    end)))
end

local function hideVisual(a1) -- Line: 86 -- upvalues: bindHiddenHumanoid (val)
    if a1:IsA("BasePart") then
        a1.LocalTransparencyModifier = 1
        return
    end
    if not a1:IsA("Decal") and not a1:IsA("Texture") then
        if not a1:IsA("BillboardGui") and not a1:IsA("SurfaceGui") then
            if not a1:IsA("ParticleEmitter") and not a1:IsA("Trail") and not a1:IsA("Beam") then
                if not a1:IsA("Smoke") and not a1:IsA("Fire") and not a1:IsA("Sparkles") then
                    if not a1:IsA("Highlight") and not a1:IsA("Light") then
                        if a1:IsA("ProximityPrompt") then
                            a1.Enabled = false
                            return
                        end
                        if a1:IsA("ForceField") then
                            a1.Visible = false
                            return
                        end
                        if a1:IsA("Humanoid") then
                            bindHiddenHumanoid(a1)
                        end
                        return
                    end
                    a1.Enabled = false
                    return
                end
                a1.Enabled = false
                return
            end
            a1.Enabled = false
            return
        end
        a1.Enabled = false
        return
    end
    a1.Transparency = 1
end

local function hideCharacter(a1) -- Line: 108 -- upvalues: hideVisual (val)
    hideVisual(a1)
    for i, v in ipairs(a1:GetDescendants()) do
        hideVisual(v)
    end
end

local function bindHiddenPlayer(a1) -- Line: 115 -- upvalues: LocalPlayer (val), u20 (val), u21 (val), hideVisual (val)
    if a1 ~= LocalPlayer and u20[a1.UserId] == true then
        a1:SetAttribute("ObbyTimeHackerHiddenLocally", true)
        local v1 = u21[a1]
        if v1 then
            v1:Disconnect()
        end
        u21[a1] = (a1.CharacterAdded:Connect(function(a1_2) -- Line: 122 -- upvalues: u20 (upval), a1 (val), hideVisual (upval)
            if u20[a1.UserId] ~= true then
                return
            end
            hideVisual(a1_2)
            for i, v in ipairs(a1_2:GetDescendants()) do
                hideVisual(v)
            end
            a1_2.DescendantAdded:Connect(function(a1_2) -- Line: 125 -- upvalues: u20 (upval), a1 (upval), hideVisual (upval)
                if u20[a1.UserId] == true then
                    hideVisual(a1_2)
                end
            end)
        end))
        if a1.Character then
            local Character = a1.Character
            hideVisual(Character)
            for i, v in ipairs(Character:GetDescendants()) do
                hideVisual(v)
            end
            a1.Character.DescendantAdded:Connect(function(a1_2) -- Line: 133 -- upvalues: u20 (upval), a1 (val), hideVisual (upval)
                if u20[a1.UserId] == true then
                    hideVisual(a1_2)
                end
            end)
        end
        return
    end
end

PlayerVisibilitySync.OnClientEvent:Connect(function(a1, a2) -- Line: 141 -- upvalues: LocalPlayer (val), Players (val), u20 (val), bindHiddenPlayer (val)
    local v1 = tonumber(a1)
    if v1 and v1 ~= LocalPlayer.UserId then
        local PlayerByUserId = Players:GetPlayerByUserId(v1)
        if a2 ~= true then
            u20[v1] = nil
            if PlayerByUserId then
                PlayerByUserId:SetAttribute("ObbyTimeHackerHiddenLocally", nil)
            end
            return
        end
        u20[v1] = true
        if not PlayerByUserId then
            return
        end
        PlayerByUserId:SetAttribute("ObbyTimeHackerHiddenLocally", true)
        bindHiddenPlayer(PlayerByUserId)
        return
    end
end)
Players.PlayerAdded:Connect(function(a1) -- Line: 159 -- upvalues: u20 (val), bindHiddenPlayer (val)
    if u20[a1.UserId] == true then
        bindHiddenPlayer(a1)
    end
end)
Players.PlayerRemoving:Connect(function(a1) -- Line: 165 -- upvalues: u21 (val), u20 (val)
    local v1 = u21[a1]
    if v1 then
        v1:Disconnect()
        u21[a1] = nil
    end
    u20[a1.UserId] = nil
end)
PlayerVisibilitySync:FireServer()