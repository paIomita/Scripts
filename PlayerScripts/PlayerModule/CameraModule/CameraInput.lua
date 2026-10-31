-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.CameraInput

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.CameraInput
-- Decompile time: 10.19 ms

local u144
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local VRService = game:GetService("VRService")
local GuiService = game:GetService("GuiService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local u52 = FlagUtil.getUserFlag("UserPSSinkUnknownTouchEvents")
local UserPSTextboxResetCameraInput = FlagUtil.getUserFlag("UserPSTextboxResetCameraInput")
local UserFixVRCameraGamepadReset = FlagUtil.getUserFlag("UserFixVRCameraGamepadReset")
local UserPlayerScriptsSupportTVRemoteKeycodes = FlagUtil.getUserFlag("UserPlayerScriptsSupportTVRemoteKeycodes")
local LocalPlayer = Players.LocalPlayer
local Value = Enum.ContextActionPriority.Medium.Value
local u70 = Vector2.new(1, 0.77) * 0.06981317007977318 * 60
local u75 = Vector2.new(1, 0.77) * 0.008726646259971648
local u80 = Vector2.new(1, 0.77) * 0.12217304763960307
local u85 = Vector2.new(1, 0.66) * 0.017453292519943295
local BindableEvent = Instance.new("BindableEvent")
local BindableEvent_2 = Instance.new("BindableEvent")
local Event = BindableEvent.Event
local Event_2 = BindableEvent_2.Event
UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 46 -- upvalues: BindableEvent (val)
    if not a2 and a1.UserInputType == Enum.UserInputType.MouseButton2 then
        BindableEvent:Fire()
    end
end)
UserInputService.InputEnded:Connect(function(a1, a2) -- Line: 52 -- upvalues: BindableEvent_2 (val)
    if a1.UserInputType == Enum.UserInputType.MouseButton2 then
        BindableEvent_2:Fire()
    end
end)

local function thumbstickCurve(a1) -- Line: 63
    local v1 = ((math.exp(((math.abs(a1)) - 0.1) / 0.9 * 2)) - 1) / 6.38905609893065
    return (math.sign(a1)) * math.clamp(v1, 0, 1)
end

local function adjustTouchPitchSensitivity(a1) -- Line: 77 -- types: a1: userdata
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return a1
    end
    local v1 = CurrentCamera.CFrame:ToEulerAnglesYXZ()
    if 0 <= a1.Y * v1 then
        return a1
    end
    v1 = (1 - ((math.abs(v1)) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25
    return Vector2.new(1, v1) * a1
end

local function isInDynamicThumbstickArea(a1) -- Line: 103 -- upvalues: LocalPlayer (val) -- types: a1: vector
    local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local TouchGui = PlayerGui and PlayerGui:FindFirstChild("TouchGui")
    local v1 = TouchGui and TouchGui:FindFirstChild("TouchControlFrame")
    local DynamicThumbstickFrame = v1 and v1:FindFirstChild("DynamicThumbstickFrame")
    if not DynamicThumbstickFrame or not TouchGui.Enabled then
        return false
    end
    local AbsolutePosition = DynamicThumbstickFrame.AbsolutePosition
    v1 = AbsolutePosition + DynamicThumbstickFrame.AbsoluteSize
    local v2 = false
    if AbsolutePosition.X <= a1.X then
        v2 = false
        if AbsolutePosition.Y <= a1.Y then
            v2 = false
            if a1.X <= v1.X then
                v2 = a1.Y <= v1.Y
            end
        end
    end
    return v2
end

local v1 = {}
local u111 = {}
local u112 = 0

local function incPanInputCount() -- Line: 133 -- upvalues: u112 (ref)
    math.max(0, u112 + 1)
end

local function decPanInputCount() -- Line: 137 -- upvalues: u112 (ref)
    math.max(0, u112 - 1)
end

local function resetPanInputCount() -- Line: 141 -- upvalues: u112 (ref)
    u112 = 0
end

local u116 = {ButtonLeft = 0, ButtonRight = 0}
u116.Thumbstick2 = Vector2.new()
local u119 = {Left = 0, Right = 0, I = 0, O = 0}
local u120 = {Wheel = 0, Pinch = 0}
u120.Movement = Vector2.new()
u120.Pan = Vector2.new()
local u125 = {Pinch = 0}
u125.Move = Vector2.new()
local BindableEvent_3 = Instance.new("BindableEvent")
v1.gamepadZoomPress = BindableEvent_3.Event
if not UserFixVRCameraGamepadReset then
    u144 = VRService.VREnabled and Instance.new("BindableEvent") or nil
    if VRService.VREnabled then
        v1.gamepadReset = u144.Event
    end
else
    u144 = Instance.new("BindableEvent")
    v1.gamepadReset = u144.Event
end

function v1.getRotationActivated() -- Line: 182
    -- upvalues: UserPlayerScriptsSupportTVRemoteKeycodes (val), u112 (ref), u116 (val)
    local v1
    if not UserPlayerScriptsSupportTVRemoteKeycodes then
        v1 = true
        if not (u112 > 0) then
            v1 = 0 < u116.Thumbstick2.Magnitude
        end
        return v1
    end
    v1 = true
    if not (u112 > 0) then
        v1 = true
        if not (0 < u116.Thumbstick2.Magnitude) then
            v1 = u116.ButtonRight - u116.ButtonLeft ~= 0
        end
    end
    return v1
end

function v1.getRotation(a1, a2) -- Line: 192
    -- upvalues: UserGameSettings (val), u119 (val), UserPlayerScriptsSupportTVRemoteKeycodes (val), u116 (val)
    -- upvalues: u120 (val), adjustTouchPitchSensitivity (val), u125 (val), u70 (val), u75 (val), u80 (val), u85 (val)
    local v1 = Vector2.new(1, UserGameSettings:GetCameraYInvertValue())
    local v2 = Vector2.new(u119.Right - u119.Left, 0) * a1
    local v3 = if not UserPlayerScriptsSupportTVRemoteKeycodes then u116.Thumbstick2 * UserGameSettings.GamepadCameraSensitivity * a1 else (u116.Thumbstick2 + (Vector2.new(u116.ButtonRight - u116.ButtonLeft, 0))) * UserGameSettings.GamepadCameraSensitivity * a1
    local Movement = u120.Movement
    local Pan = u120.Pan
    local v4 = adjustTouchPitchSensitivity(u125.Move)
    if a2 then
        v2 = Vector2.new()
    end
    return (v2 * 2.0943951023931953 + v3 * u70 + Movement * u75 + Pan * u80 + v4 * u85) * v1
end

function v1.getZoomDelta() -- Line: 223 -- upvalues: u119 (val), u120 (val), u125 (val)
    local v1 = u119.O - u119.I
    local v2 = -u120.Wheel + u120.Pinch
    local v3 = -u125.Pinch
    return v1 * 0.1 + v2 * 1 + v3 * 0.04
end

local function thumbstick(a1, a2, a3) -- Line: 231 -- upvalues: u116 (val), thumbstickCurve (ref)
    local Position = a3.Position
    u116[a3.KeyCode.Name] = (Vector2.new(thumbstickCurve(Position.X), -thumbstickCurve(Position.Y)))
    return Enum.ContextActionResult.Pass
end

local function directionalButtons(a1, a2, a3) -- Line: 237 -- upvalues: u116 (val), thumbstickCurve (ref)
    if a2 ~= Enum.UserInputState.Cancel then
        u116[a3.KeyCode.Name] = (thumbstickCurve(a3.Position.Z))
    else
        u116[a3.KeyCode.Name] = 0
    end
    return Enum.ContextActionResult.Pass
end

local function mouseMovement(a1) -- Line: 246 -- upvalues: u120 (val)
    local Delta = a1.Delta
    u120.Movement = Vector2.new(Delta.X, Delta.Y)
end

local function mouseWheel(a1, a2, a3) -- Line: 251 -- upvalues: u120 (val)
    u120.Wheel = a3.Position.Z
    return Enum.ContextActionResult.Pass
end

local function keypress(a1, a2, a3) -- Line: 256 -- upvalues: u119 (val)
    local Name = a3.KeyCode.Name
    u119[Name] = if a2 ~= Enum.UserInputState.Begin then 0 else 1
end

local function gamepadZoomPress(a1, a2, a3) -- Line: 260 -- upvalues: BindableEvent_3 (val)
    if a2 == Enum.UserInputState.Begin then
        BindableEvent_3:Fire()
    end
end

local function gamepadReset(a1, a2, a3) -- Line: 266 -- upvalues: u144 (ref)
    if a2 == Enum.UserInputState.Begin then
        u144:Fire()
    end
end

local function resetInputDevices() -- Line: 272 -- upvalues: u116 (val), u119 (val), u120 (val), u125 (val), u112 (ref)
    for k, v in pairs({u116, u119, u120, u125}) do
        for k2, i in pairs(v) do
            if type(i) ~= "boolean" then
                v[k2] = v[k2] * 0
            else
                v[k2] = false
            end
        end
    end
    u112 = 0
end

local u210 = {}
local u211 = nil
local u212 = nil

local function touchBegan(a1, a2) -- Line: 298
    -- upvalues: u211 (ref), isInDynamicThumbstickArea (val), u112 (ref), u210 (ref)
    assert(a1.UserInputType == Enum.UserInputType.Touch)
    assert(a1.UserInputState == Enum.UserInputState.Begin)
    if u211 == nil and isInDynamicThumbstickArea(a1.Position) and not a2 then
        u211 = a1
        return
    end
    if not a2 then
        math.max(0, u112 + 1)
    end
    u210[a1] = a2
end

local function touchEnded(a1, a2) -- Line: 318
    -- upvalues: u211 (ref), u210 (ref), u212 (ref), u112 (ref)
    assert(a1.UserInputType == Enum.UserInputType.Touch)
    assert(a1.UserInputState == Enum.UserInputState.End)
    if a1 == u211 then
        u211 = nil
    end
    if u210[a1] == false then
        u212 = nil
        math.max(0, u112 - 1)
    end
    u210[a1] = nil
end

local function touchChanged(a1, a2) -- Line: 337 -- upvalues: u211 (ref), u210 (ref), u52 (val), u125 (val), u212 (ref)
    local v1
    assert(a1.UserInputType == Enum.UserInputType.Touch)
    assert(a1.UserInputState == Enum.UserInputState.Change)
    if a1 == u211 then
        return
    end
    if u210[a1] == nil then
        if not u52 then
            u210[a1] = a2
        else
            u210[a1] = true
        end
    end
    local v2 = {}
    for k, v in pairs(u210) do
        if not v then
            table.insert(v2, k)
        end
    end
    if #v2 == 1 and u210[a1] == false then
        local Delta = a1.Delta
        v1 = u125
        v1.Move = v1.Move + Vector2.new(Delta.X, Delta.Y)
    end
    if #v2 ~= 2 then
        u212 = nil
        return
    end
    local Magnitude = (v2[1].Position - v2[2].Position).Magnitude
    if u212 then
        v1 = u125
        v1.Pinch = v1.Pinch + (Magnitude - u212)
    end
    u212 = Magnitude
end

local function resetTouchState() -- Line: 385 -- upvalues: u210 (ref), u211 (ref), u212 (ref), u112 (ref)
    u210 = {}
    u211 = nil
    u212 = nil
    u112 = 0
end

local function pointerAction(a1, a2, a3, a4) -- Line: 393 -- upvalues: u120 (val)
    if not a4 then
        u120.Wheel = a1
        u120.Pan = a2
        u120.Pinch = -a3
    end
end

local function inputBegan(a1, a2) -- Line: 401 -- upvalues: touchBegan (ref), u112 (ref)
    if a1.UserInputType == Enum.UserInputType.Touch then
        touchBegan(a1, a2)
        return
    end
    if a1.UserInputType == Enum.UserInputType.MouseButton2 and not a2 then
        math.max(0, u112 + 1)
    end
end

local function inputChanged(a1, a2) -- Line: 410 -- upvalues: touchChanged (ref), u120 (val)
    if a1.UserInputType == Enum.UserInputType.Touch then
        touchChanged(a1, a2)
        return
    end
    if a1.UserInputType == Enum.UserInputType.MouseMovement then
        local Delta = a1.Delta
        u120.Movement = Vector2.new(Delta.X, Delta.Y)
    end
end

local function inputEnded(a1, a2) -- Line: 419 -- upvalues: touchEnded (ref), u112 (ref)
    if a1.UserInputType == Enum.UserInputType.Touch then
        touchEnded(a1, a2)
        return
    end
    if a1.UserInputType == Enum.UserInputType.MouseButton2 then
        math.max(0, u112 - 1)
    end
end

local u227 = false

function v1.setInputEnabled(a1) -- Line: 430
    -- upvalues: u227 (ref), resetInputDevices (val), resetTouchState (ref), ContextActionService (val)
    -- upvalues: thumbstick (val), Value (val), UserPlayerScriptsSupportTVRemoteKeycodes (val), directionalButtons (val)
    -- upvalues: keypress (val), VRService (val), gamepadReset (val), gamepadZoomPress (val), u111 (ref)
    -- upvalues: UserInputService (val), inputBegan (val), inputChanged (val), inputEnded (val), pointerAction (val)
    -- upvalues: GuiService (val)
    if u227 == a1 then
        return
    end
    resetInputDevices()
    resetTouchState()
    if a1 then
        ContextActionService:BindActionAtPriority("RbxCameraThumbstick", thumbstick, false, Value, Enum.KeyCode.Thumbstick2)
        if UserPlayerScriptsSupportTVRemoteKeycodes then
            ContextActionService:BindActionAtPriority(
                "RbxCameraDirectionalButtons",
                directionalButtons,
                false,
                Value,
                Enum.KeyCode.ButtonLeft,
                Enum.KeyCode.ButtonRight
            )
        end
        ContextActionService:BindActionAtPriority(
            "RbxCameraKeypress",
            keypress,
            false,
            Value,
            Enum.KeyCode.Left,
            Enum.KeyCode.Right,
            Enum.KeyCode.I,
            Enum.KeyCode.O
        )
        if VRService.VREnabled then
            ContextActionService:BindAction("RbxCameraGamepadReset", gamepadReset, false, Enum.KeyCode.ButtonL3)
        end
        ContextActionService:BindAction("RbxCameraGamepadZoom", gamepadZoomPress, false, Enum.KeyCode.ButtonR3)
        table.insert(u111, (UserInputService.InputBegan:Connect(inputBegan)))
        table.insert(u111, (UserInputService.InputChanged:Connect(inputChanged)))
        table.insert(u111, (UserInputService.InputEnded:Connect(inputEnded)))
        table.insert(u111, (UserInputService.PointerAction:Connect(pointerAction)))
        table.insert(u111, (GuiService.MenuOpened:connect(resetTouchState)))
        return
    end
    ContextActionService:UnbindAction("RbxCameraThumbstick")
    if UserPlayerScriptsSupportTVRemoteKeycodes then
        ContextActionService:UnbindAction("RbxCameraDirectionalButtons")
    end
    ContextActionService:UnbindAction("RbxCameraMouseMove")
    ContextActionService:UnbindAction("RbxCameraMouseWheel")
    ContextActionService:UnbindAction("RbxCameraKeypress")
    ContextActionService:UnbindAction("RbxCameraGamepadZoom")
    if VRService.VREnabled then
        ContextActionService:UnbindAction("RbxCameraGamepadReset")
    end
    for k, v in pairs(u111) do
        v:Disconnect()
    end
    u111 = {}
end

function v1.getInputEnabled() -- Line: 513 -- upvalues: u227 (ref)
    return u227
end

function v1.resetInputForFrameEnd() -- Line: 517 -- upvalues: u120 (val), u125 (val)
    u120.Movement = Vector2.new()
    u125.Move = Vector2.new()
    u125.Pinch = 0
    u120.Wheel = 0
    u120.Pan = Vector2.new()
    u120.Pinch = 0
end

UserInputService.WindowFocused:Connect(resetInputDevices)
UserInputService.WindowFocusReleased:Connect(resetInputDevices)
if UserPSTextboxResetCameraInput then
    UserInputService.TextBoxFocusReleased:Connect(resetInputDevices)
end
local u265 = false
local u266 = false
local u267 = 0

function v1.getHoldPan() -- Line: 541 -- upvalues: u265 (ref)
    return u265
end

function v1.getTogglePan() -- Line: 545 -- upvalues: u266 (ref)
    return u266
end

function v1.getPanning() -- Line: 549 -- upvalues: u266 (ref), u265 (ref)
    return u266 or u265
end

function v1.setTogglePan(a1) -- Line: 553 -- upvalues: u266 (ref) -- types: a1: boolean
    u266 = a1
end

local u273 = false
local u274 = nil
local u275 = nil

function v1.enableCameraToggleInput() -- Line: 561
    -- upvalues: u273 (ref), u265 (ref), u266 (ref), u274 (ref), u275 (ref), Event (ref), u267 (ref), Event_2 (ref)
    -- upvalues: UserInputService (val)
    if u273 then
        return
    end
    u273 = true
    u265 = false
    u266 = false
    if u274 then
        u274:Disconnect()
    end
    if u275 then
        u275:Disconnect()
    end
    Event:Connect(function() -- Line: 578 -- upvalues: u265 (upval), u267 (upval)
        u265 = true
        tick()
    end)
    Event_2:Connect(function() -- Line: 583 -- upvalues: u265 (upval), u267 (upval), u266 (upval), UserInputService (upval)
        u265 = false
        if tick() - u267 < 0.3 then
            if u266 or UserInputService:GetMouseDelta().Magnitude < 2 then
                u266 = not u266
            end
        end
    end)
end

function v1.disableCameraToggleInput() -- Line: 591 -- upvalues: u273 (ref), u274 (ref), u275 (ref)
    if not u273 then
        return
    end
    u273 = false
    if u274 then
        u274:Disconnect()
        u274 = nil
    end
    if u275 then
        u275:Disconnect()
        u275 = nil
    end
end

return v1