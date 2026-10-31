-- Path: Players.Drrrrrrrrragonball.PlayerScripts.RbxCharacterSounds.AtomicBinding

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.RbxCharacterSounds.AtomicBinding
-- Decompile time: 3.50 ms

local unbindNodeDescend

local function parsePath(a1) -- Line: 4
    local v1 = string.split(a1, "/")
    for i = #v1, 1, -1 do
        if v1[i] == "" then
            table.remove(v1, i)
        end
    end
    return v1
end

local function isManifestResolved(a1, a2) -- Line: 14
    local v1 = 0
    for k in pairs(a1) do
        v1 = v1 + 1
    end
    assert(v1 <= a2, v1)
    return v1 == a2
end

function unbindNodeDescend(a1, a2) -- Line: 24 -- upvalues: unbindNodeDescend (val)
    if a1.instance == nil then
        return
    end
    a1.instance = nil
    local connections = a1.connections
    if connections then
        for i, v in ipairs(connections) do
            v:Disconnect()
        end
        table.clear(connections)
    end
    if a2 and a1.alias then
        a2[a1.alias] = nil
    end
    local children = a1.children
    if children then
        for k, i2 in pairs(children) do
            unbindNodeDescend(i2, a2)
        end
    end
end

local u3 = {}
u3.__index = u3

function u3.new(a1, a2) -- Line: 54 -- upvalues: parsePath (val), u3 (val)
    local v1 = {}
    local v2 = 1
    for k, v in pairs(a1) do
        v1[k] = (parsePath(v))
        v2 = v2 + 1
    end
    return (setmetatable({
        _boundFn = a2,
        _parsedManifest = v1,
        _manifestSizeTarget = v2,
        _dtorMap = {},
        _connections = {},
        _rootInstToRootNode = {},
        _rootInstToManifest = {},
    }, u3))
end

function u3:_startBoundFn(a2, a3) -- Line: 80
    local _boundFn = self._boundFn
    local _dtorMap = self._dtorMap
    local v1 = _dtorMap[a2]
    if v1 then
        v1()
        _dtorMap[a2] = nil
    end
    v1 = _boundFn(a3)
    if v1 then
        _dtorMap[a2] = v1
    end
end

function u3:_stopBoundFn(a2) -- Line: 96
    local _dtorMap = self._dtorMap
    local v1 = _dtorMap[a2]
    if v1 then
        v1()
        _dtorMap[a2] = nil
    end
end

function u3.bindRoot(a1, a2) -- Line: 106 -- upvalues: unbindNodeDescend (val)
    local children, connections, processNode, v1, v2, v3
    debug.profilebegin("AtomicBinding:BindRoot")
    local _parsedManifest = a1._parsedManifest
    local _rootInstToRootNode = a1._rootInstToRootNode
    local _rootInstToManifest = a1._rootInstToManifest
    local _manifestSizeTarget = a1._manifestSizeTarget
    assert(_rootInstToManifest[a2] == nil)
    local u162 = {}
    _rootInstToManifest[a2] = u162
    debug.profilebegin("BuildTree")
    local v4 = {alias = "root", instance = a2}
    if next(_parsedManifest) then
        v4.children = {}
        v4.connections = {}
    end
    _rootInstToRootNode[a2] = v4
    for k, v in pairs(_parsedManifest) do
        v3 = v4
        for i, i2 in ipairs(v) do
            v1 = i == #v
            v2 = v3.children[i2] or {}
            if not v1 then
                children = v2.children or {}
                v2.children = children
                connections = v2.connections or {}
                v2.connections = connections
            else
                if v2.alias ~= nil then
                    error("Multiple aliases assigned to one instance")
                end
                v2.alias = k
            end
            v3.children[i2] = v2
        end
    end
    debug.profileend()

    function processNode(a1_2) -- Line: 160
        -- upvalues: u162 (val), processNode (val), a1 (val), a2 (val), unbindNodeDescend (upval)
        -- upvalues: _manifestSizeTarget (val)
        local u3 = assert(a1_2.instance)
        local children = a1_2.children
        local alias = a1_2.alias
        local v1 = not children
        if alias then
            u162[alias] = u3
        end
        if not v1 then
            local v2
            for i, v in ipairs(u3:GetChildren()) do
                v2 = children[v.Name]
                if v2 and v2.instance == nil then
                    v2.instance = v
                    processNode(v2)
                end
            end
            table.insert(a1_2.connections, (u3.ChildAdded:Connect(function(a1) -- Line: 172 -- upvalues: children (val), processNode (upval)
                local v1 = children[a1.Name]
                if v1 and v1.instance == nil then
                    v1.instance = a1
                    processNode(v1)
                    return
                end
            end)))
            table.insert(a1_2.connections, (u3.ChildRemoved:Connect(function(a1_2) -- Line: 183
                -- upvalues: children (val), a1 (upval), a2 (upval), unbindNodeDescend (upval), u162 (upval), u3 (val)
                -- upvalues: processNode (upval)
                local Name = a1_2.Name
                local v1 = children[Name]
                if not v1 or v1.instance ~= a1_2 then
                    return
                end
                a1:_stopBoundFn(a2)
                unbindNodeDescend(v1, u162)
                assert(v1.instance == nil)
                v1 = u3:FindFirstChild(Name)
                if v1 then
                    local v2 = children[v1.Name]
                    if v2 then
                        if v2.instance ~= nil then
                            return
                        end
                        v2.instance = v1
                        processNode(v2)
                    end
                end
            end)))
        end
        if v1 then
            local v3 = _manifestSizeTarget
            local v4 = 0
            for k in pairs(u162) do
                v4 = v4 + 1
            end
            assert(v4 <= v3, v4)
            if v4 == v3 then
                a1:_startBoundFn(a2, u162)
            end
        end
    end

    debug.profilebegin("ResolveTree")
    processNode(v4)
    debug.profileend()
    debug.profileend()
end

function u3.unbindRoot(a1, a2) -- Line: 236 -- upvalues: unbindNodeDescend (val)
    local _rootInstToRootNode = a1._rootInstToRootNode
    local _rootInstToManifest = a1._rootInstToManifest
    a1:_stopBoundFn(a2)
    local v1 = _rootInstToRootNode[a2]
    if v1 then
        unbindNodeDescend(v1, (assert(_rootInstToManifest[a2])))
        _rootInstToRootNode[a2] = nil
    end
    _rootInstToManifest[a2] = nil
end

function u3:destroy() -- Line: 252 -- upvalues: unbindNodeDescend (val)
    local v1
    debug.profilebegin("AtomicBinding:destroy")
    for k, v in pairs(self._dtorMap) do
        v:destroy()
    end
    table.clear(self._dtorMap)
    for i, i2 in ipairs(self._connections) do
        i2:Disconnect()
    end
    table.clear(self._connections)
    local _rootInstToManifest = self._rootInstToManifest
    for k2, j in pairs(self._rootInstToRootNode) do
        v1 = assert(_rootInstToManifest[k2])
        unbindNodeDescend(j, v1)
    end
    table.clear(self._rootInstToManifest)
    table.clear(self._rootInstToRootNode)
    debug.profileend()
end

return u3