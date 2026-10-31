-- Path: Players.Drrrrrrrrragonball.PlayerScripts.DonationBoardClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.DonationBoardClient
-- Decompile time: 2.39 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local DonationConfig = require(ReplicatedStorage:WaitForChild("DonationConfig"))
local u26 = ReplicatedStorage:WaitForChild("RequestDevProductPrompt")
local DonationGranted = ReplicatedStorage:WaitForChild("DonationGranted")
local u31 = {}
local u32 = 0

local function notify(a1, a2) -- Line: 12 -- upvalues: StarterGui (val)
    pcall(function() -- Line: 13 -- upvalues: StarterGui (upval), a1 (val), a2 (val)
        StarterGui:SetCore("SendNotification", {Duration = 5, Title = a1, Text = a2})
    end)
end

local function connectDonationFrame(a1) -- Line: 22
    -- upvalues: u31 (val), u32 (ref), DonationConfig (val), StarterGui (val), u26 (val)
    if not u31[a1] and a1:IsA("GuiObject") then
        local Yes = a1:FindFirstChild("Yes")
        if Yes and Yes:IsA("GuiButton") then
            local u23 = math.floor((tonumber((a1:GetAttribute("DonationAmount")))) or 0)
            if u23 <= 0 then
                return
            end
            u31[a1] = true
            Yes.Activated:Connect(function() -- Line: 37
                -- upvalues: u32 (upval), a1 (val), DonationConfig (upval), u23 (val), StarterGui (upval), u26 (upval)
                if os.clock() - u32 < 1 then
                    return
                end
                os.clock()
                local v1 = math.floor((tonumber((a1:GetAttribute("ProductId")))) or 0)
                if v1 <= 0 then
                    v1 = DonationConfig.GetProductId(u23)
                end
                if not (v1 <= 0) then
                    u26:FireServer(v1)
                    return
                end
                local u31 = ("The Donate %s product ID still needs to be configured."):format((tostring(u23)))
                local u32_2 = "Donation unavailable"
                pcall(function() -- Line: 13 -- upvalues: StarterGui (upval), u32_2 (val), u31 (val)
                    StarterGui:SetCore("SendNotification", {Duration = 5, Title = u32_2, Text = u31})
                end)
            end)
            return
        end
        return
    end
end

DonationGranted.OnClientEvent:Connect(function(a1) -- Line: 56 -- upvalues: ReplicatedStorage (val), StarterGui (val)
    local amount = false
    if type(a1) == "table" then
        amount = a1.amount
    end
    local v1 = math.floor((tonumber(amount)) or 0)
    local total = false
    if type(a1) == "table" then
        total = a1.total
    end
    local v2 = math.floor((tonumber(total)) or 0)
    local v3 = {
        colorMode = "rainbow",
        confetti = true,
        text = ("Donation successful! Thank you so much for donating %s Robux! Total donated: %s."):format(tostring(v1), (tostring(v2))),
    }
    v2 = ReplicatedStorage:WaitForChild("ShowFeedbackMessage", 5)
    if v2 and v2:IsA("BindableEvent") then
        v2:Fire(v3)
        return
    end
    local text = v3.text
    local u53 = "Donation successful!"
    pcall(function() -- Line: 13 -- upvalues: StarterGui (upval), u53 (val), text (val)
        StarterGui:SetCore("SendNotification", {Duration = 5, Title = u53, Text = text})
    end)
end)
local v1 = workspace:WaitForChild("DonateRobuxLeaderboard", 30)
local Leaderboard = v1 and v1:WaitForChild("Leaderboard", 10)
v1 = Leaderboard and Leaderboard:WaitForChild("Board", 10)
local SurfaceGui = v1 and v1:WaitForChild("SurfaceGui", 10)
v1 = SurfaceGui and SurfaceGui:WaitForChild("ScrollingFrame", 10)
if not v1 then
    warn("DonationBoardClient: donation ScrollingFrame was not found")
else
    for i, v in ipairs(v1:GetChildren()) do
        connectDonationFrame(v)
    end
    v1.ChildAdded:Connect(connectDonationFrame)
end