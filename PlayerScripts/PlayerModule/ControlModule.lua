-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule
-- Decompile time: 8.12 ms

local u0 = {}
u0.__index = u0
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Workspace = game:GetService("Workspace")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local VRService = game:GetService("VRService")
script.Parent:WaitForChild("CommonUtils")
local Keyboard = require(script:WaitForChild("Keyboard"))
local Gamepad = require(script:WaitForChild("Gamepad"))
local DynamicThumbstick = require(script:WaitForChild("DynamicThumbstick"))
local success, err = pcall(function() -- Line: 41
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local u69 = success and err
local TouchThumbstick = require(script:WaitForChild("TouchThumbstick"))
local ClickToMoveController = require(script:WaitForChild("ClickToMoveController"))
local TouchJump = require(script:WaitForChild("TouchJump"))
local VehicleController = require(script:WaitForChild("VehicleController"))
local success_2, err_2 = pcall(function() -- Line: 58
    return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsSupportMicroGamepad")
end)
local u103 = success_2 and err_2
local Value = Enum.ContextActionPriority.Medium.Value
local u106 = {
    [Enum.TouchMovementMode.DPad] = DynamicThumbstick,
    [Enum.DevTouchMovementMode.DPad] = DynamicThumbstick,
    [Enum.TouchMovementMode.Thumbpad] = DynamicThumbstick,
    [Enum.DevTouchMovementMode.Thumbpad] = DynamicThumbstick,
    [Enum.TouchMovementMode.Thumbstick] = TouchThumbstick,
    [Enum.DevTouchMovementMode.Thumbstick] = TouchThumbstick,
    [Enum.TouchMovementMode.DynamicThumbstick] = DynamicThumbstick,
    [Enum.DevTouchMovementMode.DynamicThumbstick] = DynamicThumbstick,
    [Enum.TouchMovementMode.ClickToMove] = ClickToMoveController,
    [Enum.DevTouchMovementMode.ClickToMove] = ClickToMoveController,
    [Enum.TouchMovementMode.Default] = DynamicThumbstick,
    [Enum.ComputerMovementMode.Default] = Keyboard,
    [Enum.ComputerMovementMode.KeyboardMouse] = Keyboard,
    [Enum.DevComputerMovementMode.KeyboardMouse] = Keyboard,
    [Enum.DevComputerMovementMode.Scriptable] = nil,
    [Enum.ComputerMovementMode.ClickToMove] = ClickToMoveController,
    [Enum.DevComputerMovementMode.ClickToMove] = ClickToMoveController,
}

function u0.new() -- Line: 92
    -- upvalues: u0 (val), Players (val), VehicleController (val), Value (val), RunService (val), UserGameSettings (val)
    -- upvalues: GuiService (val), UserInputService (val)
    local u3 = setmetatable({}, u0)
    u3.controllers = {}
    u3.activeControlModule = nil
    u3.activeController = nil
    u3.touchJumpController = nil
    u3.moveFunction = Players.LocalPlayer.Move
    u3.humanoid = nil
    u3.controlsEnabled = true
    u3.humanoidSeatedConn = nil
    u3.vehicleController = nil
    u3.touchControlFrame = nil
    u3.currentTorsoAngle = 0
    u3.inputMoveVector = Vector3.new(0, 0, 0)
    u3.vehicleController = VehicleController.new(Value)
    Players.LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 117 -- upvalues: u3 (val)
        u3:OnCharacterAdded(a1)
    end)
    Players.LocalPlayer.CharacterRemoving:Connect(function(a1) -- Line: 118 -- upvalues: u3 (val)
        u3:OnCharacterRemoving(a1)
    end)
    if Players.LocalPlayer.Character then
        u3:OnCharacterAdded(Players.LocalPlayer.Character)
    end
    RunService:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(a1) -- Line: 123 -- upvalues: u3 (val)
        u3:OnRenderStepped(a1)
    end)
    ;(UserGameSettings:GetPropertyChangedSignal("TouchMovementMode")):Connect(function() -- Line: 127 -- upvalues: u3 (val)
        u3:UpdateMovementMode()
    end)
    ;(Players.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode")):Connect(function() -- Line: 130 -- upvalues: u3 (val)
        u3:UpdateMovementMode()
    end)
    ;(UserGameSettings:GetPropertyChangedSignal("ComputerMovementMode")):Connect(function() -- Line: 134 -- upvalues: u3 (val)
        u3:UpdateMovementMode()
    end)
    ;(Players.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode")):Connect(function() -- Line: 137 -- upvalues: u3 (val)
        u3:UpdateMovementMode()
    end)
    u3.playerGui = nil
    u3.touchGui = nil
    u3.playerGuiAddedConn = nil
    ;(GuiService:GetPropertyChangedSignal("TouchControlsEnabled")):Connect(function() -- Line: 146 -- upvalues: u3 (val)
        u3:UpdateMovementMode()
        u3:UpdateActiveControlModuleEnabled()
    end)
    ;(UserInputService:GetPropertyChangedSignal("PreferredInput")):Connect(function() -- Line: 151 -- upvalues: u3 (val)
        u3:UpdateMovementMode()
    end)
    u3.playerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not u3.playerGui then
        u3.playerGuiAddedConn = Players.LocalPlayer.ChildAdded:Connect(function(a1) -- Line: 157 -- upvalues: u3 (val)
            if a1:IsA("PlayerGui") then
                u3.playerGui = a1
                u3.playerGuiAddedConn:Disconnect()
                u3.playerGuiAddedConn = nil
                u3:UpdateMovementMode()
            end
        end)
    end
    u3:UpdateMovementMode()
    return u3
end

function u0:GetMoveVector() -- Line: 175
    if self.activeController then
        return self.activeController:GetMoveVector()
    end
    return (Vector3.new(0, 0, 0))
end

local function NormalizeAngle(a1) -- Line: 182
    local v1 = (a1 + 12.566370614359172) % 6.283185307179586
    if v1 > 3.141592653589793 then
        v1 = v1 - 6.283185307179586
    end
    return v1
end

local function AverageAngle(a1, a2) -- Line: 190
    local v1 = (a2 - a1 + 12.566370614359172) % 6.283185307179586
    if v1 > 3.141592653589793 then
        v1 = v1 - 6.283185307179586
    end
    local v2 = (a1 + v1 / 2 + 12.566370614359172) % 6.283185307179586
    if v2 > 3.141592653589793 then
        v2 = v2 - 6.283185307179586
    end
    return v2
end

function u0:GetEstimatedVRTorsoFrame() -- Line: 195 -- upvalues: VRService (val)
    local v1
    local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
    _, v1 = UserCFrame:ToEulerAnglesYXZ()
    v1 = -v1
    local v2 = VRService
    if not v2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
        self.currentTorsoAngle = v1
    else
        v2 = VRService
        if v2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
            local UserCFrame_2 = VRService:GetUserCFrame(Enum.UserCFrame.LeftHand)
            local v3 = VRService:GetUserCFrame(Enum.UserCFrame.RightHand)
            v2 = UserCFrame.Position - UserCFrame_2.Position
            local v4 = UserCFrame.Position - v3.Position
            v3 = -math.atan2(v2.X, v2.Z)
            local v5 = (-math.atan2(v4.X, v4.Z) - v3 + 12.566370614359172) % 6.283185307179586
            if v5 > 3.141592653589793 then
                v5 = v5 - 6.283185307179586
            end
            v4 = (v3 + v5 / 2 + 12.566370614359172) % 6.283185307179586
            if v4 > 3.141592653589793 then
                v4 = v4 - 6.283185307179586
            end
            v2 = (v1 - self.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
            if v2 > 3.141592653589793 then
                v2 = v2 - 6.283185307179586
            end
            v3 = (v4 - self.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
            if v3 > 3.141592653589793 then
                v3 = v3 - 6.283185307179586
            end
            v4 = false
            if v3 > -1.5707963267948966 then
                v4 = v3 < 1.5707963267948966
            end
            if not v4 then
                v3 = v2
            end
            v4 = math.min(v3, v2)
            v5 = math.max(v3, v2)
            v2 = 0
            if v4 > 0 then
                v2 = v4
            elseif v5 < 0 then
                v2 = v5
            end
            self.currentTorsoAngle = v2 + self.currentTorsoAngle
        else
            self.currentTorsoAngle = v1
        end
    end
    return (CFrame.new(UserCFrame.Position)) * CFrame.fromEulerAnglesYXZ(0, -self.currentTorsoAngle, 0)
end

function u0.GetActiveController(a1) -- Line: 239
    return a1.activeController
end

function u0:UpdateActiveControlModuleEnabled() -- Line: 244
    -- upvalues: Players (val), UserInputService (val), ClickToMoveController (val), TouchThumbstick (val)
    -- upvalues: DynamicThumbstick (val), TouchJump (val), GuiService (val)
    local function v1() -- Line: 246 -- upvalues: self (val), Players (upval)
        self.activeController:Enable(false)
        if self.touchJumpController then
            self.touchJumpController:Enable(false)
        end
        if self.moveFunction then
            self.moveFunction(Players.LocalPlayer, Vector3.new(0, 0, 0), true)
        end
    end

    local function v2() -- Line: 257
        -- upvalues: self (val), UserInputService (upval), ClickToMoveController (upval), TouchThumbstick (upval)
        -- upvalues: DynamicThumbstick (upval), TouchJump (upval), Players (upval)
        if not self.touchControlFrame or UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
            if self.touchJumpController then
                self.touchJumpController:Enable(false)
            end
        elseif self.activeControlModule == ClickToMoveController
            or self.activeControlModule == TouchThumbstick
            or self.activeControlModule == DynamicThumbstick then
            if not self.controllers[TouchJump] then
                self.controllers[TouchJump] = (TouchJump.new())
            end
            self.touchJumpController = self.controllers[TouchJump]
            self.touchJumpController:Enable(true, self.touchControlFrame)
        elseif self.touchJumpController then
            self.touchJumpController:Enable(false)
        end
        if self.activeControlModule == ClickToMoveController then
            self.activeController:Enable(
                true,
                Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice,
                self.touchJumpController
            )
            return
        end
        if self.touchControlFrame then
            self.activeController:Enable(true, self.touchControlFrame)
            return
        end
        self.activeController:Enable(true)
    end

    if not self.activeController then
        return
    end
    if not self.controlsEnabled then
        self.activeController:Enable(false)
        if self.touchJumpController then
            self.touchJumpController:Enable(false)
        end
        if self.moveFunction then
            self.moveFunction(Players.LocalPlayer, Vector3.new(0, 0, 0), true)
        end
        return
    end
    if not GuiService.TouchControlsEnabled and UserInputService.PreferredInput == Enum.PreferredInput.Touch then
        if self.activeControlModule ~= ClickToMoveController
            and self.activeControlModule ~= TouchThumbstick
            and self.activeControlModule ~= DynamicThumbstick then
            v2()
            return
        end
        self.activeController:Enable(false)
        if self.touchJumpController then
            self.touchJumpController:Enable(false)
        end
        if self.moveFunction then
            self.moveFunction(Players.LocalPlayer, Vector3.new(0, 0, 0), true)
        end
        return
    end
    v2()
end

function u0:Enable(a2) -- Line: 315 -- types: self: table, a2: boolean?
    if a2 == nil then
        a2 = true
    end
    if self.controlsEnabled == a2 then
        return
    end
    self.controlsEnabled = a2
    if not self.activeController then
        return
    end
    self:UpdateActiveControlModuleEnabled()
end

function u0.Disable(a1) -- Line: 330
    a1:Enable(false)
end

function u0.SelectComputerMovementModule(a1) -- Line: 336
    -- upvalues: UserInputService (val), Players (val), u103 (ref), Gamepad (val), Keyboard (val)
    -- upvalues: UserGameSettings (val), ClickToMoveController (val), u106 (val)
    if not UserInputService.KeyboardEnabled and not UserInputService.GamepadEnabled then
        return nil, false
    end
    local v1 = nil
    local DevComputerMovementMode = Players.LocalPlayer.DevComputerMovementMode
    if DevComputerMovementMode ~= Enum.DevComputerMovementMode.UserChoice then
        v1 = u106[DevComputerMovementMode]
        if not v1 and DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable then
            warn("No character control module is associated with DevComputerMovementMode ", DevComputerMovementMode)
        end
    else
        local u12 = false
        if u103 then
            pcall(function() -- Line: 347 -- upvalues: u12 (ref), UserInputService (upval)
                u12 = UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad
            end)
        end
        if UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or u12 then
            v1 = Gamepad
        elseif UserInputService.PreferredInput == Enum.PreferredInput.KeyboardAndMouse then
            v1 = Keyboard
        end
        if UserGameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v1 == Keyboard then
            v1 = ClickToMoveController
        end
    end
    if v1 then
        return v1, true
    end
    if DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then
        return nil, true
    end
    return nil, false
end

function u0.SelectTouchModule(a1) -- Line: 385 -- upvalues: Players (val), u106 (val), UserGameSettings (val)
    local v1
    local DevTouchMovementMode = Players.LocalPlayer.DevTouchMovementMode
    if DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
        v1 = u106[UserGameSettings.TouchMovementMode]
        return v1, true
    end
    if DevTouchMovementMode == Enum.DevTouchMovementMode.Scriptable then
        return nil, true
    end
    v1 = u106[DevTouchMovementMode]
    return v1, true
end

local function getGamepadRightThumbstickPosition() -- Line: 398 -- upvalues: UserInputService (val)
    for k, v in pairs((UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1))) do
        if v.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v.Position
        end
    end
    return (Vector3.new(0, 0, 0))
end

function u0:calculateRawMoveVector(a2, a3) -- Line: 408
    -- upvalues: Workspace (val), VRService (val), getGamepadRightThumbstickPosition (val)
    local Components_10, Components_11, Components_12, Components_3, Components_9, v1, v2
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return a3
    end
    local CFrame_2 = CurrentCamera.CFrame
    if VRService.VREnabled and a2.RootPart then
        VRService:GetUserCFrame(Enum.UserCFrame.Head)
        v1 = self:GetEstimatedVRTorsoFrame()
        CFrame_2 = if not ((CurrentCamera.Focus.Position - CFrame_2.Position).Magnitude < 3) then CurrentCamera.CFrame * (v1.Rotation + v1.Position * CurrentCamera.HeadScale) else CFrame_2 * v1
    end
    if (a2:GetState()) == Enum.HumanoidStateType.Swimming then
        local v3
        if not VRService.VREnabled then
            return CFrame_2:VectorToWorldSpace(a3)
        end
        local v4 = Vector3.new(a3.X, 0, a3.Z)
        if v4.Magnitude < 0.01 then
            return (Vector3.new(0, 0, 0))
        end
        local v5 = -getGamepadRightThumbstickPosition().Y * 1.3962634015954636
        v1 = math.atan2(-v4.X, -v4.Z)
        _, v3 = CFrame_2:ToEulerAnglesYXZ()
        v1 = v1 + v3
        return CFrame.fromEulerAnglesYXZ(v5, v1, 0).LookVector
    end
    _, _, _, Components_9, Components_10, Components_11, _, _, Components_3, _, _, Components_12 = CFrame_2:GetComponents()
    if not (Components_3 < 1) or not (Components_3 > -1) then
        v1 = Components_9
        v2 = -Components_10 * math.sign(Components_3)
    else
        v1 = Components_12
        v2 = Components_11
    end
    local v6 = math.sqrt(v1 * v1 + v2 * v2)
    return (Vector3.new((v1 * a3.X + v2 * a3.Z) / v6, 0, (v1 * a3.Z - v2 * a3.X) / v6))
end

function u0:OnRenderStepped(a2) -- Line: 467 -- upvalues: Gamepad (val), VRService (val), Players (val)
    if self.activeController and self.activeController.enabled and self.humanoid then
        local MoveVector = self.activeController:GetMoveVector()
        local v1 = self.activeController:IsMoveVectorCameraRelative()
        local ClickToMoveController = self:GetClickToMoveController()
        if self.activeController == ClickToMoveController then
            ClickToMoveController:OnRenderStepped(a2)
        elseif not (0 < MoveVector.magnitude) then
            ClickToMoveController:OnRenderStepped(a2)
            MoveVector = ClickToMoveController:GetMoveVector()
            v1 = ClickToMoveController:IsMoveVectorCameraRelative()
        else
            ClickToMoveController:CleanupPath()
        end
        if self.vehicleController then
            local v2, v3 = self.vehicleController:Update(MoveVector, v1, self.activeControlModule == Gamepad)
            MoveVector = v2
        end
        if v1 then
            MoveVector = self:calculateRawMoveVector(self.humanoid, MoveVector)
        end
        self.inputMoveVector = MoveVector
        if VRService.VREnabled then
            MoveVector = self:updateVRMoveVector(MoveVector)
        end
        self.moveFunction(Players.LocalPlayer, MoveVector, false)
        local humanoid_2 = self.humanoid
        local IsJumping = self.activeController:GetIsJumping() or self.touchJumpController and self.touchJumpController:GetIsJumping()
        humanoid_2.Jump = IsJumping
    end
end

function u0:updateVRMoveVector(a2) -- Line: 516 -- upvalues: VRService (val)
    local CurrentCamera = workspace.CurrentCamera
    local v1 = CurrentCamera.Focus.Position - CurrentCamera.CFrame.Position
    local v2 = false
    if v1.Magnitude < 5 then
        v2 = true
    end
    if a2.Magnitude == 0 and v2 and VRService.AvatarGestures and self.humanoid and not self.humanoid.Sit then
        v1 = VRService:GetUserCFrame(Enum.UserCFrame.Head)
        v1 = v1.Rotation + v1.Position * CurrentCamera.HeadScale
        local v3 = -0.7 * self.humanoid.RootPart.Size.Y / 2
        v3 = (CurrentCamera.CFrame * v1 * CFrame.new(0, v3, 0)).Position - self.humanoid.RootPart.CFrame.Position
        return (Vector3.new(v3.x, 0, v3.z))
    end
    return a2
end

function u0:OnHumanoidSeated(a2, a3) -- Line: 541
    -- upvalues: Value (val)
    if not a2 then
        if self.vehicleController then
            self.vehicleController:Enable(false, a3)
        end
        return
    end
    if a3 and a3:IsA("VehicleSeat") then
        if not self.vehicleController then
            self.vehicleController = self.vehicleController.new(Value)
        end
        self.vehicleController:Enable(true, a3)
        return
    end
end

function u0:OnCharacterAdded(a2) -- Line: 556
    self.humanoid = a2:FindFirstChildOfClass("Humanoid")
    while not self.humanoid do
        a2.ChildAdded:wait()
        self.humanoid = a2:FindFirstChildOfClass("Humanoid")
    end
    if self.humanoidSeatedConn then
        self.humanoidSeatedConn:Disconnect()
        self.humanoidSeatedConn = nil
    end
    self.humanoidSeatedConn = self.humanoid.Seated:Connect(function(a1, a2) -- Line: 567 -- upvalues: self (val)
        self:OnHumanoidSeated(a1, a2)
    end)
    self:UpdateMovementMode()
end

function u0:OnCharacterRemoving(a2) -- Line: 574
    self.humanoid = nil
    self:UpdateMovementMode()
end

function u0:UpdateTouchGuiVisibility() -- Line: 580 -- upvalues: GuiService (val), UserInputService (val)
    local humanoid = self.humanoid and GuiService.TouchControlsEnabled and UserInputService.PreferredInput == Enum.PreferredInput.Touch
    if humanoid and not self.touchGui then
        self:CreateTouchGuiContainer()
    end
    if self.touchGui then
        self.touchGui.Enabled = not not humanoid
    end
end

function u0:SwitchToController(a2) -- Line: 599 -- upvalues: Value (val)
    if not a2 then
        if self.activeController then
            self.activeController:Enable(false)
        end
        self.activeController = nil
        self.activeControlModule = nil
        return
    end
    if not self.controllers[a2] then
        self.controllers[a2] = (a2.new(Value))
    end
    if self.activeController ~= self.controllers[a2] then
        if self.activeController then
            self.activeController:Enable(false)
        end
        self.activeController = self.controllers[a2]
        self.activeControlModule = a2
        self:UpdateActiveControlModuleEnabled()
    end
end

function u0:UpdateMovementMode() -- Line: 638 -- upvalues: UserInputService (val)
    self:UpdateTouchGuiVisibility()
    if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
        self:SwitchToController((self:SelectComputerMovementModule()))
        return
    end
    local v1, v2 = self:SelectTouchModule()
    if v2 and self.touchControlFrame then
        self:SwitchToController(v1)
        return
    end
end

function u0:CreateTouchGuiContainer() -- Line: 654 -- upvalues: u69 (ref)
    if not self.playerGui then
        return
    end
    if self.touchGui then
        self.touchGui:Destroy()
    end
    self.touchGui = Instance.new("ScreenGui")
    self.touchGui.Name = "TouchGui"
    self.touchGui.ResetOnSpawn = false
    self.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    if u69 then
        self.touchGui.ClipToDeviceSafeArea = false
    end
    self.touchControlFrame = Instance.new("Frame")
    self.touchControlFrame.Name = "TouchControlFrame"
    self.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
    self.touchControlFrame.BackgroundTransparency = 1
    self.touchControlFrame.Parent = self.touchGui
    self.touchGui.Parent = self.playerGui
end

function u0:GetClickToMoveController() -- Line: 680 -- upvalues: ClickToMoveController (val), Value (val)
    if not self.controllers[ClickToMoveController] then
        self.controllers[ClickToMoveController] = (ClickToMoveController.new(Value))
    end
    return self.controllers[ClickToMoveController]
end

return (u0.new())