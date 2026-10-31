-- Path: ReplicatedStorage.SpinnerSkinVisuals

-- Script path: ReplicatedStorage.SpinnerSkinVisuals
-- Decompile time: 9.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CosmeticsCatalog = require(ReplicatedStorage:WaitForChild("CosmeticsCatalog"))
local u11 = {}

local function resolveSkin(a1) -- Line: 7 -- upvalues: CosmeticsCatalog (val)
    if type(a1) == "table" then
        return a1
    end
    local v1 = tostring(a1 or "")
    if v1 == "" then
        return nil
    end
    return CosmeticsCatalog.GetReward("SpinnerSkins", v1)
end

local u13 = {"BackgroundColor3", "Color", "Rotation"}

local function setStyled(a1, a2, a3) -- Line: 22
    if not a1 then
        return
    end
    local v1 = "SpinnerSkinOriginal_" .. a2
    local v2 = "SpinnerSkinHasOriginal_" .. a2
    if a1:GetAttribute(v2) ~= true then
        a1:SetAttribute(v1, a1[a2])
        a1:SetAttribute(v2, true)
    end
    a1[a2] = a3
end

local function restoreObject(a1) -- Line: 35 -- upvalues: u13 (val)
    local Attribute, v1, v2
    local v3 = a1
    for i, v in ipairs(u13) do
        v1 = "SpinnerSkinHasOriginal_" .. v
        if v3:GetAttribute(v1) == true then
            v2 = "SpinnerSkinOriginal_" .. v
            Attribute = v3:GetAttribute(v2)
            if Attribute ~= nil then
                v3[v] = Attribute
            end
            v3:SetAttribute(v2, nil)
            v3:SetAttribute(v1, nil)
        end
    end
end

local function restoreWithin(a1) -- Line: 50 -- upvalues: restoreObject (val)
    if not a1 then
        return
    end
    restoreObject(a1)
    for i, v in ipairs(a1:GetDescendants()) do
        restoreObject(v)
        if v.Name == "SpinnerSkinGradient" and v:IsA("UIGradient") then
            v:Destroy()
        end
    end
end

local function setStroke(a1, a2) -- Line: 63
    local UIStroke = a1 and a1:FindFirstChildOfClass("UIStroke")
    if UIStroke then
        if not UIStroke then
            return
        end
        if UIStroke:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
            UIStroke:SetAttribute("SpinnerSkinOriginal_Color", UIStroke.Color)
            UIStroke:SetAttribute("SpinnerSkinHasOriginal_Color", true)
        end
        UIStroke.Color = a2
    end
end

local function twoColorSequence(a1, a2) -- Line: 70
    return ColorSequence.new({ColorSequenceKeypoint.new(0, a1), (ColorSequenceKeypoint.new(1, a2))})
end

local function paletteSequence(a1, a2, a3, a4) -- Line: 77
    local v1, v2
    local colors_2 = not (type(a1 and a1.colors) ~= "table") and a1.colors or {}
    if #colors_2 == 0 then
        colors_2 = {a2, a3}
    elseif #colors_2 == 1 then
        colors_2 = {colors_2[1], a3 or colors_2[1]}
    end
    local v3 = {}
    for i, v in ipairs(colors_2) do
        v2 = Color3.new(0, 0, 0)
        v1 = v:Lerp(v2, a4 or 0)
        table.insert(v3, (ColorSequenceKeypoint.new((i - 1) / math.max(1, #colors_2 - 1), v1)))
    end
    return ColorSequence.new(v3)
end

local function styleGradient(a1, a2, a3) -- Line: 92
    if a1 and a1:IsA("GuiObject") then
        local UIGradient = a1:FindFirstChildWhichIsA("UIGradient")
        if not UIGradient then
            UIGradient = Instance.new("UIGradient")
            UIGradient.Name = "SpinnerSkinGradient"
            UIGradient.Parent = a1
        end
        if UIGradient.Name == "SpinnerSkinGradient" then
            UIGradient.Color = a2
            UIGradient.Rotation = a3 or 0
            return
        end
        if UIGradient then
            if UIGradient:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                UIGradient:SetAttribute("SpinnerSkinOriginal_Color", UIGradient.Color)
                UIGradient:SetAttribute("SpinnerSkinHasOriginal_Color", true)
            end
            UIGradient.Color = a2
        end
        if not UIGradient then
            return
        end
        if UIGradient:GetAttribute("SpinnerSkinHasOriginal_Rotation") ~= true then
            UIGradient:SetAttribute("SpinnerSkinOriginal_Rotation", UIGradient.Rotation)
            UIGradient:SetAttribute("SpinnerSkinHasOriginal_Rotation", true)
        end
        UIGradient.Rotation = a3 or 0
        return
    end
end

local function findBackdrop(a1) -- Line: 109
    local RainbowFrame, v1
    local v2 = pairs
    for k, v in v2(a1 or {}) do
        v1 = v and v:FindFirstAncestorWhichIsA("ScreenGui")
        RainbowFrame = v1 and v1:FindFirstChild("RainbowFrame")
        if RainbowFrame and RainbowFrame:IsA("GuiObject") then
            return RainbowFrame
        end
    end
    return nil
end

local function applyBackdrop(a1, a2) -- Line: 120 -- upvalues: styleGradient (val), paletteSequence (val)
    local skin = a2 and a2.skin
    if a1 and type(skin) == "table" then
        local wheelColor = skin.wheelColor
        if a1 then
            if a1:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                a1:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", a1.BackgroundColor3)
                a1:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
            end
            a1.BackgroundColor3 = wheelColor
        end
        local strokeColor = skin.strokeColor
        local UIStroke = a1 and a1:FindFirstChildOfClass("UIStroke")
        if UIStroke and UIStroke then
            if UIStroke:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                UIStroke:SetAttribute("SpinnerSkinOriginal_Color", UIStroke.Color)
                UIStroke:SetAttribute("SpinnerSkinHasOriginal_Color", true)
            end
            UIStroke.Color = strokeColor
        end
        styleGradient(a1, paletteSequence(a2, skin.optionsColor, skin.accentColor, 0.1), 25)
        return
    end
end

function u11.RestoreFrame(a1) -- Line: 130 -- upvalues: restoreWithin (val)
    restoreWithin(a1)
    if a1 then
        a1:SetAttribute("AppliedSpinnerSkin", nil)
    end
end

function u11.RestoreFrames(a1) -- Line: 137 -- upvalues: u11 (val), restoreWithin (val), findBackdrop (val)
    local v1 = pairs
    for k, v in v1(a1 or {}) do
        u11.RestoreFrame(v)
    end
    restoreWithin((findBackdrop(a1)))
end

function u11.ApplyFrame(a1, a2) -- Line: 144
    -- upvalues: CosmeticsCatalog (val), styleGradient (val), paletteSequence (val), twoColorSequence (val)
    local v1, v2
    if type(a2) ~= "table" then
        v2 = tostring(a2 or "")
        v1 = if v2 ~= "" then CosmeticsCatalog.GetReward("SpinnerSkins", v2) else nil
    else
        v1 = a2
    end
    local skin = v1 and v1.skin
    if a1 and type(skin) == "table" then
        local v3, v4
        local ScrollingFrame = a1:FindFirstChild("ScrollingFrame")
        if not ScrollingFrame then
            return false
        end
        local spinnerColor = skin.spinnerColor or Color3.fromRGB(231, 215, 215)
        local wheelColor = skin.wheelColor or Color3.fromRGB(191, 191, 191)
        local optionsColor = skin.optionsColor or Color3.fromRGB(107, 107, 107)
        local accentColor = skin.accentColor or Color3.fromRGB(255, 105, 105)
        local strokeColor = skin.strokeColor or Color3.fromRGB(0, 0, 0)
        if ScrollingFrame then
            if ScrollingFrame:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                ScrollingFrame:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", ScrollingFrame.BackgroundColor3)
                ScrollingFrame:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
            end
            ScrollingFrame.BackgroundColor3 = wheelColor
        end
        styleGradient(ScrollingFrame, paletteSequence(v1, optionsColor, accentColor, 0.06), 18)
        v2 = a1 and a1:FindFirstChildOfClass("UIStroke")
        if v2 and v2 then
            if v2:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                v2:SetAttribute("SpinnerSkinOriginal_Color", v2.Color)
                v2:SetAttribute("SpinnerSkinHasOriginal_Color", true)
            end
            v2.Color = strokeColor
        end
        local UIStroke = ScrollingFrame and ScrollingFrame:FindFirstChildOfClass("UIStroke")
        if UIStroke and UIStroke then
            if UIStroke:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                UIStroke:SetAttribute("SpinnerSkinOriginal_Color", UIStroke.Color)
                UIStroke:SetAttribute("SpinnerSkinHasOriginal_Color", true)
            end
            UIStroke.Color = strokeColor
        end
        local Frame = ScrollingFrame:FindFirstChild("Frame")
        if Frame and Frame:IsA("GuiObject") then
            if Frame then
                if Frame:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                    Frame:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", Frame.BackgroundColor3)
                    Frame:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
                end
                Frame.BackgroundColor3 = accentColor
            end
            local UIStroke_2 = Frame and Frame:FindFirstChildOfClass("UIStroke")
            if UIStroke_2 and UIStroke_2 then
                if UIStroke_2:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                    UIStroke_2:SetAttribute("SpinnerSkinOriginal_Color", UIStroke_2.Color)
                    UIStroke_2:SetAttribute("SpinnerSkinHasOriginal_Color", true)
                end
                UIStroke_2.Color = strokeColor
            end
        end
        local TopBarFrame = ScrollingFrame:FindFirstChild("TopBarFrame")
        if TopBarFrame and TopBarFrame:IsA("GuiObject") then
            v4 = spinnerColor:Lerp(accentColor, 0.12)
            if TopBarFrame then
                if TopBarFrame:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                    TopBarFrame:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", TopBarFrame.BackgroundColor3)
                    TopBarFrame:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
                end
                TopBarFrame.BackgroundColor3 = v4
            end
            styleGradient(TopBarFrame, paletteSequence(v1, spinnerColor, accentColor, 0), 0)
            local UIStroke_3 = TopBarFrame and TopBarFrame:FindFirstChildOfClass("UIStroke")
            if UIStroke_3 and UIStroke_3 then
                if UIStroke_3:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                    UIStroke_3:SetAttribute("SpinnerSkinOriginal_Color", UIStroke_3.Color)
                    UIStroke_3:SetAttribute("SpinnerSkinHasOriginal_Color", true)
                end
                UIStroke_3.Color = strokeColor
            end
        end
        local WheelFrame = ScrollingFrame:FindFirstChild("WheelFrame")
        if not WheelFrame or not WheelFrame:IsA("GuiObject") then
            v3 = a1
        else
            local BackgroundColor3_5, UIStroke_5, v5, v6
            if WheelFrame then
                if WheelFrame:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                    WheelFrame:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", WheelFrame.BackgroundColor3)
                    WheelFrame:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
                end
                WheelFrame.BackgroundColor3 = wheelColor
            end
            styleGradient(WheelFrame, paletteSequence(v1, wheelColor, accentColor, 0.18), 90)
            local UIStroke_4 = WheelFrame and WheelFrame:FindFirstChildOfClass("UIStroke")
            if UIStroke_4 and UIStroke_4 then
                if UIStroke_4:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                    UIStroke_4:SetAttribute("SpinnerSkinOriginal_Color", UIStroke_4.Color)
                    UIStroke_4:SetAttribute("SpinnerSkinHasOriginal_Color", true)
                end
                UIStroke_4.Color = strokeColor
            end
            v3 = a1
            for i, v in ipairs(WheelFrame:GetChildren()) do
                if v:IsA("Frame") and string.find(v.Name, "SpinningFrame", 1, true) == 1 then
                    if v then
                        if v:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                            BackgroundColor3_5 = v.BackgroundColor3
                            v:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", BackgroundColor3_5)
                            v:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
                        end
                        v.BackgroundColor3 = spinnerColor
                    end
                    UIStroke_5 = v and v:FindFirstChildOfClass("UIStroke")
                    if UIStroke_5 and UIStroke_5 then
                        if UIStroke_5:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                            UIStroke_5:SetAttribute("SpinnerSkinOriginal_Color", UIStroke_5.Color)
                            UIStroke_5:SetAttribute("SpinnerSkinHasOriginal_Color", true)
                        end
                        UIStroke_5.Color = strokeColor
                    end
                    v5 = styleGradient
                    v6 = paletteSequence(v1, spinnerColor, accentColor, 0)
                    v5(v, v6, 90)
                end
            end
        end
        local OptionsFrame = ScrollingFrame:FindFirstChild("OptionsFrame")
        if OptionsFrame and OptionsFrame:IsA("GuiObject") then
            if OptionsFrame then
                if OptionsFrame:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                    OptionsFrame:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", OptionsFrame.BackgroundColor3)
                    OptionsFrame:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
                end
                OptionsFrame.BackgroundColor3 = optionsColor
            end
            styleGradient(OptionsFrame, twoColorSequence(optionsColor:Lerp(accentColor, 0.2), optionsColor), 90)
            local UIStroke_6 = OptionsFrame and OptionsFrame:FindFirstChildOfClass("UIStroke")
            if UIStroke_6 and UIStroke_6 then
                if UIStroke_6:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                    UIStroke_6:SetAttribute("SpinnerSkinOriginal_Color", UIStroke_6.Color)
                    UIStroke_6:SetAttribute("SpinnerSkinHasOriginal_Color", true)
                end
                UIStroke_6.Color = strokeColor
            end
        end
        local ChancesFrame = ScrollingFrame:FindFirstChild("ChancesFrame")
        if ChancesFrame then
            local v7 = ChancesFrame and ChancesFrame:FindFirstChildOfClass("UIStroke")
            if v7 and v7 then
                if v7:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                    v7:SetAttribute("SpinnerSkinOriginal_Color", v7.Color)
                    v7:SetAttribute("SpinnerSkinHasOriginal_Color", true)
                end
                v7.Color = strokeColor
            end
            if ChancesFrame:IsA("GuiObject") and ChancesFrame.BackgroundTransparency < 1 then
                v4 = wheelColor:Lerp(spinnerColor, 0.18)
                if ChancesFrame then
                    if ChancesFrame:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                        ChancesFrame:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", ChancesFrame.BackgroundColor3)
                        ChancesFrame:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
                    end
                    ChancesFrame.BackgroundColor3 = v4
                end
                styleGradient(ChancesFrame, paletteSequence(v1, wheelColor, accentColor, 0.12), 0)
            end
            local v8 = ChancesFrame:FindFirstChild("Frame")
            if v8 and v8:IsA("GuiObject") then
                if v8 then
                    if v8:GetAttribute("SpinnerSkinHasOriginal_BackgroundColor3") ~= true then
                        v8:SetAttribute("SpinnerSkinOriginal_BackgroundColor3", v8.BackgroundColor3)
                        v8:SetAttribute("SpinnerSkinHasOriginal_BackgroundColor3", true)
                    end
                    v8.BackgroundColor3 = accentColor
                end
                local UIStroke_7 = v8 and v8:FindFirstChildOfClass("UIStroke")
                if UIStroke_7 and UIStroke_7 then
                    if UIStroke_7:GetAttribute("SpinnerSkinHasOriginal_Color") ~= true then
                        UIStroke_7:SetAttribute("SpinnerSkinOriginal_Color", UIStroke_7.Color)
                        UIStroke_7:SetAttribute("SpinnerSkinHasOriginal_Color", true)
                    end
                    UIStroke_7.Color = strokeColor
                end
            end
        end
        v3:SetAttribute("AppliedSpinnerSkin", v1.key)
        return true
    end
    return false
end

function u11.ApplyFrames(a1, a2) -- Line: 219
    -- upvalues: CosmeticsCatalog (val), u11 (val), applyBackdrop (val), findBackdrop (val)
    local v1, v2
    if type(a2) ~= "table" then
        v2 = tostring(a2 or "")
        v1 = if v2 ~= "" then CosmeticsCatalog.GetReward("SpinnerSkins", v2) else nil
    else
        v1 = a2
    end
    if not v1 then
        u11.RestoreFrames(a1)
        return false
    end
    v2 = false
    local v3 = pairs
    for k, v in v3(a1 or {}) do
        v2 = u11.ApplyFrame(v, v1) or v2
    end
    applyBackdrop(findBackdrop(a1), v1)
    return v2
end

local function corner(a1, a2) -- Line: 233
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, a2)
    UICorner.Parent = a1
end

local function stroke(a1, a2, a3) -- Line: 239
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = a2
    UIStroke.Thickness = a3
    UIStroke.Parent = a1
end

function u11.RenderPreview(a1, a2) -- Line: 246 -- upvalues: CosmeticsCatalog (val), twoColorSequence (val)
    local v1
    if type(a2) ~= "table" then
        local v2 = tostring(a2 or "")
        v1 = if v2 ~= "" then CosmeticsCatalog.GetReward("SpinnerSkins", v2) else nil
    else
        v1 = a2
    end
    local skin = v1 and v1.skin
    if a1 and type(skin) == "table" then
        local UICorner_3, UIStroke_3, accentColor_3, strokeColor_3, v3
        v1 = math.max(tonumber(a1.ZIndex) or 1, 1)
        local SpinnerSkinPreviewGenerated = a1:FindFirstChild("SpinnerSkinPreviewGenerated")
        if SpinnerSkinPreviewGenerated then
            SpinnerSkinPreviewGenerated:Destroy()
        end
        local Frame = Instance.new("Frame")
        Frame.Name = "SpinnerSkinPreviewGenerated"
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.Position = UDim2.fromScale(0.5, 0.5)
        Frame.Size = UDim2.fromScale(0.94, 0.86)
        Frame.BackgroundColor3 = skin.wheelColor
        Frame.ClipsDescendants = true
        Frame.ZIndex = v1 + 1
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 12)
        UICorner.Parent = Frame
        local strokeColor = skin.strokeColor
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = strokeColor
        UIStroke.Thickness = 2
        UIStroke.Parent = Frame
        Frame.Parent = a1
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Color = twoColorSequence(skin.wheelColor:Lerp(skin.accentColor, 0.16), skin.wheelColor)
        UIGradient.Rotation = 90
        UIGradient.Parent = Frame
        local Frame_2 = Instance.new("Frame")
        Frame_2.Name = "Spinner"
        Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_2.Position = UDim2.fromScale(0.5, 0.48)
        Frame_2.Size = UDim2.fromScale(0.82, 0.56)
        Frame_2.BackgroundColor3 = skin.spinnerColor
        Frame_2.ClipsDescendants = true
        Frame_2.ZIndex = v1 + 2
        local UICorner_2 = Instance.new("UICorner")
        UICorner_2.CornerRadius = UDim.new(0, 9)
        UICorner_2.Parent = Frame_2
        local strokeColor_2 = skin.strokeColor
        local UIStroke_2 = Instance.new("UIStroke")
        UIStroke_2.Color = strokeColor_2
        UIStroke_2.Thickness = 2
        UIStroke_2.Parent = Frame_2
        Frame_2.Parent = Frame
        local UIGradient_2 = Instance.new("UIGradient")
        UIGradient_2.Color = twoColorSequence(skin.spinnerColor:Lerp(Color3.new(1, 1, 1), 0.2), skin.spinnerColor:Lerp(skin.accentColor, 0.15))
        UIGradient_2.Parent = Frame_2
        for i = 1, 5 do
            v3 = Instance.new("Frame")
            v3.Name = "Card" .. i
            v3.AnchorPoint = Vector2.new(0.5, 0.5)
            v3.Position = UDim2.fromScale((i - 1) * 0.2 + 0.1, 0.5)
            v3.Size = UDim2.fromScale(0.16, 0.72)
            accentColor_3 = not (i ~= 3) and skin.accentColor or skin.spinnerColor:Lerp(Color3.new(1, 1, 1), 0.42)
            v3.BackgroundColor3 = accentColor_3
            v3.ZIndex = v1 + 3
            UICorner_3 = Instance.new("UICorner")
            UICorner_3.CornerRadius = UDim.new(0, 6)
            UICorner_3.Parent = v3
            strokeColor_3 = skin.strokeColor
            UIStroke_3 = Instance.new("UIStroke")
            UIStroke_3.Color = strokeColor_3
            UIStroke_3.Thickness = 1.5
            UIStroke_3.Parent = v3
            v3.Parent = Frame_2
        end
        local v4 = Instance.new("Frame")
        v4.Name = "Marker"
        v4.AnchorPoint = Vector2.new(0.5, 0)
        v4.Position = UDim2.fromScale(0.5, 0.08)
        v4.Size = UDim2.fromScale(0.025, 0.82)
        v4.BackgroundColor3 = skin.accentColor
        v4.ZIndex = v1 + 4
        local strokeColor_4 = skin.strokeColor
        local UIStroke_4 = Instance.new("UIStroke")
        UIStroke_4.Color = strokeColor_4
        UIStroke_4.Thickness = 1.5
        UIStroke_4.Parent = v4
        v4.Parent = Frame
        v4 = Instance.new("Frame")
        v4.Name = "Options"
        v4.AnchorPoint = Vector2.new(0.5, 1)
        v4.Position = UDim2.fromScale(0.5, 0.96)
        v4.Size = UDim2.fromScale(0.78, 0.18)
        v4.BackgroundColor3 = skin.optionsColor
        v4.ZIndex = v1 + 2
        v1 = Instance.new("UICorner")
        v1.CornerRadius = UDim.new(0, 7)
        v1.Parent = v4
        local strokeColor_5 = skin.strokeColor
        local UIStroke_5 = Instance.new("UIStroke")
        UIStroke_5.Color = strokeColor_5
        UIStroke_5.Thickness = 2
        UIStroke_5.Parent = v4
        v4.Parent = Frame
        return true
    end
    return false
end

return u11