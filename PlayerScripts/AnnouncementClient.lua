-- Path: Players.Drrrrrrrrragonball.PlayerScripts.AnnouncementClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.AnnouncementClient
-- Decompile time: 4.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local v1 = ReplicatedStorage:WaitForChild("GlobalAnnouncementEvent")
local u33 = ReplicatedStorage:WaitForChild("AnnouncementUI"):WaitForChild("BG")
local u38 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local AnnouncementContainer = PlayerGui:FindFirstChild("AnnouncementContainer")
if not AnnouncementContainer then
    AnnouncementContainer = Instance.new("ScreenGui")
    AnnouncementContainer.Name = "AnnouncementContainer"
    AnnouncementContainer.ResetOnSpawn = false
    AnnouncementContainer.IgnoreGuiInset = true
    AnnouncementContainer.Parent = PlayerGui
end
AnnouncementContainer.DisplayOrder = 1000000
AnnouncementContainer.ZIndexBehavior = Enum.ZIndexBehavior.Global
AnnouncementContainer.ResetOnSpawn = false
AnnouncementContainer.IgnoreGuiInset = true
;(AnnouncementContainer:GetPropertyChangedSignal("DisplayOrder")):Connect(function() -- Line: 29 -- upvalues: AnnouncementContainer (ref)
    if AnnouncementContainer.DisplayOrder ~= 1000000 then
        AnnouncementContainer.DisplayOrder = 1000000
    end
end)
local u63 = {}

local function forceAnnouncementOnTop(a1) -- Line: 39 -- upvalues: AnnouncementContainer (ref)
    if a1:IsA("GuiObject") then
        a1.ZIndex = 1000000
    end
    local v1 = 1000001
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("GuiObject") then
            v.ZIndex = v1
            v1 = v1 + 1
        end
    end
    AnnouncementContainer.DisplayOrder = 1000000
end

local function addAnnouncement(a1, a2, a3, a4, a5) -- Line: 53
    -- upvalues: u63 (val), AnnouncementContainer (ref), TweenService (val), u38 (val)
    a1.ImageTransparency = 1
    a2.TextTransparency = 1
    a3.ImageTransparency = 1
    local UIStroke = a2:FindFirstChildOfClass("UIStroke")
    if UIStroke then
        UIStroke.Transparency = 1
    end
    a1.AnchorPoint = Vector2.new(0.5, 0)
    local v1 = 60
    for i, v in ipairs(u63) do
        v1 = v1 + (v.height + 3)
    end
    a1.Position = UDim2.new(0.5, 0, 0, 160)
    a1.Parent = AnnouncementContainer
    table.insert(u63, {instance = a1, bg = a1, height = a5})
    TweenService:Create(a1, u38, {ImageTransparency = 0.6, Position = UDim2.new(0.5, 0, 0, v1)}):Play()
    TweenService:Create(a2, u38, {TextTransparency = 0}):Play()
    TweenService:Create(a3, u38, {ImageTransparency = 0}):Play()
    if UIStroke then
        TweenService:Create(UIStroke, u38, {Transparency = 0.3}):Play()
    end
    a4:Play()
end

local function removeAnnouncement(a1, a2, a3, a4) -- Line: 101 -- upvalues: u63 (val), TweenService (val), u38 (val)
    local u4 = nil
    for i, v in ipairs(u63) do
        if v.instance == a1 then
            u4 = i
            break
        end
    end
    if not u4 then
        return
    end
    local height = u63[u4].height
    local UIStroke = a2:FindFirstChildOfClass("UIStroke")
    local v1 = TweenService:Create(a1, u38, {ImageTransparency = 1})
    local v2 = TweenService:Create(a2, u38, {TextTransparency = 1})
    local v3 = TweenService:Create(a3, u38, {ImageTransparency = 1})
    v1:Play()
    v2:Play()
    v3:Play()
    if UIStroke then
        TweenService:Create(UIStroke, u38, {Transparency = 1}):Play()
    end
    v1.Completed:Connect(function() -- Line: 138
        -- upvalues: a1 (val), a4 (val), u63 (upval), u4 (ref), height (val), TweenService (upval), u38 (upval)
        local v1, v2
        a1:Destroy()
        a4:Destroy()
        table.remove(u63, u4)
        local v3 = height + 3
        local v4 = u4
        local v5 = #u63
        for i = v4, v5 do
            v1 = u63[i]
            v2 = UDim2.new(0.5, 0, 0, v1.bg.Position.Y.Offset - v3)
            TweenService:Create(v1.bg, u38, {Position = v2}):Play()
        end
    end)
end

v1.OnClientEvent:Connect(function(a1) -- Line: 157
    -- upvalues: AnnouncementContainer (ref), u33 (val), forceAnnouncementOnTop (val), Players (val)
    -- upvalues: addAnnouncement (val), removeAnnouncement (val)
    if typeof(a1) ~= "table"
        or type(a1.text) ~= "string"
        or type(a1.sender) ~= "string"
        or type(a1.userId) ~= "number" then
        return
    end
    AnnouncementContainer.DisplayOrder = 1000000
    local v1 = u33:Clone()
    forceAnnouncementOnTop(v1)
    local Frame = v1:WaitForChild("Frame")
    local Text = Frame:WaitForChild("Text")
    local ProfilePicture = Frame:WaitForChild("ProfilePicture")
    ProfilePicture.Image = Players:GetUserThumbnailAsync(a1.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    Text.Text = a1.sender .. " : " .. a1.text
    v1.Parent = AnnouncementContainer
    task.wait()
    local Y = v1.AbsoluteSize.Y
    v1.Parent = nil
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://71450094482101"
    Sound.Volume = 0.5
    Sound.Parent = v1
    addAnnouncement(v1, Text, ProfilePicture, Sound, Y)
    task.wait(a1.duration or 8)
    removeAnnouncement(v1, Text, ProfilePicture, Sound)
end)