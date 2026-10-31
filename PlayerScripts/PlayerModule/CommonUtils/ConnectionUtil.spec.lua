-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CommonUtils.ConnectionUtil.spec

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CommonUtils.ConnectionUtil.spec
-- Decompile time: 1.83 ms

local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local describe = JestGlobals.describe
local expect = JestGlobals.expect
local it = JestGlobals.it
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local u25 = require(script.Parent.ConnectionUtil)
describe("ConnectionUtil", function() -- Line: 13 -- upvalues: it (val), u25 (val), expect (val), Signal (val)
    it("should instantiate", function() -- Line: 14 -- upvalues: u25 (upval), expect (upval)
        local v1 = u25.new()
        expect(v1).never.toBeNil()
    end)
    it("should track a connection", function() -- Line: 20 -- upvalues: u25 (upval), Signal (upval), expect (upval)
        local v1 = u25.new()
        local v2 = Signal.new()
        local u6 = ""
        v1:trackConnection("Signal", (v2:Connect(function(a1) -- Line: 27 -- upvalues: u6 (ref)
            u6 = a1
        end)))
        v2:fire("Testing")
        expect(u6).toBe("Testing")
    end)
    it("should disconnect from signal", function() -- Line: 36 -- upvalues: u25 (upval), Signal (upval), expect (upval)
        local v1 = u25.new()
        local v2 = Signal.new()
        local u6 = ""
        v1:trackConnection("Signal", (v2:Connect(function(a1) -- Line: 43 -- upvalues: u6 (ref)
            u6 = a1
        end)))
        v1:disconnect("Signal")
        v2:fire("Testing")
        expect(u6).toBe("")
    end)
    it("should disconnect from all", function() -- Line: 53 -- upvalues: u25 (upval), Signal (upval), expect (upval)
        local v1 = u25.new()
        local v2 = Signal.new()
        local v3 = Signal.new()
        local v4 = Signal.new()
        local u12 = ""
        local u13 = ""
        local u14 = ""
        v1:trackConnection("Signal", (v2:Connect(function(a1) -- Line: 65 -- upvalues: u12 (ref)
            u12 = a1
        end)))
        v1:trackConnection("Signal1", (v3:Connect(function(a1) -- Line: 71 -- upvalues: u13 (ref)
            u13 = a1
        end)))
        v1:trackConnection("Signal2", (v4:Connect(function(a1) -- Line: 77 -- upvalues: u14 (ref)
            u14 = a1
        end)))
        v1:disconnectAll()
        v2:fire("TestingPrimary")
        v2:fire("TestingSecondary")
        v2:fire("TestingTertiary")
        expect(u12).toBe("")
        expect(u13).toBe("")
        expect(u14).toBe("")
    end)
    it("should call manual disconnect", function() -- Line: 92 -- upvalues: u25 (upval), expect (upval)
        local v1 = u25.new()
        local u3 = ""
        v1:trackBoundFunction("Manual", function() -- Line: 96 -- upvalues: u3 (ref)
            u3 = "Disconnected"
        end)
        v1:disconnect("Manual")
        expect(u3).toBe("Disconnected")
    end)
end)