-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.TouchJump

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.TouchJump
-- Decompile time: 2.89 ms

game:GetService("Players")
local GuiService = game:GetService("GuiService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"))
local CharacterUtil = require(CommonUtils:WaitForChild("CharacterUtil"))
local u38 = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserAllowAbilityControls")
local u48 = nil
if u38 then
    u48 = require(script.Parent:WaitForChild("AvatarAbilitiesInterface"))
end
local u49 = {
    "rbxasset://textures/ui/Input/JumpButtonRegular.png",
    "rbxasset://textures/ui/Input/JumpButtonPressed.png",
}
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local u64 = setmetatable({}, BaseCharacterController)
u64.__index = u64

function u64.new() -- Line: 61 -- upvalues: BaseCharacterController (val), u64 (val), ConnectionUtil (val)
    local v1 = BaseCharacterController.new()
    local v2 = setmetatable(v1, u64)
    v2.parentUIFrame = nil
    v2.jumpButton = nil
    v2.externallyEnabled = false
    v2.isJumping = false
    v2._active = false
    v2._connectionUtil = ConnectionUtil.new()
    return v2
end

function u64:_reset() -- Line: 75 -- upvalues: u38 (val), u48 (ref), u49 (val)
    self.isJumping = false
    self.touchObject = nil
    if self.jumpButton then
        if u38 and u48.isEnabled() then
            self.jumpButton.Image = u49[1]
            return
        end
        self.jumpButton.ImageRectOffset = Vector2.new(1, 146)
    end
end

function u64:EnableButton(a2) -- Line: 90 -- upvalues: GuiService (val)
    if a2 == self._active then
        return
    end
    if not a2 then
        if self.jumpButton then
            self.jumpButton.Visible = false
        end
        self._connectionUtil:disconnect("JUMP_INPUT_ENDED")
        self._connectionUtil:disconnect("MENU_OPENED")
    else
        if not self.jumpButton then
            self:Create()
        end
        self.jumpButton.Visible = true
        self._connectionUtil:trackConnection("JUMP_INPUT_ENDED", (self.jumpButton.InputEnded:Connect(function(a1) -- Line: 105 -- upvalues: self (val)
            if a1 == self.touchObject then
                self:_reset()
            end
        end)))
        self._connectionUtil:trackConnection("MENU_OPENED", (GuiService.MenuOpened:Connect(function() -- Line: 115 -- upvalues: self (val)
            if self.touchObject then
                self:_reset()
            end
        end)))
    end
    self:_reset()
    self._active = a2
end

function u64:UpdateEnabled() -- Line: 132 -- upvalues: CharacterUtil (val)
    local v1 = CharacterUtil.getChild("Humanoid", "Humanoid")
    if v1 and self.externallyEnabled then
        if v1.UseJumpPower and 0 < v1.JumpPower then
            if v1:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
                self:EnableButton(true)
                return
            end
            self:EnableButton(false)
            return
        end
        if not v1.UseJumpPower and 0 < v1.JumpHeight and v1:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
            self:EnableButton(true)
            return
        end
    end
    self:EnableButton(false)
end

function u64:_setupConfigurations() -- Line: 141 -- upvalues: CharacterUtil (val)
    local function update() -- Line: 142 -- upvalues: self (val)
        self:UpdateEnabled()
    end

    self._connectionUtil:trackConnection("HUMANOID", (CharacterUtil.onChild("Humanoid", "Humanoid", function(a1) -- Line: 147 -- upvalues: self (val), update (val)
        self:UpdateEnabled()
        self:_reset()
        self._connectionUtil:trackConnection("HUMANOID_JUMP_POWER", ((a1:GetPropertyChangedSignal("JumpPower")):Connect(update)))
        self._connectionUtil:trackConnection("HUMANOID_JUMP_HEIGHT", ((a1:GetPropertyChangedSignal("JumpHeight")):Connect(update)))
        self._connectionUtil:trackConnection("HUMANOID_STATE_ENABLED_CHANGED", (a1.StateEnabledChanged:Connect(function(a1, a2) -- Line: 160 -- upvalues: self (upval)
            if a1 == Enum.HumanoidStateType.Jumping and a2 ~= self._active then
                self:UpdateEnabled()
            end
        end)))
    end)))
end

function u64.Enable(a1, a2, a3) -- Line: 172
    if a3 then
        a1.parentUIFrame = a3
    end
    if a1.externallyEnabled == a2 then
        return
    end
    a1.externallyEnabled = a2
    a1:UpdateEnabled()
    if a2 then
        a1:_setupConfigurations()
        return
    end
    a1._connectionUtil:disconnectAll()
end

function u64:Create() -- Line: 189 -- upvalues: u38 (val), u48 (ref), u49 (val)
    if not self.parentUIFrame then
        return
    end
    if self.jumpButton then
        self.jumpButton:Destroy()
        self.jumpButton = nil
    end
    if self.absoluteSizeChangedConn then
        self.absoluteSizeChangedConn:Disconnect()
        self.absoluteSizeChangedConn = nil
    end
    if u38 and self.avatarAbilitiesEnabledChangedConn then
        self.avatarAbilitiesEnabledChangedConn:Disconnect()
        self.avatarAbilitiesEnabledChangedConn = nil
    end
    self.jumpButton = Instance.new("ImageButton")
    self.jumpButton.Name = "JumpButton"
    self.jumpButton.Visible = false
    self.jumpButton.BackgroundTransparency = 1
    if not u38 or not u48.isEnabled() then
        self.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
        self.jumpButton.ImageRectOffset = Vector2.new(1, 146)
        self.jumpButton.ImageRectSize = Vector2.new(144, 144)
    else
        self.jumpButton.Image = u49[1]
    end

    local function ResizeJumpButton() -- Line: 224 -- upvalues: self (val), u38 (upval), u48 (upval), u49 (upval)
        local v1, v2
        local v3 = (math.min(self.parentUIFrame.AbsoluteSize.x, self.parentUIFrame.AbsoluteSize.y)) <= 500
        if u38 and u48.isEnabled() then
            local v4
            v1 = if not v3 then 100 else 64
            local v5 = if not v3 then 112 else 64
            v2 = -(if not v3 then 120 else 72) - v1
            v1 = -v4 - v5
            self.jumpButton.Image = u49[1]
            self.jumpButton.ImageRectOffset = Vector2.new(0, 0)
            self.jumpButton.ImageRectSize = Vector2.new(0, 0)
            self.jumpButton.Size = UDim2.new(0, v4, 0, v4)
            self.jumpButton.Position = UDim2.new(1, v2, 1, v1)
            return
        end
        v1 = if not v3 then 120 else 70
        if u38 then
            self.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
            self.jumpButton.ImageRectOffset = Vector2.new(1, 146)
            self.jumpButton.ImageRectSize = Vector2.new(144, 144)
        end
        self.jumpButton.Size = UDim2.new(0, v1, 0, v1)
        local jumpButton = self.jumpButton
        v2 = v3 and UDim2.new(1, -(v1 * 1.5 - 10), 1, -v1 - 20) or UDim2.new(1, -(v1 * 1.5 - 10), 1, -v1 * 1.75)
        jumpButton.Position = v2
    end

    ResizeJumpButton()
    self.absoluteSizeChangedConn = (self.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize")):Connect(ResizeJumpButton)
    if u38 then
        self.avatarAbilitiesEnabledChangedConn = u48.GetEnabledChangedSignal():Connect(ResizeJumpButton)
    end
    self.touchObject = nil
    self.jumpButton.InputBegan:connect(function(a1) -- Line: 262 -- upvalues: self (val), u38 (upval), u48 (upval), u49 (upval)
        if not self.touchObject
            and a1.UserInputType == Enum.UserInputType.Touch
            and a1.UserInputState == Enum.UserInputState.Begin then
            self.touchObject = a1
            if not u38 or not u48.isEnabled() then
                self.jumpButton.ImageRectOffset = Vector2.new(146, 146)
            else
                self.jumpButton.Image = u49[2]
            end
            self.isJumping = true
            return
        end
    end)
    self.jumpButton.Parent = self.parentUIFrame
end

return u64