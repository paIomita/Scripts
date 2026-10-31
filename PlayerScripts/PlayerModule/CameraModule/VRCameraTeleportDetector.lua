-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRCameraTeleportDetector

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRCameraTeleportDetector
-- Decompile time: 0.25 ms

local u0 = {JUMP_STUDS = 4, SETTLED_STUDS = 1, DEBOUNCE_SECONDS = 0.25}

function u0.shouldRecenter(a1, a2, a3, a4) -- Line: 29
    -- upvalues: u0 (val)
    if a2 <= u0.JUMP_STUDS then
        return false
    end
    if a1 ~= nil and u0.SETTLED_STUDS <= a1 then
        return false
    end
    if a3 ~= nil and a4 - a3 < u0.DEBOUNCE_SECONDS then
        return false
    end
    return true
end

return u0