-- Path: Workspace.mooooon186.Animate

-- Script path: Workspace.mooooon186.Animate
-- Decompile time: 8.73 ms

local v1
local Parent = script.Parent
local Torso = Parent:WaitForChild("Torso")
local u9 = Torso:WaitForChild("Right Shoulder")
local u13 = Torso:WaitForChild("Left Shoulder")
local u17 = Torso:WaitForChild("Right Hip")
local u21 = Torso:WaitForChild("Left Hip")
Torso:WaitForChild("Neck")
local Humanoid = Parent:WaitForChild("Humanoid")
local u30 = "Standing"
local success, err = pcall(function() -- Line: 15
    return UserSettings():IsUserFeatureEnabled("UserAnimateRemoveEmoteChatHook")
end)

local function getRigScale() -- Line: 23 -- upvalues: Parent (val)
    return Parent:GetScale()
end

local u38 = ""
local u39 = nil
local u40 = nil
local u41 = nil
local u42 = 1
local u43 = {}
local u44 = {
    idle = {
        {id = "http://www.roblox.com/asset/?id=180435571", weight = 9},
        {id = "http://www.roblox.com/asset/?id=180435792", weight = 1},
    },
    walk = {{id = "http://www.roblox.com/asset/?id=180426354", weight = 10}},
    run = {{id = "run.xml", weight = 10}},
    jump = {{id = "http://www.roblox.com/asset/?id=125750702", weight = 10}},
    fall = {{id = "http://www.roblox.com/asset/?id=180436148", weight = 10}},
    climb = {{id = "http://www.roblox.com/asset/?id=180436334", weight = 10}},
    sit = {{id = "http://www.roblox.com/asset/?id=178130996", weight = 10}},
    toolnone = {{id = "http://www.roblox.com/asset/?id=182393478", weight = 10}},
    toolslash = {{id = "http://www.roblox.com/asset/?id=129967390", weight = 10}},
    toollunge = {{id = "http://www.roblox.com/asset/?id=129967478", weight = 10}},
    wave = {{id = "http://www.roblox.com/asset/?id=128777973", weight = 10}},
    point = {{id = "http://www.roblox.com/asset/?id=128853357", weight = 10}},
    dance1 = {
        {id = "http://www.roblox.com/asset/?id=182435998", weight = 10},
        {id = "http://www.roblox.com/asset/?id=182491037", weight = 10},
        {id = "http://www.roblox.com/asset/?id=182491065", weight = 10},
    },
    dance2 = {
        {id = "http://www.roblox.com/asset/?id=182436842", weight = 10},
        {id = "http://www.roblox.com/asset/?id=182491248", weight = 10},
        {id = "http://www.roblox.com/asset/?id=182491277", weight = 10},
    },
    dance3 = {
        {id = "http://www.roblox.com/asset/?id=182436935", weight = 10},
        {id = "http://www.roblox.com/asset/?id=182491368", weight = 10},
        {id = "http://www.roblox.com/asset/?id=182491423", weight = 10},
    },
    laugh = {{id = "http://www.roblox.com/asset/?id=129423131", weight = 10}},
    cheer = {{id = "http://www.roblox.com/asset/?id=129423030", weight = 10}},
}
local u86 = {"dance1", "dance2", "dance3"}
local u90 = {
    wave = false,
    point = false,
    dance1 = true,
    dance2 = true,
    dance3 = true,
    laugh = false,
    cheer = false,
}

function configureAnimationSet(a1, a2) -- Line: 99 -- upvalues: u43 (val)
    if u43[a1] ~= nil then
        for k, v in pairs(u43[a1].connections) do
            v:disconnect()
        end
    end
    u43[a1] = {}
    local v1 = u43[a1]
    v1.count = 0
    v1 = u43[a1]
    v1.totalWeight = 0
    v1 = u43[a1]
    v1.connections = {}
    v1 = script:FindFirstChild(a1)
    if v1 ~= nil then
        local Weight, v2, v3
        table.insert(u43[a1].connections, (v1.ChildAdded:connect(function(a1_2) -- Line: 114 -- upvalues: a1 (val), a2 (val)
            configureAnimationSet(a1, a2)
        end)))
        table.insert(u43[a1].connections, (v1.ChildRemoved:connect(function(a1_2) -- Line: 115 -- upvalues: a1 (val), a2 (val)
            configureAnimationSet(a1, a2)
        end)))
        local v4 = 1
        for k2, i in pairs(v1:GetChildren()) do
            if i:IsA("Animation") then
                table.insert(u43[a1].connections, (i.Changed:connect(function(a1_2) -- Line: 119 -- upvalues: a1 (val), a2 (val)
                    configureAnimationSet(a1, a2)
                end)))
                v3 = u43[a1]
                v3[v4] = {}
                u43[a1][v4].anim = i
                Weight = i:FindFirstChild("Weight")
                if Weight ~= nil then
                    v2 = u43[a1][v4]
                    v2.weight = Weight.Value
                else
                    v2 = u43[a1][v4]
                    v2.weight = 1
                end
                v2 = u43[a1]
                v2.count = u43[a1].count + 1
                v2 = u43[a1]
                v2.totalWeight = u43[a1].totalWeight + u43[a1][v4].weight
                v4 = v4 + 1
            end
        end
    end
    if u43[a1].count <= 0 then
        local v5
        for k3, j in pairs(a2) do
            v5 = u43[a1]
            v5[k3] = {}
            v5 = u43[a1][k3]
            v5.anim = Instance.new("Animation")
            u43[a1][k3].anim.Name = a1
            u43[a1][k3].anim.AnimationId = j.id
            v5 = u43[a1][k3]
            v5.weight = j.weight
            v5 = u43[a1]
            v5.count = u43[a1].count + 1
            v5 = u43[a1]
            v5.totalWeight = u43[a1].totalWeight + j.weight
        end
    end
end

function scriptChildModified(a1) -- Line: 152 -- upvalues: u44 (val)
    local v1 = u44[a1.Name]
    if v1 ~= nil then
        configureAnimationSet(a1.Name, v1)
    end
end

script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local Animator = if not Humanoid then nil else Humanoid:FindFirstChildOfClass("Animator")
if Animator then
    for i, v in ipairs((Animator:GetPlayingAnimationTracks())) do
        v:Stop(0)
        v:Destroy()
    end
end
for k, i2 in pairs(u44) do
    configureAnimationSet(k, i2)
end
local u148 = "None"
local u149 = 0
local u150 = 0

function stopAllAnimations() -- Line: 193 -- upvalues: u38 (ref), u90 (val), u39 (ref), u41 (ref), u40 (ref)
    local v1 = u38
    if u90[v1] ~= nil and u90[v1] == false then
        v1 = "idle"
    end
    u38 = ""
    u39 = nil
    if u41 ~= nil then
        u41:disconnect()
    end
    if u40 ~= nil then
        u40:Stop()
        u40:Destroy()
        u40 = nil
    end
    return v1
end

function setAnimationSpeed(a1) -- Line: 215 -- upvalues: u42 (ref), u40 (ref)
    if a1 ~= u42 then
        u40:AdjustSpeed(a1)
    end
end

function keyFrameReachedFunc(a1) -- Line: 222 -- upvalues: u38 (ref), u90 (val), u42 (ref), Humanoid (val)
    if a1 == "End" then
        local v1 = u38
        if u90[v1] ~= nil and u90[v1] == false then
            v1 = "idle"
        end
        local v2 = u42
        playAnimation(v1, 0, Humanoid)
        setAnimationSpeed(v2)
    end
end

function playAnimation(a1, a2, a3) -- Line: 238
    -- upvalues: u43 (val), u39 (ref), u40 (ref), u42 (ref), u38 (ref), u41 (ref)
    local v1 = math.random(1, u43[a1].totalWeight)
    local v2 = 1
    while u43[a1][v2].weight < v1 do
        v1 = v1 - u43[a1][v2].weight
        v2 = v2 + 1
    end
    local anim = u43[a1][v2].anim
    if anim ~= u39 then
        if u40 ~= nil then
            u40:Stop(a2)
            u40:Destroy()
        end
        u42 = 1
        u40 = a3:LoadAnimation(anim)
        u40.Priority = Enum.AnimationPriority.Core
        u40:Play(a2)
        u38 = a1
        u39 = anim
        if u41 ~= nil then
            u41:disconnect()
        end
        u40.KeyframeReached:connect(keyFrameReachedFunc)
    end
end

local u163 = ""
local u164 = nil
local u165 = nil
local u166 = nil

function toolKeyFrameReachedFunc(a1) -- Line: 287 -- upvalues: u163 (ref), Humanoid (val)
    if a1 == "End" then
        playToolAnimation(u163, 0, Humanoid)
    end
end

function playToolAnimation(a1, a2, a3, a4) -- Line: 295
    -- upvalues: u43 (val), u165 (ref), u164 (ref), u163 (ref), u166 (ref)
    local v1 = math.random(1, u43[a1].totalWeight)
    local v2 = 1
    while u43[a1][v2].weight < v1 do
        v1 = v1 - u43[a1][v2].weight
        v2 = v2 + 1
    end
    local anim = u43[a1][v2].anim
    if u165 ~= anim then
        local v3
        if u164 == nil then
            v3 = a2
        else
            u164:Stop()
            u164:Destroy()
            v3 = 0
        end
        u164 = a3:LoadAnimation(anim)
        if a4 then
            u164.Priority = a4
        end
        u164:Play(v3)
        u163 = a1
        u165 = anim
        u164.KeyframeReached:connect(toolKeyFrameReachedFunc)
    end
end

function stopToolAnimations() -- Line: 330 -- upvalues: u163 (ref), u166 (ref), u165 (ref), u164 (ref)
    local v1 = u163
    if u166 ~= nil then
        u166:disconnect()
    end
    u163 = ""
    u165 = nil
    if u164 ~= nil then
        u164:Stop()
        u164:Destroy()
        u164 = nil
    end
    return v1
end

function onRunning(a1) -- Line: 353
    -- upvalues: Parent (val), Humanoid (val), u39 (ref), u30 (ref), u90 (val), u38 (ref)
    local v1 = a1 / Parent:GetScale()
    if not (v1 > 0.01) then
        if u90[u38] == nil then
            playAnimation("idle", 0.1, Humanoid)
            u30 = "Standing"
        end
        return
    end
    playAnimation("walk", 0.1, Humanoid)
    if u39 and u39.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
        setAnimationSpeed(v1 / 14.5)
    end
    u30 = "Running"
end

function onDied() -- Line: 370 -- upvalues: u30 (ref)
    u30 = "Dead"
end

function onJumping() -- Line: 374 -- upvalues: Humanoid (val), u150 (ref), u30 (ref)
    playAnimation("jump", 0.1, Humanoid)
    u150 = 0.3
    u30 = "Jumping"
end

function onClimbing(a1) -- Line: 380 -- upvalues: Parent (val), Humanoid (val), u30 (ref)
    local v1 = a1 / Parent:GetScale()
    playAnimation("climb", 0.1, Humanoid)
    setAnimationSpeed(v1 / 12)
    u30 = "Climbing"
end

function onGettingUp() -- Line: 388 -- upvalues: u30 (ref)
    u30 = "GettingUp"
end

function onFreeFall() -- Line: 392 -- upvalues: u150 (ref), Humanoid (val), u30 (ref)
    if u150 <= 0 then
        playAnimation("fall", 0.3, Humanoid)
    end
    u30 = "FreeFall"
end

function onFallingDown() -- Line: 399 -- upvalues: u30 (ref)
    u30 = "FallingDown"
end

function onSeated() -- Line: 403 -- upvalues: u30 (ref)
    u30 = "Seated"
end

function onPlatformStanding() -- Line: 407 -- upvalues: u30 (ref)
    u30 = "PlatformStanding"
end

function onSwimming(a1) -- Line: 411 -- upvalues: u30 (ref)
    if a1 > 0 then
        u30 = "Running"
        return
    end
    u30 = "Standing"
end

function getTool() -- Line: 419 -- upvalues: Parent (val)
    for i, v in ipairs(Parent:GetChildren()) do
        if v.className == "Tool" then
            return v
        end
    end
    return nil
end

function getToolAnim(a1) -- Line: 426
    for i, v in ipairs(a1:GetChildren()) do
        if v.Name == "toolanim" and v.className == "StringValue" then
            return v
        end
    end
    return nil
end

function animateTool() -- Line: 435 -- upvalues: u148 (ref), Humanoid (val)
    if u148 == "None" then
        playToolAnimation("toolnone", 0.1, Humanoid, Enum.AnimationPriority.Idle)
        return
    end
    if u148 == "Slash" then
        playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
        return
    end
    if u148 ~= "Lunge" then
        return
    end
    playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
end

function moveSit() -- Line: 453 -- upvalues: u9 (val), u13 (val), u17 (val), u21 (val)
    u9.MaxVelocity = 0.15
    u13.MaxVelocity = 0.15
    u9:SetDesiredAngle(1.57)
    u13:SetDesiredAngle(-1.57)
    u17:SetDesiredAngle(1.57)
    u21:SetDesiredAngle(-1.57)
end

local u190 = 0

function move(a1) -- Line: 464
    -- upvalues: u190 (ref), u150 (ref), u30 (ref), Humanoid (val), u9 (val), u13 (val), u17 (val), u21 (val)
    -- upvalues: u148 (ref), u149 (ref), u165 (ref)
    local v1 = 1
    local v2 = 1
    local v3 = a1 - u190
    u190 = a1
    local v4 = false
    if u150 > 0 then
        u150 = u150 - v3
    end
    if u30 == "FreeFall" and u150 <= 0 then
        playAnimation("fall", 0.3, Humanoid)
        if v4 then
            v3 = v1 * math.sin(a1 * v2)
            u9:SetDesiredAngle(v3 + 0)
            u13:SetDesiredAngle(v3 - 0)
            u17:SetDesiredAngle(-v3)
            u21:SetDesiredAngle(-v3)
        end
        v4 = getTool()
        if v4 and v4:FindFirstChild("Handle") then
            v2 = getToolAnim(v4)
            if v2 then
                u148 = v2.Value
                v2.Parent = nil
                u149 = a1 + 0.3
            end
            if u149 < a1 then
                u149 = 0
                u148 = "None"
            end
            animateTool()
            return
        end
        stopToolAnimations()
        u148 = "None"
        u165 = nil
        u149 = 0
        return
    end
    if u30 == "Seated" then
        playAnimation("sit", 0.5, Humanoid)
        return
    end
    if u30 == "Running" then
        playAnimation("walk", 0.1, Humanoid)
    elseif u30 == "Dead"
        or u30 == "GettingUp"
        or u30 == "FallingDown"
        or u30 == "Seated"
        or u30 == "PlatformStanding" then
        stopAllAnimations()
        v1 = 0.1
        v2 = 1
        v4 = true
    end
    if v4 then
        v3 = v1 * math.sin(a1 * v2)
        u9:SetDesiredAngle(v3 + 0)
        u13:SetDesiredAngle(v3 - 0)
        u17:SetDesiredAngle(-v3)
        u21:SetDesiredAngle(-v3)
    end
    v4 = getTool()
    if v4 and v4:FindFirstChild("Handle") then
        v2 = getToolAnim(v4)
        if v2 then
            u148 = v2.Value
            v2.Parent = nil
            u149 = a1 + 0.3
        end
        if u149 < a1 then
            u149 = 0
            u148 = "None"
        end
        animateTool()
        return
    end
    stopToolAnimations()
    u148 = "None"
    u165 = nil
    u149 = 0
end

Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)
if not success or not err then
    (game:GetService("Players")).LocalPlayer.Chatted:connect(function(a1) -- Line: 542 -- upvalues: u86 (val), u30 (ref), u90 (val), Humanoid (val)
        local v1 = ""
        if a1 == "/e dance" then
            v1 = u86[math.random(1, #u86)]
        elseif string.sub(a1, 1, 3) == "/e " then
            v1 = string.sub(a1, 4)
        elseif string.sub(a1, 1, 7) == "/emote " then
            v1 = string.sub(a1, 8)
        end
        if u30 == "Standing" and u90[v1] ~= nil then
            playAnimation(v1, 0.1, Humanoid)
        end
    end)
end
local PlayEmote = script:WaitForChild("PlayEmote")

function PlayEmote.OnInvoke(a1) -- Line: 559 -- upvalues: u30 (ref), u90 (val), Humanoid (val), u40 (ref)
    if u30 ~= "Standing" then
        return
    end
    if u90[a1] == nil then
        return false
    end
    playAnimation(a1, 0.1, Humanoid)
    return true, u40
end

playAnimation("idle", 0.1, Humanoid)
while Parent.Parent ~= nil do
    _, v1 = wait(0.1)
    move(v1)
end