-- Path: Players.Drrrrrrrrragonball.PlayerScripts.UpdateLogClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.UpdateLogClient
-- Decompile time: 12.00 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local u30 = LocalPlayer:WaitForChild("PlayerGui")
local Changelog = (u30:WaitForChild("Main2"):WaitForChild("BottomRight")):WaitForChild("Changelog")
local v1 = Changelog:WaitForChild("Thumbnail")
local NotificationOne = v1:WaitForChild("NotificationOne")
local UpdateLogViewed = ReplicatedStorage:WaitForChild("UpdateLogViewed")
local v2 = u30:WaitForChild("SeasonPassPreview")
local Root = v2:WaitForChild("Root")
local Mission1 = ((((v2:WaitForChild("MissionsRoot")):WaitForChild("Body")):WaitForChild("Pages")):WaitForChild("Daily")):WaitForChild("Mission1")
local u89 = Color3.fromRGB(25, 29, 38)
local v3 = {
    {
        title = "ADMIN EVENT WHEEL",
        description = "Spin a polished wheel for Pop events, Admin Balloon, or the Pop Titan Boss Fight.",
        image = "rbxassetid://123490843567560",
        top = Color3.fromRGB(255, 229, 247),
        bottom = Color3.fromRGB(255, 173, 224),
        accent = Color3.fromRGB(255, 77, 190),
    },
    {
        title = "POP TITAN BOSS FIGHT",
        description = "Dodge the Pop Titan in the Fight Zone and collect your own Pop rewards after defeating it.",
        image = "rbxthumb://type=AvatarHeadShot&id=634947518&w=150&h=150",
        top = Color3.fromRGB(255, 227, 225),
        bottom = Color3.fromRGB(255, 177, 170),
        accent = Color3.fromRGB(244, 79, 67),
    },
    {
        title = "MORE POP EVENTS",
        description = "Volcano, Tsunami, Meteor, Rift, Tornado, Blizzard, UFO, Black Hole, Thunderstorm, Aurora, and more!",
        image = "rbxassetid://11395089850",
        top = Color3.fromRGB(255, 244, 214),
        bottom = Color3.fromRGB(255, 211, 139),
        accent = Color3.fromRGB(255, 171, 34),
    },
    {
        title = "RAINBOW SWORD",
        description = "Owners can use it in the Fight Zone for +25% damage and a slightly faster reload.",
        image = "rbxassetid://92925094328048",
        top = Color3.fromRGB(226, 250, 255),
        bottom = Color3.fromRGB(164, 225, 255),
        accent = Color3.fromRGB(51, 187, 245),
    },
    {
        title = "UI & QUALITY IMPROVEMENTS",
        description = "Better mobile scaling, menus, feedback, event visuals, Fight Zone UI, Season UI, and gameplay fixes.",
        image = v1.Image,
        top = Color3.fromRGB(238, 229, 255),
        bottom = Color3.fromRGB(202, 180, 255),
        accent = Color3.fromRGB(137, 103, 255),
    },
}
local UpdateLogGui = u30:FindFirstChild("UpdateLogGui")
if UpdateLogGui then
    UpdateLogGui:Destroy()
end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UpdateLogGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = v2.IgnoreGuiInset
ScreenGui.DisplayOrder = v2.DisplayOrder
ScreenGui.ZIndexBehavior = v2.ZIndexBehavior
ScreenGui.ScreenInsets = v2.ScreenInsets
ScreenGui.SafeAreaCompatibility = v2.SafeAreaCompatibility
ScreenGui.ClipToDeviceSafeArea = v2.ClipToDeviceSafeArea
ScreenGui.Parent = u30
local u198 = v2:WaitForChild("Shade"):Clone()
u198.Name = "Shade"
u198.Visible = false
u198.Parent = ScreenGui
local u204 = Instance.new("Frame")
u204.Name = "Root"
u204.Size = Root.Size
u204.AnchorPoint = Vector2.new(0.5, 0.5)
u204.Position = Root.Position
u204.BackgroundColor3 = Root.BackgroundColor3
u204.BackgroundTransparency = Root.BackgroundTransparency
u204.BorderSizePixel = 0
u204.ClipsDescendants = false
u204.ZIndex = Root.ZIndex
u204.Visible = false
u204.Parent = ScreenGui
for i, v in ipairs({"UICorner", "UIStroke", "UIAspectRatioConstraint", "UISizeConstraint"}) do
    Root:WaitForChild(v):Clone().Parent = u204
end
local UIScale = Instance.new("UIScale")
UIScale.Name = "SeasonPanelOpenScale"
UIScale.Scale = 1
UIScale.Parent = u204
local v4 = Root:WaitForChild("SeasonBlockShadow"):Clone()
v4.Name = "UpdateBlockShadow"
v4.Text = "UPDATE LOG"
v4.Parent = u204
v4 = Root:WaitForChild("SeasonBlockTitle"):Clone()
v4.Name = "UpdateBlockTitle"
v4.Text = "UPDATE LOG"
v4.Parent = u204
v4 = Root:WaitForChild("Header"):Clone()
for i2, i3 in ipairs(v4:GetChildren()) do
    if i3.Name ~= "UIGradient" and i3.Name ~= "HeaderCorner" then
        i3:Destroy()
    end
end
v4.Name = "Header"
v4.Parent = u204
local v5 = Root.Header:WaitForChild("SeasonPanel"):Clone()
v5.Name = "UpdatePanel"
v5.Size = UDim2.new(0.89, 0, 0.7, 0)
v5.Position = UDim2.new(0.035, 0, 0.13, 0)
v5.Parent = v4
v5 = Root.Header:WaitForChild("Title"):Clone()
v5.Name = "Title"
v5.Text = "UPDATE 3"
v5.Position = UDim2.new(0.065, 0, 0.18, 0)
v5.Size = UDim2.new(0.32, 0, 0.3, 0)
v5.Parent = v4
v5 = Root.Header:WaitForChild("Subtitle"):Clone()
v5.Name = "Subtitle"
v5.Text = "WHAT'S NEW IN POP FOR FREE"
v5.Position = UDim2.new(0.065, 0, 0.52, 0)
v5.Size = UDim2.new(0.55, 0, 0.24, 0)
v5.Parent = v4
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ChangeLogArtwork"
ImageLabel.Size = UDim2.new(0.07, 0, 0.7, 0)
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.84, 0, 0.48, 0)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = v1.Image
ImageLabel.ScaleType = Enum.ScaleType.Fit
ImageLabel.ZIndex = 31
ImageLabel.Parent = v4
v1 = Instance.new("UIAspectRatioConstraint")
v1.AspectRatio = 1
v1.Parent = ImageLabel
v5 = Root.Header:WaitForChild("Close"):Clone()
v5.Name = "Close"
v5.Parent = v4
local u393 = v5:FindFirstChild("ButtonUIScale")
v1 = Root:WaitForChild("Body"):Clone()
for i4, j in ipairs(v1:GetChildren()) do
    if not j:IsA("UICorner") and not j:IsA("UIStroke") and not j:IsA("UIGradient") then
        j:Destroy()
    end
end
v1.Name = "Body"
v1.Parent = u204
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "UpdateEntries"
ScrollingFrame.Size = UDim2.new(0.97, 0, 0.92, 0)
ScrollingFrame.Position = UDim2.new(0.015, 0, 0.04, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(24, 150, 221)
ScrollingFrame.CanvasSize = UDim2.new()
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ScrollingFrame.ZIndex = 27
ScrollingFrame.Parent = v1
v1 = Instance.new("UIPadding")
v1.PaddingTop = UDim.new(0, 7)
v1.PaddingBottom = UDim.new(0, 10)
v1.PaddingLeft = UDim.new(0, 7)
v1.PaddingRight = UDim.new(0, 15)
v1.Parent = ScrollingFrame
v1 = Instance.new("UIListLayout")
v1.Padding = UDim.new(0, 11)
v1.SortOrder = Enum.SortOrder.LayoutOrder
v1.Parent = ScrollingFrame

local function setTextConstraint(a1, a2, a3) -- Line: 200
    local UITextSizeConstraint = a1:FindFirstChildWhichIsA("UITextSizeConstraint")
    if UITextSizeConstraint then
        UITextSizeConstraint.MinTextSize = a2
        UITextSizeConstraint.MaxTextSize = a3
    end
end

local function addEntry(a1, a2) -- Line: 208 -- upvalues: Mission1 (val), ScrollingFrame (val), u89 (val)
    local v1 = Mission1:Clone()
    v1.Name = a1.title:gsub("%W", "")
    v1.Size = UDim2.new(1, -8, 0, 112)
    v1.Position = UDim2.new()
    v1.LayoutOrder = a2
    v1.BackgroundColor3 = a1.top
    v1.Parent = ScrollingFrame
    for i, v in ipairs(v1:GetChildren()) do
        if v.Name ~= "UICorner"
            and v.Name ~= "UIStroke"
            and v.Name ~= "UIGradient"
            and v.Name ~= "IconBack"
            and v.Name ~= "MissionTitle"
            and v.Name ~= "Description" then
            v:Destroy()
        end
    end
    local UIGradient = v1:FindFirstChildWhichIsA("UIGradient")
    if UIGradient then
        UIGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, a1.top),
            (ColorSequenceKeypoint.new(1, a1.bottom)),
        })
    end
    local IconBack = v1:WaitForChild("IconBack")
    IconBack.BackgroundColor3 = a1.accent
    local Icon = IconBack:WaitForChild("Icon")
    Icon.Image = a1.image
    Icon.ImageColor3 = Color3.new(1, 1, 1)
    Icon.Rotation = 0
    local MissionTitle = v1:WaitForChild("MissionTitle")
    MissionTitle.Text = a1.title
    MissionTitle.Position = UDim2.new(0.125, 0, 0.08, 0)
    MissionTitle.Size = UDim2.new(0.84, 0, 0.31, 0)
    MissionTitle.TextColor3 = u89
    local v2 = MissionTitle:FindFirstChildWhichIsA("UITextSizeConstraint")
    if v2 then
        v2.MinTextSize = 12
        v2.MaxTextSize = 23
    end
    local Description = v1:WaitForChild("Description")
    Description.Text = a1.description
    Description.Position = UDim2.new(0.125, 0, 0.4, 0)
    Description.Size = UDim2.new(0.84, 0, 0.48, 0)
    Description.TextColor3 = Color3.fromRGB(70, 78, 91)
    Description.TextYAlignment = Enum.TextYAlignment.Top
    v1 = Description:FindFirstChildWhichIsA("UITextSizeConstraint")
    if v1 then
        v1.MinTextSize = 10
        v1.MaxTextSize = 17
    end
end

for i5, k in ipairs(v3) do
    addEntry(k, i5)
end
local v6 = Root:WaitForChild("Footer"):Clone()
v6.Name = "Footer"
for i6, n in ipairs(v6:GetChildren()) do
    n:Destroy()
end
v6.Parent = u204
v3 = Root.Header:WaitForChild("Subtitle"):Clone()
v3.Name = "FooterText"
v3.Size = UDim2.fromScale(1, 1)
v3.Position = UDim2.new()
v3.Text = "THANKS FOR PLAYING!  •  MORE UPDATES SOON"
v3.TextXAlignment = Enum.TextXAlignment.Center
v3.TextColor3 = Color3.fromRGB(75, 220, 255)
v3.Parent = v6
local UITextSizeConstraint = v3:FindFirstChildWhichIsA("UITextSizeConstraint")
if UITextSizeConstraint then
    UITextSizeConstraint.MinTextSize = 12
    UITextSizeConstraint.MaxTextSize = 22
end
local u550 = nil

local function updateDeviceLayout() -- Line: 273 -- upvalues: u204 (val), Root (val)
    local CurrentCamera = workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    if ViewportSize.Y < 450 then
        u204.Size = UDim2.new(0.84, 0, 0.74, 0)
        u204.Position = UDim2.new(0.5, 0, 0.6, 0)
        return
    end
    if ViewportSize.Y < 600 then
        u204.Size = UDim2.new(0.9, 0, 0.8, 0)
        u204.Position = UDim2.new(0.5, 0, 0.56, 0)
        return
    end
    u204.Size = Root.Size
    u204.Position = Root.Position
end

if u550 then
    u550:Disconnect()
end
updateDeviceLayout()
local CurrentCamera = workspace.CurrentCamera
if CurrentCamera then
    (CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateDeviceLayout)
end
;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 288 -- upvalues: u550 (ref), updateDeviceLayout (val)
    if u550 then
        u550:Disconnect()
        u550 = nil
    end
    updateDeviceLayout()
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera then
        (CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateDeviceLayout)
    end
end)
local u584 = {}
local u585 = false

local function setBlur(a1) -- Line: 306 -- upvalues: Lighting (val), TweenService (val)
    local UpdateLogModalBlur = Lighting:FindFirstChild("UpdateLogModalBlur")
    if a1 then
        if not UpdateLogModalBlur then
            UpdateLogModalBlur = Instance.new("BlurEffect")
            UpdateLogModalBlur.Name = "UpdateLogModalBlur"
            UpdateLogModalBlur.Size = 0
            UpdateLogModalBlur.Parent = Lighting
        end
        TweenService:Create(UpdateLogModalBlur, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
    elseif UpdateLogModalBlur then
        local v1 = TweenService
        local v2 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        v1 = v1:Create(UpdateLogModalBlur, v2, {Size = 0})
        v1:Play()
        v1.Completed:Connect(function() -- Line: 319 -- upvalues: UpdateLogModalBlur (ref)
            if UpdateLogModalBlur and UpdateLogModalBlur.Parent and UpdateLogModalBlur.Size <= 0.01 then
                UpdateLogModalBlur:Destroy()
            end
        end)
    end
end

local function hideOtherUi() -- Line: 325
    -- upvalues: u585 (ref), u584 (ref), u30 (val), ScreenGui (val), Lighting (val), TweenService (val)
    if u585 then
        return
    end
    u585 = true
    u584 = {}
    for i, v in ipairs(u30:GetChildren()) do
        if v:IsA("ScreenGui") and v ~= ScreenGui and v.Name ~= "FeedbackGui" then
            u584[v] = v.Enabled
            v.Enabled = false
        end
    end
    u30:SetAttribute("UpdateLogModalActive", true)
    local UpdateLogModalBlur = Lighting:FindFirstChild("UpdateLogModalBlur")
    if not UpdateLogModalBlur then
        UpdateLogModalBlur = Instance.new("BlurEffect")
        UpdateLogModalBlur.Name = "UpdateLogModalBlur"
        UpdateLogModalBlur.Size = 0
        UpdateLogModalBlur.Parent = Lighting
    end
    TweenService:Create(UpdateLogModalBlur, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
end

local function restoreOtherUi() -- Line: 339 -- upvalues: u585 (ref), u584 (ref), u30 (val), setBlur (val)
    if not u585 then
        return
    end
    u585 = false
    for k, v in pairs(u584) do
        if k and k.Parent then
            k.Enabled = v
        end
    end
    u584 = {}
    u30:SetAttribute("UpdateLogModalActive", false)
    setBlur(false)
end

local u605 = false
local u606 = 0
local u607 = false
local u608 = 0
local u609 = false
local Rotation = NotificationOne.Rotation
local UpdateLogWiggleScale = NotificationOne:FindFirstChild("UpdateLogWiggleScale")
if not UpdateLogWiggleScale then
    UpdateLogWiggleScale = Instance.new("UIScale")
    UpdateLogWiggleScale.Name = "UpdateLogWiggleScale"
    UpdateLogWiggleScale.Parent = NotificationOne
end

local function setNotificationVisible(a1) -- Line: 365
    -- upvalues: u608 (ref), u609 (ref), NotificationOne (val), Rotation (val), UpdateLogWiggleScale (ref)
    -- upvalues: TweenService (val)
    if not (a1 == true) then
        u608 = u608 + 1
        u609 = false
        NotificationOne.Visible = false
        NotificationOne.Rotation = Rotation
        UpdateLogWiggleScale.Scale = 1
        return
    end
    NotificationOne.Visible = true
    if u609 then
        return
    end
    u609 = true
    u608 = u608 + 1
    local u19 = u608
    task.spawn(function() -- Line: 381
        -- upvalues: u19 (val), u608 (upval), NotificationOne (upval), TweenService (upval)
        -- upvalues: UpdateLogWiggleScale (upval), Rotation (upval), u609 (upval)
        local function step(a1, a2, a3) -- Line: 382
            -- upvalues: u19 (upval), u608 (upval), NotificationOne (upval), TweenService (upval)
            -- upvalues: UpdateLogWiggleScale (upval)
            if u19 == u608 and NotificationOne.Visible then
                local v1 = TweenService:Create(NotificationOne, TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = a1})
                local v2 = TweenService:Create(
                    UpdateLogWiggleScale,
                    TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {Scale = a2}
                )
                v1:Play()
                v2:Play()
                v1.Completed:Wait()
                local Visible = false
                if u19 == u608 then
                    Visible = NotificationOne.Visible
                end
                return Visible
            end
            return false
        end

        while u19 == u608 do
            if not NotificationOne.Visible
                or not step(Rotation - 13, 0.94, 0.09)
                or not step(Rotation + 13, 1.09, 0.12)
                or not step(Rotation - 8, 1.04, 0.1)
                or not step(Rotation + 6, 1.02, 0.1)
                or not step(Rotation, 1, 0.13) then
                break
            end
            task.wait(0.9)
        end
        if u19 == u608 then
            u609 = false
            NotificationOne.Rotation = Rotation
            UpdateLogWiggleScale.Scale = 1
        end
    end)
end

local function refreshNotification() -- Line: 407
    -- upvalues: u607 (ref), LocalPlayer (val), u608 (ref), u609 (ref), NotificationOne (val), Rotation (val)
    -- upvalues: UpdateLogWiggleScale (ref), TweenService (val)
    local v1 = not u607
    if v1 then
        v1 = false
        if LocalPlayer:GetAttribute("CurrencyDataLoaded") == true then
            v1 = false
            if LocalPlayer:GetAttribute("UpdateLog3Eligible") == true then
                v1 = LocalPlayer:GetAttribute("UpdateLog3Seen") ~= true
            end
        end
    end
    if not (v1 == true) then
        u608 = u608 + 1
        u609 = false
        NotificationOne.Visible = false
        NotificationOne.Rotation = Rotation
        UpdateLogWiggleScale.Scale = 1
        return
    end
    NotificationOne.Visible = true
    if u609 then
        return
    end
    u609 = true
    u608 = u608 + 1
    local u41 = u608
    task.spawn(function() -- Line: 381
        -- upvalues: u41 (val), u608 (upval), NotificationOne (upval), TweenService (upval)
        -- upvalues: UpdateLogWiggleScale (upval), Rotation (upval), u609 (upval)
        local function step(a1, a2, a3) -- Line: 382
            -- upvalues: u41 (upval), u608 (upval), NotificationOne (upval), TweenService (upval)
            -- upvalues: UpdateLogWiggleScale (upval)
            if u41 == u608 and NotificationOne.Visible then
                local v1 = TweenService:Create(NotificationOne, TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = a1})
                local v2 = TweenService:Create(
                    UpdateLogWiggleScale,
                    TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {Scale = a2}
                )
                v1:Play()
                v2:Play()
                v1.Completed:Wait()
                local Visible = false
                if u41 == u608 then
                    Visible = NotificationOne.Visible
                end
                return Visible
            end
            return false
        end

        while u41 == u608 do
            if not NotificationOne.Visible
                or not step(Rotation - 13, 0.94, 0.09)
                or not step(Rotation + 13, 1.09, 0.12)
                or not step(Rotation - 8, 1.04, 0.1)
                or not step(Rotation + 6, 1.02, 0.1)
                or not step(Rotation, 1, 0.13) then
                break
            end
            task.wait(0.9)
        end
        if u41 == u608 then
            u609 = false
            NotificationOne.Rotation = Rotation
            UpdateLogWiggleScale.Scale = 1
        end
    end)
end

local function playOpen() -- Line: 415
    -- upvalues: u606 (ref), u204 (val), u198 (val), UIScale (val), TweenService (val), u605 (ref)
    u606 = u606 + 1
    local u2 = u606
    u204:SetAttribute("JiggleToken", u2)
    u204.Visible = true
    u198.Visible = true
    UIScale.Scale = 0.78
    u204.Rotation = 0
    TweenService:Create(UIScale, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.035}):Play()
    task.delay(0.16, function() -- Line: 424 -- upvalues: u605 (upval), u606 (upval), u2 (val), TweenService (upval), UIScale (upval)
        if u605 and u606 == u2 then
            TweenService:Create(UIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = 0.99}):Play()
        end
    end)
    task.delay(0.26, function() -- Line: 429 -- upvalues: u605 (upval), u606 (upval), u2 (val), TweenService (upval), UIScale (upval)
        if u605 and u606 == u2 then
            TweenService:Create(UIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = 1}):Play()
        end
    end)
end

local function closeUpdateLog() -- Line: 450
    -- upvalues: u605 (ref), u606 (ref), TweenService (val), UIScale (val), u204 (val), u198 (val), restoreOtherUi (val)
    if not u605 then
        return
    end
    u605 = false
    u606 = u606 + 1
    local u4 = u606
    TweenService:Create(UIScale, TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = 1.02}):Play()
    task.delay(0.08, function() -- Line: 456 -- upvalues: u606 (upval), u4 (val), TweenService (upval), UIScale (upval)
        if u606 == u4 then
            TweenService:Create(UIScale, TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Scale = 0.78}):Play()
        end
    end)
    task.delay(0.22, function() -- Line: 461
        -- upvalues: u606 (upval), u4 (val), u204 (upval), u198 (upval), UIScale (upval), restoreOtherUi (upval)
        if u606 ~= u4 then
            return
        end
        u204.Visible = false
        u198.Visible = false
        UIScale.Scale = 1
        u204.Rotation = 0
        restoreOtherUi()
    end)
end

local function tweenCloseScale(a1) -- Line: 471 -- upvalues: u393 (val), TweenService (val)
    if not u393 then
        return
    end
    TweenService:Create(u393, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = a1}):Play()
end

Changelog.Activated:Connect(function() -- Line: 436
    -- upvalues: u605 (ref), updateDeviceLayout (val), NotificationOne (val), u607 (ref), u608 (ref), u609 (ref)
    -- upvalues: Rotation (val), UpdateLogWiggleScale (ref), TweenService (val), UpdateLogViewed (val)
    -- upvalues: hideOtherUi (val), playOpen (val)
    if u605 then
        return
    end
    updateDeviceLayout()
    u605 = true
    local Visible = NotificationOne.Visible
    u607 = true
    if false then
        NotificationOne.Visible = true
        if not u609 then
            u609 = true
            u608 = u608 + 1
            local u26 = u608
            task.spawn(function() -- Line: 381
                -- upvalues: u26 (val), u608 (upval), NotificationOne (upval), TweenService (upval)
                -- upvalues: UpdateLogWiggleScale (upval), Rotation (upval), u609 (upval)
                local function step(a1, a2, a3) -- Line: 382
                    -- upvalues: u26 (upval), u608 (upval), NotificationOne (upval), TweenService (upval)
                    -- upvalues: UpdateLogWiggleScale (upval)
                    if u26 == u608 and NotificationOne.Visible then
                        local v1 = TweenService:Create(
                            NotificationOne,
                            TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                            {Rotation = a1}
                        )
                        local v2 = TweenService:Create(
                            UpdateLogWiggleScale,
                            TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                            {Scale = a2}
                        )
                        v1:Play()
                        v2:Play()
                        v1.Completed:Wait()
                        local Visible = false
                        if u26 == u608 then
                            Visible = NotificationOne.Visible
                        end
                        return Visible
                    end
                    return false
                end

                while u26 == u608 do
                    if not NotificationOne.Visible
                        or not step(Rotation - 13, 0.94, 0.09)
                        or not step(Rotation + 13, 1.09, 0.12)
                        or not step(Rotation - 8, 1.04, 0.1)
                        or not step(Rotation + 6, 1.02, 0.1)
                        or not step(Rotation, 1, 0.13) then
                        break
                    end
                    task.wait(0.9)
                end
                if u26 == u608 then
                    u609 = false
                    NotificationOne.Rotation = Rotation
                    UpdateLogWiggleScale.Scale = 1
                end
            end)
        end
    else
        u608 = u608 + 1
        u609 = false
        NotificationOne.Visible = false
        NotificationOne.Rotation = Rotation
        UpdateLogWiggleScale.Scale = 1
    end
    if Visible then
        UpdateLogViewed:FireServer(3)
    end
    hideOtherUi()
    playOpen()
end)
v5.Activated:Connect(closeUpdateLog)
v5.MouseEnter:Connect(function() -- Line: 478 -- upvalues: tweenCloseScale (val)
    tweenCloseScale(1.08)
end)
v5.MouseLeave:Connect(function() -- Line: 479 -- upvalues: tweenCloseScale (val)
    tweenCloseScale(1)
end)
v5.MouseButton1Down:Connect(function() -- Line: 480 -- upvalues: tweenCloseScale (val)
    tweenCloseScale(0.9)
end)
v5.MouseButton1Up:Connect(function() -- Line: 481 -- upvalues: tweenCloseScale (val)
    tweenCloseScale(1.08)
end)
UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 483 -- upvalues: u605 (ref), closeUpdateLog (val)
    if not a2 and u605 then
        if a1.KeyCode == Enum.KeyCode.Escape or a1.KeyCode == Enum.KeyCode.ButtonB then
            closeUpdateLog()
        end
        return
    end
end)
;(LocalPlayer:GetAttributeChangedSignal("CurrencyDataLoaded")):Connect(refreshNotification)
;(LocalPlayer:GetAttributeChangedSignal("UpdateLog3Eligible")):Connect(refreshNotification)
;(LocalPlayer:GetAttributeChangedSignal("UpdateLog3Seen")):Connect(refreshNotification)
NotificationOne.Visible = false
NotificationOne.Rotation = Rotation
UpdateLogWiggleScale.Scale = 1
u204.Visible = false
u198.Visible = false
local v7 = not u607
if v7 then
    v7 = false
    if LocalPlayer:GetAttribute("CurrencyDataLoaded") == true then
        v7 = false
        if LocalPlayer:GetAttribute("UpdateLog3Eligible") == true then
            v7 = LocalPlayer:GetAttribute("UpdateLog3Seen") ~= true
        end
    end
end
if v7 == true then
    NotificationOne.Visible = true
    if not u609 then
        u609 = true
        u608 = u608 + 1
        local u788 = u608
        task.spawn(function() -- Line: 381
            -- upvalues: u788 (val), u608 (ref), NotificationOne (val), TweenService (val), UpdateLogWiggleScale (ref)
            -- upvalues: Rotation (val), u609 (ref)
            local function step(a1, a2, a3) -- Line: 382
                -- upvalues: u788 (upval), u608 (upval), NotificationOne (upval), TweenService (upval)
                -- upvalues: UpdateLogWiggleScale (upval)
                if u788 == u608 and NotificationOne.Visible then
                    local v1 = TweenService:Create(
                        NotificationOne,
                        TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                        {Rotation = a1}
                    )
                    local v2 = TweenService:Create(
                        UpdateLogWiggleScale,
                        TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                        {Scale = a2}
                    )
                    v1:Play()
                    v2:Play()
                    v1.Completed:Wait()
                    local Visible = false
                    if u788 == u608 then
                        Visible = NotificationOne.Visible
                    end
                    return Visible
                end
                return false
            end

            while u788 == u608 do
                if not NotificationOne.Visible
                    or not step(Rotation - 13, 0.94, 0.09)
                    or not step(Rotation + 13, 1.09, 0.12)
                    or not step(Rotation - 8, 1.04, 0.1)
                    or not step(Rotation + 6, 1.02, 0.1)
                    or not step(Rotation, 1, 0.13) then
                    break
                end
                task.wait(0.9)
            end
            if u788 == u608 then
                u609 = false
                NotificationOne.Rotation = Rotation
                UpdateLogWiggleScale.Scale = 1
            end
        end)
    end
else
    u608 = u608 + 1
    NotificationOne.Visible = false
    NotificationOne.Rotation = Rotation
    UpdateLogWiggleScale.Scale = 1
end