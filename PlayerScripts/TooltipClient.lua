-- Path: Players.Drrrrrrrrragonball.PlayerScripts.TooltipClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.TooltipClient
-- Decompile time: 10.16 ms

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local u355 = Players.LocalPlayer:WaitForChild("PlayerGui")
local Main = u355:WaitForChild("Main")
local Main2 = u355:FindFirstChild("Main2")
local TouchEnabled = UserInputService.TouchEnabled
if TouchEnabled then
    TouchEnabled = not UserInputService.KeyboardEnabled
end
local TooltipGui = u355:FindFirstChild("TooltipGui")
if not TooltipGui then
    TooltipGui = Instance.new("ScreenGui")
    TooltipGui.Name = "TooltipGui"
    TooltipGui.ResetOnSpawn = false
    TooltipGui.IgnoreGuiInset = true
    TooltipGui.DisplayOrder = 999999
    TooltipGui.Parent = u355
end
TooltipGui.Enabled = false
pcall(function() -- Line: 30 -- upvalues: TooltipGui (ref)
    TooltipGui.ScreenInsets = Enum.ScreenInsets.None
end)
pcall(function() -- Line: 31 -- upvalues: TooltipGui (ref)
    TooltipGui.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
end)
pcall(function() -- Line: 32 -- upvalues: TooltipGui (ref)
    TooltipGui.ClipToDeviceSafeArea = false
end)
local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "Tooltip"
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.TextSize = if not TouchEnabled then 22 else 16
TextLabel.TextColor3 = Color3.fromRGB(45, 45, 55)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 0
TextLabel.BorderSizePixel = 0
TextLabel.AutomaticSize = Enum.AutomaticSize.XY
TextLabel.Size = UDim2.fromOffset(0, 0)
TextLabel.TextWrapped = TouchEnabled
TextLabel.TextTruncate = Enum.TextTruncate.None
TextLabel.ZIndex = 999999
TextLabel.Visible = false
TextLabel.AnchorPoint = Vector2.new(0, 0)
TextLabel.Parent = TooltipGui
local UISizeConstraint = Instance.new("UISizeConstraint")
local v1 = TouchEnabled and Vector2.new(160, 80) or Vector2.new(260, 100)
UISizeConstraint.MaxSize = v1
UISizeConstraint.MinSize = Vector2.new(0, 0)
UISizeConstraint.Parent = TextLabel
local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingLeft = UDim.new(0, if not TouchEnabled then 14 else 10)
UIPadding.PaddingRight = UDim.new(0, if not TouchEnabled then 14 else 10)
UIPadding.PaddingTop = UDim.new(0, if not TouchEnabled then 6 else 5)
UIPadding.PaddingBottom = UDim.new(0, if not TouchEnabled then 6 else 5)
UIPadding.Parent = TextLabel
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 7)
UICorner.Parent = TextLabel
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(30, 30, 40)
UIStroke.Thickness = if not TouchEnabled then 2.5 else 2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = TextLabel
local u369 = nil
local u370 = false
local u190 = nil
local u191 = 0
local u371 = {}
local u368 = {}
local shouldSkipButton = nil
local isShopPurchaseButton = nil

local function getHoverState(a1) -- Line: 82 -- upvalues: u368 (val)
    local v1 = u368[a1]
    if v1 then
        return v1
    end
    local Thumbnail = a1:FindFirstChild("Thumbnail")
    if not Thumbnail or not Thumbnail:IsA("GuiObject") then
        Thumbnail = a1
    end
    local TooltipHoverScale = Thumbnail:FindFirstChild("TooltipHoverScale")
    if not TooltipHoverScale or not TooltipHoverScale:IsA("UIScale") then
        TooltipHoverScale = Instance.new("UIScale")
        TooltipHoverScale.Name = "TooltipHoverScale"
        TooltipHoverScale.Scale = 1
        TooltipHoverScale.Parent = Thumbnail
    end
    v1 = {
        isHovering = false,
        target = Thumbnail,
        scale = TooltipHoverScale,
        rotation = Thumbnail.Rotation,
        side = if #a1.Name % 2 ~= 0 then -1 else 1,
    }
    u368[a1] = v1
    return v1
end

local function tweenHover(a1, a2) -- Line: 112 -- upvalues: getHoverState (val), TweenService (val)
    if a1 and a1:IsA("GuiObject") then
        local v1 = getHoverState(a1)
        v1.isHovering = a2 == true
        if v1.scaleTween then
            v1.scaleTween:Cancel()
        end
        if v1.rotationTween then
            v1.rotationTween:Cancel()
        end
        if not a2 then
            v1.scaleTween = TweenService:Create(v1.scale, TweenInfo.new(0.45, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Scale = 1})
            v1.rotationTween = TweenService:Create(
                v1.target,
                TweenInfo.new(0.45, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
                {Rotation = v1.rotation or 0}
            )
        else
            v1.scaleTween = TweenService:Create(v1.scale, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.06})
            local target = v1.target
            local v2 = TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local v3 = {}
            local rotation = not (a1:GetAttribute("HoverNoRotate") ~= true) and v1.rotation or v1.rotation + 5 * v1.side
            v3.Rotation = rotation
            v1.rotationTween = TweenService:Create(target, v2, v3)
        end
        v1.scaleTween:Play()
        v1.rotationTween:Play()
        return
    end
end

local function shouldBindHoverEffect(a1) -- Line: 154
    -- upvalues: TextLabel (val), TooltipGui (ref), isShopPurchaseButton (ref), shouldSkipButton (ref)
    if a1 and a1:IsA("GuiButton") then
        if a1 ~= TextLabel and not a1:IsDescendantOf(TooltipGui) then
            if a1.Name == "StartTutorialBlocker" or a1:GetAttribute("NoHoverEffect") == true then
                return false
            end
            if not isShopPurchaseButton(a1) then
                return not shouldSkipButton(a1)
            end
            a1:SetAttribute("HoverNoRotate", true)
            return true
        end
        return false
    end
    return false
end

local function rebuildRoots() -- Line: 174 -- upvalues: u371 (ref), u355 (val), Main (ref), Main2 (ref)
    u371 = {}
    local Main_2 = u355:FindFirstChild("Main")
    local Main2_2 = u355:FindFirstChild("Main2")
    if Main_2 then
        table.insert(u371, Main_2)
    end
    if Main2_2 then
        table.insert(u371, Main2_2)
    end
    for i, v in ipairs(u371) do
        table.insert({}, v.Name)
    end
    Main = Main_2 or Main
    Main2 = Main2_2
end

local function getInstancePath(a1) -- Line: 189
    if not a1 then
        return "nil"
    end
    local v1 = {}
    local Parent = a1
    while Parent do
        table.insert(v1, 1, Parent.Name)
        Parent = Parent.Parent
    end
    return table.concat(v1, ">")
end

local function getAncestors(a1) -- Line: 200
    local v1 = {}
    local Parent = a1 and a1.Parent
    while Parent do
        table.insert(v1, Parent)
        Parent = Parent.Parent
    end
    return v1
end

local function prettifyButtonName(a1) -- Line: 210
    return ((a1:gsub("Button$", "")):gsub("(%l)(%u)", "%1 %2"):gsub("_", " "))
end

local function getTooltipOverride(a1) -- Line: 217
    for i, v in ipairs({(a1.Name or ""):lower(), ((a1:IsA("TextButton") and a1.Text or ""):lower())}) do
        if v:find("troll") then
            return "😂Troll", true
        end
        if not v:find("offline") and not v:find("away") then
            if not v:find("quest") then
                continue
            end
            return "???", true
        end
        return "Away Mode", true
    end
    return nil, false
end

local function isOfflineQuestsTrollButton(a1) -- Line: 238 -- upvalues: Main (ref)
    local Name
    local v1 = false
    local v2 = false
    local v3 = false
    local v4 = false
    local v5 = ipairs
    local v6 = {}
    local Parent = a1 and a1.Parent
    while Parent do
        table.insert(v6, Parent)
        Parent = Parent.Parent
    end
    for i, v in v5(v6) do
        Name = v.Name
        if Name == "Main2" then
            v1 = true
        end
        if Name == "Right" then
            v2 = true
        end
        if Name == "Tools" then
            v3 = true
        end
        if Name == "Offline" or Name == "Quests" or Name == "Troll" then
            v4 = true
        end
        if v == Main then
            break
        end
    end
    return v1 and v2 and v3 and v4
end

function shouldSkipButton(a1) -- Line: 256
    -- upvalues: u371 (ref), isOfflineQuestsTrollButton (val), Main (ref), Main2 (ref)
    local v1 = false
    for i, v in ipairs(u371) do
        if a1:IsDescendantOf(v) then
            v1 = true
            break
        end
    end
    if not v1 then
        return true
    end
    if isOfflineQuestsTrollButton(a1) then
        return false
    end
    local Bottom = Main:FindFirstChild("Bottom")
    if Bottom and a1:IsDescendantOf(Bottom) then
        return true
    end
    if Main2 and a1:IsDescendantOf(Main2) then
        local v2
        local v3 = ipairs
        local v4 = {}
        local Parent = a1 and a1.Parent
        while Parent do
            table.insert(v4, Parent)
            Parent = Parent.Parent
        end
        for i2, i3 in v3(v4) do
            if i3 == Main2 then
                break
            end
            v2 = i3.Name:lower()
            if v2:find("bottom") and v2:find("right") then
                return true
            end
        end
    end
    return false
end

local function shouldShowOnLeft(a1) -- Line: 294 -- upvalues: isOfflineQuestsTrollButton (val), Main (ref)
    if isOfflineQuestsTrollButton(a1) then
        return true
    end
    local v1 = ipairs
    local v2 = {}
    local Parent = a1 and a1.Parent
    while Parent do
        table.insert(v2, Parent)
        Parent = Parent.Parent
    end
    for i, v in v1(v2) do
        if v == Main then
            break
        end
        if v.Name == "Right" then
            return true
        end
    end
    return false
end

local function isRightToolsButton(a1) -- Line: 308 -- upvalues: Main2 (ref)
    local Right = Main2 and Main2:FindFirstChild("Right")
    local Tools = Right and Right:FindFirstChild("Tools")
    return Tools and a1:IsDescendantOf(Tools) or false
end

function isShopPurchaseButton(a1) -- Line: 314 -- upvalues: u355 (val)
    if a1 and a1:IsA("GuiButton") then
        local ShopGui = u355:FindFirstChild("ShopGui")
        if ShopGui and a1:IsDescendantOf(ShopGui) then
            local Name
            local Parent = a1
            while Parent do
                if Parent == ShopGui then
                    break
                end
                Name = Parent.Name
                if Name ~= "Row - Passes" and Name ~= "Row - Diamonds" and Name ~= "Row - DiamondBest" then
                    Parent = Parent.Parent
                    continue
                end
                return a1:IsA("ImageButton")
            end
            return false
        end
        return false
    end
    return false
end

local function updateTooltipPosition() -- Line: 335
    -- upvalues: u369 (ref), TouchEnabled (val), TextLabel (val), u190 (ref), UserInputService (val), u370 (ref)
    -- upvalues: shouldShowOnLeft (val), Main2 (ref)
    local v1
    if not u369 then
        return
    end
    local CurrentCamera = workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1080, 1920)
    if not TouchEnabled then
        TextLabel.AnchorPoint = Vector2.new(0, 0)
        local MouseLocation = UserInputService:GetMouseLocation()
        TextLabel.Position = UDim2.fromOffset(MouseLocation.X + ((u370 or shouldShowOnLeft(u369)) and -TextLabel.AbsoluteSize.X - 8 or 8), MouseLocation.Y + 5)
        return
    end
    TextLabel.AnchorPoint = Vector2.new(0, 0)
    local v2 = u190 or UserInputService:GetMouseLocation()
    local AbsoluteSize = TextLabel.AbsoluteSize
    local v3 = u370
    if not v3 then
        v3 = shouldShowOnLeft(u369)
        if not v3 then
            v1 = u369
            local Right = Main2 and Main2:FindFirstChild("Right")
            local Tools = Right and Right:FindFirstChild("Tools")
            v3 = Tools and v1:IsDescendantOf(Tools) or false
        end
    end
    v1 = v3 and -AbsoluteSize.X - 3 or 3
    v3 = -math.floor(AbsoluteSize.Y * 0.5)
    local v4 = v2.X + v1
    v1 = v2.Y + v3
    v3 = math.clamp(v4, 6, (math.max(6, ViewportSize.X - AbsoluteSize.X - 6)))
    v4 = math.clamp(v1, 6, (math.max(6, ViewportSize.Y - AbsoluteSize.Y - 6)))
    TextLabel.Position = UDim2.fromOffset(math.floor(v3), (math.floor(v4)))
end

local function isButtonStillVisible(a1) -- Line: 363 -- upvalues: u355 (val)
    if a1 and a1.Parent then
        local Parent = a1
        while Parent do
            if Parent:IsA("GuiObject") and not Parent.Visible then
                return false
            end
            if Parent:IsA("ScreenGui") and not Parent.Enabled then
                return false
            end
            Parent = Parent.Parent
        end
        return a1:IsDescendantOf(u355)
    end
    return false
end

local function showTooltip(a1) -- Line: 378
    -- upvalues: tweenHover (val), u369 (ref), u370 (ref), u190 (ref), TextLabel (val)
    tweenHover(a1, true)
    u369 = nil
    u370 = false
    u190 = nil
    TextLabel.Visible = false
end

local function hideTooltip(a1) -- Line: 408
    -- upvalues: tweenHover (val), u369 (ref), u370 (ref), u190 (ref), TextLabel (val)
    tweenHover(a1, false)
    if u369 ~= a1 then
        return
    end
    u369 = nil
    u370 = false
    u190 = nil
    TextLabel.Visible = false
end

local function showTouchTooltip(a1, a2) -- Line: 417 -- upvalues: TextLabel (val)
    TextLabel.Visible = false
end

local function bindButton(a1) -- Line: 434
    -- upvalues: shouldBindHoverEffect (val), TouchEnabled (val), tweenHover (val), u369 (ref), u370 (ref), u190 (ref)
    -- upvalues: TextLabel (val), u191 (ref), UserInputService (val)
    if not shouldBindHoverEffect(a1) or a1:GetAttribute("ButtonHoverEffectBoundV2") then
        return
    end
    a1:SetAttribute("ButtonHoverEffectBoundV2", true)
    if not TouchEnabled then
        a1.MouseEnter:Connect(function() -- Line: 442
            -- upvalues: a1 (val), tweenHover (upval), u369 (upval), u370 (upval), u190 (upval), TextLabel (upval)
            tweenHover(a1, true)
            u369 = nil
            u370 = false
            u190 = nil
            TextLabel.Visible = false
        end)
        a1.MouseLeave:Connect(function() -- Line: 446
            -- upvalues: a1 (val), tweenHover (upval), u369 (upval), u370 (upval), u190 (upval), TextLabel (upval)
            local v1 = a1
            tweenHover(v1, false)
            if u369 ~= v1 then
                return
            end
            u369 = nil
            u370 = false
            u190 = nil
            TextLabel.Visible = false
        end)
    end
    if TouchEnabled then
        a1.Activated:Connect(function() -- Line: 453
            -- upvalues: u191 (upval), a1 (val), UserInputService (upval), TextLabel (upval), tweenHover (upval)
            -- upvalues: u369 (upval), u370 (upval), u190 (upval)
            if 0.18 < os.clock() - u191 then
                UserInputService:GetMouseLocation()
                TextLabel.Visible = false
            end
            task.delay(1, function() -- Line: 457
                -- upvalues: a1 (upval), tweenHover (upval), u369 (upval), u370 (upval), u190 (upval), TextLabel (upval)
                local v1 = a1
                tweenHover(v1, false)
                if u369 ~= v1 then
                    return
                end
                u369 = nil
                u370 = false
                u190 = nil
                TextLabel.Visible = false
            end)
        end)
        a1.TouchTap:Connect(function(a1_2) -- Line: 462
            -- upvalues: u191 (upval), a1 (val), UserInputService (upval), TextLabel (upval), tweenHover (upval)
            -- upvalues: u369 (upval), u370 (upval), u190 (upval)
            if os.clock() - u191 <= 0.18 then
                return
            end
            local v1 = nil
            if type(a1_2) == "table" and a1_2[1] then
                v1 = a1_2[1]
            end
            if not v1 then
                UserInputService:GetMouseLocation()
            end
            TextLabel.Visible = false
            task.delay(1, function() -- Line: 471
                -- upvalues: a1 (upval), tweenHover (upval), u369 (upval), u370 (upval), u190 (upval), TextLabel (upval)
                local v1 = a1
                tweenHover(v1, false)
                if u369 ~= v1 then
                    return
                end
                u369 = nil
                u370 = false
                u190 = nil
                TextLabel.Visible = false
            end)
        end)
        a1.InputBegan:Connect(function(a1_2) -- Line: 476
            -- upvalues: a1 (val), TextLabel (upval), tweenHover (upval), u369 (upval), u370 (upval), u190 (upval)
            if a1_2.UserInputType == Enum.UserInputType.Touch then
                local Position = a1_2.Position
                TextLabel.Visible = false
                task.delay(1, function() -- Line: 479
                    -- upvalues: a1 (upval), tweenHover (upval), u369 (upval), u370 (upval), u190 (upval)
                    -- upvalues: TextLabel (upval)
                    local v1 = a1
                    tweenHover(v1, false)
                    if u369 ~= v1 then
                        return
                    end
                    u369 = nil
                    u370 = false
                    u190 = nil
                    TextLabel.Visible = false
                end)
            end
        end)
    end
end

rebuildRoots()
for i, v in ipairs(u371) do
    for i2, i3 in ipairs(v:GetDescendants()) do
        bindButton(i3)
    end
end
for i4, j in ipairs(u371) do
    j.DescendantAdded:Connect(function(a1) -- Line: 495 -- upvalues: bindButton (val)
        bindButton(a1)
    end)
end

local function bindShopPurchaseButtons(a1) -- Line: 500 -- upvalues: bindButton (val)
    if not a1 then
        return
    end
    for i, v in ipairs(a1:GetDescendants()) do
        bindButton(v)
    end
    a1.DescendantAdded:Connect(function(a1) -- Line: 505 -- upvalues: bindButton (upval)
        bindButton(a1)
    end)
end

bindShopPurchaseButtons(u355:FindFirstChild("ShopGui"))
u355.ChildAdded:Connect(function(a1) -- Line: 512 -- upvalues: rebuildRoots (val), bindButton (val), bindShopPurchaseButtons (val)
    if a1.Name == "Main" then
        rebuildRoots()
        for i, v in ipairs(a1:GetDescendants()) do
            bindButton(v)
        end
        a1.DescendantAdded:Connect(function(a1) -- Line: 518 -- upvalues: bindButton (upval)
            bindButton(a1)
        end)
    elseif a1.Name == "Main2" then
        rebuildRoots()
        for i2, i3 in ipairs(a1:GetDescendants()) do
            bindButton(i3)
        end
        a1.DescendantAdded:Connect(function(a1) -- Line: 518 -- upvalues: bindButton (upval)
            bindButton(a1)
        end)
    end
    if a1.Name == "ShopGui" then
        bindShopPurchaseButtons(a1)
    end
end)
RunService.RenderStepped:Connect(function() -- Line: 527
    -- upvalues: u368 (val), isButtonStillVisible (val), TextLabel (val), u369 (ref), u370 (ref)
    -- upvalues: updateTooltipPosition (val)
    for k, v in pairs(u368) do
        if not k.Parent or not v.target.Parent then
            u368[k] = nil
        elseif v.isHovering and not isButtonStillVisible(k) then
            v.isHovering = false
            if v.scaleTween then
                v.scaleTween:Cancel()
            end
            if v.rotationTween then
                v.rotationTween:Cancel()
            end
            v.scale.Scale = 1
            v.target.Rotation = v.rotation or 0
        end
    end
    if TextLabel.Visible then
        if not isButtonStillVisible(u369) then
            u369 = nil
            u370 = false
            TextLabel.Visible = false
            return
        end
        updateTooltipPosition()
    end
end)