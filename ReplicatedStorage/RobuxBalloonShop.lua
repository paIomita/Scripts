-- Path: ReplicatedStorage.RobuxBalloonShop

-- Script path: ReplicatedStorage.RobuxBalloonShop
-- Decompile time: 0.16 ms

local u0 = {
    onSale = false,
    balloonIndexes = {
        [2] = true,
        [4] = true,
        [10] = true,
        [14] = true,
        [15] = true,
    },
}

function u0.isRetiredBalloon(a1) -- Line: 11 -- upvalues: u0 (val)
    return not u0.onSale and u0.balloonIndexes[tonumber(a1)] == true
end

return u0