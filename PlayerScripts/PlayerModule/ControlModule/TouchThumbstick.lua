-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.TouchThumbstick

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.TouchThumbstick
-- Decompile time: 3.92 ms

game:GetService("Players")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
UserSettings():GetService("UserGameSettings")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local u37 = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserAllowAbilityControls")
local u47 = nil
if u37 then
    u47 = require(script.Parent:WaitForChild("AvatarAbilitiesInterface"))
end
local u56 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u60 = setmetatable({}, u56)
u60.__index = u60

function u60.new() -- Line: 29 -- upvalues: u56 (val), u60 (val)
    local v1 = u56.new()
    local v2 = setmetatable(v1, u60)
    v2.isFollowStick = false
    v2.thumbstickFrame = nil
    v2.moveTouchObject = nil
    v2.onTouchMovedConn = nil
    v2.onTouchEndedConn = nil
    v2.screenPos = nil
    v2.stickImage = nil
    v2.thumbstickSize = nil
    return v2
end

function u60.Enable(a1, a2, a3) -- Line: 44 -- types: a1: table, a2: boolean?
    if a2 == nil then
        return false
    end
    local v1 = not not a2
    if a1.enabled == v1 then
        return true
    end
    a1.moveVector = Vector3.new(0, 0, 0)
    a1.isJumping = false
    if not v1 then
        a1.thumbstickFrame.Visible = false
        a1:OnInputEnded()
    else
        if not a1.thumbstickFrame then
            a1:Create(a3)
        end
        a1.thumbstickFrame.Visible = true
    end
    a1.enabled = v1
end

function u60:OnInputEnded() -- Line: 65
    self.thumbstickFrame.Position = self.screenPos
    self.stickImage.Position = UDim2.new(
        0,
        self.thumbstickFrame.Size.X.Offset / 2 - self.thumbstickSize / 4,
        0,
        self.thumbstickFrame.Size.Y.Offset / 2 - self.thumbstickSize / 4
    )
    self.moveVector = Vector3.new(0, 0, 0)
    self.isJumping = false
    self.thumbstickFrame.Position = self.screenPos
    self.moveTouchObject = nil
end

function u60:Create(a2) -- Line: 74 -- upvalues: u37 (val), u47 (ref), UserInputService (val), GuiService (val)
    if self.thumbstickFrame then
        self.thumbstickFrame:Destroy()
        self.thumbstickFrame = nil
        if self.onTouchMovedConn then
            self.onTouchMovedConn:Disconnect()
            self.onTouchMovedConn = nil
        end
        if self.onTouchEndedConn then
            self.onTouchEndedConn:Disconnect()
            self.onTouchEndedConn = nil
        end
        if self.absoluteSizeChangedConn then
            self.absoluteSizeChangedConn:Disconnect()
            self.absoluteSizeChangedConn = nil
        end
        if u37 and self.avatarAbilitiesEnabledChangedConn then
            self.avatarAbilitiesEnabledChangedConn:Disconnect()
            self.avatarAbilitiesEnabledChangedConn = nil
        end
    end
    self.thumbstickFrame = Instance.new("Frame")
    self.thumbstickFrame.Name = "ThumbstickFrame"
    self.thumbstickFrame.Active = true
    self.thumbstickFrame.Visible = false
    self.thumbstickFrame.BackgroundTransparency = 1
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "OuterImage"
    ImageLabel.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
    ImageLabel.ImageRectOffset = Vector2.new()
    ImageLabel.ImageRectSize = Vector2.new(220, 220)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Position = UDim2.new(0, 0, 0, 0)
    self.stickImage = Instance.new("ImageLabel")
    self.stickImage.Name = "StickImage"
    self.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
    self.stickImage.ImageRectOffset = Vector2.new(220, 0)
    self.stickImage.ImageRectSize = Vector2.new(111, 111)
    self.stickImage.BackgroundTransparency = 1
    self.stickImage.ZIndex = 2

    local function ResizeThumbstick() -- Line: 120
        -- upvalues: a2 (val), u37 (upval), u47 (upval), self (val), ImageLabel (val)
        local v1 = (math.min(a2.AbsoluteSize.X, a2.AbsoluteSize.Y)) <= 500
        if not u37 or not u47.isEnabled() then
            self.thumbstickSize = if not v1 then 120 else 70
            local v2 = v1 and UDim2.new(0, self.thumbstickSize / 2 - 10, 1, -self.thumbstickSize - 20) or UDim2.new(0, self.thumbstickSize / 2, 1, -self.thumbstickSize * 1.75)
            self.screenPos = v2
        else
            local v3 = if not v1 then 112 else 64
            self.thumbstickSize = if not v1 then 120 else 72
            self.screenPos = UDim2.new(0, if not v1 then 100 else 64, 1, -self.thumbstickSize - v3)
        end
        self.thumbstickFrame.Size = UDim2.new(0, self.thumbstickSize, 0, self.thumbstickSize)
        self.thumbstickFrame.Position = self.screenPos
        ImageLabel.Size = UDim2.new(0, self.thumbstickSize, 0, self.thumbstickSize)
        self.stickImage.Size = UDim2.new(0, self.thumbstickSize / 2, 0, self.thumbstickSize / 2)
        self.stickImage.Position = UDim2.new(0, self.thumbstickSize / 2 - self.thumbstickSize / 4, 0, self.thumbstickSize / 2 - self.thumbstickSize / 4)
    end

    ResizeThumbstick()
    self.absoluteSizeChangedConn = (a2:GetPropertyChangedSignal("AbsoluteSize")):Connect(ResizeThumbstick)
    if u37 then
        self.avatarAbilitiesEnabledChangedConn = u47.GetEnabledChangedSignal():Connect(ResizeThumbstick)
    end
    ImageLabel.Parent = self.thumbstickFrame
    self.stickImage.Parent = self.thumbstickFrame
    local u115 = nil

    local function DoMove(a1) -- Line: 154 -- upvalues: self (val) -- types: a1: userdata
        local v1 = a1 / (self.thumbstickSize / 2)
        local magnitude = v1.magnitude
        if not (magnitude < 0.05) then
            v1 = v1.unit * math.min(1, (magnitude - 0.05) / 0.95)
            v1 = Vector3.new(v1.X, 0, v1.Y)
        else
            v1 = Vector3.new()
        end
        self.moveVector = v1
    end

    local function MoveStick(a1) -- Line: 172 -- upvalues: u115 (ref), self (val) -- types: a1: vector
        local v1 = Vector2.new(a1.X - u115.X, a1.Y - u115.Y)
        local magnitude = v1.magnitude
        local v2 = self.thumbstickFrame.AbsoluteSize.X / 2
        if not self.isFollowStick or not (v2 < magnitude) then
            v1 = v1.unit * (math.min(magnitude, v2))
        else
            local v3 = v1.unit * v2
            self.thumbstickFrame.Position = UDim2.new(0, a1.X - self.thumbstickFrame.AbsoluteSize.X / 2 - v3.X, 0, a1.Y - self.thumbstickFrame.AbsoluteSize.Y / 2 - v3.Y)
        end
        self.stickImage.Position = UDim2.new(0, v1.X + self.stickImage.AbsoluteSize.X / 2, 0, v1.Y + self.stickImage.AbsoluteSize.Y / 2)
    end

    self.thumbstickFrame.InputBegan:Connect(function(a1) -- Line: 189 -- upvalues: self (val), u115 (ref) -- types: a1: userdata
        if not self.moveTouchObject
            and a1.UserInputType == Enum.UserInputType.Touch
            and a1.UserInputState == Enum.UserInputState.Begin then
            self.moveTouchObject = a1
            self.thumbstickFrame.Position = UDim2.new(0, a1.Position.X - self.thumbstickFrame.Size.X.Offset / 2, 0, a1.Position.Y - self.thumbstickFrame.Size.Y.Offset / 2)
            u115 = Vector2.new(
                self.thumbstickFrame.AbsolutePosition.X + self.thumbstickFrame.AbsoluteSize.X / 2,
                self.thumbstickFrame.AbsolutePosition.Y + self.thumbstickFrame.AbsoluteSize.Y / 2
            )
            Vector2.new(a1.Position.X - u115.X, a1.Position.Y - u115.Y)
            return
        end
    end)
    self.onTouchMovedConn = UserInputService.TouchMoved:Connect(function(a1, a2) -- Line: 204 -- upvalues: self (val), u115 (ref), MoveStick (val) -- types: a1: userdata, a2: boolean
        if a1 == self.moveTouchObject then
            u115 = Vector2.new(
                self.thumbstickFrame.AbsolutePosition.X + self.thumbstickFrame.AbsoluteSize.X / 2,
                self.thumbstickFrame.AbsolutePosition.Y + self.thumbstickFrame.AbsoluteSize.Y / 2
            )
            local v1 = (Vector2.new(a1.Position.X - u115.X, a1.Position.Y - u115.Y)) / (self.thumbstickSize / 2)
            local magnitude = v1.magnitude
            if not (magnitude < 0.05) then
                v1 = v1.unit * math.min(1, (magnitude - 0.05) / 0.95)
                v1 = Vector3.new(v1.X, 0, v1.Y)
            else
                v1 = Vector3.new()
            end
            self.moveVector = v1
            MoveStick(a1.Position)
        end
    end)
    self.onTouchEndedConn = UserInputService.TouchEnded:Connect(function(a1, a2) -- Line: 214 -- upvalues: self (val)
        if a1 == self.moveTouchObject then
            self:OnInputEnded()
        end
    end)
    GuiService.MenuOpened:Connect(function() -- Line: 220 -- upvalues: self (val)
        if self.moveTouchObject then
            self:OnInputEnded()
        end
    end)
    self.thumbstickFrame.Parent = a2
end

return u60