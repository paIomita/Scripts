-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.TransparencyController

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.TransparencyController
-- Decompile time: 2.56 ms

local VRService = game:GetService("VRService")
local u5 = {"BasePart", "Decal", "Beam", "ParticleEmitter", "Trail", "Fire", "Smoke", "Sparkles", "Explosion"}
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local u23 = {}
u23.__index = u23

function u23.new() -- Line: 29 -- upvalues: u23 (val)
    local v1 = setmetatable({}, u23)
    v1.transparencyDirty = false
    v1.enabled = false
    v1.lastTransparency = nil
    v1.descendantAddedConn = nil
    v1.descendantRemovingConn = nil
    v1.toolDescendantAddedConns = {}
    v1.toolDescendantRemovingConns = {}
    v1.cachedParts = {}
    return v1
end

function u23:HasToolAncestor(a2) -- Line: 45 -- types: self: table, a2: userdata
    if a2.Parent == nil then
        return false
    end
    assert(a2.Parent, "")
    return a2.Parent:IsA("Tool") or self:HasToolAncestor(a2.Parent)
end

function u23:IsValidPartToModify(a2) -- Line: 51 -- upvalues: u5 (val) -- types: self: table, a2: userdata
    for i, j in u5 do
        if a2:IsA(j) then
            return not self:HasToolAncestor(a2)
        end
    end
    return false
end

function u23:CachePartsRecursive(a2) -- Line: 61
    if a2 then
        if self:IsValidPartToModify(a2) then
            self.cachedParts[a2] = true
            self.transparencyDirty = true
        end
        for k, v in pairs(a2:GetChildren()) do
            self:CachePartsRecursive(v)
        end
    end
end

function u23:TeardownTransparency() -- Line: 73
    for k, v in pairs(self.cachedParts) do
        k.LocalTransparencyModifier = 0
    end
    self.cachedParts = {}
    self.transparencyDirty = true
    self.lastTransparency = nil
    if self.descendantAddedConn then
        self.descendantAddedConn:disconnect()
        self.descendantAddedConn = nil
    end
    if self.descendantRemovingConn then
        self.descendantRemovingConn:disconnect()
        self.descendantRemovingConn = nil
    end
    for k2, i in pairs(self.toolDescendantAddedConns) do
        i:Disconnect()
        self.toolDescendantAddedConns[k2] = nil
    end
    for k3, j in pairs(self.toolDescendantRemovingConns) do
        j:Disconnect()
        self.toolDescendantRemovingConns[k3] = nil
    end
end

function u23:SetupTransparency(a2) -- Line: 99
    self:TeardownTransparency()
    if self.descendantAddedConn then
        self.descendantAddedConn:disconnect()
    end
    self.descendantAddedConn = a2.DescendantAdded:Connect(function(a1) -- Line: 103 -- upvalues: self (val), a2 (val)
        if self:IsValidPartToModify(a1) then
            self.cachedParts[a1] = true
            self.transparencyDirty = true
            return
        end
        if a1:IsA("Tool") then
            if self.toolDescendantAddedConns[a1] then
                self.toolDescendantAddedConns[a1]:Disconnect()
            end
            self.toolDescendantAddedConns[a1] = (a1.DescendantAdded:Connect(function(a1) -- Line: 111 -- upvalues: self (upval)
                self.cachedParts[a1] = nil
                if a1:IsA("BasePart") or a1:IsA("Decal") then
                    a1.LocalTransparencyModifier = 0
                end
            end))
            if self.toolDescendantRemovingConns[a1] then
                self.toolDescendantRemovingConns[a1]:disconnect()
            end
            self.toolDescendantRemovingConns[a1] = (a1.DescendantRemoving:Connect(function(a1) -- Line: 119 -- upvalues: a2 (upval), self (upval)
                wait()
                if a2 and a1 and a1:IsDescendantOf(a2) and self:IsValidPartToModify(a1) then
                    self.cachedParts[a1] = true
                    self.transparencyDirty = true
                end
            end))
        end
    end)
    if self.descendantRemovingConn then
        self.descendantRemovingConn:disconnect()
    end
    self.descendantRemovingConn = a2.DescendantRemoving:connect(function(a1) -- Line: 131 -- upvalues: self (val)
        if self.cachedParts[a1] then
            self.cachedParts[a1] = nil
            a1.LocalTransparencyModifier = 0
        end
    end)
    self:CachePartsRecursive(a2)
end

function u23.Enable(a1, a2) -- Line: 142 -- types: a1: table, a2: boolean
    if a1.enabled ~= a2 then
        a1.enabled = a2
    end
end

function u23.SetSubject(a1, a2) -- Line: 148
    local Parent = nil
    if a2 and a2:IsA("Humanoid") then
        Parent = a2.Parent
    end
    if a2 and a2:IsA("VehicleSeat") and a2.Occupant then
        Parent = a2.Occupant.Parent
    end
    if Parent then
        a1:SetupTransparency(Parent)
        return
    end
    a1:TeardownTransparency()
end

function u23.Update(a1, a2) -- Line: 163 -- upvalues: CameraUtils (val), VRService (val)
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera and a1.enabled then
        local v1
        local magnitude = (CurrentCamera.Focus.p - CurrentCamera.CoordinateFrame.p).magnitude
        local v2 = magnitude < 2 and 1 - (magnitude - 0.5) / 1.5 or 0
        if v2 < 0.5 then
            v2 = 0
        end
        if not a1.lastTransparency or not (v2 < 1) or not (a1.lastTransparency < 0.95) then
            a1.transparencyDirty = true
        else
            local v3 = v2 - a1.lastTransparency
            local v4 = 2.8 * a2
            v3 = math.clamp(v3, -v4, v4)
            v2 = a1.lastTransparency + v3
        end
        v2 = math.clamp(CameraUtils.Round(v2, 2), 0, 1)
        if a1.transparencyDirty then
            for k, v in pairs(a1.cachedParts) do
                if not VRService.VREnabled or not VRService.AvatarGestures then
                    k.LocalTransparencyModifier = v2
                else
                    v1 = {
                        [Enum.AccessoryType.Hat] = true,
                        [Enum.AccessoryType.Hair] = true,
                        [Enum.AccessoryType.Face] = true,
                        [Enum.AccessoryType.Eyebrow] = true,
                        [Enum.AccessoryType.Eyelash] = true,
                    }
                    if not k.Parent:IsA("Accessory") then
                        if k.Name ~= "Head" then
                            k.LocalTransparencyModifier = 0
                        else
                            k.LocalTransparencyModifier = v2
                        end
                    elseif v1[k.Parent.AccessoryType] then
                        k.LocalTransparencyModifier = v2
                    elseif k.Name ~= "Head" then
                        k.LocalTransparencyModifier = 0
                    else
                        k.LocalTransparencyModifier = v2
                    end
                end
            end
            a1.transparencyDirty = false
            a1.lastTransparency = v2
        elseif a1.lastTransparency ~= v2 then
            for k2, i in pairs(a1.cachedParts) do
                if not VRService.VREnabled or not VRService.AvatarGestures then
                    k2.LocalTransparencyModifier = v2
                else
                    v1 = {
                        [Enum.AccessoryType.Hat] = true,
                        [Enum.AccessoryType.Hair] = true,
                        [Enum.AccessoryType.Face] = true,
                        [Enum.AccessoryType.Eyebrow] = true,
                        [Enum.AccessoryType.Eyelash] = true,
                    }
                    if not k2.Parent:IsA("Accessory") then
                        if k2.Name ~= "Head" then
                            k2.LocalTransparencyModifier = 0
                        else
                            k2.LocalTransparencyModifier = v2
                        end
                    elseif v1[k2.Parent.AccessoryType] then
                        k2.LocalTransparencyModifier = v2
                    elseif k2.Name ~= "Head" then
                        k2.LocalTransparencyModifier = 0
                    else
                        k2.LocalTransparencyModifier = v2
                    end
                end
            end
            a1.transparencyDirty = false
            a1.lastTransparency = v2
        end
    end
end

return u23