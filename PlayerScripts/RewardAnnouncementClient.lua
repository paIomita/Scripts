-- Path: Players.Drrrrrrrrragonball.PlayerScripts.RewardAnnouncementClient

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.RewardAnnouncementClient
-- Decompile time: 4.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local RewardAnnouncement = ReplicatedStorage:WaitForChild("RewardAnnouncement")
local u14 = {}
local u15 = {}

local function isDuplicateAnnouncement(a1) -- Line: 10 -- upvalues: u14 (val), u15 (val)
    local id = a1 and a1.id
    if id == nil then
        return false
    end
    local v1 = tostring(id)
    if v1 == "" then
        return false
    end
    if u14[v1] then
        return true
    end
    u14[v1] = true
    table.insert(u15, v1)
    if #u15 > 256 then
        u14[(table.remove(u15, 1))] = nil
    end
    return false
end

local u17 = {
    global = "#FFE66D",
    red = "#FF4B4B",
    orange = "#FF9F1C",
    yellow = "#FFE45E",
    green = "#35E56B",
    blue = "#45B7FF",
    purple = "#B86CFF",
    pink = "#FF5BD6",
    hackerA = "#7CFF00",
    hackerB = "#39FF14",
    hackerC = "#58FF7A",
    hackerD = "#1FA33A",
    hackerE = "#167A2D",
}
local u18 = {"#7CFF00", "#1FA33A", "#39FF14", "#167A2D", "#58FF7A", "#1FA33A"}
local u25 = {
    "#FF3B30",
    "#FF6B00",
    "#FFD60A",
    "#7CFF00",
    "#00F5A0",
    "#00D1FF",
    "#2E7BFF",
    "#7A5CFF",
    "#B95CFF",
    "#FF5BD6",
    "#FF2D55",
}

local function escapeRichText(a1) -- Line: 72
    return ((((tostring(a1 or ""):gsub("&", "&amp;")):gsub("<", "&lt;")):gsub(">", "&gt;")):gsub("\"", "&quot;")):gsub("'", "&apos;")
end

local function wrap(a1, a2, a3) -- Line: 81 -- upvalues: escapeRichText (val)
    local v1 = string.format("<font color=\"%s\">%s</font>", a2, (escapeRichText(a1)))
    if a3 then
        return "<b>" .. v1 .. "</b>"
    end
    return v1
end

local function formatAmount(a1) -- Line: 90
    local v1 = math.floor(((tonumber(a1)) or 0) + 0.5)
    return (if not (v1 < 0) then "" else "-") .. tostring((math.abs(v1))):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

local function gradientText(a1, a2) -- Line: 99 -- upvalues: escapeRichText (val)
    local v1 = tostring(a1 or "")
    local v2 = {}
    local v3 = {}
    for i, j in utf8.codes(v1) do
        table.insert(v3, (utf8.char(j)))
    end
    local v4 = math.max(#v3, 1)
    for i2, v in ipairs(v3) do
        table.insert(
            v2,
            "<b>" .. (string.format(
                "<font color=\"%s\">%s</font>",
                a2[(math.clamp(math.floor((i2 - 1) / v4 * #a2) + 1, 1, #a2))],
                (escapeRichText(v))
            )) .. "</b>"
        )
    end
    return table.concat(v2)
end

local function alternatingText(a1, a2) -- Line: 114 -- upvalues: escapeRichText (val)
    local v1
    local v2 = tostring(a1 or "")
    local v3 = {}
    local v4 = 1
    for i, j in utf8.codes(v2) do
        v1 = utf8.char(j)
        if v1 ~= " " then
            table.insert(v3, "<b>" .. (string.format("<font color=\"%s\">%s</font>", a2[v4], (escapeRichText(v1)))) .. "</b>")
            v4 = v4 + 1
            if #a2 < v4 then end
        else
            table.insert(v3, " ")
        end
    end
    return table.concat(v3)
end

local function colorForAmount(a1) -- Line: 133
    local v1 = tonumber(a1) or 0
    if v1 >= 501 then
        return "#FF5BD6"
    end
    if v1 >= 101 then
        return "#B86CFF"
    end
    if v1 >= 51 then
        return "#45B7FF"
    end
    if v1 >= 31 then
        return "#35E56B"
    end
    if v1 >= 16 then
        return "#FFE45E"
    end
    if v1 >= 10 then
        return "#FF9F1C"
    end
    return "#FF4B4B"
end

local function hackerPhrase(a1) -- Line: 151 -- upvalues: alternatingText (val), u18 (val)
    return alternatingText(a1, u18)
end

local function phraseText(a1, a2) -- Line: 155
    -- upvalues: gradientText (val), u25 (val), hackerPhrase (val), u17 (val), escapeRichText (val)
    local v1 = tonumber(a2) or 0
    if v1 >= 5001 then
        return gradientText(a1, u25)
    end
    if v1 >= 1001 then
        return hackerPhrase(a1)
    end
    local v2 = tonumber(v1) or 0
    local pink = if not (v2 >= 501) then if not (v2 >= 101) then if not (v2 >= 51) then if not (v2 >= 31) then if not (v2 >= 16) then if not (v2 >= 10) then u17.red else u17.orange else u17.yellow else u17.green else u17.blue else u17.purple else u17.pink
    return "<b>" .. (string.format("<font color=\"%s\">%s</font>", pink, (escapeRichText(a1)))) .. "</b>"
end

local function formatMessage(a1) -- Line: 165
    -- upvalues: formatAmount (val), escapeRichText (val), gradientText (val), u25 (val), alternatingText (val)
    -- upvalues: u18 (val), u17 (val), phraseText (val)
    local v1
    local v2 = tonumber(a1 and a1.amount) or 0
    local displayName = a1 and a1.displayName or a1 and a1.username or "Someone"
    local balloonName = a1 and a1.balloonName or "a"
    local v3 = string.format("%s pulled %s R$ from the %s balloon!", displayName, formatAmount(v2), balloonName)
    local v4 = a1
    if v4 then
        v4 = true
        if a1.isGlobal ~= true then
            v4 = a1.global == true
        end
    end
    if not v4 then
        return phraseText(v3, v2)
    end
    local v5 = "<b>" .. (string.format("<font color=\"%s\">%s</font>", "#FFE66D", (escapeRichText("[GLOBAL]")))) .. "</b>"
    local v6 = tonumber(v2) or 0
    if v6 >= 5001 then
        v1 = gradientText(v3, u25)
    elseif not (v6 >= 1001) then
        local v7 = tonumber(v6) or 0
        local pink = if not (v7 >= 501) then if not (v7 >= 101) then if not (v7 >= 51) then if not (v7 >= 31) then if not (v7 >= 16) then if not (v7 >= 10) then u17.red else u17.orange else u17.yellow else u17.green else u17.blue else u17.purple else u17.pink
        v1 = "<b>" .. (string.format("<font color=\"%s\">%s</font>", pink, (escapeRichText(v3)))) .. "</b>"
    else
        v1 = alternatingText(v3, u18)
    end
    return v5 .. " " .. v1
end

RewardAnnouncement.OnClientEvent:Connect(function(a1) -- Line: 178 -- upvalues: TextChatService (val), u14 (val), u15 (val), formatMessage (val)
    local TextChannels = TextChatService:FindFirstChild("TextChannels")
    local RBXSystem = TextChannels and (TextChannels:FindFirstChild("RBXSystem") or TextChannels:FindFirstChild("RBXGeneral"))
    if RBXSystem then
        local v1
        local id = a1 and a1.id
        if id ~= nil then
            local v2 = tostring(id)
            if v2 == "" then
                v1 = false
            elseif not u14[v2] then
                u14[v2] = true
                table.insert(u15, v2)
                if #u15 > 256 then
                    u14[(table.remove(u15, 1))] = nil
                end
                v1 = false
            else
                v1 = true
            end
        else
            v1 = false
        end
        if not v1 then
            RBXSystem:DisplaySystemMessage((formatMessage(a1)))
            return
        end
    end
end)