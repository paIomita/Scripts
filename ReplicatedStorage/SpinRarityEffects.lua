-- Path: ReplicatedStorage.SpinRarityEffects

-- Script path: ReplicatedStorage.SpinRarityEffects
-- Decompile time: 2.32 ms

local RunService = game:GetService("RunService")
local u5 = {}
local u9 = setmetatable({}, {__mode = "k"})
local u14 = Color3.fromRGB(65, 181, 255)
local u19 = Color3.fromRGB(243, 253, 255)
local u24 = Color3.fromRGB(255, 209, 74)
u5.DiamondGradient = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(31, 112, 225)),
    ColorSequenceKeypoint.new(0.32, u14),
    ColorSequenceKeypoint.new(0.52, u19),
    ColorSequenceKeypoint.new(0.72, Color3.fromRGB(151, 235, 255)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(47, 138, 245))),
})
u5.MixedGradient = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(237, 161, 26)),
    ColorSequenceKeypoint.new(0.32, u24),
    ColorSequenceKeypoint.new(0.5, u19),
    ColorSequenceKeypoint.new(0.68, Color3.fromRGB(151, 235, 255)),
    (ColorSequenceKeypoint.new(1, u14)),
})

function u5.gradient(a1, a2) -- Line: 23 -- upvalues: u5 (val)
    return not (a1 ~= "Mixed") and u5.MixedGradient or not (a1 ~= "Diamond") and u5.DiamondGradient or a2
end

function u5.stop(a1) -- Line: 27 -- upvalues: u9 (val)
    local v1 = u9[a1]
    if not v1 then
        return
    end
    u9[a1] = nil
    if v1.connection then
        v1.connection:Disconnect()
    end
    if v1.destroying then
        v1.destroying:Disconnect()
    end
    if v1.layer then
        v1.layer:Destroy()
    end
end

function u5.start(a1, a2) -- Line: 36 -- upvalues: u5 (val), u9 (val), u24 (val), u14 (val), u19 (val), RunService (val)
    local Frame_2, Frame_3
    u5.stop(a1)
    if a2 ~= "Diamond" and a2 ~= "Mixed" then
        return
    end
    local Frame = Instance.new("Frame")
    Frame.Name = "DiamondSparkEffects"
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.BackgroundTransparency = 1
    Frame.Active = false
    Frame.ClipsDescendants = true
    Frame.ZIndex = a1.ZIndex + 7
    Frame.Parent = a1
    local v1 = {layer = Frame}
    u9[a1] = v1
    local u22 = {}
    for i = 1, 12 do
        Frame_2 = Instance.new("Frame")
        Frame_2.Name = "CrystalSpark"
        Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_2.Size = UDim2.fromOffset(4, 4)
        Frame_2.Rotation = 45
        Frame_2.BorderSizePixel = 0
        Frame_2.BackgroundColor3 = not (a2 ~= "Mixed") and not (i % 2 ~= 0) and u24 or not (i % 3 ~= 0) and u14 or u19
        Frame_2.ZIndex = Frame.ZIndex
        Frame_2.Parent = Frame
        for i2, v in ipairs({UDim2.fromScale(0.22, 3.4), (UDim2.fromScale(3.4, 0.22))}) do
            Frame_3 = Instance.new("Frame")
            Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
            Frame_3.Position = UDim2.fromScale(0.5, 0.5)
            Frame_3.Size = v
            Frame_3.BackgroundColor3 = Frame_2.BackgroundColor3
            Frame_3.BorderSizePixel = 0
            Frame_3.ZIndex = Frame.ZIndex
            Frame_3.Parent = Frame_2
        end
        u22[i] = Frame_2
    end
    local u121 = os.clock()
    local u122 = false
    pcall(function() -- Line: 74 -- upvalues: u122 (ref)
        u122 = game:GetService("GuiService").ReducedMotionEnabled
    end)
    local u126 = 0
    v1.connection = RunService.RenderStepped:Connect(function(a1_2) -- Line: 76 -- upvalues: a1 (val), u5 (upval), u126 (ref), Frame (val), u121 (val), u22 (val), u122 (ref)
        local fromScale, v1, v2, v3
        if not a1.Parent then
            u5.stop(a1)
            return
        end
        u126 = u126 + a1_2
        if u126 < 0.03333333333333333 then
            return
        end
        u126 = 0
        local v4 = true
        local Parent = a1
        while Parent do
            if Parent:IsA("GuiObject") and not Parent.Visible then
                v4 = false
                break
            end
            if Parent:IsA("ScreenGui") and not Parent.Enabled then
                v4 = false
                break
            end
            Parent = Parent.Parent
        end
        Frame.Visible = v4
        if not v4 then
            return
        end
        local v5 = os.clock() - u121
        for i, v in ipairs(u22) do
            v4 = (v5 * (if not u122 then 0.65 else 0.2) + i * 0.137) % 1
            v2 = i * 0.381966 % 1
            v3 = if i % 2 ~= 0 then 0.88 else 0.12
            fromScale = UDim2.fromScale
            v1 = if not u122 then (v4 - 0.5) * 0.15 else 0
            v.Position = fromScale(v2, v3 + v1)
            v3 = math.sin(v4 * 3.141592653589793) ^ 4
            v2 = if not u122 then v3 * 5 + 2 else 3
            v.Size = UDim2.fromOffset(v2, v2)
            v.BackgroundTransparency = 1 - v3 * 0.95
            for i2, i3 in ipairs(v:GetChildren()) do
                i3.BackgroundTransparency = 1 - v3 * 0.65
            end
        end
    end)
    v1.destroying = a1.Destroying:Connect(function() -- Line: 103 -- upvalues: u5 (upval), a1 (val)
        u5.stop(a1)
    end)
end

function u5.chime(a1, a2) -- Line: 106
    local v1 = a1:Clone()
    v1.PlaybackSpeed = 1.45
    v1.Volume = a1.Volume * 0.85
    v1.Parent = a2
    v1:Play()
    ;(game:GetService("Debris")):AddItem(v1, 5)
end

return u5