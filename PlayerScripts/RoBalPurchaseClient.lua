-- Path: Players.Drrrrrrrrragonball.PlayerScripts.RoBalPurchaseClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.RoBalPurchaseClient
-- Decompile time: 6.42 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local v1 = Players.LocalPlayer:WaitForChild("PlayerGui")
local RoBalPurchaseRemotes = ReplicatedStorage:WaitForChild("RoBalPurchaseRemotes")
local RequestPurchase = RoBalPurchaseRemotes:WaitForChild("RequestPurchase")
local PurchaseOffer = RoBalPurchaseRemotes:WaitForChild("PurchaseOffer")
local ConfirmPurchase = RoBalPurchaseRemotes:WaitForChild("ConfirmPurchase")
local PurchaseResult = RoBalPurchaseRemotes:WaitForChild("PurchaseResult")
local u46 = nil
local u47 = {
    [3601980450] = true,
    [3601980449] = true,
    [3601980448] = true,
    [3601980447] = true,
    [3601980446] = true,
    [3601980445] = true,
    [3601980444] = true,
    [3601980443] = true,
    [3601980442] = true,
    [3601980441] = true,
}
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RoBalPurchaseGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 100000
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = v1
local TextButton = Instance.new("TextButton")
TextButton.Name = "Blocker"
TextButton.Text = ""
TextButton.AutoButtonColor = false
TextButton.BackgroundTransparency = 1
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.fromScale(1, 1)
TextButton.Active = true
TextButton.Modal = true
TextButton.Visible = false
TextButton.ZIndex = 0
TextButton.Parent = ScreenGui
local ShopGui = v1:WaitForChild("ShopGui")
local u103 = ShopGui:WaitForChild("ConfirmationFrame"):Clone()
u103.Name = "ConfirmationFrame"
u103.AnchorPoint = Vector2.new(0.5, 0.5)
u103.Position = UDim2.new(0.5, 0, 0.54, 0)
u103.Visible = false
u103.Parent = ScreenGui
local u120 = u103:WaitForChild("Contents")
local Yes = u120:WaitForChild("Yes")
local No = u120:WaitForChild("No")
local Close = u103:WaitForChild("Close")
local CustomDesc = u120:WaitForChild("CustomDesc")
local CustomIcon = u120:WaitForChild("CustomIcon")
local CustomHolder = u120:FindFirstChild("CustomHolder")
local CurrencyCoins = u120:FindFirstChild("CurrencyCoins")
local Desc = u120:FindFirstChild("Desc")
local Top = u103:FindFirstChild("Top")
local Title = u103:FindFirstChild("Title", true)
local TextLabel = Yes:FindFirstChildWhichIsA("TextLabel", true)
local TextLabel_2 = No:FindFirstChildWhichIsA("TextLabel", true)
local TextLabel_3 = Close:FindFirstChildWhichIsA("TextLabel", true)
local Image = CustomHolder
if Image then
    Image = CustomHolder:FindFirstChild("Image")
end
local ImageLabel = Image
if ImageLabel then
    ImageLabel = Image:FindFirstChildWhichIsA("ImageLabel", true)
end

local function enforceModalStructure() -- Line: 76
    -- upvalues: u120 (val), Close (val), Top (val), Title (val), Yes (val), No (val), TextLabel (val)
    -- upvalues: TextLabel_2 (val), TextLabel_3 (val), CustomDesc (val), CustomHolder (val), Image (val)
    -- upvalues: ImageLabel (val), CurrencyCoins (val), Desc (val), CustomIcon (val)
    u120.Visible = true
    Close.Visible = true
    if Top and Top:IsA("GuiObject") then
        Top.Visible = true
    end
    if Title then
        Title.Visible = true
        Title.Text = "Confirmation"
    end
    Yes.Visible = true
    No.Visible = true
    if TextLabel then
        TextLabel.Visible = true
        TextLabel.Text = "Yes"
    end
    if TextLabel_2 then
        TextLabel_2.Visible = true
        TextLabel_2.Text = "No"
    end
    if TextLabel_3 then
        TextLabel_3.Visible = true
        TextLabel_3.Text = "X"
    end
    CustomDesc.Visible = true
    if CustomHolder then
        CustomHolder.Visible = true
    end
    if Image then
        Image.Visible = true
    end
    if ImageLabel then
        ImageLabel.Visible = true
        ImageLabel.ScaleType = Enum.ScaleType.Fit
    end
    if CurrencyCoins then
        CurrencyCoins.Visible = false
    end
    if Desc then
        Desc.Visible = false
    end
    CustomIcon.Visible = false
end

local function protectVisibleWhileOpen(a1) -- Line: 110 -- upvalues: u103 (val)
    if a1 and a1:IsA("GuiObject") then
        (a1:GetPropertyChangedSignal("Visible")):Connect(function() -- Line: 112 -- upvalues: u103 (upval), a1 (val)
            if u103.Visible and not a1.Visible then
                a1.Visible = true
            end
        end)
        return
    end
end

protectVisibleWhileOpen(u120)
protectVisibleWhileOpen(Top)
protectVisibleWhileOpen(Close)
protectVisibleWhileOpen(Title)
protectVisibleWhileOpen(Yes)
protectVisibleWhileOpen(No)
protectVisibleWhileOpen(TextLabel)
protectVisibleWhileOpen(TextLabel_2)
protectVisibleWhileOpen(TextLabel_3)
protectVisibleWhileOpen(CustomDesc)
protectVisibleWhileOpen(CustomHolder)
protectVisibleWhileOpen(Image)
protectVisibleWhileOpen(ImageLabel)
enforceModalStructure()
local ModalScale = u103:FindFirstChild("ModalScale")
if not ModalScale or not ModalScale:IsA("UIScale") then
    ModalScale = Instance.new("UIScale")
    ModalScale.Name = "ModalScale"
    ModalScale.Scale = 1
    ModalScale.Parent = u103
end

local function setBlur(a1) -- Line: 143 -- upvalues: Lighting (val), TweenService (val)
    local RoBalPurchaseBlur = Lighting:FindFirstChild("RoBalPurchaseBlur")
    if a1 then
        if not RoBalPurchaseBlur then
            RoBalPurchaseBlur = Instance.new("BlurEffect")
            RoBalPurchaseBlur.Name = "RoBalPurchaseBlur"
            RoBalPurchaseBlur.Size = 0
            RoBalPurchaseBlur.Parent = Lighting
        end
        TweenService:Create(RoBalPurchaseBlur, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 10}):Play()
    elseif RoBalPurchaseBlur then
        local v1 = TweenService
        local v2 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        v1 = v1:Create(RoBalPurchaseBlur, v2, {Size = 0})
        v1:Play()
        v1.Completed:Connect(function() -- Line: 156 -- upvalues: RoBalPurchaseBlur (ref)
            if RoBalPurchaseBlur and RoBalPurchaseBlur.Parent and RoBalPurchaseBlur.Size <= 0.01 then
                RoBalPurchaseBlur:Destroy()
            end
        end)
    end
end

local function setVisible(a1) -- Line: 164
    -- upvalues: ScreenGui (val), TextButton (val), u103 (val), setBlur (val), enforceModalStructure (val)
    -- upvalues: ModalScale (ref), TweenService (val)
    ScreenGui.Enabled = true
    TextButton.Visible = a1
    u103.Visible = a1
    setBlur(a1)
    if not a1 then
        ModalScale.Scale = 1
        return
    end
    enforceModalStructure()
    ModalScale.Scale = 0
    TweenService:Create(ModalScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
end

local function getCurrentInfinityRewardImage() -- Line: 178 -- upvalues: ShopGui (val)
    local ImageLabel, Parent, v1
    local ShopFrame = ShopGui:FindFirstChild("ShopFrame")
    local ItemsFrame = ShopFrame and ShopFrame:FindFirstChild("ItemsFrame")
    local v2 = ItemsFrame and ItemsFrame:FindFirstChild("Items")
    local Infinite = v2 and v2:FindFirstChild("Infinite")
    v2 = Infinite and Infinite:FindFirstChild("Pack")
    if not v2 then
        return nil
    end
    for i, v in ipairs(v2:GetDescendants()) do
        if v:IsA("GuiButton") and v:GetAttribute("InfinitePackClaimable") == true then
            Parent = v.Parent
            ImageLabel = Parent and Parent:FindFirstChild("ImageLabel")
            if ImageLabel and ImageLabel:IsA("ImageLabel") then
                v1 = ImageLabel:FindFirstChild("ImageLabel")
                if v1 and v1:IsA("ImageLabel") and v1.Image ~= "" then
                    return v1.Image
                end
                if ImageLabel.Image ~= "" then
                    return ImageLabel.Image
                end
            end
        end
    end
    return nil
end

local function commaNumber(a1) -- Line: 204
    local v1, v2
    local v3 = tostring((math.floor((tonumber(a1)) or 0)))
    repeat
        v1, v2 = v3:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        v3 = v1
    until v2 == 0
    return v3
end

local function showFeedback(a1, a2, a3) -- Line: 214 -- upvalues: ReplicatedStorage (val)
    local v1 = {text = tostring(a1), colorMode = a2 or "green", confetti = a3 == true}
    local ShowFeedbackMessage = ReplicatedStorage:FindFirstChild("ShowFeedbackMessage")
    if ShowFeedbackMessage and ShowFeedbackMessage:IsA("BindableEvent") then
        ShowFeedbackMessage:Fire(v1)
        return
    end
    if _G.ShowFeedbackMessage then
        _G.ShowFeedbackMessage(v1)
    end
end

local function respond(a1) -- Line: 228
    -- upvalues: u46 (ref), ScreenGui (val), TextButton (val), u103 (val), setBlur (val), ModalScale (ref)
    -- upvalues: ConfirmPurchase (val)
    local v1 = u46
    u46 = nil
    ScreenGui.Enabled = true
    TextButton.Visible = false
    u103.Visible = false
    setBlur(false)
    ModalScale.Scale = 1
    if v1 then
        ConfirmPurchase:FireServer(v1.token, a1 == true)
    end
end

Yes.Activated:Connect(function() -- Line: 237
    -- upvalues: u46 (ref), ScreenGui (val), TextButton (val), u103 (val), setBlur (val), ModalScale (ref)
    -- upvalues: ConfirmPurchase (val)
    local v1 = u46
    u46 = nil
    ScreenGui.Enabled = true
    TextButton.Visible = false
    u103.Visible = false
    setBlur(false)
    ModalScale.Scale = 1
    if v1 then
        ConfirmPurchase:FireServer(v1.token, true)
    end
end)
No.Activated:Connect(function() -- Line: 240
    -- upvalues: u46 (ref), ScreenGui (val), TextButton (val), u103 (val), setBlur (val), ModalScale (ref)
    -- upvalues: ConfirmPurchase (val)
    local v1 = u46
    u46 = nil
    ScreenGui.Enabled = true
    TextButton.Visible = false
    u103.Visible = false
    setBlur(false)
    ModalScale.Scale = 1
    if v1 then
        ConfirmPurchase:FireServer(v1.token, false)
    end
end)
Close.Activated:Connect(function() -- Line: 243
    -- upvalues: u46 (ref), ScreenGui (val), TextButton (val), u103 (val), setBlur (val), ModalScale (ref)
    -- upvalues: ConfirmPurchase (val)
    local v1 = u46
    u46 = nil
    ScreenGui.Enabled = true
    TextButton.Visible = false
    u103.Visible = false
    setBlur(false)
    ModalScale.Scale = 1
    if v1 then
        ConfirmPurchase:FireServer(v1.token, false)
    end
end)
TextButton.Activated:Connect(function() -- Line: 246
    -- upvalues: u46 (ref), ScreenGui (val), TextButton (val), u103 (val), setBlur (val), ModalScale (ref)
    -- upvalues: ConfirmPurchase (val)
    local v1 = u46
    u46 = nil
    ScreenGui.Enabled = true
    TextButton.Visible = false
    u103.Visible = false
    setBlur(false)
    ModalScale.Scale = 1
    if v1 then
        ConfirmPurchase:FireServer(v1.token, false)
    end
end)
PurchaseOffer.OnClientEvent:Connect(function(a1) -- Line: 250
    -- upvalues: u46 (ref), CustomDesc (val), commaNumber (val), ImageLabel (val), u47 (val)
    -- upvalues: getCurrentInfinityRewardImage (val), setVisible (val)
    if type(a1) == "table" and type(a1.token) == "string" then
        u46 = a1
        CustomDesc.Text = ("Buy %s for %s RoBal?"):format(
            tostring(a1.name or (if a1.kind ~= "GamePass" then "this product" else "this gamepass")),
            (commaNumber(a1.price))
        )
        if ImageLabel then
            local v1 = nil
            if u47[tonumber(a1.purchaseId)] then
                v1 = getCurrentInfinityRewardImage()
            end
            if not v1 then
                local v2 = math.max(0, (math.floor((tonumber(a1.iconImageAssetId)) or 0)))
                v1 = v2 > 0 and "rbxassetid://" .. tostring(v2) or ""
            end
            ImageLabel.Image = v1
            ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
        end
        setVisible(true)
        return
    end
end)
PurchaseResult.OnClientEvent:Connect(function(a1) -- Line: 270
    -- upvalues: u46 (ref), ScreenGui (val), TextButton (val), u103 (val), setBlur (val), ModalScale (ref)
    -- upvalues: showFeedback (val), commaNumber (val)
    if type(a1) ~= "table" then
        return
    end
    if u46 and a1.purchaseId == u46.purchaseId then
        u46 = nil
        ScreenGui.Enabled = true
        TextButton.Visible = false
        u103.Visible = false
        setBlur(false)
        ModalScale.Scale = 1
    end
    if a1.success == true and a1.usedRoBal == true then
        showFeedback(("Purchased %s for %s RoBal! %s RoBal remaining."):format(
            tostring(a1.name or "item"),
            commaNumber(a1.price),
            (commaNumber(a1.balance))
        ), "green", true)
        return
    end
    if a1.cancelled == true then
        return
    end
    if a1.reason == "already_owned" then
        showFeedback("You already own this gamepass.", "red")
        return
    end
    if a1.reason == "not_enough_robal" then
        showFeedback("Your RoBal balance changed and is no longer enough for this purchase.", "red")
        return
    end
    if a1.reason == "offer_expired" then
        showFeedback("That RoBal offer expired. Please try again.", "red")
        return
    end
    if a1.refundPending == true then
        showFeedback("The purchase could not finish. Your RoBal refund is saved for automatic recovery when your data reconnects.", "red")
        return
    end
    if a1.refunded == true then
        showFeedback("The purchase could not be granted, so your RoBal was refunded.", "red")
        return
    end
    if a1.reason and a1.reason ~= "cancelled" then
        showFeedback("The RoBal purchase could not be completed. You were not charged.", "red")
    end
end)
local v2 = _G
v2.RoBalPurchaseClient = {
    request = function(a1, a2) -- Line: 300 -- upvalues: RequestPurchase (val)
        RequestPurchase:FireServer(a1, a2)
    end,
}