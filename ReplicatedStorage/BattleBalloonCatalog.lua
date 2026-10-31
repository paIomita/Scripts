-- Path: ReplicatedStorage.BattleBalloonCatalog

-- Script path: ReplicatedStorage.BattleBalloonCatalog
-- Decompile time: 0.45 ms

local byKey, clientDefs, v1, v2, v3
local v4 = {
    order = {
        "Red",
        "Orange",
        "Yellow",
        "Lime",
        "Green",
        "Blue",
        "Cobalt",
        "Violet",
        "Orchid",
        "Fuschia",
        "Pink",
    },
}
local v5 = {
    "88538512855921",
    "111583553474295",
    "102624714463485",
    "136318374173788",
    "104096733080965",
    "77067321530724",
    "89882986173445",
    "111989361835444",
    "88612190597995",
    "129995677832106",
    "82638088484051",
}
local v6 = {1, 3, 10, 20, 25, 50, 75, 100, 250, 1000, 5000}
v4.byKey = {}
v4.clientDefs = {}
for i, v in ipairs(v4.order) do
    v2 = v .. " Balloon"
    v3 = "rbxassetid://" .. v5[i]
    byKey = v4.byKey
    v1 = {display = v2, asset = v3, cost = v6[i]}
    byKey[v] = v1
    clientDefs = v4.clientDefs
    v1 = {key = v, name = v2, image = v3, cost = v6[i]}
    clientDefs[i] = v1
end
return v4