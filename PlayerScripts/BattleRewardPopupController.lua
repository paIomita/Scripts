-- Path: Players.Drrrrrrrrragonball.PlayerScripts.BattleRewardPopupController

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.BattleRewardPopupController
-- Decompile time: 3.60 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u19 = (Players.LocalPlayer:WaitForChild("PlayerGui")):WaitForChild("BattleRewardsGui")
local BattleReward = u19:WaitForChild("BattleReward")
local CustomDesc = (BattleReward:WaitForChild("Contents")):WaitForChild("CustomDesc")
local Yes = BattleReward.Contents:WaitForChild("Yes")
local TextLabel = Yes:FindFirstChild("TextLabel")
local Title = (BattleReward:WaitForChild("Top")):WaitForChild("Title")
local BattlesRemotes = ReplicatedStorage:WaitForChild("BattlesRemotes")
local u57 = BattlesRemotes:WaitForChild("GetBattleOfflineRewards")
local ClaimBattleOfflineReward = BattlesRemotes:WaitForChild("ClaimBattleOfflineReward")
local BattleOfflineQueued = BattlesRemotes:WaitForChild("BattleOfflineQueued")
local u66 = {}
local u67 = {}
local u68 = {}
local u69 = nil
local u70 = false
local u71 = 0
local u72 = false
local u73 = nil
local u74 = {}
local u75 = {
    storage_unavailable = "Saved data is temporarily unavailable. Your reward is still saved; try again shortly.",
    confirmation_pending = "The reward was processed, but saving its confirmation is taking longer. Retrying will not pay it twice.",
    busy = "Your previous claim is still being checked. Please wait a moment.",
    rate_limited = "Please wait a moment before trying again.",
    battle_not_finished = "This battle has not finished yet. You can close this and return later.",
    missing_reward = "This notice could not be found. Close it and rejoin to refresh your saved rewards.",
}
BattleReward.Visible = false
CustomDesc.Text = ""
u19.ResetOnSpawn = false
u19.DisplayOrder = 10000

local function present() -- Line: 33
    -- upvalues: u69 (ref), u19 (val), BattleReward (val), Title (val), CustomDesc (val), u73 (ref), Yes (val)
    -- upvalues: u70 (ref), TextLabel (val)
    if u69 and u19.Parent then
        u19.Enabled = true
        BattleReward.Visible = true
        Title.Text = if u69.kind ~= "BattleRefund" then "Battle Results" else "Battle Refunded"
        CustomDesc.Text = u73 or tostring(u69.description or "Your battle result is ready.")
        Yes.Active = not u70
        Yes.AutoButtonColor = not u70
        if TextLabel then
            TextLabel.Text = if not u70 then if not u73 then "Claim / OK" else "Try again" else "Claiming..."
        end
        return
    end
end

local function showNext() -- Line: 44 -- upvalues: u69 (ref), u66 (val), u73 (ref), present (val)
    if not u69 then
        u69 = table.remove(u66, 1)
        u73 = nil
    end
    if u69 then
        present()
    end
end

local function queueReward(a1) -- Line: 52
    -- upvalues: u68 (val), u67 (val), u66 (val), u69 (ref), u73 (ref), present (val)
    if type(a1) == "table" and type(a1.id) == "string" and a1.id ~= "" then
        if a1.kind == "BattleResult" and a1.claimable == false then
            return
        end
        if not u68[a1.id] and not u67[a1.id] then
            u67[a1.id] = true
            table.insert(u66, a1)
            if not u69 then
                u69 = table.remove(u66, 1)
                u73 = nil
            end
            if u69 then
                present()
            end
            return
        end
        return
    end
end

local function restorePresentation() -- Line: 61 -- upvalues: u69 (ref), u72 (ref), present (val)
    if u69 and not u72 then
        u72 = true
        task.defer(function() -- Line: 64 -- upvalues: u72 (upval), u69 (upval), present (upval)
            u72 = false
            if u69 then
                present()
            end
        end)
        return
    end
end

;(BattleReward:GetPropertyChangedSignal("Visible")):Connect(function() -- Line: 70 -- upvalues: u69 (ref), BattleReward (val), u72 (ref), present (val)
    if u69 and not BattleReward.Visible and u69 then
        if u72 then
            return
        end
        u72 = true
        task.defer(function() -- Line: 64 -- upvalues: u72 (upval), u69 (upval), present (upval)
            u72 = false
            if u69 then
                present()
            end
        end)
    end
end)
;(u19:GetPropertyChangedSignal("Enabled")):Connect(function() -- Line: 73 -- upvalues: u69 (ref), u19 (val), u72 (ref), present (val)
    if u69 and not u19.Enabled and u69 then
        if u72 then
            return
        end
        u72 = true
        task.defer(function() -- Line: 64 -- upvalues: u72 (upval), u69 (upval), present (upval)
            u72 = false
            if u69 then
                present()
            end
        end)
    end
end)
Yes.Activated:Connect(function() -- Line: 77
    -- upvalues: u69 (ref), u70 (ref), u74 (val), u73 (ref), present (val), u71 (ref), ClaimBattleOfflineReward (val)
    -- upvalues: u68 (val), BattleReward (val), CustomDesc (val), u66 (val), u75 (val)
    if u69 and not u70 then
        local id = u69.id
        if u74[id] then
            u73 = (tostring(u69.description or "")) .. "\nYour claim is still being checked. You can close this while it finishes."
            present()
            return
        end
        u74[id] = true
        u71 = u71 + 1
        local u19 = u71
        u70 = true
        u73 = nil
        present()
        task.delay(12, function() -- Line: 91
            -- upvalues: u69 (upval), id (val), u71 (upval), u19 (val), u70 (upval), u73 (upval), present (upval)
            if u69 and u69.id == id and u71 == u19 and u70 then
                u70 = false
                u73 = (tostring(u69.description or "")) .. "\nThe server is taking longer to confirm. You can close this while it finishes."
                present()
            end
        end)
        task.spawn(function() -- Line: 98
            -- upvalues: ClaimBattleOfflineReward (upval), id (val), u74 (upval), u68 (upval), u69 (upval), u70 (upval)
            -- upvalues: u73 (upval), u71 (upval), BattleReward (upval), CustomDesc (upval), u66 (upval)
            -- upvalues: present (upval), u19 (val), u75 (upval)
            local success, err = pcall(function() -- Line: 99 -- upvalues: ClaimBattleOfflineReward (upval), id (upval)
                return ClaimBattleOfflineReward:InvokeServer(id)
            end)
            u74[id] = nil
            if success and type(err) == "table" and err.success == true and err.rewardId == id then
                u68[id] = true
            end
            if u69 and u69.id == id then
                if success and type(err) == "table" and err.success == true and err.rewardId == id then
                    u68[id] = true
                    u69 = nil
                    u70 = false
                    u73 = nil
                    u71 = u71 + 1
                    BattleReward.Visible = false
                    CustomDesc.Text = ""
                    if not u69 then
                        u69 = table.remove(u66, 1)
                        u73 = nil
                    end
                    if not u69 then
                        return
                    end
                    present()
                    return
                end
                if u71 == u19 then
                    u70 = false
                    local reason = success
                    if reason then
                        reason = false
                        if type(err) == "table" then
                            reason = err.reason
                        end
                    end
                    u73 = (tostring(u69.description or "")) .. "\n" .. (u75[reason] or "Couldn't confirm the claim yet. Your saved reward can be retried.")
                    present()
                end
                return
            end
        end)
        return
    end
end)
local DismissBattleReward = BattleReward.Top:FindFirstChild("DismissBattleReward") or Instance.new("TextButton")
DismissBattleReward.Name = "DismissBattleReward"
DismissBattleReward.AnchorPoint = Vector2.new(1, 0.5)
DismissBattleReward.Position = UDim2.fromScale(0.98, 0.5)
DismissBattleReward.Size = UDim2.fromScale(0.075, 0.6)
DismissBattleReward.BackgroundTransparency = 1
DismissBattleReward.Text = "X"
DismissBattleReward.FontFace = Title.FontFace
DismissBattleReward.TextColor3 = Color3.new(1, 1, 1)
DismissBattleReward.TextStrokeColor3 = Color3.new(0, 0, 0)
DismissBattleReward.TextStrokeTransparency = 0
DismissBattleReward.TextScaled = true
DismissBattleReward.ZIndex = Title.ZIndex + 1
DismissBattleReward.Parent = BattleReward.Top
DismissBattleReward.Activated:Connect(function() -- Line: 137
    -- upvalues: u69 (ref), u70 (ref), u73 (ref), u71 (ref), BattleReward (val), CustomDesc (val), u66 (val)
    -- upvalues: present (val)
    if not u69 then
        return
    end
    u69 = nil
    u70 = false
    u73 = nil
    u71 = u71 + 1
    BattleReward.Visible = false
    CustomDesc.Text = ""
    if not u69 then
        u69 = table.remove(u66, 1)
        u73 = nil
    end
    if u69 then
        present()
    end
end)
BattleOfflineQueued.OnClientEvent:Connect(queueReward)
task.spawn(function() -- Line: 147 -- upvalues: u19 (val), u57 (val), queueReward (val), u69 (ref), present (val)
    local err, success
    while u19.Parent do
        success, err = pcall(function() -- Line: 149 -- upvalues: u57 (upval)
            return u57:InvokeServer()
        end)
        if success and type(err) == "table" then
            for i, v in ipairs(err) do
                queueReward(v)
            end
        end
        if u69 then
            present()
        end
        task.wait(12)
    end
end)