-- Path: Players.Drrrrrrrrragonball.PlayerScripts.GlassBridgeObby7Client

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.GlassBridgeObby7Client
-- Decompile time: 4.67 ms

local Attribute, Attribute_2, Attribute_3, v1, v2
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local u134 = workspace:WaitForChild("GlassBridgeParts")
local GlassBridgeRemotes = ReplicatedStorage:WaitForChild("GlassBridgeRemotes")
local v3 = GlassBridgeRemotes:WaitForChild("State")
local GetState = GlassBridgeRemotes:WaitForChild("GetState")
local ForceRestore = GlassBridgeRemotes:WaitForChild("ForceRestore")
local TileVisual = GlassBridgeRemotes:WaitForChild("TileVisual")
local PlayerRestore = GlassBridgeRemotes:WaitForChild("PlayerRestore")
local u47 = {}
local u214 = nil
local u183 = setmetatable({}, {__mode = "k"})
local u176 = setmetatable({}, {__mode = "k"})
local u189 = setmetatable({}, {__mode = "k"})
local u195 = {}
local u201 = {}
local u170 = setmetatable({}, {__mode = "k"})
local u207 = nil
for i = 1, 20 do
    for i2, v in ipairs({"A", "B"}) do
        v1 = u134:WaitForChild((tostring(i)) .. v)
        v2 = {}
        Attribute = v1:GetAttribute("GlassBridgeOriginalCFrame") or v1.CFrame
        v2.cframe = Attribute
        Attribute_2 = v1:GetAttribute("GlassBridgeOriginalColor") or v1.Color
        v2.color = Attribute_2
        v2.material = v1.Material
        Attribute_3 = v1:GetAttribute("GlassBridgeOriginalTransparency") or v1.Transparency
        v2.transparency = Attribute_3
        u47[v1] = v2
    end
end

local function isLocalCharacterHit(a1) -- Line: 36 -- upvalues: LocalPlayer (val)
    local Character = LocalPlayer.Character
    return Character and a1 and a1:IsDescendantOf(Character)
end

local function restoreTiles(a1) -- Line: 41
    -- upvalues: u170 (val), u176 (val), u47 (val), u183 (val), u189 (val), u195 (val), u201 (val), u207 (ref)
    local v1, v2
    for k in pairs(u170) do
        u176[k] = nil
        u170[k] = nil
        if k.Parent then
            k:Destroy()
        end
    end
    for k2, v in pairs(u47) do
        k2.Anchored = true
        k2.CFrame = v.cframe
        k2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        k2.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        k2.Color = v.color
        k2.Material = v.material
        k2.Transparency = v.transparency
        k2.LocalTransparencyModifier = 0
        v1 = k2.Name:match("^(%d+)([AB])$")
        v2 = v1 ~= nil
        k2.CanCollide = v2
        v2 = v1 ~= nil
        k2.CanTouch = v2
        v2 = v1 ~= nil
        k2.CanQuery = v2
    end
    table.clear(u183)
    table.clear(u176)
    table.clear(u189)
    table.clear(u195)
    table.clear(u201)
    u207 = nil
end

local function createLocalTileVisual(a1, a2) -- Line: 76 -- upvalues: u47 (val), u134 (val), u170 (val)
    local v1 = u47[a1]
    if not v1 then
        return nil
    end
    local v2 = a1:Clone()
    v2.Name = "LocalVisual_" .. a1.Name
    v2.Anchored = true
    v2.CanCollide = false
    v2.CanTouch = false
    v2.CanQuery = false
    v2.CFrame = v1.cframe
    v2.Transparency = v1.transparency
    if not a2 then
        v2.Color = v1.color
        v2.Material = v1.material
    end
    for i, v in ipairs(v2:GetDescendants()) do
        if v:IsA("LuaSourceContainer") then
            v:Destroy()
        end
    end
    v2.Parent = u134
    u170[v2] = true
    return v2
end

local u217 = 0
PlayerRestore.OnClientEvent:Connect(function(a1) -- Line: 102 -- upvalues: LocalPlayer (val), u217 (ref)
    local Character = LocalPlayer.Character
    local Humanoid = Character
    if Humanoid then
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
    end
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    if Character and Humanoid and HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
        u217 = u217 + 1
        local u24 = u217
        if type(a1) == "table" and typeof(a1.cframe) == "CFrame" then
            HumanoidRootPart.CFrame = a1.cframe
        end
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        if type(a1) == "table" then
            Humanoid.PlatformStand = a1.platformStand == true
            Humanoid.Sit = a1.sit == true
        end
        if 0 < Humanoid.Health and not Humanoid.PlatformStand and not Humanoid.Sit then
            Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        task.delay(0.04, function() -- Line: 123
            -- upvalues: u24 (val), u217 (upval), LocalPlayer (upval), Character (val), HumanoidRootPart (val)
            -- upvalues: Humanoid (val)
            if u24 == u217 and LocalPlayer.Character == Character and HumanoidRootPart.Parent then
                HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                if 0 < Humanoid.Health and not Humanoid.PlatformStand and not Humanoid.Sit then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end
                return
            end
        end)
        return
    end
end)
TileVisual.OnClientEvent:Connect(function(a1) -- Line: 133
    -- upvalues: u214 (ref), u134 (val), u195 (val), createLocalTileVisual (val), u176 (val), u189 (val), u47 (val)
    -- upvalues: TweenService (val), u170 (val)
    if type(a1) == "table" and u214 then
        local v1
        if (tonumber(a1.cycle)) ~= tonumber(u214.cycle) then
            return
        end
        if a1.action == "safe" then
            v1 = u134:FindFirstChild((tostring(a1.tileName or "")))
            if v1 and v1:IsA("BasePart") then
                v1.Color = Color3.fromRGB(70, 255, 105)
                v1.Material = Enum.Material.Neon
                return
            end
            return
        end
        if a1.action ~= "fall" then
            if a1.action == "reset" then
                local v2
                for k in pairs(u170) do
                    u176[k] = nil
                    u170[k] = nil
                    if k.Parent then
                        k:Destroy()
                    end
                end
                for k2 in pairs(u47) do
                    if u195[k2.Name] ~= u214.cycle then
                        local u123 = createLocalTileVisual(k2, true)
                        if u123 then
                            v2 = TweenService:Create(
                                u123,
                                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                                {Transparency = 1}
                            )
                            v2:Play()
                            v2.Completed:Connect(function() -- Line: 183 -- upvalues: u170 (upval), u123 (val)
                                u170[u123] = nil
                                if u123.Parent then
                                    u123:Destroy()
                                end
                            end)
                        end
                    end
                    k2.LocalTransparencyModifier = 1
                end
            end
            return
        end
        local v3 = tostring(a1.tileName or "")
        if u195[v3] == u214.cycle then
            return
        end
        v1 = u134:FindFirstChild(v3)
        if v1 and v1:IsA("BasePart") then
            u195[v3] = u214.cycle
            v1.CanCollide = false
            v1.CanTouch = false
            v1.CanQuery = false
            v1.LocalTransparencyModifier = 1
            local u61 = createLocalTileVisual(v1, false)
            if not u61 then
                return
            end
            u176[u61] = true
            u189[u61] = (os.clock())
            local v4 = u47[v1]
            v1 = TweenService:Create(
                u61,
                TweenInfo.new(0.65, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Transparency = 1, CFrame = v4.cframe + Vector3.new(0, -18, 0)}
            )
            v1:Play()
            v1.Completed:Connect(function() -- Line: 164 -- upvalues: u176 (upval), u61 (val), u170 (upval)
                u176[u61] = nil
                u170[u61] = nil
                if u61.Parent then
                    u61:Destroy()
                end
            end)
            return
        end
        return
    end
end)
ForceRestore.OnClientEvent:Connect(function(a1) -- Line: 194 -- upvalues: u214 (ref), restoreTiles (val)
    if type(a1) == "table" and tonumber(a1.cycle) ~= nil then
        u214 = a1
        restoreTiles(a1)
        return
    end
end)
v3.OnClientEvent:Connect(function(a1) -- Line: 69 -- upvalues: u214 (ref), restoreTiles (val)
    if type(a1) == "table" and tonumber(a1.cycle) ~= nil then
        local v1 = not u214 or (tonumber(u214.cycle)) ~= tonumber(a1.cycle)
        u214 = a1
        if v1 then
            restoreTiles(a1)
        end
        return
    end
end)
task.spawn(function() -- Line: 202 -- upvalues: GetState (val), u214 (ref), restoreTiles (val)
    local err_2, success_2, v1, v2
    local success, err = pcall(function() -- Line: 203 -- upvalues: GetState (upval)
        return GetState:InvokeServer()
    end)
    if success and type(err) == "table" and tonumber(err.cycle) ~= nil then
        local v3 = not u214 or (tonumber(u214.cycle)) ~= tonumber(err.cycle)
        u214 = err
        if v3 then
            restoreTiles(err)
        end
    end
    while true do
        task.wait(0.2)
        if u214 then
            v2 = os.time()
            if tonumber(u214.resetEndsAt or 0) <= v2 then
                success_2, err_2 = pcall(function() -- Line: 213 -- upvalues: GetState (upval)
                    return GetState:InvokeServer()
                end)
                if success_2 and type(err_2) == "table" and tonumber(err_2.cycle) ~= nil then
                    v1 = not u214 or (tonumber(u214.cycle)) ~= tonumber(err_2.cycle)
                    u214 = err_2
                    if v1 then
                        restoreTiles(err_2)
                    end
                end
            end
        end
    end
end)