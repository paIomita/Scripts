-- Path: ReplicatedStorage.BattleSpeedConfig

-- Script path: ReplicatedStorage.BattleSpeedConfig
-- Decompile time: 0.35 ms

local u0 = {
    PassId = 1968739186,
    Seconds = {Slow = 6, Fast = 5, UltraFast = 4},
    Labels = {Slow = "Normal", Fast = "Fast", UltraFast = "Ultra Fast"},
}

function u0.RequiresPass(a1) -- Line: 6
    local v1 = true
    if a1 ~= "Fast" then
        v1 = a1 == "UltraFast"
    end
    return v1
end

function u0.Timing(a1) -- Line: 7 -- upvalues: u0 (val)
    local Slow = u0.Seconds[not (type(a1) ~= "table") and a1.speed or a1] or u0.Seconds.Slow
    local v1 = Slow / 6
    local v2 = Slow * 0.76
    return {
        step = Slow,
        total = v2,
        main = v2 - 0.32 * v1,
        pause = 0.1 * v1,
        snap = 0.22 * v1,
        pop = 0.32 * v1,
    }
end

return u0