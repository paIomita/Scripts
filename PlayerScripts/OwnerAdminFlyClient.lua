-- Path: Players.Drrrrrrrrragonball.PlayerScripts.OwnerAdminFlyClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.OwnerAdminFlyClient
-- Decompile time: 2.92 ms

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local u21 = {}
local u22 = nil
local u23 = nil
local u24 = nil
local u25 = nil
local u26 = nil
local u27 = nil
local u28 = {
    [Enum.KeyCode.W] = true,
    [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true,
    [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Space] = true,
    [Enum.KeyCode.BackSlash] = true,
}

local function getFlat(a1) -- Line: 24
    local v1 = Vector3.new(a1.X, 0, a1.Z)
    return 0.001 < v1.Magnitude and v1.Unit or Vector3.new(0, 0, 0)
end

local function destroyFlyObjects() -- Line: 29
    -- upvalues: u27 (ref), u25 (ref), u23 (ref), u24 (ref), u22 (ref), u26 (ref)
    if u27 then
        u27:Disconnect()
        u27 = nil
    end
    if u25 then
        u25.PlatformStand = false
        u25.AutoRotate = true
    end
    if u23 then
        u23:Destroy()
        u23 = nil
    end
    if u24 then
        u24:Destroy()
        u24 = nil
    end
    if u22 then
        u22:Destroy()
        u22 = nil
    end
    u25 = nil
    u26 = nil
end

local function getMoveVector(a1) -- Line: 54 -- upvalues: u21 (val)
    local v1 = Vector3.new(0, 0, 0)
    local LookVector = a1.CFrame.LookVector
    local v2 = Vector3.new(LookVector.X, 0, LookVector.Z)
    local Unit = 0.001 < v2.Magnitude and v2.Unit or Vector3.new(0, 0, 0)
    local RightVector = a1.CFrame.RightVector
    local v3 = Vector3.new(RightVector.X, 0, RightVector.Z)
    local Unit_2 = 0.001 < v3.Magnitude and v3.Unit or Vector3.new(0, 0, 0)
    if u21[Enum.KeyCode.W] then
        v1 = v1 + Unit
    end
    if u21[Enum.KeyCode.S] then
        v1 = v1 - Unit
    end
    if u21[Enum.KeyCode.D] then
        v1 = v1 + Unit_2
    end
    if u21[Enum.KeyCode.A] then
        v1 = v1 - Unit_2
    end
    if u21[Enum.KeyCode.Space] then
        v1 = v1 + Vector3.new(0, 1, 0)
    end
    if u21[Enum.KeyCode.BackSlash] then
        v1 = v1 - Vector3.new(0, 1, 0)
    end
    return 0.001 < v1.Magnitude and v1.Unit or Vector3.new(0, 0, 0)
end

local function startFlying() -- Line: 67
    -- upvalues: destroyFlyObjects (val), LocalPlayer (val), u25 (ref), u26 (ref), u22 (ref), u23 (ref), u24 (ref)
    -- upvalues: u27 (ref), RunService (val), Workspace (val), getMoveVector (val)
    destroyFlyObjects()
    local Character = LocalPlayer.Character
    u25 = Character and Character:FindFirstChildOfClass("Humanoid")
    u26 = Character and Character:FindFirstChild("HumanoidRootPart")
    if u25 and u26 then
        u22 = Instance.new("Attachment")
        u22.Name = "OwnerAdminFlyAttachment"
        u22.Parent = u26
        u23 = Instance.new("LinearVelocity")
        u23.Name = "OwnerAdminFlyVelocity"
        u23.Attachment0 = u22
        u23.MaxForce = (1 / 0)
        u23.RelativeTo = Enum.ActuatorRelativeTo.World
        u23.VectorVelocity = Vector3.new(0, 0, 0)
        u23.Parent = u26
        u24 = Instance.new("AlignOrientation")
        u24.Name = "OwnerAdminFlyOrientation"
        u24.Attachment0 = u22
        u24.MaxTorque = (1 / 0)
        u24.Responsiveness = 18
        u24.Mode = Enum.OrientationAlignmentMode.OneAttachment
        u24.Parent = u26
        u25.PlatformStand = true
        u25.AutoRotate = false
        RunService.RenderStepped:Connect(function() -- Line: 98
            -- upvalues: LocalPlayer (upval), u26 (upval), destroyFlyObjects (upval), Workspace (upval), u23 (upval)
            -- upvalues: getMoveVector (upval), u24 (upval)
            if LocalPlayer:GetAttribute("OwnerAdminFly") == true and u26 and u26.Parent then
                local CurrentCamera = Workspace.CurrentCamera
                if not CurrentCamera then
                    return
                end
                local v1 = tonumber((LocalPlayer:GetAttribute("OwnerAdminFlySpeed"))) or 70
                u23.VectorVelocity = getMoveVector(CurrentCamera) * v1
                local LookVector = CurrentCamera.CFrame.LookVector
                local v2 = Vector3.new(LookVector.X, 0, LookVector.Z)
                local Unit = 0.001 < v2.Magnitude and v2.Unit or Vector3.new(0, 0, 0)
                if 0.001 < Unit.Magnitude then
                    u24.CFrame = CFrame.lookAt(u26.Position, u26.Position + Unit)
                end
                return
            end
            destroyFlyObjects()
        end)
        return
    end
end

UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 124 -- upvalues: u28 (val), u21 (val)
    if a2 then
        return
    end
    if u28[a1.KeyCode] then
        u21[a1.KeyCode] = true
    end
end)
UserInputService.InputEnded:Connect(function(a1) -- Line: 131 -- upvalues: u28 (val), u21 (val)
    if u28[a1.KeyCode] then
        u21[a1.KeyCode] = nil
    end
end)
;(LocalPlayer:GetAttributeChangedSignal("OwnerAdminFly")):Connect(function() -- Line: 116 -- upvalues: LocalPlayer (val), startFlying (val), destroyFlyObjects (val)
    if LocalPlayer:GetAttribute("OwnerAdminFly") == true then
        startFlying()
        return
    end
    destroyFlyObjects()
end)
LocalPlayer.CharacterAdded:Connect(function() -- Line: 138 -- upvalues: LocalPlayer (val), startFlying (val), destroyFlyObjects (val)
    task.wait(0.25)
    if LocalPlayer:GetAttribute("OwnerAdminFly") == true then
        startFlying()
        return
    end
    destroyFlyObjects()
end)
if LocalPlayer:GetAttribute("OwnerAdminFly") ~= true then
    destroyFlyObjects()
else
    startFlying()
end