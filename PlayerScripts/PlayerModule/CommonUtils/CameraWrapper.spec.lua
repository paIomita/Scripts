-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CommonUtils.CameraWrapper.spec

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.CommonUtils.CameraWrapper.spec
-- Decompile time: 0.55 ms

local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local describe = JestGlobals.describe
local expect = JestGlobals.expect
local it = JestGlobals.it
local waitForEvents = require(CorePackages.Workspace.Packages.TestUtils).DeferredLuaHelpers.waitForEvents
local u26 = require(script.Parent.CameraWrapper)
describe("CameraWrapper", function() -- Line: 12 -- upvalues: it (val), u26 (val), expect (val), waitForEvents (val)
    it("should instantiate", function() -- Line: 13 -- upvalues: u26 (upval), expect (upval)
        local v1 = u26.new()
        expect(v1).never.toBeNil()
    end)
    it("should return updated camera", function() -- Line: 19 -- upvalues: u26 (upval), expect (upval), waitForEvents (upval)
        local v1 = u26.new()
        v1:Enable()
        local Camera = Instance.new("Camera")
        Camera.Parent = game.Workspace
        expect(v1:getCamera()).toBe(game.Workspace.CurrentCamera)
        expect(v1:getCamera()).never.toBe(Camera)
        game.Workspace.CurrentCamera = Camera
        waitForEvents()
        expect(v1:getCamera()).toBe(game.Workspace.CurrentCamera)
        expect(v1:getCamera()).toBe(Camera)
    end)
end)