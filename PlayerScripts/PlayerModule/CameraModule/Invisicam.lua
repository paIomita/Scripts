-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.Invisicam

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.Invisicam
-- Decompile time: 10.66 ms

local Players = game:GetService("Players")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local u21 = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI2")
local u22 = {
    LIMBS = 2,
    MOVEMENT = 3,
    CORNERS = 4,
    CIRCLE1 = 5,
    CIRCLE2 = 6,
    LIMBMOVE = 7,
    SMART_CIRCLE = 8,
    CHAR_OUTLINE = 9,
}
local u23 = {
    Head = true,
    ["Left Arm"] = true,
    ["Right Arm"] = true,
    ["Left Leg"] = true,
    ["Right Leg"] = true,
    LeftLowerArm = true,
    RightLowerArm = true,
    LeftUpperLeg = true,
    RightUpperLeg = true,
}
local u33 = {}
u33[1] = (Vector3.new(1, 1, -1))
u33[2] = (Vector3.new(1, -1, -1))
u33[3] = (Vector3.new(-1, -1, -1))
u33[4] = (Vector3.new(-1, 1, -1))
local u39 = RaycastParams.new()
u39.FilterType = Enum.RaycastFilterType.Exclude
local u42 = RaycastParams.new()
u42.FilterType = Enum.RaycastFilterType.Include

local function AssertTypes(a1, ...) -- Line: 71
    local v1 = {}
    local v2 = ""
    for k, v in pairs({...}) do
        v1[v] = true
        v2 = v2 .. (if v2 ~= "" then " or " else "") .. v
    end
    local v3 = type(a1)
    assert(v1[v3], v2 .. " type expected, got: " .. v3)
end

local function Det3x3(a1, a2, a3, a4, a5, a6, a7, a8, a9) -- Line: 83
    -- upvalues: 
    return a1 * (a5 * a9 - a6 * a8) - a2 * (a4 * a9 - a6 * a7) + a3 * (a4 * a8 - a5 * a7)
end

local function RayIntersection(a1, a2, a3, a4) -- Line: 91 -- types: a1: vector, a2: vector, a3: vector, a4: vector
    local v1 = a2:Cross(a4)
    local v2 = a3.X - a1.X
    local v3 = a3.Y - a1.Y
    local v4 = a3.Z - a1.Z
    local X = a2.X
    local v5 = -a4.X
    local X_2 = v1.X
    local Y = a2.Y
    local v6 = -a4.Y
    local Y_2 = v1.Y
    local Z = a2.Z
    local v7 = -a4.Z
    local Z_2 = v1.Z
    local v8 = X * (v6 * Z_2 - Y_2 * v7) - v5 * (Y * Z_2 - Y_2 * Z) + X_2 * (Y * v7 - v6 * Z)
    if v8 == 0 then
        return (Vector3.new(0, 0, 0))
    end
    local v9 = -a4.X
    local X_3 = v1.X
    v6 = -a4.Y
    local Y_3 = v1.Y
    local v10 = -a4.Z
    local Z_3 = v1.Z
    local v11 = (v2 * (v6 * Z_3 - Y_3 * v10) - v9 * (v3 * Z_3 - Y_3 * v4) + X_3 * (v3 * v10 - v6 * v4)) / v8
    local X_4 = a2.X
    local X_5 = v1.X
    local Y_4 = a2.Y
    local Y_5 = v1.Y
    local Z_4 = a2.Z
    local Z_5 = v1.Z
    v5 = (X_4 * (v3 * Z_5 - Y_5 * v4) - v2 * (Y_4 * Z_5 - Y_5 * Z_4) + X_5 * (Y_4 * v4 - v3 * Z_4)) / v8
    v8 = a1 + v11 * a2
    v11 = a3 + v5 * a4
    v5 = v8 + (v11 - v8) * 0.5
    if (v11 - v8).Magnitude < 0.25 then
        return v5
    end
    return (Vector3.new(0, 0, 0))
end

local BaseOcclusion = require(script.Parent:WaitForChild("BaseOcclusion"))
local u58 = setmetatable({}, BaseOcclusion)
u58.__index = u58

function u58.new() -- Line: 124 -- upvalues: BaseOcclusion (val), u58 (val), u22 (val)
    local v1 = BaseOcclusion.new()
    local v2 = setmetatable(v1, u58)
    v2.char = nil
    v2.humanoidRootPart = nil
    v2.torsoPart = nil
    v2.headPart = nil
    v2.childAddedConn = nil
    v2.childRemovedConn = nil
    v2.behaviors = {}
    v2.behaviors[u22.LIMBS] = v2.LimbBehavior
    v2.behaviors[u22.MOVEMENT] = v2.MoveBehavior
    v2.behaviors[u22.CORNERS] = v2.CornerBehavior
    v2.behaviors[u22.CIRCLE1] = v2.CircleBehavior
    v2.behaviors[u22.CIRCLE2] = v2.CircleBehavior
    v2.behaviors[u22.LIMBMOVE] = v2.LimbMoveBehavior
    v2.behaviors[u22.SMART_CIRCLE] = v2.SmartCircleBehavior
    v2.behaviors[u22.CHAR_OUTLINE] = v2.CharacterOutlineBehavior
    v2.mode = u22.SMART_CIRCLE
    v2.behaviorFunction = v2.SmartCircleBehavior
    v2.savedHits = {}
    v2.trackedLimbs = {}
    v2.camera = game.Workspace.CurrentCamera
    v2.enabled = false
    return v2
end

function u58.Enable(a1, a2) -- Line: 157
    a1.enabled = a2
    if not a2 then
        a1:Cleanup()
    end
end

function u58.GetOcclusionMode(a1) -- Line: 165
    return Enum.DevCameraOcclusionMode.Invisicam
end

function u58:LimbBehavior(a2) -- Line: 170
    for k, v in pairs(self.trackedLimbs) do
        a2[#a2 + 1] = k.Position
    end
end

function u58:MoveBehavior(a2) -- Line: 176
    local Position, Velocity, v1, v2
    for i = 1, 3 do
        Position = self.humanoidRootPart.Position
        Velocity = self.humanoidRootPart.Velocity
        v2 = Vector3.new(Velocity.X, 0, Velocity.Z).Magnitude / 2
        v1 = (i - 1) * self.humanoidRootPart.CFrame.lookVector * v2
        a2[#a2 + 1] = Position + v1
    end
end

function u58.CornerBehavior(a1, a2) -- Line: 185 -- upvalues: u33 (val)
    local CFrame = a1.humanoidRootPart.CFrame
    local Position = CFrame.Position
    local v1 = CFrame - Position
    local v2 = a1.char:GetExtentsSize() / 2
    a2[#a2 + 1] = Position
    local v3 = #u33
    for i = 1, v3 do
        a2[#a2 + 1] = Position + v1 * (v2 * u33[i])
    end
end

function u58.CircleBehavior(a1, a2) -- Line: 196 -- upvalues: u22 (val)
    local CFrame, v1, v2
    if a1.mode ~= u22.CIRCLE1 then
        local CoordinateFrame = a1.camera.CoordinateFrame
        CFrame = CoordinateFrame - CoordinateFrame.Position + a1.humanoidRootPart.Position
    else
        CFrame = a1.humanoidRootPart.CFrame
    end
    a2[#a2 + 1] = CFrame.Position
    for i = 0, 9 do
        v1 = 0.6283185307179586 * i
        v2 = Vector3.new(math.cos(v1), math.sin(v1), 0) * 3
        a2[#a2 + 1] = CFrame * v2
    end
end

function u58.LimbMoveBehavior(a1, a2) -- Line: 212
    a1:LimbBehavior(a2)
    a1:MoveBehavior(a2)
end

function u58.CharacterOutlineBehavior(a1, a2) -- Line: 217 -- upvalues: u21 (val), u42 (val)
    local Position_2, v1, v2, v3, v4
    local unit = a1.torsoPart.CFrame.upVector.unit
    local unit_2 = a1.torsoPart.CFrame.rightVector.unit
    a2[#a2 + 1] = a1.torsoPart.CFrame.p
    a2[#a2 + 1] = a1.torsoPart.CFrame.p + unit
    a2[#a2 + 1] = a1.torsoPart.CFrame.p - unit
    a2[#a2 + 1] = a1.torsoPart.CFrame.p + unit_2
    a2[#a2 + 1] = a1.torsoPart.CFrame.p - unit_2
    if a1.headPart then
        a2[#a2 + 1] = a1.headPart.CFrame.p
    end
    local new = CFrame.new
    local X = a1.camera.CoordinateFrame.lookVector.X
    local Z = a1.camera.CoordinateFrame.lookVector.Z
    local v5 = new(Vector3.new(0, 0, 0), (Vector3.new(X, 0, Z)))
    local Position = a1.torsoPart and a1.torsoPart.Position or a1.humanoidRootPart.Position
    local v6 = {a1.torsoPart}
    if a1.headPart then
        v6[#v6 + 1] = a1.headPart
    end
    local v7 = a2
    for i = 1, 24 do
        v3 = 6.283185307179586 * i / 24
        v4 = v5 * (Vector3.new(math.cos(v3), math.sin(v3), 0) * 3)
        v4 = Vector3.new(v4.X, math.max(v4.Y, -2.25), v4.Z)
        if not u21 then
            v1, v2 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(Position + v4, -3 * v4), v6, false)
            if v1 then
                v7[#v7 + 1] = v2 + 0.2 * (Position - v2).unit
            end
        else
            u42.FilterDescendantsInstances = v6
            v3 = game.Workspace:Raycast(Position + v4, -3 * v4, u42)
            if v3 then
                Position_2 = v3.Position
                v7[#v7 + 1] = Position_2 + 0.2 * (Position - Position_2).unit
            end
        end
    end
end

function u58.SmartCircleBehavior(a1, a2) -- Line: 268 -- upvalues: u21 (val), u39 (val), RayIntersection (val)
    local Normal, Position_2, Workspace_4, unit_3, unit_4, unit_6, unit_7, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local unit = a1.torsoPart.CFrame.upVector.unit
    local unit_2 = a1.torsoPart.CFrame.rightVector.unit
    a2[#a2 + 1] = a1.torsoPart.CFrame.p
    a2[#a2 + 1] = a1.torsoPart.CFrame.p + unit
    a2[#a2 + 1] = a1.torsoPart.CFrame.p - unit
    a2[#a2 + 1] = a1.torsoPart.CFrame.p + unit_2
    a2[#a2 + 1] = a1.torsoPart.CFrame.p - unit_2
    if a1.headPart then
        a2[#a2 + 1] = a1.headPart.CFrame.p
    end
    local v13 = a1.camera.CFrame - a1.camera.CFrame.p
    local v14 = Vector3.new(0, 0.5, 0)
    local Position = a1.torsoPart and a1.torsoPart.Position or a1.humanoidRootPart.Position
    local v15 = v14 + Position
    local v16, v17 = a1, a2
    for i = 1, 24 do
        v10 = 0.2617993877991494 * i - 1.5707963267948966
        v10 = v15 + v13 * (Vector3.new(math.cos(v10), math.sin(v10), 0) * 2.5)
        v11 = v10 - v16.camera.CFrame.p
        if not u21 then
            v12 = Ray.new(v15, v10 - v15)
            Workspace_4 = game.Workspace
            v4 = {v16.char}
            v1, v2, v3 = Workspace_4:FindPartOnRayWithIgnoreList(v12, v4, false, false)
            v12 = v10
            if v1 then
                v4 = v2 + 0.1 * v3.unit
                v5 = v4 - v15
                unit_6 = v5:Cross(v11).unit:Cross(v3).unit
                unit_7 = (v4 - v16.camera.CFrame.p).unit
                if not ((v5.unit:Dot(-unit_6)) < v5.unit:Dot(unit_7)) then
                    v12 = v4
                else
                    v12 = RayIntersection(v4, unit_6, v10, v11)
                    if not (0 < v12.Magnitude) then
                        v12 = v4
                    else
                        v7, v8, v9 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v4, v12 - v4), {v16.char}, false, false)
                        if v7 then
                            v12 = v8 + 0.1 * v9.unit
                        end
                    end
                end
                v6, v7 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v15, v12 - v15), {v16.char}, false, false)
                if v6 then
                    v12 = v7 - 0.1 * (v12 - v15).unit
                end
            end
            v17[#v17 + 1] = v12
        else
            u39.FilterDescendantsInstances = {v16.char}
            v12 = game.Workspace:Raycast(v15, v10 - v15, u39)
            v1 = v10
            if v12 then
                Position_2 = v12.Position
                Normal = v12.Normal
                v4 = Position_2 + 0.1 * Normal.unit
                v2 = v4 - v15
                unit_3 = v2:Cross(v11).unit:Cross(Normal).unit
                unit_4 = (v4 - v16.camera.CFrame.p).unit
                if not ((v2.unit:Dot(-unit_3)) < v2.unit:Dot(unit_4)) then
                    v1 = v4
                else
                    v1 = RayIntersection(v4, unit_3, v10, v11)
                    if not (0 < v1.Magnitude) then
                        v1 = v4
                    else
                        v12 = game.Workspace:Raycast(v4, v1 - v4, u39)
                        if v12 then
                            v1 = v12.Position + 0.1 * v12.Normal.Unit
                        end
                    end
                end
                v12 = game.Workspace:Raycast(v15, v1 - v15, u39)
                if v12 then
                    v1 = v12.Position - 0.1 * (v1 - v15).unit
                end
            end
            v17[#v17 + 1] = v1
        end
    end
end

function u58:CheckTorsoReference() -- Line: 403
    if self.char then
        self.torsoPart = self.char:FindFirstChild("Torso")
        if not self.torsoPart then
            self.torsoPart = self.char:FindFirstChild("UpperTorso")
            if not self.torsoPart then
                self.torsoPart = self.char:FindFirstChild("HumanoidRootPart")
            end
        end
        self.headPart = self.char:FindFirstChild("Head")
    end
end

function u58.CharacterAdded(a1, a2, a3) -- Line: 417
    -- upvalues: Players (val), u23 (val)
    if a3 ~= Players.LocalPlayer then
        return
    end
    if a1.childAddedConn then
        a1.childAddedConn:Disconnect()
        a1.childAddedConn = nil
    end
    if a1.childRemovedConn then
        a1.childRemovedConn:Disconnect()
        a1.childRemovedConn = nil
    end
    a1.char = a2
    a1.trackedLimbs = {}
    a1.childAddedConn = a2.ChildAdded:Connect(function(a1_2) -- Line: 433 -- upvalues: u23 (upval), a1 (val)
        if a1_2:IsA("BasePart") then
            if u23[a1_2.Name] then
                a1.trackedLimbs[a1_2] = true
            end
            if a1_2.Name == "Torso" or a1_2.Name == "UpperTorso" then
                a1.torsoPart = a1_2
            end
            if a1_2.Name == "Head" then
                a1.headPart = a1_2
            end
        end
    end)
    a1.childRemovedConn = a2.ChildRemoved:Connect(function(a1_2) -- Line: 449 -- upvalues: a1 (val)
        a1.trackedLimbs[a1_2] = nil
        a1:CheckTorsoReference()
    end)
    for k, v in pairs(a1.char:GetChildren()) do
        if v:IsA("BasePart") then
            if u23[v.Name] then
                a1.trackedLimbs[v] = true
            end
            if v.Name == "Torso" or v.Name == "UpperTorso" then
                a1.torsoPart = v
            end
            if v.Name == "Head" then
                a1.headPart = v
            end
        end
    end
end

function u58.SetMode(a1, a2) -- Line: 463 -- upvalues: AssertTypes (val), u22 (val) -- types: a1: table, a2: number
    AssertTypes(a2, "number")
    for k, v in pairs(u22) do
        if v == a2 then
            a1.mode = a2
            a1.behaviorFunction = a1.behaviors[a1.mode]
            return
        end
    end
    error("Invalid mode number")
end

function u58.GetObscuredParts(a1) -- Line: 475
    return a1.savedHits
end

function u58:Cleanup() -- Line: 480
    for k, v in pairs(self.savedHits) do
        k.LocalTransparencyModifier = v
    end
end

function u58.Update(a1, a2, a3, a4) -- Line: 486 -- types: a1: table, a2: number, a3: userdata, a4: userdata
    if a1.enabled and a1.char then
        local add, u427, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        a1.camera = game.Workspace.CurrentCamera
        if not a1.humanoidRootPart then
            local u26
            local Humanoid = a1.char:FindFirstChildOfClass("Humanoid")
            if Humanoid and Humanoid.RootPart then
                a1.humanoidRootPart = Humanoid.RootPart
                u26 = nil
                v9 = a1.humanoidRootPart.AncestryChanged:Connect(function(a1_2, a2) -- Line: 511 -- upvalues: a1 (val), u26 (ref)
                    if a1_2 == a1.humanoidRootPart and not a2 then
                        a1.humanoidRootPart = nil
                        if u26 and u26.Connected then
                            u26:Disconnect()
                            u26 = nil
                        end
                    end
                end)
                if not a1.torsoPart then
                    a1:CheckTorsoReference()
                    if not a1.torsoPart then
                        return a3, a4
                    end
                end
                v8 = {}
                a1.behaviorFunction(a1, v8)
                u427 = {}
                v9 = {a1.char}

                function add(a1_2) -- Line: 537 -- upvalues: u427 (val), a1 (val)
                    u427[a1_2] = true
                    if not a1.savedHits[a1_2] then
                        a1.savedHits[a1_2] = a1_2.LocalTransparencyModifier
                    end
                end

                v11 = 0
                v1 = {}
                v2 = 0.75
                v3 = 0.75
                v10 = a1.camera:GetPartsObscuringTarget({
                    a1.headPart and a1.headPart.CFrame.p or v8[1],
                    a1.torsoPart and a1.torsoPart.CFrame.p or v8[2],
                }, v9)
                v6 = #v10
                for i = 1, v6 do
                    v5 = v10[i]
                    v11 = v11 + 1
                    v1[v5] = true
                    for k, v in pairs(v5:GetChildren()) do
                        if not v:IsA("Decal") and not v:IsA("Texture") then
                            continue
                        end
                        v11 = v11 + 1
                        break
                    end
                end
                if v11 > 0 then
                    v2 = math.pow(0.375 / v11 + 0.375, 1 / v11)
                    v3 = math.pow(0.25 / v11 + 0.25, 1 / v11)
                end
                v10 = a1.camera:GetPartsObscuringTarget(v8, v9)
                v11 = {}
                v4 = #v10
                for j = 1, v4 do
                    v9 = v10[j]
                    v11[v9] = v1[v9] and v2 or v3
                    if v9.Transparency < v11[v9] then
                        u427[v9] = true
                        if not a1.savedHits[v9] then
                            a1.savedHits[v9] = v9.LocalTransparencyModifier
                        end
                    end
                    for k2, k3 in pairs(v9:GetChildren()) do
                        if k3:IsA("Decal") then
                            if k3.Transparency < v11[v9] then
                                v11[k3] = v11[v9]
                                u427[k3] = true
                                if not a1.savedHits[k3] then
                                    a1.savedHits[k3] = k3.LocalTransparencyModifier
                                end
                            end
                        elseif k3:IsA("Texture") and k3.Transparency < v11[v9] then
                            v11[k3] = v11[v9]
                            u427[k3] = true
                            if not a1.savedHits[k3] then
                                a1.savedHits[k3] = k3.LocalTransparencyModifier
                            end
                        end
                    end
                end
                for k4, n in pairs(a1.savedHits) do
                    if not u427[k4] then
                        k4.LocalTransparencyModifier = n
                        a1.savedHits[k4] = nil
                    else
                        v7 = k4.Transparency < 1 and (v11[k4] - k4.Transparency) / (1 - k4.Transparency) or 0
                        k4.LocalTransparencyModifier = v7
                    end
                end
                return a3, a4
            end
            a1.humanoidRootPart = a1.char:FindFirstChild("HumanoidRootPart")
            if not a1.humanoidRootPart then
                return a3, a4
            end
            u26 = nil
            v9 = a1.humanoidRootPart.AncestryChanged:Connect(function(a1_2, a2) -- Line: 511 -- upvalues: a1 (val), u26 (ref)
                if a1_2 == a1.humanoidRootPart and not a2 then
                    a1.humanoidRootPart = nil
                    if u26 and u26.Connected then
                        u26:Disconnect()
                        u26 = nil
                    end
                end
            end)
        end
        if not a1.torsoPart then
            a1:CheckTorsoReference()
            if not a1.torsoPart then
                return a3, a4
            end
        end
        v8 = {}
        a1.behaviorFunction(a1, v8)
        u427 = {}
        v9 = {}
        v9[1] = a1.char

        function add(a1_2) -- Line: 537 -- upvalues: u427 (val), a1 (val)
            u427[a1_2] = true
            if not a1.savedHits[a1_2] then
                a1.savedHits[a1_2] = a1_2.LocalTransparencyModifier
            end
        end

        v11 = 0
        v1 = {}
        v2 = 0.75
        v3 = 0.75
        v10 = a1.camera:GetPartsObscuringTarget({
            a1.headPart and a1.headPart.CFrame.p or v8[1],
            a1.torsoPart and a1.torsoPart.CFrame.p or v8[2],
        }, v9)
        v6 = #v10
        for m = 1, v6 do
            v5 = v10[m]
            v11 = v11 + 1
            v1[v5] = true
            for k5, i5 in pairs(v5:GetChildren()) do
                if not i5:IsA("Decal") and not i5:IsA("Texture") then
                    continue
                end
                v11 = v11 + 1
                break
            end
        end
        if v11 > 0 then
            v2 = math.pow(0.375 / v11 + 0.375, 1 / v11)
            v3 = math.pow(0.25 / v11 + 0.25, 1 / v11)
        end
        v10 = a1.camera:GetPartsObscuringTarget(v8, v9)
        v11 = {}
        v4 = #v10
        for i6 = 1, v4 do
            v9 = v10[i6]
            v11[v9] = v1[v9] and v2 or v3
            if v9.Transparency < v11[v9] then
                u427[v9] = true
                if not a1.savedHits[v9] then
                    a1.savedHits[v9] = v9.LocalTransparencyModifier
                end
            end
            for k6, i7 in pairs(v9:GetChildren()) do
                if i7:IsA("Decal") then
                    if i7.Transparency < v11[v9] then
                        v11[i7] = v11[v9]
                        u427[i7] = true
                        if not a1.savedHits[i7] then
                            a1.savedHits[i7] = i7.LocalTransparencyModifier
                        end
                    end
                elseif i7:IsA("Texture") and i7.Transparency < v11[v9] then
                    v11[i7] = v11[v9]
                    u427[i7] = true
                    if not a1.savedHits[i7] then
                        a1.savedHits[i7] = i7.LocalTransparencyModifier
                    end
                end
            end
        end
        for k7, i8 in pairs(a1.savedHits) do
            if not u427[k7] then
                k7.LocalTransparencyModifier = i8
                a1.savedHits[k7] = nil
            else
                v7 = k7.Transparency < 1 and (v11[k7] - k7.Transparency) / (1 - k7.Transparency) or 0
                k7.LocalTransparencyModifier = v7
            end
        end
        return a3, a4
    end
    return a3, a4
end

return u58