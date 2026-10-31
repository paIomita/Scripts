-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRCameraTeleportDetector.spec

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CameraModule.VRCameraTeleportDetector.spec
-- Decompile time: 1.08 ms

local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local describe = JestGlobals.describe
local expect = JestGlobals.expect
local it = JestGlobals.it
local v1 = require(script.Parent.VRCameraTeleportDetector)
local shouldRecenter = v1.shouldRecenter
local JUMP_STUDS = v1.JUMP_STUDS
local SETTLED_STUDS = v1.SETTLED_STUDS
local DEBOUNCE_SECONDS = v1.DEBOUNCE_SECONDS
describe("VRCameraTeleportDetector.shouldRecenter", function() -- Line: 14
    -- upvalues: it (val), expect (val), shouldRecenter (val), JUMP_STUDS (val), SETTLED_STUDS (val)
    -- upvalues: DEBOUNCE_SECONDS (val)
    it("fires on a discrete jump from rest (no prior step, never recentered)", function() -- Line: 15 -- upvalues: expect (upval), shouldRecenter (upval), JUMP_STUDS (upval)
        expect(shouldRecenter(nil, JUMP_STUDS + 10, nil, 100)).toBe(true)
    end)
    it("fires on a discrete jump preceded by a near-still frame", function() -- Line: 19 -- upvalues: expect (upval), shouldRecenter (upval), SETTLED_STUDS (upval), JUMP_STUDS (upval)
        expect(shouldRecenter(SETTLED_STUDS - 0.5, JUMP_STUDS + 10, nil, 100)).toBe(true)
    end)
    it("does not fire for sub-threshold motion", function() -- Line: 23 -- upvalues: expect (upval), shouldRecenter (upval), JUMP_STUDS (upval)
        expect(shouldRecenter(0, JUMP_STUDS - 0.1, nil, 100)).toBe(false)
        expect(shouldRecenter(0, 0, nil, 100)).toBe(false)
    end)
    it("does not fire when the previous frame was already moving (continuous motion)", function() -- Line: 28 -- upvalues: expect (upval), shouldRecenter (upval), SETTLED_STUDS (upval), JUMP_STUDS (upval)
        expect(shouldRecenter(SETTLED_STUDS + 0.1, JUMP_STUDS + 10, nil, 100)).toBe(false)
    end)
    it("does not fire within the debounce interval", function() -- Line: 33 -- upvalues: expect (upval), shouldRecenter (upval), JUMP_STUDS (upval), DEBOUNCE_SECONDS (upval)
        expect(shouldRecenter(nil, JUMP_STUDS + 10, 100, 100 + DEBOUNCE_SECONDS - 0.01)).toBe(false)
    end)
    it("fires again once the debounce interval has elapsed", function() -- Line: 38 -- upvalues: expect (upval), shouldRecenter (upval), JUMP_STUDS (upval), DEBOUNCE_SECONDS (upval)
        expect(shouldRecenter(nil, JUMP_STUDS + 10, 100, 100 + DEBOUNCE_SECONDS + 0.01)).toBe(true)
    end)
    it("does not retrigger every frame under continuous per-frame CFrame writes (oscillation guard)", function() -- Line: 43 -- upvalues: JUMP_STUDS (upval), shouldRecenter (upval), expect (upval)
        local v1 = 0
        local v2 = nil
        local v3 = nil
        local v4 = 0
        local v5 = JUMP_STUDS + 10
        for i = 1, 120 do
            if shouldRecenter(v2, v5, v3, v1) then
                v4 = v4 + 1
            end
            v1 = v1 + 0.016666666666666666
        end
        expect(v4).toBe(1)
    end)
end)