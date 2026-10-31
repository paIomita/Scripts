-- Path: Players.Drrrrrrrrragonball.PlayerScripts.TitleChatPrefix

-- Script path: Players.Drrrrrrrrragonball.PlayerScripts.TitleChatPrefix
-- Decompile time: 4.10 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local v1 = utf8.char(57344)
local v2 = TextChatService.ChatVersion == Enum.ChatVersion.TextChatService
local GetTitleForUserId = ReplicatedStorage:WaitForChild("GetTitleForUserId", 10)
local u28 = {}
local u29 = {}
local u30 = {
    Noob = "Player",
    Beginner = "Beginner",
    Novice = "Novice",
    Pro = "Pro",
    Master = "Master",
    Hacker = "Hacker",
    Godlike = "Godlike",
    Immortal = "Immortal",
    Magma = "Magma",
    ["Dark-Matter"] = "Dark-Matter",
    God = "God",
}
u30.Admin = v1 .. "Admin"
u30.VIP = v1 .. "VIP"
u30.Developer = v1 .. "Developer"
u30.Tester = v1 .. "Tester"
u30.Moderator = v1 .. "Moderator"
u30.ContentCreator = v1 .. "Content Creator"
u30.Season1Champion = "Season 1 Champion"
u30.Season1God = "Season 1 God"
u30.Season2Champion = "Season 2 Champion"
u30.Season2God = "Season 2 God"
u30.Season3Champion = "Season 3 Champion"
u30.Season3God = "Season 3 God"
u30.Season4Champion = "Season 4 Champion"
u30.Season4God = "Season 4 God"
u30.LeaderboardPopsSpent = "Pops Spent Title"
u30.LeaderboardRobuxSpent = "Robux Earned Title"
u30.LeaderboardRobuxDonated = "Robux Donated Title"
u30.LeaderboardPlaytime = "Playtime Title"
local u73 = {
    Noob = "#AAAAAA",
    Beginner = "#88CC88",
    Novice = "#55BB55",
    Pro = "#44AAFF",
    Master = "#AA55FF",
    Hacker = "#FF5555",
    Godlike = "#FFD700",
    Immortal = "#FF44FF",
    Magma = "#FF6600",
    ["Dark-Matter"] = "#8800AA",
    God = "#FFD700",
    Admin = "#FF4444",
    VIP = "#FFD700",
    Developer = "#00BFFF",
    Tester = "#00FF88",
    Moderator = "#FF8800",
    ContentCreator = "#FF00FF",
    LeaderboardRobuxDonated = "#54FF9D",
    Season1Champion = "#E85D04",
    Season1God = "#B7791F",
    Season2Champion = "#0077B6",
    Season2God = "#6D28D9",
    Season3Champion = "#9333EA",
    Season3God = "#BE185D",
    Season4Champion = "#16A34A",
    Season4God = "#22D3EE",
    LeaderboardPopsSpent = "#FF8A2A",
    LeaderboardRobuxSpent = "#FFD22E",
    LeaderboardPlaytime = "#28C9FF",
}

local function color3ToHex(a1) -- Line: 97
    return string.format(
        "#%02X%02X%02X",
        math.clamp(math.floor(a1.R * 255 + 0.5), 0, 255),
        math.clamp(math.floor(a1.G * 255 + 0.5), 0, 255),
        (math.clamp(math.floor(a1.B * 255 + 0.5), 0, 255))
    )
end

local function getStoredGradientColorHex(a1) -- Line: 104 -- upvalues: color3ToHex (val)
    local StoredTitleGradient = a1:FindFirstChild("StoredTitleGradient")
    local UIGradient = StoredTitleGradient and StoredTitleGradient:FindFirstChildWhichIsA("UIGradient")
    local v1 = UIGradient and UIGradient.Color.Keypoints[1]
    return v1 and color3ToHex(v1.Value) or nil
end

local function escapeRichText(a1) -- Line: 111
    return ((((tostring(a1 or ""):gsub("&", "&amp;")):gsub("<", "&lt;")):gsub(">", "&gt;")):gsub("\"", "&quot;")):gsub("'", "&apos;")
end

local function buildTitlePrefix(a1, a2, a3) -- Line: 120 -- upvalues: u30 (val), u73 (val), escapeRichText (val)
    local v1 = tostring(a1 or "Noob")
    if v1 == "Player" then
        v1 = "Noob"
    end
    local v2 = tostring(a3 or "")
    if v2 == "" then
        v2 = u30[v1] or v1
    end
    return "<font color=\"" .. (if not a2 then u73[v1] or "#FFFFFF" else if a2 == "" then u73[v1] or "#FFFFFF" else if a2 ~= "#FFFFFF" then a2 else u73[v1] or "#FFFFFF") .. "\">[" .. (escapeRichText(v2)) .. "]</font>"
end

local function getTitlePrefix(a1) -- Line: 137 -- upvalues: color3ToHex (val), buildTitlePrefix (val)
    local TitleGradientData = a1:FindFirstChild("TitleGradientData")
    local Value = TitleGradientData and not (TitleGradientData.Value == "") and TitleGradientData.Value or "Noob"
    local StoredTitleGradient = a1:FindFirstChild("StoredTitleGradient")
    local UIGradient = StoredTitleGradient and StoredTitleGradient:FindFirstChildWhichIsA("UIGradient")
    local v1 = UIGradient and UIGradient.Color.Keypoints[1]
    local Value_2 = v1 and color3ToHex(v1.Value) or nil
    local TitleColorHex = a1:FindFirstChild("TitleColorHex")
    if not Value_2 then
        if TitleColorHex and TitleColorHex.Value ~= "" then
            Value_2 = TitleColorHex.Value
        end
    elseif Value_2 == "#FFFFFF" and TitleColorHex and TitleColorHex.Value ~= "" then
        Value_2 = TitleColorHex.Value
    end
    return (buildTitlePrefix(Value, Value_2, (a1:GetAttribute("EquippedTitleDisplayText"))))
end

local function requestRemoteTitle(a1) -- Line: 150 -- upvalues: GetTitleForUserId (val), u29 (val), u28 (val)
    if GetTitleForUserId and not u29[a1] then
        u29[a1] = true
        task.spawn(function() -- Line: 156 -- upvalues: GetTitleForUserId (upval), a1 (val), u28 (upval), u29 (upval)
            local success, err = pcall(function() -- Line: 157 -- upvalues: GetTitleForUserId (upval), a1 (upval)
                return GetTitleForUserId:InvokeServer(a1)
            end)
            if success and type(err) == "table" then
                local v1 = a1
                u28[v1] = {
                    expiresAt = os.clock() + 300,
                    titleKey = tostring(err.titleKey or "Noob"),
                    titleText = tostring(err.titleText or ""),
                    titleColorHex = tostring(err.titleColorHex or ""),
                }
            end
            u29[a1] = nil
        end)
        return
    end
end

local function getSendingPlayer(a1) -- Line: 172 -- upvalues: Players (val)
    if not a1.TextSource then
        return nil
    end
    return Players:GetPlayerByUserId(a1.TextSource.UserId)
end

local function getMessageTitlePrefix(a1) -- Line: 180
    -- upvalues: Players (val), getTitlePrefix (val), u28 (val), buildTitlePrefix (val), GetTitleForUserId (val)
    -- upvalues: u29 (val)
    if not a1.TextSource then
        return nil
    end
    local u6 = tonumber(a1.TextSource.UserId)
    if not u6 then
        return nil
    end
    local PlayerByUserId = Players:GetPlayerByUserId(u6)
    if PlayerByUserId then
        return (getTitlePrefix(PlayerByUserId))
    end
    local v1 = u28[u6]
    if v1 then
        local expiresAt = v1.expiresAt
        if os.clock() < expiresAt then
            return (buildTitlePrefix(v1.titleKey, v1.titleColorHex, v1.titleText))
        end
    end
    if GetTitleForUserId and not u29[u6] then
        u29[u6] = true
        task.spawn(function() -- Line: 156 -- upvalues: GetTitleForUserId (upval), u6 (val), u28 (upval), u29 (upval)
            local success, err = pcall(function() -- Line: 157 -- upvalues: GetTitleForUserId (upval), u6 (upval)
                return GetTitleForUserId:InvokeServer(u6)
            end)
            if success and type(err) == "table" then
                local v1 = u6
                u28[v1] = {
                    expiresAt = os.clock() + 300,
                    titleKey = tostring(err.titleKey or "Noob"),
                    titleText = tostring(err.titleText or ""),
                    titleColorHex = tostring(err.titleColorHex or ""),
                }
            end
            u29[u6] = nil
        end)
    end
    return nil
end

if v2 then
    function TextChatService.OnIncomingMessage(a1) -- Line: 205 -- upvalues: Players (val), getMessageTitlePrefix (val)
        local v1 = nil
        local PlayerByUserId = if a1.TextSource then Players:GetPlayerByUserId(a1.TextSource.UserId) else nil
        if PlayerByUserId
            and PlayerByUserId:GetAttribute("OwnerAdminChatCommandUser") == true
            and tostring(a1.Text or ""):match("^%s*/silent%s+") then
            v1 = Instance.new("TextChatMessageProperties")
            v1.Text = ""
            v1.PrefixText = ""
            return v1
        end
        local v2 = getMessageTitlePrefix(a1)
        if v2 then
            v1 = Instance.new("TextChatMessageProperties")
            v1.PrefixText = v2 .. " " .. tostring(a1.PrefixText or "")
        end
        return v1
    end

    return
end
warn("[TitleChatPrefix] TextChatService chat is disabled, so global chat title prefixes cannot be applied.")