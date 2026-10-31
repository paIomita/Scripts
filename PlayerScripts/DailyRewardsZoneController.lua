-- Path: Players.Drrrrrrrrragonball.PlayerScripts.DailyRewardsZoneController

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.DailyRewardsZoneController
-- Decompile time: 2.38 ms

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local v1 = LocalPlayer:WaitForChild("PlayerGui")
local DailyGui = v1:WaitForChild("DailyGui")
local DailyFrame = DailyGui:WaitForChild("DailyFrame")
local ItemsFrame = DailyFrame:WaitForChild("ItemsFrame")
local WheelGui = v1:WaitForChild("WheelGui")
local u44 = ((Workspace:WaitForChild("Daily Rewards Chest")):WaitForChild("Put in Workplace")):WaitForChild("ClaimPart")
local v2 = ItemsFrame:FindFirstChild("Close") or DailyFrame:WaitForChild("Close")
local u62 = math.max(u44.Size.X, u44.Size.Z) / 2
local u63 = u62 + 2
local u64 = false
local u65 = false
local u66 = false
local u67 = false
local u68 = false

local function openDailyGui() -- Line: 33
    -- upvalues: u66 (ref), u65 (ref), u67 (ref), WheelGui (val), u68 (ref), DailyGui (val), DailyFrame (val)
    if u66 then
        return
    end
    if not u65 then
        u67 = WheelGui.Enabled
        WheelGui.Enabled = false
        u68 = true
    end
    DailyGui.Enabled = true
    DailyFrame.Visible = true
    u65 = true
end

local function closeDailyGui(a1) -- Line: 49
    -- upvalues: DailyGui (val), DailyFrame (val), u68 (ref), WheelGui (val), u67 (ref), u65 (ref)
    DailyGui.Enabled = false
    DailyFrame.Visible = false
    if a1 and u68 then
        WheelGui.Enabled = u67
    end
    u68 = false
    u65 = false
end

v2.Activated:Connect(function() -- Line: 61
    -- upvalues: u64 (ref), u66 (ref), DailyGui (val), DailyFrame (val), u68 (ref), WheelGui (val), u67 (ref), u65 (ref)
    if u64 then
        u66 = true
    end
    DailyGui.Enabled = false
    DailyFrame.Visible = false
    if u68 then
        WheelGui.Enabled = u67
    end
    u68 = false
    u65 = false
end)

local function forceCheckPlayerPosition() -- Line: 70
    -- upvalues: LocalPlayer (val), DailyGui (val), DailyFrame (val), u68 (ref), u65 (ref), u44 (val), u62 (val)
    -- upvalues: u63 (val), u64 (ref), u66 (ref), u67 (ref), WheelGui (val)
    if LocalPlayer:GetAttribute("ClickMinigamePending") == true then
        if DailyGui.Enabled or DailyFrame.Visible then
            DailyGui.Enabled = false
            DailyFrame.Visible = false
            u68 = false
            u65 = false
        end
        return
    end
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local Position = HumanoidRootPart.Position
    local Position_2 = u44.Position
    local Magnitude = ((Vector3.new(Position.X, 0, Position.Z)) - Vector3.new(Position_2.X, 0, Position_2.Z)).Magnitude
    local v1 = math.abs(Position.Y - Position_2.Y)
    local v2 = false
    if Magnitude <= u62 then
        v2 = v1 <= 8
    end
    local v3 = true
    if not (u63 < Magnitude) then
        v3 = v1 > 8
    end
    if not v2 then
        if v3 then
            if u64 then
                u64 = false
                u66 = false
                DailyGui.Enabled = false
                DailyFrame.Visible = false
                if u68 then
                    WheelGui.Enabled = u67
                end
                u68 = false
                u65 = false
                return
            end
            if DailyGui.Enabled or DailyFrame.Visible then
                DailyGui.Enabled = false
                DailyFrame.Visible = false
                u68 = false
                u65 = false
            end
        end
        return
    end
    if not u64 then
        u64 = true
        u66 = false
        if u66 then
            return
        end
        if not u65 then
            u67 = WheelGui.Enabled
            WheelGui.Enabled = false
            u68 = true
        end
        DailyGui.Enabled = true
        DailyFrame.Visible = true
        u65 = true
        return
    end
    if u66 then
        if not DailyGui.Enabled and not DailyFrame.Visible then
            return
        end
        DailyGui.Enabled = false
        DailyFrame.Visible = false
        u68 = false
        u65 = false
        return
    end
    if DailyGui.Enabled and DailyFrame.Visible then
        return
    end
    if u66 then
        return
    end
    if not u65 then
        u67 = WheelGui.Enabled
        WheelGui.Enabled = false
        u68 = true
    end
    DailyGui.Enabled = true
    DailyFrame.Visible = true
    u65 = true
end

DailyGui.Enabled = false
DailyFrame.Visible = false
task.spawn(function() -- Line: 128 -- upvalues: forceCheckPlayerPosition (val)
    while true do
        forceCheckPlayerPosition()
        task.wait(0.2)
    end
end)
print("Daily Rewards DailyGui zone controller loaded (Strict Mode).")