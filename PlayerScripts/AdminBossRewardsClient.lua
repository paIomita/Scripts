-- Path: Players.Drrrrrrrrragonball.PlayerScripts.AdminBossRewardsClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.AdminBossRewardsClient
-- Decompile time: 3.87 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local u25 = ReplicatedStorage:WaitForChild("AdminBossRewardEvent")
local PopBall = ReplicatedStorage:WaitForChild("PopBall")
local u35 = workspace:WaitForChild("FightZone")
local u46 = workspace:FindFirstChild("LocalBossRewards_" .. LocalPlayer.UserId)
if not u46 then
    u46 = Instance.new("Folder")
    u46.Name = "LocalBossRewards_" .. LocalPlayer.UserId
    u46.Parent = workspace
end
local u51 = {}

local function addPopBillboard(a1, a2) -- Line: 22 -- upvalues: PopBall (val)
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "PopRewardBillboard"
    BillboardGui.AlwaysOnTop = false
    BillboardGui.LightInfluence = 0
    BillboardGui.MaxDistance = 350
    BillboardGui.Size = UDim2.new(3, 0, 3.15, 0)
    BillboardGui.Parent = a1
    local v1 = PopBall:Clone()
    v1.Name = "PopOutline"
    v1.AnchorPoint = Vector2.zero
    v1.Position = UDim2.fromScale(-0.04, -0.04)
    v1.Size = UDim2.fromScale(1.08, 1.08)
    v1.ImageColor3 = Color3.new(0, 0, 0)
    v1.ImageTransparency = 0.15
    v1.ZIndex = 1
    v1.Parent = BillboardGui
    v1 = PopBall:Clone()
    v1.Name = "PopBall"
    v1.AnchorPoint = Vector2.zero
    v1.Position = UDim2.fromScale(0, 0)
    v1.Size = UDim2.fromScale(1, 1)
    v1.ZIndex = 2
    v1.Parent = BillboardGui
    if a2 > 1 then
        local TextLabel = Instance.new("TextLabel")
        TextLabel.AnchorPoint = Vector2.new(0.5, 0)
        TextLabel.Position = UDim2.new(0.5, 0, 0.78, 0)
        TextLabel.Size = UDim2.new(1.4, 0, 0.38, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Font = Enum.Font.FredokaOne
        TextLabel.Text = "x" .. tostring(a2)
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextScaled = true
        TextLabel.ZIndex = 3
        TextLabel.Parent = BillboardGui
    end
end

local function resolveArenaGroundY() -- Line: 66 -- upvalues: u35 (val), u46 (ref), LocalPlayer (val)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    local v2 = {u35, u46}
    if LocalPlayer.Character then
        table.insert(v2, LocalPlayer.Character)
    end
    local AdminPopTitan = workspace:FindFirstChild("AdminPopTitan")
    if AdminPopTitan then
        table.insert(v2, AdminPopTitan)
    end
    v1.FilterDescendantsInstances = v2
    local v3 = u35.Size * 0.5
    v2 = u35.CFrame:PointToWorldSpace((Vector3.new(0, v3.Y + 20, 0)))
    local v4 = workspace:Raycast(v2, Vector3.new(0, -(u35.Size.Y + 220), 0), v1)
    return v4 and v4.Position.Y or u35.Position.Y - v3.Y
end

local function landingPosition(a1, a2) -- Line: 80 -- upvalues: u35 (val)
    local v1 = u35.Size * 0.5
    local v2 = u35.CFrame:PointToWorldSpace((Vector3.new(
        a1:NextNumber(-math.max(1, v1.X - 3), (math.max(1, v1.X - 3))),
        0,
        (a1:NextNumber(-math.max(1, v1.Z - 3), (math.max(1, v1.Z - 3))))
    )))
    return (Vector3.new(v2.X, a2 + 1.2, v2.Z))
end

local function destroyToken(a1) -- Line: 90 -- upvalues: u51 (val)
    u51[a1] = nil
    if a1.Parent then
        a1:Destroy()
    end
end

local function spawnToken(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 95
    -- upvalues: landingPosition (val), addPopBillboard (val), u51 (val), TweenService (val)
    if not a1.Parent then
        return
    end
    local v1 = landingPosition(a5, a6)
    local v2 = v1 + Vector3.new(0, a8, 0)
    local Part = Instance.new("Part")
    Part.Name = "PersonalBossPop"
    Part.Size = Vector3.new(1.5, 1.5, 1.5)
    Part.Transparency = 1
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Position = a4 + Vector3.new(0, 4, 0)
    Part.Parent = a1
    addPopBillboard(Part, a3.value)
    local v3 = a5:NextNumber(0.55, 0.9)
    u51[Part] = {
        launching = true,
        landed = false,
        sessionId = a2,
        tokenId = a3.id,
        spawnedAt = os.clock(),
        lifetime = a7,
        landing = v1,
    }
    TweenService:Create(Part, TweenInfo.new(v3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = v2}):Play()
    task.delay(v3, function() -- Line: 124 -- upvalues: u51 (upval), Part (val), a5 (val)
        local v1 = u51[Part]
        if v1 and Part.Parent then
            v1.launching = false
            Part.Anchored = false
            Part.AssemblyLinearVelocity = Vector3.new(0, -a5:NextNumber(3, 8), 0)
            return
        end
    end)
end

u25.OnClientEvent:Connect(function(a1, a2) -- Line: 133 -- upvalues: u46 (ref), resolveArenaGroundY (val), spawnToken (val), u51 (val)
    if a1 == "Spawn" and type(a2) == "table" and type(a2.tokens) == "table" then
        local u11 = tostring(a2.sessionId or "")
        if u11 ~= "" and typeof(a2.origin) == "Vector3" then
            local Folder = Instance.new("Folder")
            Folder.Name = "Session_" .. u11
            Folder.Parent = u46
            local u27 = Random.new(tonumber(a2.seed) or 1)
            local u32 = tonumber(a2.groundY)
            if not u32 then
                u32 = resolveArenaGroundY()
            end
            local u37 = tonumber(a2.lifetime) or 120
            local u41 = tonumber(a2.spawnWindow) or 4
            local u45 = tonumber(a2.spawnHeight) or 42
            local u47 = #a2.tokens
            task.spawn(function() -- Line: 146
                -- upvalues: a2 (val), Folder (val), u47 (val), u41 (val), spawnToken (upval), u11 (val), u27 (val)
                -- upvalues: u32 (val), u37 (val), u45 (val)
                local v1, v2
                local ServerTimeNow = workspace:GetServerTimeNow()
                for i, v in ipairs(a2.tokens) do
                    if not Folder.Parent then
                        return
                    end
                    v1 = if not (u47 <= 1) then (i - 1) / (u47 - 1) * u41 else 0
                    while Folder.Parent do
                        v2 = ServerTimeNow + v1 - workspace:GetServerTimeNow()
                        if v2 <= 0 then
                            break
                        end
                        task.wait((math.min(0.04, v2)))
                    end
                    spawnToken(Folder, u11, v, a2.origin, u27, u32, u37, u45)
                end
            end)
            task.delay(u37, function() -- Line: 159 -- upvalues: Folder (val), u51 (upval)
                if Folder.Parent then
                    for i, v in ipairs(Folder:GetChildren()) do
                        u51[v] = nil
                    end
                    Folder:Destroy()
                end
            end)
            return
        end
        return
    end
end)
RunService.Heartbeat:Connect(function(a1) -- Line: 169 -- upvalues: LocalPlayer (val), u51 (val), u25 (val)
    local Magnitude, v1
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    for k, v in pairs(u51) do
        if k.Parent then
            v1 = os.clock() - v.spawnedAt
            if v.lifetime <= v1 then
                u51[k] = nil
                if k.Parent then
                    k:Destroy()
                end
            elseif not v.launching then
                if not v.landed and k.Position.Y <= v.landing.Y then
                    k.Position = v.landing
                    k.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    k.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    k.Anchored = true
                    v.landed = true
                end
                if HumanoidRootPart and Humanoid and 0 < Humanoid.Health then
                    Magnitude = (k.Position - HumanoidRootPart.Position).Magnitude
                    if Magnitude < 2 then
                        u25:FireServer("Collect", v.sessionId, v.tokenId)
                        u51[k] = nil
                        if k.Parent then
                            k:Destroy()
                        end
                    elseif Magnitude < 12 then
                        k.Anchored = true
                        v1 = 1 - math.exp((math.min(a1, 0.1)) * -12)
                        k.Position = k.Position:Lerp(HumanoidRootPart.Position, v1)
                    end
                end
            end
        else
            u51[k] = nil
        end
    end
end)