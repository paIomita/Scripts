-- Path: Players.Drrrrrrrrragonball.PlayerScripts.RbxCharacterSounds

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.RbxCharacterSounds
-- Decompile time: 7.45 ms

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local AtomicBinding = require(script:WaitForChild("AtomicBinding"))

local function loadFlag(a1) -- Line: 12 -- types: a1: string
    local success, err = pcall(function() -- Line: 13 -- upvalues: a1 (val)
        return (UserSettings()):IsUserFeatureEnabled(a1)
    end)
    return success and err
end

local u23 = "UserSoundsUseRelativeVelocity2"
local success, err = pcall(function() -- Line: 13 -- upvalues: u23 (val)
    return (UserSettings()):IsUserFeatureEnabled(u23)
end)
local u28 = success and err
local u29 = "UserNewCharacterSoundsApi3"
local success_2, err_2 = pcall(function() -- Line: 13 -- upvalues: u29 (val)
    return (UserSettings()):IsUserFeatureEnabled(u29)
end)
local u34 = success_2 and err_2
local u35 = "UserFixCharSoundsEmitters"
local success_3, err_3 = pcall(function() -- Line: 13 -- upvalues: u35 (val)
    return (UserSettings()):IsUserFeatureEnabled(u35)
end)
local u40 = success_3 and err_3
local u41 = "UserFixCharSoundsEmitterRootPart"
local success_4, err_4 = pcall(function() -- Line: 13 -- upvalues: u41 (val)
    return (UserSettings()):IsUserFeatureEnabled(u41)
end)
local u46 = success_4 and err_4
local u47 = {
    Climbing = {SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", Looped = true},
    Died = {SoundId = "rbxasset://sounds/uuhhh.mp3"},
    FreeFalling = {SoundId = "rbxasset://sounds/action_falling.ogg", Looped = true},
    GettingUp = {SoundId = "rbxasset://sounds/action_get_up.mp3"},
    Jumping = {SoundId = "rbxasset://sounds/action_jump.mp3"},
    Landing = {SoundId = "rbxasset://sounds/action_jump_land.mp3"},
    Running = {SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", Looped = true, Pitch = 1.85},
    Splash = {SoundId = "rbxasset://sounds/impact_water.mp3"},
    Swimming = {SoundId = "rbxasset://sounds/action_swim.mp3", Looped = true, Pitch = 1.6},
}
local u57 = {
    Climbing = {AssetId = "rbxasset://sounds/action_footsteps_plastic.mp3", Looping = true},
    Died = {AssetId = "rbxasset://sounds/uuhhh.mp3"},
    FreeFalling = {AssetId = "rbxasset://sounds/action_falling.ogg", Looping = true},
    GettingUp = {AssetId = "rbxasset://sounds/action_get_up.mp3"},
    Jumping = {AssetId = "rbxasset://sounds/action_jump.mp3"},
    Landing = {AssetId = "rbxasset://sounds/action_jump_land.mp3"},
    Running = {AssetId = "rbxasset://sounds/action_footsteps_plastic.mp3", Looping = true, PlaybackSpeed = 1.85},
    Splash = {AssetId = "rbxasset://sounds/impact_water.mp3"},
    Swimming = {AssetId = "rbxasset://sounds/action_swim.mp3", Looping = true, PlaybackSpeed = 1.6},
}

local function map(a1, a2, a3, a4, a5) -- Line: 97 -- types: a1: number, a2: number, a3: number, a4: number, a5: number
    return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4
end

local function getRelativeVelocity(a1, a2) -- Line: 101
    if not a1 then
        return a2
    end
    local ActiveController = a1.ActiveController and (a1.ActiveController:IsA("GroundController") and a1.GroundSensor or a1.ActiveController:IsA("ClimbController") and a1.ClimbSensor)
    if ActiveController and ActiveController.SensedPart then
        return a2 - ActiveController.SensedPart:GetVelocityAtPosition(a1.RootPart.Position)
    end
    return a2
end

local function playSound(a1, a2) -- Line: 118 -- upvalues: u34 (val) -- types: a1: userdata, a2: boolean?
    if not a2 then
        a1.TimePosition = 0
    end
    if u34 and a1:IsA("AudioPlayer") then
        a1:Play()
        return
    end
    a1.Playing = true
end

local function stopSound(a1) -- Line: 129 -- upvalues: u34 (val) -- types: a1: userdata
    if u34 and a1:IsA("AudioPlayer") then
        a1:Stop()
        return
    end
    a1.Playing = false
end

local function playSoundIf(a1, a2) -- Line: 137 -- upvalues: u34 (val) -- types: a1: userdata, a2: boolean
    if u34 and a1:IsA("AudioPlayer") then
        if a1.IsPlaying and not a2 then
            a1:Stop()
            return
        end
        if not a1.IsPlaying and a2 then
            a1:Play()
            return
        end
        return
    end
    a1.Playing = a2
end

local function setSoundLooped(a1, a2) -- Line: 149 -- upvalues: u34 (val) -- types: a1: userdata, a2: boolean
    if u34 and a1:IsA("AudioPlayer") then
        a1.Looping = a2
        return
    end
    a1.Looped = a2
end

local function shallowCopy(a1) -- Line: 157
    local v1 = {}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

local u78 = AtomicBinding.new({humanoid = "Humanoid", rootPart = "HumanoidRootPart"}, function(a1) -- Line: 165
    -- upvalues: u28 (val), u34 (val), SoundService (val), u40 (val), u46 (val), Players (val), u57 (val), u47 (val)
    -- upvalues: getRelativeVelocity (val), RunService (val)
    local Sound
    local humanoid = a1.humanoid
    local rootPart = a1.rootPart
    local u259 = nil
    local u261 = nil
    if u28 then
        u261 = humanoid.Parent:FindFirstChild("ControllerManager")
    end
    local u252 = {}
    if not u34 then
        for k, v in pairs(u47) do
            Sound = Instance.new("Sound")
            Sound.Name = k
            Sound.Archivable = false
            Sound.RollOffMinDistance = 5
            Sound.RollOffMaxDistance = 150
            Sound.Volume = 0.65
            for k2, i in pairs(v) do
                Sound[k2] = i
            end
            Sound.Parent = rootPart
            u252[k] = Sound
        end
    elseif SoundService.CharacterSoundsUseNewApi ~= Enum.RolloutState.Enabled then
        for k3, j in pairs(u47) do
            Sound = Instance.new("Sound")
            Sound.Name = k3
            Sound.Archivable = false
            Sound.RollOffMinDistance = 5
            Sound.RollOffMaxDistance = 150
            Sound.Volume = 0.65
            for k4, k5 in pairs(j) do
                Sound[k4] = k5
            end
            Sound.Parent = rootPart
            u252[k3] = Sound
        end
    else
        local v1
        local Character = nil
        local RootPart_2 = nil
        if not u40 then
            Character = Players.LocalPlayer.Character
        else
            RootPart_2 = if not u46 then humanoid.RootPart else humanoid.RootPart or humanoid.Parent
        end
        local v2 = {}
        local v3 = 5
        while v3 < 150 do
            v2[v3] = 5 / v3
            v3 = v3 * 1.25
        end
        v2[150] = 0
        u259 = if not u40 then Instance.new("AudioEmitter", Character) else Instance.new("AudioEmitter", RootPart_2)
        u259.Name = "RbxCharacterSoundsEmitter"
        u259:SetDistanceAttenuation(v2)
        for k6, n in pairs(u57) do
            v3 = Instance.new("AudioPlayer")
            v1 = Instance.new("Wire")
            v3.Name = k6
            v1.Name = k6 .. "Wire"
            v3.Archivable = false
            v3.Volume = 0.65
            for k7, m in pairs(n) do
                v3[k7] = m
            end
            v3.Parent = rootPart
            v1.Parent = v3
            v1.SourceInstance = v3
            v1.TargetInstance = u259
            u252[k6] = v3
        end
    end
    local u132 = {}

    local function stopPlayingLoopedSounds(a1) -- Line: 241 -- upvalues: u132 (val), u34 (upval) -- types: a1: userdata?
        local v1 = a1 or nil
        local v2 = pairs
        local v3 = {}
        for k, v in pairs(u132) do
            v3[k] = v
        end
        for k2 in v2(v3) do
            if k2 ~= v1 then
                if not u34 or not k2:IsA("AudioPlayer") then
                    k2.Playing = false
                else
                    k2:Stop()
                end
                u132[k2] = nil
            end
        end
    end

    local u134 = {}
    local FallingDown = Enum.HumanoidStateType.FallingDown

    u134[FallingDown] = function() -- Line: 253 -- upvalues: stopPlayingLoopedSounds (val)
        stopPlayingLoopedSounds()
    end

    local GettingUp = Enum.HumanoidStateType.GettingUp

    u134[GettingUp] = function() -- Line: 257 -- upvalues: stopPlayingLoopedSounds (val), u252 (val), u34 (upval)
        stopPlayingLoopedSounds()
        local GettingUp = u252.GettingUp
        GettingUp.TimePosition = 0
        if u34 and GettingUp:IsA("AudioPlayer") then
            GettingUp:Play()
            return
        end
        GettingUp.Playing = true
    end

    local Jumping = Enum.HumanoidStateType.Jumping

    u134[Jumping] = function() -- Line: 262 -- upvalues: stopPlayingLoopedSounds (val), u252 (val), u34 (upval)
        stopPlayingLoopedSounds()
        local Jumping = u252.Jumping
        Jumping.TimePosition = 0
        if u34 and Jumping:IsA("AudioPlayer") then
            Jumping:Play()
            return
        end
        Jumping.Playing = true
    end

    local Swimming = Enum.HumanoidStateType.Swimming

    u134[Swimming] = function() -- Line: 267 -- upvalues: rootPart (val), u252 (val), u34 (upval), stopPlayingLoopedSounds (val), u132 (val)
        local v1 = math.abs(rootPart.AssemblyLinearVelocity.Y)
        if v1 > 0.1 then
            u252.Splash.Volume = math.clamp((v1 - 100) * 0.72 / 250 + 0.28, 0, 1)
            local Splash_2 = u252.Splash
            Splash_2.TimePosition = 0
            if not u34 or not Splash_2:IsA("AudioPlayer") then
                Splash_2.Playing = true
            else
                Splash_2:Play()
            end
        end
        stopPlayingLoopedSounds(u252.Swimming)
        local Swimming = u252.Swimming
        if not u34 or not Swimming:IsA("AudioPlayer") then
            Swimming.Playing = true
        else
            Swimming:Play()
        end
        u132[u252.Swimming] = true
    end

    local Freefall = Enum.HumanoidStateType.Freefall

    u134[Freefall] = function() -- Line: 278 -- upvalues: u252 (val), stopPlayingLoopedSounds (val), u34 (upval), u132 (val)
        u252.FreeFalling.Volume = 0
        stopPlayingLoopedSounds(u252.FreeFalling)
        local FreeFalling = u252.FreeFalling
        if not u34 or not FreeFalling:IsA("AudioPlayer") then
            FreeFalling.Looped = true
        else
            FreeFalling.Looping = true
        end
        if u252.FreeFalling:IsA("Sound") then
            u252.FreeFalling.PlaybackRegionsEnabled = true
        end
        u252.FreeFalling.LoopRegion = NumberRange.new(2, 9)
        local FreeFalling_2 = u252.FreeFalling
        FreeFalling_2.TimePosition = 0
        if not u34 or not FreeFalling_2:IsA("AudioPlayer") then
            FreeFalling_2.Playing = true
        else
            FreeFalling_2:Play()
        end
        u132[u252.FreeFalling] = true
    end

    local Landed = Enum.HumanoidStateType.Landed

    u134[Landed] = function() -- Line: 292 -- upvalues: stopPlayingLoopedSounds (val), rootPart (val), u252 (val), u34 (upval)
        stopPlayingLoopedSounds()
        local v1 = math.abs(rootPart.AssemblyLinearVelocity.Y)
        if v1 > 75 then
            u252.Landing.Volume = math.clamp((v1 - 50) * 1 / 50 + 0, 0, 1)
            local Landing_2 = u252.Landing
            Landing_2.TimePosition = 0
            if u34 and Landing_2:IsA("AudioPlayer") then
                Landing_2:Play()
                return
            end
            Landing_2.Playing = true
        end
    end

    local Running = Enum.HumanoidStateType.Running

    u134[Running] = function() -- Line: 301 -- upvalues: stopPlayingLoopedSounds (val), u252 (val), u34 (upval), u132 (val)
        stopPlayingLoopedSounds(u252.Running)
        local Running = u252.Running
        if not u34 or not Running:IsA("AudioPlayer") then
            Running.Playing = true
        else
            Running:Play()
        end
        u132[u252.Running] = true
    end

    local Climbing = Enum.HumanoidStateType.Climbing

    u134[Climbing] = function() -- Line: 307
        -- upvalues: u252 (val), rootPart (val), u28 (upval), getRelativeVelocity (upval), u261 (ref), u34 (upval)
        -- upvalues: stopPlayingLoopedSounds (val), u132 (val)
        local Climbing = u252.Climbing
        local AssemblyLinearVelocity = rootPart.AssemblyLinearVelocity
        if not (0.1 < (math.abs((if not u28 then AssemblyLinearVelocity else getRelativeVelocity(u261, AssemblyLinearVelocity)).Y))) then
            stopPlayingLoopedSounds()
        else
            if not u34 or not Climbing:IsA("AudioPlayer") then
                Climbing.Playing = true
            else
                Climbing:Play()
            end
            stopPlayingLoopedSounds(Climbing)
        end
        u132[Climbing] = true
    end

    local Seated = Enum.HumanoidStateType.Seated

    u134[Seated] = function() -- Line: 320 -- upvalues: stopPlayingLoopedSounds (val)
        stopPlayingLoopedSounds()
    end

    local Dead = Enum.HumanoidStateType.Dead

    u134[Dead] = function() -- Line: 324 -- upvalues: stopPlayingLoopedSounds (val), u252 (val), u34 (upval)
        stopPlayingLoopedSounds()
        local Died = u252.Died
        Died.TimePosition = 0
        if u34 and Died:IsA("AudioPlayer") then
            Died:Play()
            return
        end
        Died.Playing = true
    end

    local u168 = {}

    u168[u252.Climbing] = function(a1, a2, a3) -- Line: 332
        -- upvalues: u28 (upval), getRelativeVelocity (upval), u261 (ref), u34 (upval)
        local v1 = 0.1 < (if not u28 then a3 else getRelativeVelocity(u261, a3)).Magnitude
        if u34 and a2:IsA("AudioPlayer") then
            if a2.IsPlaying and not v1 then
                a2:Stop()
                return
            end
            if not a2.IsPlaying and v1 then
                a2:Play()
                return
            end
            return
        end
        a2.Playing = v1
    end

    u168[u252.FreeFalling] = function(a1, a2, a3) -- Line: 337 -- types: a1: number, a2: userdata, a3: vector
        if 75 < a3.Magnitude then
            a2.Volume = math.clamp(a2.Volume + a1 * 0.9, 0, 1)
            return
        end
        a2.Volume = 0
    end

    u168[u252.Running] = function(a1, a2, a3) -- Line: 345
        -- upvalues: humanoid (val), u34 (upval)
        local v1 = false
        if 0.5 < a3.Magnitude then
            v1 = 0.5 < humanoid.MoveDirection.Magnitude
        end
        if u34 and a2:IsA("AudioPlayer") then
            if a2.IsPlaying and not v1 then
                a2:Stop()
                return
            end
            if not a2.IsPlaying and v1 then
                a2:Play()
                return
            end
            return
        end
        a2.Playing = v1
    end

    local u183 = {}
    u183[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
    local State = u183[humanoid:GetState()]
    if not State then
        State = humanoid:GetState()
    end

    local function transitionTo(a1) -- Line: 357 -- upvalues: u134 (val), State (ref)
        local v1 = u134[a1]
        if v1 then
            v1()
        end
        State = a1
    end

    local v4 = State
    local v5 = u134[v4]
    if v5 then
        v5()
    end
    State = v4
    local u211 = humanoid.StateChanged:Connect(function(a1, a2) -- Line: 369 -- upvalues: u183 (val), State (ref), u134 (val)
        local v1 = u183[a2] or a2
        if v1 ~= State then
            local v2 = u134[v1]
            if v2 then
                v2()
            end
            State = v1
        end
    end)
    local u223 = RunService.Stepped:Connect(function(a1, a2) -- Line: 377 -- upvalues: u132 (val), u168 (val), rootPart (val) -- types: a2: number
        local v1
        for k in pairs(u132) do
            v1 = u168[k]
            if v1 then
                v1(a2, k, rootPart.AssemblyLinearVelocity)
            end
        end
    end)
    return function() -- Line: 388 -- upvalues: u211 (val), u223 (val), u46 (upval), u259 (ref), u252 (val)
        u211:Disconnect()
        u223:Disconnect()
        if u46 and u259 then
            u259:Destroy()
        end
        for k, v in pairs(u252) do
            v:Destroy()
        end
        table.clear(u252)
    end
end)
local u79 = {}

local function characterAdded(a1) -- Line: 415 -- upvalues: u78 (val)
    u78:bindRoot(a1)
end

local function characterRemoving(a1) -- Line: 419 -- upvalues: u78 (val)
    u78:unbindRoot(a1)
end

local function playerAdded(a1) -- Line: 423
    -- upvalues: u79 (val), u78 (val), characterAdded (val), characterRemoving (val)
    local v1 = u79[a1]
    if not v1 then
        u79[a1] = {}
    end
    if a1.Character then
        u78:bindRoot(a1.Character)
    end
    table.insert(v1, (a1.CharacterAdded:Connect(characterAdded)))
    table.insert(v1, (a1.CharacterRemoving:Connect(characterRemoving)))
end

for i, v in ipairs(Players:GetPlayers()) do
    task.spawn(playerAdded, v)
end
Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(function(a1) -- Line: 437 -- upvalues: u79 (val), u78 (val) -- types: a1: userdata
    local v1 = u79[a1]
    if v1 then
        for i, v in ipairs(v1) do
            v:Disconnect()
        end
        u79[a1] = nil
    end
    if a1.Character then
        u78:unbindRoot(a1.Character)
    end
end)