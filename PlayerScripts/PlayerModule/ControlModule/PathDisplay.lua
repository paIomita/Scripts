-- Path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.PathDisplay

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.PlayerModule.ControlModule.PathDisplay
-- Decompile time: 1.95 ms

local ImageHandleAdornment
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local u16 = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI2")
local u18 = RaycastParams.new()
u18.FilterType = Enum.RaycastFilterType.Exclude
local u20 = {spacing = 8, image = "rbxasset://textures/Cursors/Gamepad/Pointer.png"}
u20.imageSize = Vector2.new(2, 2)
local u27 = {}
local u28 = {}
local Model = Instance.new("Model")
Model.Name = "PathDisplayPoints"
local Part = Instance.new("Part")
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
Part.Name = "PathDisplayAdornee"
Part.CFrame = CFrame.new(0, 0, 0)
Part.Parent = Model
local u45 = {}
local u46 = 30
local v1 = u46
for i = 1, v1 do
    ImageHandleAdornment = Instance.new("ImageHandleAdornment")
    ImageHandleAdornment.Archivable = false
    ImageHandleAdornment.Adornee = Part
    ImageHandleAdornment.Image = u20.image
    ImageHandleAdornment.Size = u20.imageSize
    u45[i] = ImageHandleAdornment
end

local function retrieveFromPool() -- Line: 41 -- upvalues: u45 (val), u46 (ref)
    local v1 = u45[1]
    if not v1 then
        return nil
    end
    local v2 = u45
    local v3 = u46
    u45[1] = u45[u46]
    v2[v3] = nil
    u46 = u46 - 1
    return v1
end

local function returnToPool(a1) -- Line: 52 -- upvalues: u46 (ref), u45 (val) -- types: a1: userdata
    u46 = u46 + 1
    u45[u46] = a1
end

local function renderPoint(a1, a2) -- Line: 57
    -- upvalues: u46 (ref), u45 (val), u16 (val), u18 (val), Model (val)
    local v1, v2, v3, v4
    if u46 == 0 then
        return nil
    end
    local v5 = u45[1]
    if v5 then
        v3 = u45
        v4 = u46
        u45[1] = u45[u46]
        v3[v4] = nil
        u46 = u46 - 1
        v1 = v5
    else
        v1 = nil
    end
    if u16 then
        u18.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, workspace.CurrentCamera}
        v5 = workspace:Raycast(a1 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0), u18)
        if not v5 then
            return nil
        end
        v1.CFrame = CFrame.lookAlong(v5.Position, v5.Normal)
        v1.Parent = Model
        return v1
    end
    v5 = Ray.new(a1 + Vector3.new(0, 2, 0), (Vector3.new(0, -8, 0)))
    v2, v3, v4 = workspace:FindPartOnRayWithIgnoreList(v5, {game.Players.LocalPlayer.Character, workspace.CurrentCamera})
    if not v2 then
        return nil
    end
    v1.CFrame = CFrame.new(v3, v3 + v4)
    v1.Parent = Model
    return v1
end

function u20.setCurrentPoints(a1) -- Line: 89 -- upvalues: u27 (ref)
    if typeof(a1) == "table" then
        u27 = a1
        return
    end
    u27 = {}
end

function u20.clearRenderedPath() -- Line: 97 -- upvalues: u28 (ref), u46 (ref), u45 (val), Model (val)
    for i, v in ipairs(u28) do
        v.Parent = nil
        u46 = u46 + 1
        u45[u46] = v
    end
    u28 = {}
    Model.Parent = nil
end

function u20.renderPath() -- Line: 106 -- upvalues: u20 (val), u27 (ref), u28 (ref), renderPoint (val), Model (val)
    u20.clearRenderedPath()
    if u27 and #u27 ~= 0 then
        local magnitude, v1, v2, v3
        local v4 = #u27
        local v5 = u27[v4]
        local v6 = 0
        u28[1] = (renderPoint(v5, true))
        if not u28[1] then
            return
        end
        while true do
            v5 = u27[v4]
            v1 = u27[v4 - 1]
            if v4 < 2 then
                break
            end
            v2 = v1 - v5
            magnitude = v2.magnitude
            if not (magnitude < v6) then
                v3 = renderPoint(v5 + v2.unit * v6, false)
                if v3 then
                    u28[#u28 + 1] = v3
                end
                v6 = v6 + u20.spacing
            else
                v6 = v6 - magnitude
                v4 = v4 - 1
            end
        end
        Model.Parent = workspace.CurrentCamera
        return
    end
end

return u20