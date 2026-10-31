-- Path: Players.Drrrrrrrrragonball.PlayerScripts.DailyRewardsClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.DailyRewardsClient
-- Decompile time: 11.97 ms

local v1
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local LocalPlayer = Players.LocalPlayer
local v2 = LocalPlayer:WaitForChild("PlayerGui")
local DailyGui = v2:WaitForChild("DailyGui")
local DailyFrame = DailyGui:WaitForChild("DailyFrame")
local Items = (DailyFrame:WaitForChild("ItemsFrame")):WaitForChild("Items")
local TextLabel = (Items:WaitForChild("Countdown")):WaitForChild("TextLabel")
local Gradients = ReplicatedStorage:WaitForChild("Gradients")
local u139 = Gradients:WaitForChild("green gradient")
local u136 = Gradients:WaitForChild("red gradient")
local u295 = ReplicatedStorage:WaitForChild("DailyRewardsGetState")
local DailyRewardsClaim = ReplicatedStorage:WaitForChild("DailyRewardsClaim")
local DailyRewardsUpdate = ReplicatedStorage:WaitForChild("DailyRewardsUpdate")
local u154 = DailyFrame:WaitForChild("RewardPopup")
local Message = u154:WaitForChild("Message")
local PopupScale = u154:WaitForChild("PopupScale")
local u88 = {}
for i = 1, 7 do
    v1 = (Items:WaitForChild(if i > 3 then if i > 6 then "Row3" else "Row2" else "Row1")):WaitForChild("Day" .. i)
    u88[i] = (v1:WaitForChild("Close"))
end
local u126 = nil
local u127 = false
local u128 = 0
local u129 = 0

local function secondsRemaining() -- Line: 39 -- upvalues: u126 (ref)
    if u126 and u126.nextClaimAt and not (u126.nextClaimAt <= 0) then
        return (math.max(0, u126.nextClaimAt - (os.time())))
    end
    return 0
end

local function formatCountdown(a1) -- Line: 46
    local v1 = math.max(0, (math.floor(a1)))
    return string.format("Next reward available in: %02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), v1 % 60)
end

local function useGradient(a1, a2) -- Line: 54
    for i, v in ipairs(a1:GetChildren()) do
        if v:IsA("UIGradient") then
            v:Destroy()
        end
    end
    a2:Clone().Parent = a1
end

local function setButtonVisual(a1, a2) -- Line: 63 -- upvalues: useGradient (val), u136 (val), u139 (val)
    local v1
    local TextLabel = a1:FindFirstChild("TextLabel")
    if TextLabel then
        TextLabel.Text = a2
    end
    a1.Active = a2 == "CLAIM"
    a1.Interactable = v1
    a1.AutoButtonColor = v1
    useGradient(a1, not (a2 ~= "LOCKED") and u136 or u139)
end

local function getDayVisual(a1) -- Line: 76 -- upvalues: u126 (ref)
    if not u126 then
        return "LOCKED"
    end
    local v1 = (if not u126 or not u126.nextClaimAt then 0 else if not (u126.nextClaimAt <= 0) then math.max(0, u126.nextClaimAt - (os.time())) else 0) > 0
    if u126.currentDay == 1 and u126.lastClaimedDay == 7 then
        if a1 == 7 then
            return "CLAIMED"
        end
        if a1 ~= 1 or v1 then
            return "LOCKED"
        end
        return "CLAIM"
    end
    if a1 < u126.currentDay then
        return "CLAIMED"
    end
    if a1 ~= u126.currentDay or v1 then
        return "LOCKED"
    end
    return "CLAIM"
end

local function refreshUI() -- Line: 94
    -- upvalues: TextLabel (val), u126 (ref), u88 (val), useGradient (val), u136 (val), u139 (val)
    local TextLabel_2, v1, v2, v3
    local v4 = math.max(
        0,
        (math.floor(if not u126 or not u126.nextClaimAt then 0 else if not (u126.nextClaimAt <= 0) then math.max(0, u126.nextClaimAt - (os.time())) else 0))
    )
    TextLabel.Text = string.format("Next reward available in: %02d:%02d:%02d", math.floor(v4 / 3600), math.floor(v4 % 3600 / 60), v4 % 60)
    for k, v in pairs(u88) do
        if u126 then
            v2 = (if not u126 or not u126.nextClaimAt then 0 else if not (u126.nextClaimAt <= 0) then math.max(0, u126.nextClaimAt - (os.time())) else 0) > 0
            v1 = if u126.currentDay ~= 1 then if not (k < u126.currentDay) then if k ~= u126.currentDay then "LOCKED" else if not v2 then "CLAIM" else "LOCKED" else "CLAIMED" else if u126.lastClaimedDay ~= 7 then if not (k < u126.currentDay) then if k ~= u126.currentDay then "LOCKED" else if not v2 then "CLAIM" else "LOCKED" else "CLAIMED" else if k ~= 7 then if k ~= 1 then "LOCKED" else if not v2 then "CLAIM" else "LOCKED" else "CLAIMED"
        else
            v1 = "LOCKED"
        end
        TextLabel_2 = v:FindFirstChild("TextLabel")
        if TextLabel_2 then
            TextLabel_2.Text = v1
        end
        v2 = v1 == "CLAIM"
        v.Active = v2
        v.Interactable = v2
        v.AutoButtonColor = v2
        v3 = not (v1 ~= "LOCKED") and u136 or u139
        useGradient(v, v3)
    end
end

local function showTemporaryMessage(a1) -- Line: 108 -- upvalues: u129 (ref), TextLabel (val), refreshUI (val)
    u129 = u129 + 1
    local u3 = u129
    TextLabel.Text = tostring(a1)
    task.delay(2.5, function() -- Line: 112 -- upvalues: u3 (val), u129 (upval), refreshUI (upval)
        if u3 == u129 then
            refreshUI()
        end
    end)
end

local function showCouponPopup(a1) -- Line: 119
    -- upvalues: u128 (ref), Message (val), u154 (val), PopupScale (val), TweenService (val)
    u128 = u128 + 1
    local u3 = u128
    Message.Text = string.format("You received a %d Robux coupon!\nIt was added to your BAG.", a1)
    u154.Visible = true
    PopupScale.Scale = 0
    TweenService:Create(PopupScale, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    task.delay(4, function() -- Line: 135 -- upvalues: u3 (val), u128 (upval), u154 (upval), TweenService (upval), PopupScale (upval)
        if u3 == u128 and u154.Parent then
            local v1 = TweenService:Create(PopupScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Scale = 0})
            v1:Play()
            v1.Completed:Wait()
            if u3 == u128 then
                u154.Visible = false
            end
            return
        end
    end)
end

local u172 = v2:WaitForChild("Main"):WaitForChild("Top")
local DailyRewardEffectsLayer = DailyGui:FindFirstChild("DailyRewardEffectsLayer")
if not DailyRewardEffectsLayer then
    DailyRewardEffectsLayer = Instance.new("Frame")
    DailyRewardEffectsLayer.Name = "DailyRewardEffectsLayer"
    DailyRewardEffectsLayer.Size = UDim2.fromScale(1, 1)
    DailyRewardEffectsLayer.BackgroundTransparency = 1
    DailyRewardEffectsLayer.ClipsDescendants = false
    DailyRewardEffectsLayer.ZIndex = 500
    DailyRewardEffectsLayer.Parent = DailyGui
end
local u192 = 0
local u193 = {}
local v3 = Color3.fromRGB(255, 76, 107)
local v4 = Color3.fromRGB(255, 221, 69)
local v5 = Color3.fromRGB(64, 224, 111)
local v6 = Color3.fromRGB(55, 196, 255)
u193[1] = v3
u193[2] = v4
u193[3] = v5
u193[4] = v6
u193[5] = Color3.fromRGB(210, 102, 255)

local function screenShake() -- Line: 173 -- upvalues: u192 (ref), LocalPlayer (val), DailyFrame (val)
    local CameraOffset
    u192 = u192 + 1
    local u2 = u192
    local Character = LocalPlayer.Character
    local Humanoid = Character
    if Humanoid then
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
    end
    if not Humanoid then
        CameraOffset = Vector3.new(0, 0, 0)
    else
        CameraOffset = Humanoid.CameraOffset
        if not CameraOffset then
            CameraOffset = Vector3.new(0, 0, 0)
        end
    end
    local Position = DailyFrame.Position
    task.spawn(function() -- Line: 180
        -- upvalues: u2 (val), u192 (upval), DailyFrame (upval), Position (val), Humanoid (val), CameraOffset (val)
        local v1
        local v2 = os.clock() + 0.42
        while u2 == u192 do
            if not (os.clock() < v2) then
                break
            end
            v1 = math.max(0, (v2 - (os.clock())) / 0.42)
            DailyFrame.Position = Position + UDim2.fromOffset(math.random(-10, 10) * v1, math.random(-8, 8) * v1)
            if Humanoid then
                Humanoid.CameraOffset = CameraOffset + Vector3.new(math.random(-8, 8) / 55 * v1, math.random(-6, 6) / 55 * v1, 0)
            end
            task.wait(0.025)
        end
        DailyFrame.Position = Position
        if Humanoid then
            Humanoid.CameraOffset = CameraOffset
        end
    end)
end

local function burstConfetti(a1) -- Line: 202
    -- upvalues: u193 (val), DailyRewardEffectsLayer (ref), TweenService (val), Debris (val)
    local Frame, UICorner, v1
    local ViewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    for i = 1, 52 do
        Frame = Instance.new("Frame")
        Frame.Name = "Confetti"
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.Size = UDim2.fromOffset(math.random(7, 15), math.random(12, 25))
        Frame.Position = UDim2.fromOffset(a1.X + math.random(-55, 55), a1.Y + math.random(-35, 35))
        Frame.BackgroundColor3 = u193[math.random(1, #u193)]
        Frame.BorderSizePixel = 0
        Frame.Rotation = math.random(-180, 180)
        Frame.ZIndex = 510
        Frame.Parent = DailyRewardEffectsLayer
        UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = Frame
        v1 = UDim2.fromOffset(math.clamp(a1.X + math.random(-420, 420), 0, ViewportSize.X), ViewportSize.Y + math.random(30, 180))
        TweenService:Create(Frame, TweenInfo.new(math.random(85, 155) / 100, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.15,
            Position = v1,
            Rotation = Frame.Rotation + math.random(-540, 540),
        }):Play()
        Debris:AddItem(Frame, 1.8)
    end
end

local function findRewardIcon(a1) -- Line: 232 -- upvalues: u88 (val)
    local v1 = u88[a1]
    local Parent = v1 and v1.Parent
    if Parent then
        for i, v in ipairs(Parent:GetDescendants()) do
            if v:IsA("ImageLabel") and v.Name == "Icon" and v.Image ~= "" then
                return v
            end
        end
    end
    return nil
end

local function animateCurrencyToTop(a1, a2) -- Line: 245
    -- upvalues: u172 (val), u88 (val), findRewardIcon (val), DailyRewardEffectsLayer (ref), TweenService (val)
    local v1 = u172:FindFirstChild(a2)
    local Icon = v1 and v1:FindFirstChild("Icon")
    local v2 = u88[a1]
    if Icon and v2 then
        local v3
        local v4 = findRewardIcon(a1) or Icon
        local u23 = v2.AbsolutePosition + v2.AbsoluteSize / 2
        local u27 = Icon.AbsolutePosition + Icon.AbsoluteSize / 2
        for i = 1, 30 do
            local u36 = Instance.new("ImageLabel")
            u36.Name = "DailyRewardFly"
            u36.BackgroundTransparency = 1
            u36.Image = v4.Image
            u36.ScaleType = Enum.ScaleType.Fit
            u36.AnchorPoint = Vector2.new(0.5, 0.5)
            v3 = math.random(24, 42)
            u36.Size = UDim2.fromOffset(v3, v3)
            u36.Position = UDim2.fromOffset(u23.X + math.random(-120, 120), -math.random(20, 180))
            u36.Rotation = math.random(-40, 40)
            u36.ZIndex = 520
            u36.Parent = DailyRewardEffectsLayer
            task.delay(math.random(0, 28) / 100, function() -- Line: 267 -- upvalues: u36 (val), TweenService (upval), u23 (val), u27 (val)
                if not u36.Parent then
                    return
                end
                local v1 = TweenService:Create(u36, TweenInfo.new(math.random(30, 48) / 100, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Position = UDim2.fromOffset(u23.X + math.random(-100, 100), u23.Y + math.random(-75, 75)),
                    Rotation = math.random(-150, 150),
                })
                v1:Play()
                v1.Completed:Connect(function() -- Line: 275 -- upvalues: u36 (upval), TweenService (upval), u27 (upval)
                    if not u36.Parent then
                        return
                    end
                    local v1 = TweenService:Create(u36, TweenInfo.new(math.random(52, 78) / 100, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        ImageTransparency = 0.1,
                        Position = UDim2.fromOffset(u27.X, u27.Y),
                        Size = UDim2.fromOffset(12, 12),
                        Rotation = math.random(180, 420),
                    })
                    v1:Play()
                    v1.Completed:Connect(function() -- Line: 283 -- upvalues: u36 (upval)
                        if u36.Parent then
                            u36:Destroy()
                        end
                    end)
                end)
            end)
        end
        local u95 = v1:FindFirstChildOfClass("UIScale")
        if u95 then
            task.delay(1, function() -- Line: 292 -- upvalues: TweenService (upval), u95 (val)
                TweenService:Create(u95, TweenInfo.new(0.12, Enum.EasingStyle.Back), {Scale = 1.14}):Play()
                task.delay(0.14, function() -- Line: 294 -- upvalues: TweenService (upval), u95 (upval)
                    TweenService:Create(u95, TweenInfo.new(0.16, Enum.EasingStyle.Back), {Scale = 1}):Play()
                end)
            end)
        end
        return
    end
end

local function playClaimEffects(a1) -- Line: 301
    -- upvalues: u88 (val), DailyRewardEffectsLayer (ref), u192 (ref), LocalPlayer (val), DailyFrame (val)
    -- upvalues: burstConfetti (val), animateCurrencyToTop (val)
    local CameraOffset
    local v1 = u88[a1]
    local v2 = v1 and v1.AbsolutePosition + v1.AbsoluteSize / 2 or Vector2.new(DailyRewardEffectsLayer.AbsoluteSize.X / 2, DailyRewardEffectsLayer.AbsoluteSize.Y / 2)
    u192 = u192 + 1
    local u19 = u192
    local Character = LocalPlayer.Character
    local Humanoid = Character
    if Humanoid then
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
    end
    if not Humanoid then
        CameraOffset = Vector3.new(0, 0, 0)
    else
        CameraOffset = Humanoid.CameraOffset
        if not CameraOffset then
            CameraOffset = Vector3.new(0, 0, 0)
        end
    end
    local Position = DailyFrame.Position
    task.spawn(function() -- Line: 180
        -- upvalues: u19 (val), u192 (upval), DailyFrame (upval), Position (val), Humanoid (val), CameraOffset (val)
        local v1
        local v2 = os.clock() + 0.42
        while u19 == u192 do
            if not (os.clock() < v2) then
                break
            end
            v1 = math.max(0, (v2 - (os.clock())) / 0.42)
            DailyFrame.Position = Position + UDim2.fromOffset(math.random(-10, 10) * v1, math.random(-8, 8) * v1)
            if Humanoid then
                Humanoid.CameraOffset = CameraOffset + Vector3.new(math.random(-8, 8) / 55 * v1, math.random(-6, 6) / 55 * v1, 0)
            end
            task.wait(0.025)
        end
        DailyFrame.Position = Position
        if Humanoid then
            Humanoid.CameraOffset = CameraOffset
        end
    end)
    burstConfetti(v2)
    if a1 ~= 1 and a1 ~= 3 and a1 ~= 5 then
        if a1 == 2 or a1 == 4 or a1 == 6 then
            animateCurrencyToTop(a1, "Credits")
        end
        return
    end
    animateCurrencyToTop(a1, "Pops")
end

local function claimDay(a1) -- Line: 314
    -- upvalues: u127 (ref), u126 (ref), DailyRewardsClaim (val), refreshUI (val), playClaimEffects (val)
    -- upvalues: showCouponPopup (val), u129 (ref), TextLabel (val)
    if not u127 then
        local v1
        if u126 then
            local v2 = (if not u126 or not u126.nextClaimAt then 0 else if not (u126.nextClaimAt <= 0) then math.max(0, u126.nextClaimAt - (os.time())) else 0) > 0
            v1 = if u126.currentDay ~= 1 then if not (a1 < u126.currentDay) then if a1 ~= u126.currentDay then "LOCKED" else if not v2 then "CLAIM" else "LOCKED" else "CLAIMED" else if u126.lastClaimedDay ~= 7 then if not (a1 < u126.currentDay) then if a1 ~= u126.currentDay then "LOCKED" else if not v2 then "CLAIM" else "LOCKED" else "CLAIMED" else if a1 ~= 7 then if a1 ~= 1 then "LOCKED" else if not v2 then "CLAIM" else "LOCKED" else "CLAIMED"
        else
            v1 = "LOCKED"
        end
        if v1 == "CLAIM" then
            u127 = true
            local success, err = pcall(function() -- Line: 317 -- upvalues: DailyRewardsClaim (upval), a1 (val)
                return DailyRewardsClaim:InvokeServer(a1)
            end)
            if not success or type(err) ~= "table" then
                u129 = u129 + 1
                local u100 = u129
                TextLabel.Text = tostring("Could not contact the reward server.")
                task.delay(2.5, function() -- Line: 112 -- upvalues: u100 (val), u129 (upval), refreshUI (upval)
                    if u100 == u129 then
                        refreshUI()
                    end
                end)
                warn("[DailyRewards] Claim request failed:", err)
            else
                if err.state then
                    local state = err.state
                    if type(state) == "table"
                        and type(state.currentDay) == "number"
                        and type(state.nextClaimAt) == "number" then
                        u126 = state
                        refreshUI()
                    end
                end
                if not err.ok then
                    local v3 = err.error or "Claim failed. Please try again."
                    u129 = u129 + 1
                    local u89 = u129
                    TextLabel.Text = tostring(v3)
                    task.delay(2.5, function() -- Line: 112 -- upvalues: u89 (val), u129 (upval), refreshUI (upval)
                        if u89 == u129 then
                            refreshUI()
                        end
                    end)
                else
                    task.spawn(playClaimEffects, tonumber(err.claimedDay) or a1)
                    if err.claimedDay == 7 and type(err.couponAmount) == "number" then
                        showCouponPopup(err.couponAmount)
                    end
                end
            end
            u127 = false
            return
        end
    end
end

for k, v in pairs(u88) do
    v.Activated:Connect(function() -- Line: 343 -- upvalues: claimDay (val), k (val)
        claimDay(k)
    end)
end
DailyRewardsUpdate.OnClientEvent:Connect(function(a1) -- Line: 101 -- upvalues: u126 (ref), refreshUI (val)
    if type(a1) ~= "table" then
        return
    end
    if type(a1.currentDay) == "number" and type(a1.nextClaimAt) == "number" then
        u126 = a1
        refreshUI()
        return
    end
end)
u154.Visible = false
refreshUI()
task.spawn(function() -- Line: 352 -- upvalues: u295 (val), u126 (ref), refreshUI (val), u129 (ref), TextLabel (val)
    local success, err = pcall(function() -- Line: 353 -- upvalues: u295 (upval)
        return u295:InvokeServer()
    end)
    if success and type(err) == "table" and err.ok then
        local state = err.state
        if type(state) ~= "table" or type(state.currentDay) ~= "number" or type(state.nextClaimAt) ~= "number" then
            return
        end
        u126 = state
        refreshUI()
        return
    end
    local error = success and err.error or "Daily reward data could not be loaded."
    u129 = u129 + 1
    local u26 = u129
    TextLabel.Text = tostring(error)
    task.delay(2.5, function() -- Line: 112 -- upvalues: u26 (val), u129 (upval), refreshUI (upval)
        if u26 == u129 then
            refreshUI()
        end
    end)
end)
task.spawn(function() -- Line: 365 -- upvalues: refreshUI (val)
    while true do
        refreshUI()
        task.wait(1)
    end
end)