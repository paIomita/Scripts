-- Path: ReplicatedStorage.BattleSpeedPurchase

-- Script path: ReplicatedStorage.BattleSpeedPurchase
-- Decompile time: 1.23 ms

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local BattleSpeedConfig = require(script.Parent:WaitForChild("BattleSpeedConfig"))
local LocalPlayer = Players.LocalPlayer
local u19 = {busy = false, revision = 0}
local u20 = nil

local function owns() -- Line: 8 -- upvalues: MarketplaceService (val), LocalPlayer (val), BattleSpeedConfig (val)
    local success = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, LocalPlayer.UserId, BattleSpeedConfig.PassId)
    return success
end

function u19.TrySelect(a1, a2, a3) -- Line: 11
    -- upvalues: u19 (val), BattleSpeedConfig (val), u20 (ref), MarketplaceService (val), LocalPlayer (val)
    if u19.busy and BattleSpeedConfig.RequiresPass(a1) then
        return
    end
    local v1 = u19
    v1.revision = v1.revision + 1
    local revision = u19.revision
    if not BattleSpeedConfig.RequiresPass(a1) then
        u20 = nil
        a2()
        return
    end
    u19.busy = true
    local success, err = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, LocalPlayer.UserId, BattleSpeedConfig.PassId)
    if revision ~= u19.revision then
        u19.busy = false
        return
    end
    if not success then
        u19.busy = false
        a3("Couldn't check the Faster Battles pass. Please try again.", "red")
        return
    end
    if err then
        u19.busy = false
        a2()
        return
    end
    u20 = {apply = a2, feedback = a3, revision = revision}
    local success_2 = pcall(MarketplaceService.PromptGamePassPurchase, MarketplaceService, LocalPlayer, BattleSpeedConfig.PassId)
    if not success_2 then
        u20 = nil
        u19.busy = false
        a3("Couldn't open the gamepass purchase. Please try again.", "red")
    end
end

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(a1, a2, a3) -- Line: 32
    -- upvalues: LocalPlayer (val), BattleSpeedConfig (val), u20 (ref), u19 (val), MarketplaceService (val)
    if a1 == LocalPlayer and a2 == BattleSpeedConfig.PassId then
        local v1 = u20
        u20 = nil
        u19.busy = false
        if a3 and v1 and v1.revision == u19.revision then
            local success, err = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, LocalPlayer.UserId, BattleSpeedConfig.PassId)
            if success and err then
                v1.apply()
                return
            end
            v1.feedback("Select your battle speed again to check the new pass.", "red")
            return
        end
        return
    end
end)
return u19