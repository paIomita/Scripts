-- Path: ReplicatedStorage.Speedrun.SpeedrunMovementPolicy

-- Script path: ReplicatedStorage.Speedrun.SpeedrunMovementPolicy
-- Decompile time: 1.06 ms

local BoundingBox, BoundingBox_2, v1, v2
local StarterPlayer = game:GetService("StarterPlayer")
local Parent = script.Parent
local SpeedrunConfig = require(Parent:WaitForChild("SpeedrunConfig"))
local u13 = {}
local LevelCount = SpeedrunConfig.LevelCount
for i = 1, LevelCount do
    v2 = Parent:WaitForChild("Level" .. (tostring(i)))
    BoundingBox, BoundingBox_2 = v2:GetBoundingBox()
    v1 = {
        cframe = SpeedrunConfig.ZonePivot * v2:GetPivot():ToObjectSpace(BoundingBox),
        halfSize = BoundingBox_2 * 0.5 + Vector3.new(24, 48, 24),
    }
    u13[i] = v1
end
local u52 = {}

function u52.IsInArea(a1) -- Line: 20 -- upvalues: u13 (val)
    local halfSize, v1
    if typeof(a1) ~= "Vector3" then
        return false
    end
    for i, v in ipairs(u13) do
        v1 = v.cframe:PointToObjectSpace(a1)
        halfSize = v.halfSize
        if (math.abs(v1.X)) <= halfSize.X and (math.abs(v1.Y)) <= halfSize.Y and (math.abs(v1.Z)) <= halfSize.Z then
            return true
        end
    end
    return false
end

function u52.RemoveOutsideBoost(a1, a2) -- Line: 32 -- upvalues: u52 (val), SpeedrunConfig (val), StarterPlayer (val)
    local HumanoidRootPart = a2 and a2:FindFirstChild("HumanoidRootPart")
    local Humanoid = a2 and a2:FindFirstChildOfClass("Humanoid")
    if HumanoidRootPart and Humanoid and not u52.IsInArea(HumanoidRootPart.Position) then
        local v1 = a1 and a1:GetAttribute("OwnerAdminWalkSpeed")
        local v2 = false
        if type(v1) == "number" then
            v2 = false
            if a1:GetAttribute("SpeedrunActive") ~= true then
                v2 = (math.abs(Humanoid.WalkSpeed - v1)) < 0.001
            end
        end
        v1 = false
        if not v2 and (math.abs(Humanoid.WalkSpeed - SpeedrunConfig.RunWalkSpeed)) < 0.001 then
            Humanoid.WalkSpeed = StarterPlayer.CharacterWalkSpeed
            v1 = true
        end
        if not Humanoid.UseJumpPower and (math.abs(Humanoid.JumpHeight - SpeedrunConfig.RunJumpHeight)) < 0.001 then
            Humanoid.UseJumpPower = StarterPlayer.CharacterUseJumpPower
            Humanoid.JumpPower = StarterPlayer.CharacterJumpPower
            Humanoid.JumpHeight = StarterPlayer.CharacterJumpHeight
        end
        return v1
    end
    return false
end

return table.freeze(u52)