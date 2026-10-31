-- Path: Players.Drrrrrrrrragonball.PlayerScripts.DailyRewardsZoneControllerV2

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.DailyRewardsZoneControllerV2
-- Decompile time: 4.19 ms

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local u20 = LocalPlayer:WaitForChild("PlayerGui")
local DailyGui = u20:WaitForChild("DailyGui")
local DailyFrame = DailyGui:WaitForChild("DailyFrame")
DailyGui.DisplayOrder = 100000
DailyGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
local Close = DailyFrame:WaitForChild("ItemsFrame"):FindFirstChild("Close") or DailyFrame:WaitForChild("Close")
local u48 = u20:WaitForChild("Main")
local Top = u48:WaitForChild("Top")
local ClickMinigameGui = u20:WaitForChild("ClickMinigameGui")
local ClaimPart = ((Workspace:WaitForChild("Daily Rewards Chest")):WaitForChild("Put in Workplace")):WaitForChild("ClaimPart")
local u76 = math.max(ClaimPart.Size.X, ClaimPart.Size.Z) / 2
local u77 = u76 + 2
local u78 = false
local u79 = false
local u80 = false
local u81 = {}
local u82 = {}
local u83 = {}

local function enforceDailyOnTop() -- Line: 30 -- upvalues: DailyGui (val), u20 (val), u83 (val)
    DailyGui.DisplayOrder = 100000
    for i, v in ipairs(u20:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= DailyGui and DailyGui.DisplayOrder <= v.DisplayOrder then
            if u83[v] == nil then
                u83[v] = v.DisplayOrder
            end
            v.DisplayOrder = DailyGui.DisplayOrder - 1
        end
    end
end

local function hideOtherInterfaces() -- Line: 40
    -- upvalues: enforceDailyOnTop (val), u20 (val), DailyGui (val), u48 (val), ClickMinigameGui (val), u81 (val)
    -- upvalues: u82 (val), Top (val)
    local v1
    enforceDailyOnTop()
    for i, v in ipairs(u20:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= DailyGui and v ~= u48 and v ~= ClickMinigameGui then
            if u81[v] == nil then
                u81[v] = v.Enabled
            end
            v.Enabled = false
        end
    end
    if u81[u48] == nil then
        u81[u48] = u48.Enabled
    end
    u48.Enabled = true
    for i2, i3 in ipairs(u48:GetChildren()) do
        if i3:IsA("GuiObject") then
            if u82[i3] == nil then
                u82[i3] = i3.Visible
            end
            v1 = i3 == Top
            i3.Visible = v1
        end
    end
    Top.Visible = true
end

local function restoreInterfaces() -- Line: 59 -- upvalues: u81 (val), u82 (val), u83 (val)
    for k, v in pairs(u81) do
        if k and k.Parent then
            k.Enabled = v
        end
    end
    for k2, i in pairs(u82) do
        if k2 and k2.Parent then
            k2.Visible = i
        end
    end
    for k3, j in pairs(u83) do
        if k3 and k3.Parent then
            k3.DisplayOrder = j
        end
    end
    table.clear(u81)
    table.clear(u82)
    table.clear(u83)
end

local function openDailyGui() -- Line: 74
    -- upvalues: u80 (ref), LocalPlayer (val), DailyGui (val), hideOtherInterfaces (val), DailyFrame (val), u79 (ref)
    if not u80 and LocalPlayer:GetAttribute("ClickMinigamePending") ~= true then
        DailyGui.DisplayOrder = 100000
        hideOtherInterfaces()
        DailyGui.Enabled = true
        DailyFrame.Visible = true
        u79 = true
        return
    end
end

local function closeDailyGui(a1) -- Line: 83
    -- upvalues: DailyGui (val), DailyFrame (val), u79 (ref), restoreInterfaces (val)
    DailyGui.Enabled = false
    DailyFrame.Visible = false
    u79 = false
    if a1 then
        restoreInterfaces()
    end
end

Close.Activated:Connect(function() -- Line: 90
    -- upvalues: u78 (ref), u80 (ref), DailyGui (val), DailyFrame (val), u79 (ref), restoreInterfaces (val)
    if u78 then
        u80 = true
    end
    DailyGui.Enabled = false
    DailyFrame.Visible = false
    u79 = false
    restoreInterfaces()
end)

local function checkPosition() -- Line: 95
    -- upvalues: LocalPlayer (val), DailyGui (val), DailyFrame (val), u79 (ref), ClaimPart (val), u76 (val), u77 (val)
    -- upvalues: u78 (ref), u80 (ref), hideOtherInterfaces (val), restoreInterfaces (val), u81 (val), u82 (val)
    if LocalPlayer:GetAttribute("ClickMinigamePending") == true then
        if DailyGui.Enabled or DailyFrame.Visible then
            DailyGui.Enabled = false
            DailyFrame.Visible = false
            u79 = false
        end
        return
    end
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local Position = HumanoidRootPart.Position
    local Position_2 = ClaimPart.Position
    local Magnitude = ((Vector3.new(Position.X, 0, Position.Z)) - Vector3.new(Position_2.X, 0, Position_2.Z)).Magnitude
    local v1 = math.abs(Position.Y - Position_2.Y)
    local v2 = false
    if Magnitude <= u76 then
        v2 = v1 <= 8
    end
    local v3 = true
    if not (u77 < Magnitude) then
        v3 = v1 > 8
    end
    if not v2 then
        if v3 then
            if u78 then
                u78 = false
                u80 = false
                DailyGui.Enabled = false
                DailyFrame.Visible = false
                u79 = false
                restoreInterfaces()
                return
            end
            if not DailyGui.Enabled and not DailyFrame.Visible then
                if next(u81) or next(u82) then
                    restoreInterfaces()
                end
                return
            end
            DailyGui.Enabled = false
            DailyFrame.Visible = false
            u79 = false
            return
        end
        return
    end
    if not u78 then
        u78 = true
        u80 = false
        if u80 or LocalPlayer:GetAttribute("ClickMinigamePending") == true then
            return
        end
        DailyGui.DisplayOrder = 100000
        hideOtherInterfaces()
        DailyGui.Enabled = true
        DailyFrame.Visible = true
        u79 = true
        return
    end
    if u80 then
        if not DailyGui.Enabled and not DailyFrame.Visible then
            return
        end
        DailyGui.Enabled = false
        DailyFrame.Visible = false
        u79 = false
        return
    end
    if not DailyGui.Enabled then
        if not u80 and LocalPlayer:GetAttribute("ClickMinigamePending") ~= true then
            DailyGui.DisplayOrder = 100000
            hideOtherInterfaces()
            DailyGui.Enabled = true
            DailyFrame.Visible = true
            u79 = true
        end
    elseif not DailyFrame.Visible and not u80 and LocalPlayer:GetAttribute("ClickMinigamePending") ~= true then
        DailyGui.DisplayOrder = 100000
        hideOtherInterfaces()
        DailyGui.Enabled = true
        DailyFrame.Visible = true
        u79 = true
    end
    if not u79 then
        return
    end
    hideOtherInterfaces()
end

DailyGui.Enabled = false
DailyFrame.Visible = false
task.spawn(function() -- Line: 134 -- upvalues: checkPosition (val)
    while true do
        checkPosition()
        task.wait(0.15)
    end
end)
RunService:BindToRenderStep("DailyRewardsHideOtherUI", Enum.RenderPriority.Last.Value + 100, function() -- Line: 138
    -- upvalues: u79 (ref), LocalPlayer (val), hideOtherInterfaces (val), DailyGui (val), DailyFrame (val)
    if u79 and LocalPlayer:GetAttribute("ClickMinigamePending") ~= true then
        hideOtherInterfaces()
        DailyGui.Enabled = true
        DailyFrame.Visible = true
    end
end)