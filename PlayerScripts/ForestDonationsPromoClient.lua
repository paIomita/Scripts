-- Path: Players.Drrrrrrrrragonball.PlayerScripts.ForestDonationsPromoClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.ForestDonationsPromoClient
-- Decompile time: 6.53 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local v1 = LocalPlayer:WaitForChild("PlayerGui")
local ForestDonationsPromoEvent = ReplicatedStorage:WaitForChild("ForestDonationsPromoEvent")
local u676 = require((v1:WaitForChild("TopbarPlus")):WaitForChild("Icon"))
local u689 = Vector2.new(620, 500)
local u691 = utf8.char(57346)
local ForestDonationPromoGui = v1:FindFirstChild("ForestDonationPromoGui")
if ForestDonationPromoGui then
    ForestDonationPromoGui:Destroy()
end

local function make(a1, a2, a3) -- Line: 24
    local v1 = Instance.new(a1)
    local v2 = pairs
    for k, v in v2(a3 or {}) do
        v1[k] = v
    end
    v1.Parent = a2
    return v1
end

local u694 = make("TextButton", make("ScreenGui", v1, {
    Name = "ForestDonationPromoGui",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    DisplayOrder = 80,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}), {
    Name = "Dim",
    BackgroundTransparency = 0.38,
    BorderSizePixel = 0,
    Text = "",
    AutoButtonColor = false,
    Active = true,
    Modal = true,
    Visible = false,
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.new(0, 0, 0),
})
local u693 = v1:WaitForChild("ShopGui"):WaitForChild("ConfirmationFrame"):Clone()
u693.Name = "ForestDonationPromoFrame"
u693.Parent = u694
u693.AnchorPoint = Vector2.new(0.5, 0.5)
u693.Position = UDim2.fromScale(0.5, 0.5)
u693.Size = UDim2.fromOffset(u689.X, u689.Y)
u693.Visible = true
for i, v in ipairs(u693:GetChildren()) do
    if v:IsA("UIAspectRatioConstraint") or v:IsA("UISizeConstraint") then
        v:Destroy()
    end
end
local u142 = make("UIScale", u693, {Name = "ForestDonationPromoScale", Scale = 1})
local Top = u693:WaitForChild("Top")
Top.Size = UDim2.new(1, 0, 0, 76)
local Title = Top:WaitForChild("Title")
Title.Text = "FOREST DONATIONS"
local Close = u693:WaitForChild("Close")
Close.Visible = true
local Contents = u693:WaitForChild("Contents")
Contents.AnchorPoint = Vector2.new(0, 0)
Contents.Position = UDim2.fromOffset(0, 76)
Contents.Size = UDim2.new(1, 0, 1, -76)
local Yes = Contents:WaitForChild("Yes")
local No = Contents:WaitForChild("No")
for i2, i3 in ipairs(Contents:GetChildren()) do
    if i3 ~= Yes and i3 ~= No and not i3:IsA("UICorner") then
        i3:Destroy()
    end
end
Yes.AnchorPoint = Vector2.new(0.5, 0.5)
Yes.Position = UDim2.new(0.27, 0, 1, -42)
Yes.Size = UDim2.fromOffset(262, 66)
Yes.Visible = true
No.AnchorPoint = Vector2.new(0.5, 0.5)
No.Position = UDim2.new(0.73, 0, 1, -42)
No.Size = UDim2.fromOffset(262, 66)
No.Visible = true

local function setButtonText(a1, a2) -- Line: 104
    local TextLabel = a1:FindFirstChild("TextLabel")
    if TextLabel and TextLabel:IsA("TextLabel") then
        TextLabel.Text = a2
    end
end

local TextLabel = Yes:FindFirstChild("TextLabel")
if TextLabel and TextLabel:IsA("TextLabel") then
    TextLabel.Text = "YES"
end
local TextLabel_2 = No:FindFirstChild("TextLabel")
if TextLabel_2 and TextLabel_2:IsA("TextLabel") then
    TextLabel_2.Text = "No + Hide"
end
No.TextLabel.TextWrapped = false
No.TextLabel.TextScaled = false
No.TextLabel.TextSize = 32
local v2 = make("Frame", Contents, {
    Name = "ThumbnailHolder",
    BorderSizePixel = 0,
    ZIndex = 4,
    Position = UDim2.fromOffset(28, 28),
    Size = UDim2.fromOffset(248, 248),
    BackgroundColor3 = Color3.fromRGB(220, 250, 229),
})
make("UICorner", v2, {CornerRadius = UDim.new(0, 18)})
make("UIStroke", v2, {
    Thickness = 3,
    Color = Color3.fromRGB(38, 46, 59),
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
})
make("UICorner", make("ImageLabel", v2, {
    Name = "Thumbnail",
    BackgroundTransparency = 1,
    Image = "rbxassetid://123249093076952",
    ZIndex = 5,
    Position = UDim2.fromOffset(7, 7),
    Size = UDim2.new(1, -14, 1, -14),
    ScaleType = Enum.ScaleType.Crop,
}), {CornerRadius = UDim.new(0, 13)})
local v3 = make("TextLabel", Contents, {
    Name = "ThumbnailCaption",
    BackgroundTransparency = 1,
    Text = "A NEW WAY\nTO DONATE!",
    TextScaled = true,
    TextWrapped = true,
    ZIndex = 4,
    Position = UDim2.fromOffset(28, 278),
    Size = UDim2.fromOffset(248, 64),
    Font = Enum.Font.FredokaOne,
    TextColor3 = Color3.fromRGB(30, 168, 93),
})
v3.TextWrapped = true
v3.TextScaled = false
v3.TextSize = 24
make("UIStroke", v3, {
    Thickness = 1.5,
    Color = Color3.fromRGB(13, 72, 47),
    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
})
make("UITextSizeConstraint", make("TextLabel", Contents, {
    Name = "Description",
    BackgroundTransparency = 1,
    Text = "Donate Robux to other players, claim your own booth, receive gifts, and climb global leaderboards!",
    TextScaled = true,
    TextWrapped = true,
    ZIndex = 4,
    Position = UDim2.fromOffset(296, 56),
    Size = UDim2.fromOffset(296, 170),
    Font = Enum.Font.FredokaOne,
    TextColor3 = Color3.fromRGB(38, 46, 59),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Center,
}), {MinTextSize = 14, MaxTextSize = 23})
make("UITextSizeConstraint", make("TextLabel", Contents, {
    Name = "Question",
    BackgroundTransparency = 1,
    Text = "Do you want to join?",
    TextScaled = true,
    TextWrapped = true,
    ZIndex = 4,
    Position = UDim2.fromOffset(292, 258),
    Size = UDim2.fromOffset(304, 48),
    Font = Enum.Font.FredokaOne,
    TextColor3 = Color3.fromRGB(38, 46, 59),
}), {MinTextSize = 16, MaxTextSize = 26})

local function addButtonMotion(a1) -- Line: 193 -- upvalues: make (val), TweenService (val)
    local ButtonUIScale = a1:FindFirstChild("ButtonUIScale")
    if not ButtonUIScale then
        ButtonUIScale = make("UIScale", a1, {Name = "ButtonUIScale", Scale = 1})
    end
    a1.MouseEnter:Connect(function() -- Line: 198 -- upvalues: TweenService (upval), ButtonUIScale (ref)
        TweenService:Create(ButtonUIScale, TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.035}):Play()
    end)
    a1.MouseLeave:Connect(function() -- Line: 201 -- upvalues: TweenService (upval), ButtonUIScale (ref)
        TweenService:Create(ButtonUIScale, TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    a1.MouseButton1Down:Connect(function() -- Line: 204 -- upvalues: TweenService (upval), ButtonUIScale (ref)
        TweenService:Create(ButtonUIScale, TweenInfo.new(0.08), {Scale = 0.96}):Play()
    end)
    a1.MouseButton1Up:Connect(function() -- Line: 207 -- upvalues: TweenService (upval), ButtonUIScale (ref)
        TweenService:Create(ButtonUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.035}):Play()
    end)
end

addButtonMotion(Yes)
addButtonMotion(No)
addButtonMotion(Close)
local u432 = 1
local u433 = false
local u434 = false
local u435 = false
local u436 = nil

local function updateResponsiveScale() -- Line: 221
    -- upvalues: Workspace (val), u432 (ref), u689 (val), u433 (ref), u434 (ref), u142 (val)
    local CurrentCamera = Workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    u432 = math.clamp(math.min((ViewportSize.X - 30) / u689.X, (ViewportSize.Y - 80) / u689.Y), 0.56, 1.08)
    if u433 and not u434 then
        u142.Scale = u432
    end
end

local CurrentCamera = Workspace.CurrentCamera
local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
u432 = math.clamp(math.min((ViewportSize.X - 30) / u689.X, (ViewportSize.Y - 80) / u689.Y), 0.56, 1.08)
if u433 and not u434 then
    u142.Scale = u432
end
if Workspace.CurrentCamera then
    (Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateResponsiveScale)
end
;(Workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 233
    -- upvalues: Workspace (val), u432 (ref), u689 (val), u433 (ref), u434 (ref), u142 (val)
    -- upvalues: updateResponsiveScale (val)
    local CurrentCamera = Workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    u432 = math.clamp(math.min((ViewportSize.X - 30) / u689.X, (ViewportSize.Y - 80) / u689.Y), 0.56, 1.08)
    if u433 and not u434 then
        u142.Scale = u432
    end
    if Workspace.CurrentCamera then
        (Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateResponsiveScale)
    end
end)

local function setBlur(a1) -- Line: 240 -- upvalues: Lighting (val), make (val), TweenService (val)
    local ForestDonationPromoBlur = Lighting:FindFirstChild("ForestDonationPromoBlur")
    if a1 then
        if not ForestDonationPromoBlur then
            ForestDonationPromoBlur = make("BlurEffect", Lighting, {Name = "ForestDonationPromoBlur", Size = 0})
        end
        TweenService:Create(ForestDonationPromoBlur, TweenInfo.new(0.14, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
    elseif ForestDonationPromoBlur then
        local v1 = TweenService
        local v2 = TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        v1 = v1:Create(ForestDonationPromoBlur, v2, {Size = 0})
        v1:Play()
        v1.Completed:Connect(function() -- Line: 250 -- upvalues: ForestDonationPromoBlur (ref)
            if ForestDonationPromoBlur
                and ForestDonationPromoBlur.Parent
                and ForestDonationPromoBlur.Size <= 0.01 then
                ForestDonationPromoBlur:Destroy()
            end
        end)
    end
end

local function showPromo() -- Line: 256
    -- upvalues: u433 (ref), u434 (ref), LocalPlayer (val), u435 (ref), Yes (val), u694 (val), u693 (val), u142 (val)
    -- upvalues: setBlur (val), TweenService (val), u432 (ref)
    if not u433 and not u434 and not LocalPlayer:GetAttribute("ForestDonationsPromoHiddenThisSession") then
        u433 = true
        u434 = true
        u435 = false
        local TextLabel = Yes:FindFirstChild("TextLabel")
        if TextLabel and TextLabel:IsA("TextLabel") then
            TextLabel.Text = "YES"
        end
        Yes.Active = true
        u694.Visible = true
        u693.Position = UDim2.new(0.5, 0, 0.5, 18)
        u142.Scale = 0
        setBlur(true)
        local v1 = TweenService:Create(u142, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = u432})
        local v2 = TweenService:Create(
            u693,
            TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {Position = UDim2.fromScale(0.5, 0.5)}
        )
        v1:Play()
        v2:Play()
        v1.Completed:Connect(function() -- Line: 271 -- upvalues: u433 (upval), u434 (upval)
            if u433 then
                u434 = false
            end
        end)
        return
    end
end

local function hidePromo() -- Line: 276
    -- upvalues: u433 (ref), u434 (ref), TweenService (val), u142 (val), u693 (val), u694 (val), u432 (ref)
    -- upvalues: setBlur (val)
    if u433 and not u434 then
        u434 = true
        local v1 = TweenService:Create(u142, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Scale = 0})
        local v2 = TweenService:Create(
            u693,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Position = UDim2.new(0.5, 0, 0.5, 18)}
        )
        v1:Play()
        v2:Play()
        v1.Completed:Connect(function() -- Line: 283
            -- upvalues: u694 (upval), u693 (upval), u142 (upval), u432 (upval), u433 (upval), u434 (upval)
            -- upvalues: setBlur (upval)
            u694.Visible = false
            u693.Position = UDim2.fromScale(0.5, 0.5)
            u142.Scale = u432
            u433 = false
            u434 = false
            setBlur(false)
        end)
        return
    end
end

Close.Activated:Connect(hidePromo)
No.Activated:Connect(function() -- Line: 294 -- upvalues: u433 (ref), u434 (ref), LocalPlayer (val), u436 (ref), hidePromo (val)
    if u433 and not u434 then
        LocalPlayer:SetAttribute("ForestDonationsPromoHiddenThisSession", true)
        if u436 then
            u436:setEnabled(false)
        end
        hidePromo()
        return
    end
end)
Yes.Activated:Connect(function() -- Line: 301 -- upvalues: u435 (ref), Yes (val), ForestDonationsPromoEvent (val), LocalPlayer (val)
    if u435 then
        return
    end
    u435 = true
    Yes.Active = false
    local TextLabel = Yes:FindFirstChild("TextLabel")
    if TextLabel and TextLabel:IsA("TextLabel") then
        TextLabel.Text = "JOINING..."
    end
    ForestDonationsPromoEvent:FireServer("Teleport")
    task.delay(8, function() -- Line: 307 -- upvalues: u435 (upval), LocalPlayer (upval), Yes (upval)
        if u435 and LocalPlayer.Parent then
            u435 = false
            Yes.Active = true
            local TextLabel = Yes:FindFirstChild("TextLabel")
            if TextLabel and TextLabel:IsA("TextLabel") then
                TextLabel.Text = "YES"
            end
        end
    end)
end)
ForestDonationsPromoEvent.OnClientEvent:Connect(function(a1) -- Line: 316 -- upvalues: u435 (ref), Yes (val)
    if a1 == "TeleportFailed" then
        u435 = false
        Yes.Active = true
        local TextLabel = Yes:FindFirstChild("TextLabel")
        if TextLabel and TextLabel:IsA("TextLabel") then
            TextLabel.Text = "TRY AGAIN"
        end
    end
end)
UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 324 -- upvalues: u433 (ref), hidePromo (val)
    if not a2 and a1.KeyCode == Enum.KeyCode.Escape and u433 then
        hidePromo()
    end
end)

local function createTopbarButton() -- Line: 330
    -- upvalues: u436 (ref), LocalPlayer (val), u676 (val), u691 (val), showPromo (val)
    if not u436 and not LocalPlayer:GetAttribute("ForestDonationsPromoHiddenThisSession") then
        u436 = (((u676.new()):setLabel("[NEW] Forest " .. u691 .. " Donations " .. u691):setRight():setOrder(1)):setCaption("Explore Forest Donations")):oneClick(true)
        u436.selected:Connect(function() -- Line: 338 -- upvalues: showPromo (upval)
            showPromo()
        end)
        return
    end
end

;(LocalPlayer:GetAttributeChangedSignal("ForestDonationsPromoPlaytimeSeconds")):Connect(function() -- Line: 343 -- upvalues: LocalPlayer (val), createTopbarButton (val)
    if 3600 <= (tonumber((LocalPlayer:GetAttribute("ForestDonationsPromoPlaytimeSeconds"))) or 0) then
        createTopbarButton()
    end
end)
if 3600 <= (tonumber((LocalPlayer:GetAttribute("ForestDonationsPromoPlaytimeSeconds"))) or 0) then
    createTopbarButton()
end