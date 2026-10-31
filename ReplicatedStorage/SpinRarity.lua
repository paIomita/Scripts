-- Path: ReplicatedStorage.SpinRarity

-- Script path: ReplicatedStorage.SpinRarity
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u5 = {
    DiamondImage = "rbxassetid://91107603705484",
    Minimums = {
        Orange = 5,
        Yellow = 25,
        Lime = 2500,
        Green = 25,
        Blue = 100,
        Cobalt = 100,
        Purple = 50,
        Violet = 50,
        Orchid = 100,
        Fuschia = 300,
        Pink = 10000,
        White = 1000,
        Rainbow = 500,
        Summer = 5000,
        Rich = 100000,
        Cosmic = 100000,
        Admin = 10000,
    },
}

function u5.isEnabled() -- Line: 12 -- upvalues: ReplicatedStorage (val)
    local SpinPresentationSettings = ReplicatedStorage:FindFirstChild("SpinPresentationSettings")
    local DiamondEnabled = SpinPresentationSettings and SpinPresentationSettings:FindFirstChild("DiamondEnabled")
    local v1 = false
    if DiamondEnabled ~= nil then
        v1 = DiamondEnabled:IsA("BoolValue") and DiamondEnabled.Value == true
    end
    return v1
end

function u5.isDiamond(a1, a2, a3) -- Line: 18 -- upvalues: u5 (val)
    if a3 == nil then
        a3 = u5.isEnabled()
    end
    if a3 and type(a2) == "table" then
        local v1 = u5.Minimums[tostring(a1)]
        if not v1 then
            return false
        end
        local v2 = tostring(a2.rewardName or a2.name or "")
        local currency = a2.currency or (if not v2:find("Robux", 1, true) then if not v2:find("Pop", 1, true) then "Credits" else "Pops" else "Robux")
        if currency ~= (if a1 ~= "Lime" then "Robux" else "Pops") then
            return false
        end
        local v3 = tonumber((v2:match("^(%d+)"))) or tonumber((tostring(a2.amount or 0):gsub(",", ""))) or 0
        return v1 <= v3
    end
    return false
end

function u5.gateway(a1) -- Line: 35
    return {
        isGoldSpin = true,
        name = if a1 ~= "Diamond" then "GoldSpin" else "DiamondSpin",
        spinTier = a1,
    }
end

function u5.batchTier(a1, a2) -- Line: 39
    if not (a1 > 0) then
        return "Gold"
    end
    if a2 > 0 then
        return "Mixed"
    end
    return "Diamond"
end

return u5