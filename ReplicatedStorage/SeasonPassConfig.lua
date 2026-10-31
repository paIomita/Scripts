-- Path: ReplicatedStorage.SeasonPassConfig

-- Script path: ReplicatedStorage.SeasonPassConfig
-- Decompile time: 44.20 ms

local u0 = {SeasonId = 2, SeasonName = "SEASON 1"}
u0.SeasonStartUnix = DateTime.fromUniversalTime(2026, 7, 26, 4, 0, 0).UnixTimestamp
u0.SeasonEndUnix = DateTime.fromUniversalTime(2026, 8, 23, 4, 0, 0).UnixTimestamp
u0.MaxTier = 50
u0.MaxSeasonXP = 14300
u0.PremiumPrice = 399
u0.PremiumGamePassId = 1927513193
u0.SkipToEndPrice = 999
u0.SkipToEndProductId = 3611694752
u0.MissionSkipProductIds = {
    Daily = {Easy = 3612124491, Medium = 3612124656, Hard = 3612124737},
    Weekly = {Easy = 3612124839, Medium = 3612124871, Hard = 3612124882},
    Monthly = {Easy = 3612124910, Medium = 3612124970, Hard = 3612124984},
}
u0.StudioTestUserIds = {[2572197100] = true}
u0.Assets = {
    Pops = "rbxassetid://140173109015230",
    Credits = "rbxassetid://84158554214330",
    RoBal = "rbxassetid://118839423136179",
    Red = "rbxassetid://88538512855921",
    White = "rbxassetid://136758216666144",
    Orange = "rbxassetid://111583553474295",
    Yellow = "rbxassetid://102624714463485",
    Green = "rbxassetid://104096733080965",
    Cyan = "rbxassetid://77067321530724",
    Cobalt = "rbxassetid://89882986173445",
    Violet = "rbxassetid://111989361835444",
    Orchid = "rbxassetid://88612190597995",
    Pink = "rbxassetid://82638088484051",
    Fuschia = "rbxassetid://129995677832106",
    Lime = "rbxassetid://136318374173788",
    Summer = "rbxassetid://128529360727278",
    Rich = "rbxassetid://125800937292528",
    Cosmic = "rbxassetid://135176258024217",
    Rainbow = "rbxassetid://123490843567560",
    Clover = "rbxassetid://113351023179100",
    Star = "rbxassetid://86554068378315",
    Clock = "rbxassetid://108975604225114",
    Sword = "rbxassetid://92925094328048",
    Gift = "rbxassetid://111506192638597",
    Obby = "rbxassetid://87531941715815",
    Spinner = "rbxassetid://106060374989990",
    ItemsCrate = "rbxassetid://98935797200796",
    SpinnerSkinsCrate = "rbxassetid://74730683332161",
    AuraCrate = "rbxassetid://130818303515769",
    PremiumItemsCrate = "rbxassetid://104031525496743",
    PremiumSpinnerSkinsCrate = "rbxassetid://128833320473410",
    PremiumAuraCrate = "rbxassetid://123622421166685",
}
u0.DifficultyXP = {
    Daily = {Easy = 20, Medium = 40, Hard = 65},
    Weekly = {Easy = 200, Medium = 450, Hard = 850},
    Monthly = {Easy = 500, Medium = 1500, Hard = 3500},
}
u0.NonRobuxBalloonKeys = {"Red", "Orange", "Yellow", "Green", "Cyan", "Violet", "Pink", "Fuschia", "Lime"}

local function mission(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) -- Line: 87
    local v1 = {
        id = a1,
        difficulty = a2,
        family = a3,
        action = a4,
        target = a5,
        xp = a6,
        title = a7,
        description = a8,
        icon = a9,
    }
    local v2 = pairs
    for k, v in v2(a10 or {}) do
        v1[k] = v
    end
    return v1
end

local function group(a1, ...) -- Line: 103
    return {family = a1, variants = {...}}
end

local Daily = u0.DifficultyXP.Daily
local Weekly = u0.DifficultyXP.Weekly
local Monthly = u0.DifficultyXP.Monthly
local Assets = u0.Assets
u0.MissionPools = {
    Daily = {
        Easy = {
            group("playtime", (mission(
                "daily_easy_play",
                "Easy",
                "playtime",
                "play_seconds",
                300,
                Daily.Easy,
                "PLAY FOR 5 MINUTES",
                "Stay in the server for 5 minutes",
                Assets.Clock,
                {displayDivisor = 60}
            ))),
            group("open_balloons", (mission(
                "daily_easy_open",
                "Easy",
                "open_balloons",
                "spin_total",
                3,
                Daily.Easy,
                "OPEN 3 BALLOONS",
                "Every completed balloon spin counts",
                Assets.Red
            ))),
            group("specific_obby", (mission(
                "daily_easy_easy_obby",
                "Easy",
                "specific_obby",
                "obby_complete",
                3,
                Daily.Easy,
                "COMPLETE EASY OBBY 3 TIMES",
                "Finish the Easy obby three times",
                Assets.Obby,
                {obbyIndex = 1}
            ))),
            group("credit_single", (mission(
                "daily_easy_credit_spin",
                "Easy",
                "credit_single",
                "credit_single",
                100,
                Daily.Easy,
                "GET 100+ CREDITS IN ONE SPIN",
                "Land at least 100 Credits from one balloon",
                Assets.Credits
            ))),
            group("earn_pops", (mission(
                "daily_easy_pops",
                "Easy",
                "earn_pops",
                "earn_pops_non_lime",
                10,
                Daily.Easy,
                "EARN 10 POPS",
                "Lime balloon rewards do not count",
                Assets.Pops
            ))),
            group("balloon_variety", (mission(
                "daily_easy_balloon_variety",
                "Easy",
                "balloon_variety",
                "distinct_balloons",
                3,
                Daily.Easy,
                "SPIN 3 DIFFERENT BALLOONS",
                "Try three different balloon types",
                Assets.Red
            ))),
            (group("obby_variety", (mission(
                "daily_easy_obby_variety",
                "Easy",
                "obby_variety",
                "distinct_obbies",
                2,
                Daily.Easy,
                "COMPLETE 2 DIFFERENT OBBIES",
                "Finish two different obbies",
                Assets.Obby
            )))),
        },
        Medium = {
            group("playtime", (mission(
                "daily_medium_play",
                "Medium",
                "playtime",
                "play_seconds",
                1800,
                Daily.Medium,
                "PLAY FOR 30 MINUTES",
                "Stay in the server for 30 minutes",
                Assets.Clock,
                {displayDivisor = 60}
            ))),
            group("open_balloons", (mission(
                "daily_medium_open",
                "Medium",
                "open_balloons",
                "spin_total",
                15,
                Daily.Medium,
                "OPEN 15 BALLOONS",
                "Every completed balloon spin counts",
                Assets.Red
            ))),
            group("specific_obby", mission(
                "daily_medium_easy_obby",
                "Medium",
                "specific_obby",
                "obby_complete",
                15,
                Daily.Medium,
                "COMPLETE EASY OBBY 15 TIMES",
                "Finish the Easy obby fifteen times",
                Assets.Obby,
                {obbyIndex = 1}
            ), (mission(
                "daily_medium_medium_obby",
                "Medium",
                "specific_obby",
                "obby_complete",
                8,
                Daily.Medium,
                "COMPLETE MEDIUM OBBY 8 TIMES",
                "Finish the Medium obby eight times",
                Assets.Obby,
                {obbyIndex = 2}
            ))),
            group("credit_single", (mission(
                "daily_medium_credit_spin",
                "Medium",
                "credit_single",
                "credit_single",
                200,
                Daily.Medium,
                "GET 200+ CREDITS IN ONE SPIN",
                "Land at least 200 Credits from one balloon",
                Assets.Credits
            ))),
            group("earn_pops", (mission(
                "daily_medium_pops",
                "Medium",
                "earn_pops",
                "earn_pops_non_lime",
                50,
                Daily.Medium,
                "EARN 50 POPS",
                "Lime balloon rewards do not count",
                Assets.Pops
            ))),
            group("balloon_variety", (mission(
                "daily_medium_balloon_variety",
                "Medium",
                "balloon_variety",
                "distinct_balloons",
                4,
                Daily.Medium,
                "SPIN 4 DIFFERENT BALLOONS",
                "Try four different balloon types",
                Assets.Red
            ))),
            (group("obby_variety", (mission(
                "daily_medium_obby_variety",
                "Medium",
                "obby_variety",
                "distinct_obbies",
                4,
                Daily.Medium,
                "COMPLETE 4 DIFFERENT OBBIES",
                "Finish four different obbies",
                Assets.Obby
            )))),
        },
        Hard = {
            group("playtime", (mission(
                "daily_hard_play",
                "Hard",
                "playtime",
                "play_seconds",
                5400,
                Daily.Hard,
                "PLAY FOR 90 MINUTES",
                "Stay in the server for 90 minutes",
                Assets.Clock,
                {displayDivisor = 60}
            ))),
            group("open_balloons", (mission(
                "daily_hard_open",
                "Hard",
                "open_balloons",
                "spin_total",
                50,
                Daily.Hard,
                "OPEN 50 BALLOONS",
                "Every completed balloon spin counts",
                Assets.Red
            ))),
            group("specific_obby", mission(
                "daily_hard_long_obby",
                "Hard",
                "specific_obby",
                "obby_complete",
                7,
                Daily.Hard,
                "COMPLETE LONG OBBY 7 TIMES",
                "Finish the Long obby seven times",
                Assets.Obby,
                {obbyIndex = 5}
            ), (mission(
                "daily_hard_rainbow_obby",
                "Hard",
                "specific_obby",
                "obby_complete",
                10,
                Daily.Hard,
                "COMPLETE RAINBOW OBBY 10 TIMES",
                "Finish the Rainbow obby ten times",
                Assets.Obby,
                {obbyIndex = 6}
            ))),
            group("credit_single", (mission(
                "daily_hard_credit_spin",
                "Hard",
                "credit_single",
                "credit_single",
                500,
                Daily.Hard,
                "GET 500+ CREDITS IN ONE SPIN",
                "Land at least 500 Credits from one balloon",
                Assets.Credits
            ))),
            group("earn_pops", (mission(
                "daily_hard_pops",
                "Hard",
                "earn_pops",
                "earn_pops_non_lime",
                100,
                Daily.Hard,
                "EARN 100 POPS",
                "Lime balloon rewards do not count",
                Assets.Pops
            ))),
            group("balloon_variety", (mission(
                "daily_hard_balloon_variety",
                "Hard",
                "balloon_variety",
                "distinct_balloons",
                5,
                Daily.Hard,
                "SPIN 5 DIFFERENT BALLOONS",
                "Try five different balloon types",
                Assets.Red
            ))),
            (group("obby_variety", (mission(
                "daily_hard_obby_variety",
                "Hard",
                "obby_variety",
                "distinct_obbies",
                5,
                Daily.Hard,
                "COMPLETE 5 DIFFERENT OBBIES",
                "Finish five different obbies",
                Assets.Obby
            )))),
        },
    },
    Weekly = {
        Easy = {
            group("playtime", (mission(
                "weekly_easy_play",
                "Easy",
                "playtime",
                "play_seconds",
                7200,
                Weekly.Easy,
                "PLAY FOR 120 MINUTES",
                "Playtime adds up throughout the week",
                Assets.Clock,
                {displayDivisor = 60}
            ))),
            group("open_balloons", (mission(
                "weekly_easy_open",
                "Easy",
                "open_balloons",
                "spin_total",
                50,
                Weekly.Easy,
                "OPEN 50 BALLOONS",
                "Every completed balloon spin counts",
                Assets.Red
            ))),
            group("specific_balloon", mission(
                "weekly_easy_red",
                "Easy",
                "specific_balloon",
                "spin_balloon",
                20,
                Weekly.Easy,
                "SPIN RED BALLOON 20 TIMES",
                "Complete twenty Red balloon spins",
                Assets.Red,
                {balloonKey = "Red"}
            ), (mission(
                "weekly_easy_orange",
                "Easy",
                "specific_balloon",
                "spin_balloon",
                10,
                Weekly.Easy,
                "SPIN ORANGE BALLOON 10 TIMES",
                "Complete ten Orange balloon spins",
                Assets.Orange,
                {balloonKey = "Orange"}
            ))),
            group("arena_kills", (mission(
                "weekly_easy_arena",
                "Easy",
                "arena_kills",
                "arena_kill",
                10,
                Weekly.Easy,
                "GET 10 SWORD ARENA KILLS",
                "Defeat ten players in the swordfight arena",
                Assets.Sword
            ))),
            group("specific_obby", mission(
                "weekly_easy_easy_obby",
                "Easy",
                "specific_obby",
                "obby_complete",
                20,
                Weekly.Easy,
                "COMPLETE EASY OBBY 20 TIMES",
                "Finish the Easy obby twenty times",
                Assets.Obby,
                {obbyIndex = 1}
            ), (mission(
                "weekly_easy_medium_obby",
                "Easy",
                "specific_obby",
                "obby_complete",
                10,
                Weekly.Easy,
                "COMPLETE MEDIUM OBBY 10 TIMES",
                "Finish the Medium obby ten times",
                Assets.Obby,
                {obbyIndex = 2}
            ))),
            group("credit_single", (mission(
                "weekly_easy_credit_spin",
                "Easy",
                "credit_single",
                "credit_single",
                5000,
                Weekly.Easy,
                "GET 5K+ CREDITS IN ONE SPIN",
                "A Robux reward also completes this mission",
                Assets.Credits,
                {robuxCounts = true}
            ))),
            group("earn_pops", (mission(
                "weekly_easy_pops",
                "Easy",
                "earn_pops",
                "earn_pops_non_lime",
                50,
                Weekly.Easy,
                "EARN 50 POPS",
                "Lime balloon rewards do not count",
                Assets.Pops
            ))),
            group("daily_missions", (mission(
                "weekly_easy_dailies",
                "Easy",
                "daily_missions",
                "claim_daily_mission",
                3,
                Weekly.Easy,
                "COMPLETE 3 DAILY MISSIONS",
                "Claim three Daily mission rewards",
                Assets.Gift
            ))),
            group("balloon_variety", (mission(
                "weekly_easy_balloon_variety",
                "Easy",
                "balloon_variety",
                "distinct_balloons",
                3,
                Weekly.Easy,
                "SPIN 3 DIFFERENT BALLOONS",
                "Try three different balloon types",
                Assets.Red
            ))),
            (group("obby_variety", (mission(
                "weekly_easy_obby_variety",
                "Easy",
                "obby_variety",
                "distinct_obbies",
                3,
                Weekly.Easy,
                "COMPLETE 3 DIFFERENT OBBIES",
                "Finish three different obbies",
                Assets.Obby
            )))),
        },
        Medium = {
            group("playtime", (mission(
                "weekly_medium_play",
                "Medium",
                "playtime",
                "play_seconds",
                14400,
                Weekly.Medium,
                "PLAY FOR 240 MINUTES",
                "Playtime adds up throughout the week",
                Assets.Clock,
                {displayDivisor = 60}
            ))),
            group("open_balloons", (mission(
                "weekly_medium_open",
                "Medium",
                "open_balloons",
                "spin_total",
                150,
                Weekly.Medium,
                "OPEN 150 BALLOONS",
                "Every completed balloon spin counts",
                Assets.Red
            ))),
            group("specific_balloon", mission(
                "weekly_medium_yellow",
                "Medium",
                "specific_balloon",
                "spin_balloon",
                20,
                Weekly.Medium,
                "SPIN YELLOW BALLOON 20 TIMES",
                "Complete twenty Yellow balloon spins",
                Assets.Yellow,
                {balloonKey = "Yellow"}
            ), mission(
                "weekly_medium_lime",
                "Medium",
                "specific_balloon",
                "spin_balloon",
                15,
                Weekly.Medium,
                "SPIN LIME BALLOON 15 TIMES",
                "Complete fifteen Lime balloon spins",
                Assets.Lime,
                {balloonKey = "Lime"}
            ), (mission(
                "weekly_medium_green",
                "Medium",
                "specific_balloon",
                "spin_balloon",
                10,
                Weekly.Medium,
                "SPIN GREEN BALLOON 10 TIMES",
                "Complete ten Green balloon spins",
                Assets.Green,
                {balloonKey = "Green"}
            ))),
            group("arena_kills", (mission(
                "weekly_medium_arena",
                "Medium",
                "arena_kills",
                "arena_kill",
                25,
                Weekly.Medium,
                "GET 25 SWORD ARENA KILLS",
                "Defeat twenty-five players in the swordfight arena",
                Assets.Sword
            ))),
            group("specific_obby", mission(
                "weekly_medium_long_obby",
                "Medium",
                "specific_obby",
                "obby_complete",
                25,
                Weekly.Medium,
                "COMPLETE LONG OBBY 25 TIMES",
                "Finish the Long obby twenty-five times",
                Assets.Obby,
                {obbyIndex = 5}
            ), mission(
                "weekly_medium_rainbow_obby",
                "Medium",
                "specific_obby",
                "obby_complete",
                50,
                Weekly.Medium,
                "COMPLETE RAINBOW OBBY 50 TIMES",
                "Finish the Rainbow obby fifty times",
                Assets.Obby,
                {obbyIndex = 6}
            ), (mission(
                "weekly_medium_bridge_obby",
                "Medium",
                "specific_obby",
                "obby_complete",
                30,
                Weekly.Medium,
                "COMPLETE GLASS BRIDGE 30 TIMES",
                "Finish the Glass Bridge thirty times",
                Assets.Obby,
                {obbyIndex = 7}
            ))),
            group("credit_single", (mission(
                "weekly_medium_credit_spin",
                "Medium",
                "credit_single",
                "credit_single",
                10000,
                Weekly.Medium,
                "GET 10K+ CREDITS IN ONE SPIN",
                "A Robux reward also completes this mission",
                Assets.Credits,
                {robuxCounts = true}
            ))),
            group("earn_pops", (mission(
                "weekly_medium_pops",
                "Medium",
                "earn_pops",
                "earn_pops_non_lime",
                300,
                Weekly.Medium,
                "EARN 300 POPS",
                "Lime balloon rewards do not count",
                Assets.Pops
            ))),
            group("daily_missions", (mission(
                "weekly_medium_dailies",
                "Medium",
                "daily_missions",
                "claim_daily_mission",
                7,
                Weekly.Medium,
                "COMPLETE 7 DAILY MISSIONS",
                "Claim seven Daily mission rewards",
                Assets.Gift
            ))),
            group("balloon_variety", (mission(
                "weekly_medium_balloon_variety",
                "Medium",
                "balloon_variety",
                "distinct_balloons",
                5,
                Weekly.Medium,
                "SPIN 5 DIFFERENT BALLOONS",
                "Try five different balloon types",
                Assets.Red
            ))),
            (group("obby_variety", (mission(
                "weekly_medium_obby_variety",
                "Medium",
                "obby_variety",
                "distinct_obbies",
                5,
                Weekly.Medium,
                "COMPLETE 5 DIFFERENT OBBIES",
                "Finish five different obbies",
                Assets.Obby
            )))),
        },
        Hard = {
            group("playtime", (mission(
                "weekly_hard_play",
                "Hard",
                "playtime",
                "play_seconds",
                36000,
                Weekly.Hard,
                "PLAY FOR 600 MINUTES",
                "Playtime adds up throughout the week",
                Assets.Clock,
                {displayDivisor = 60}
            ))),
            group("open_balloons", (mission(
                "weekly_hard_open",
                "Hard",
                "open_balloons",
                "spin_total",
                400,
                Weekly.Hard,
                "OPEN 400 BALLOONS",
                "Every completed balloon spin counts",
                Assets.Red
            ))),
            group("specific_balloon", mission(
                "weekly_hard_yellow",
                "Hard",
                "specific_balloon",
                "spin_balloon",
                100,
                Weekly.Hard,
                "SPIN YELLOW BALLOON 100 TIMES",
                "Complete one hundred Yellow balloon spins",
                Assets.Yellow,
                {balloonKey = "Yellow"}
            ), mission(
                "weekly_hard_lime",
                "Hard",
                "specific_balloon",
                "spin_balloon",
                80,
                Weekly.Hard,
                "SPIN LIME BALLOON 80 TIMES",
                "Complete eighty Lime balloon spins",
                Assets.Lime,
                {balloonKey = "Lime"}
            ), mission(
                "weekly_hard_green",
                "Hard",
                "specific_balloon",
                "spin_balloon",
                50,
                Weekly.Hard,
                "SPIN GREEN BALLOON 50 TIMES",
                "Complete fifty Green balloon spins",
                Assets.Green,
                {balloonKey = "Green"}
            ), (mission(
                "weekly_hard_violet",
                "Hard",
                "specific_balloon",
                "spin_balloon",
                25,
                Weekly.Hard,
                "SPIN VIOLET BALLOON 25 TIMES",
                "Complete twenty-five Violet balloon spins",
                Assets.Violet,
                {balloonKey = "Violet"}
            ))),
            group("arena_kills", (mission(
                "weekly_hard_arena",
                "Hard",
                "arena_kills",
                "arena_kill",
                50,
                Weekly.Hard,
                "GET 50 SWORD ARENA KILLS",
                "Defeat fifty players in the swordfight arena",
                Assets.Sword
            ))),
            group("specific_obby", mission(
                "weekly_hard_long_obby",
                "Hard",
                "specific_obby",
                "obby_complete",
                25,
                Weekly.Hard,
                "COMPLETE LONG OBBY 25 TIMES",
                "Finish the Long obby twenty-five times",
                Assets.Obby,
                {obbyIndex = 5}
            ), mission(
                "weekly_hard_rainbow_obby",
                "Hard",
                "specific_obby",
                "obby_complete",
                50,
                Weekly.Hard,
                "COMPLETE RAINBOW OBBY 50 TIMES",
                "Finish the Rainbow obby fifty times",
                Assets.Obby,
                {obbyIndex = 6}
            ), (mission(
                "weekly_hard_bridge_obby",
                "Hard",
                "specific_obby",
                "obby_complete",
                30,
                Weekly.Hard,
                "COMPLETE GLASS BRIDGE 30 TIMES",
                "Finish the Glass Bridge thirty times",
                Assets.Obby,
                {obbyIndex = 7}
            ))),
            group("robux_reward", (mission(
                "weekly_hard_robux",
                "Hard",
                "robux_reward",
                "robux_spin",
                1,
                Weekly.Hard,
                "GET ROBUX IN ANY SPIN",
                "Land any Robux reward from a balloon",
                Assets.RoBal
            ))),
            group("earn_pops", (mission(
                "weekly_hard_pops",
                "Hard",
                "earn_pops",
                "earn_pops_non_lime",
                1000,
                Weekly.Hard,
                "EARN 1,000 POPS",
                "Lime balloon rewards do not count",
                Assets.Pops
            ))),
            group("daily_missions", (mission(
                "weekly_hard_dailies",
                "Hard",
                "daily_missions",
                "claim_daily_mission",
                13,
                Weekly.Hard,
                "COMPLETE 13 DAILY MISSIONS",
                "Claim thirteen Daily mission rewards",
                Assets.Gift
            ))),
            group("balloon_variety", (mission(
                "weekly_hard_balloon_variety",
                "Hard",
                "balloon_variety",
                "distinct_balloons",
                7,
                Weekly.Hard,
                "SPIN 7 DIFFERENT BALLOONS",
                "Try seven different balloon types",
                Assets.Red
            ))),
            (group("obby_variety", (mission(
                "weekly_hard_obby_mastery",
                "Hard",
                "obby_variety",
                "distinct_obbies_threshold",
                6,
                Weekly.Hard,
                "MASTER 6 DIFFERENT OBBIES",
                "Complete six different obbies ten times each",
                Assets.Obby,
                {uniqueTargetPerKey = 10}
            )))),
        },
    },
}
u0.MonthlyMissions = {
    mission(
        "monthly_easy_play",
        "Easy",
        "playtime",
        "play_seconds",
        43200,
        Monthly.Easy,
        "PLAY FOR 720 MINUTES",
        "Playtime adds up across the whole season",
        Assets.Clock,
        {displayDivisor = 60}
    ),
    mission(
        "monthly_medium_balloon_tour",
        "Medium",
        "balloon_variety",
        "distinct_balloons",
        #u0.NonRobuxBalloonKeys,
        Monthly.Medium,
        "SPIN EVERY NON-ROBUX BALLOON",
        "Spin every Pops-cost balloon at least once",
        Assets.Red,
        {allowedKeys = u0.NonRobuxBalloonKeys}
    ),
    (mission(
        "monthly_hard_pops",
        "Hard",
        "earn_pops",
        "earn_pops_non_lime",
        30000,
        Monthly.Hard,
        "EARN 30,000 POPS",
        "Lime balloon rewards do not count",
        Assets.Pops
    )),
}

local function cloneDefinition(a1) -- Line: 217
    local v1
    local v2 = {}
    for k, v in pairs(a1) do
        if type(v) ~= "table" then
            v2[k] = v
        else
            v1 = {}
            for k2, i in pairs(v) do
                v1[k2] = i
            end
            v2[k] = v1
        end
    end
    return v2
end

function u0.GetMissions(a1, a2, a3) -- Line: 231 -- upvalues: u0 (val), cloneDefinition (val)
    local v1, v2, v3, v4, v5, variants
    local v6 = tostring(a1 or "")
    if v6 == "Monthly" then
        v5 = {}
        for i4, j in ipairs(u0.MonthlyMissions) do
            v5[i4] = (cloneDefinition(j))
        end
        return v5
    end
    v5 = u0.MissionPools[v6]
    if not v5 then
        return {}
    end
    local v7 = if v6 ~= "Daily" then 91873 else 17431
    local v8 = (math.abs((math.floor((tonumber(a3)) or 0)))) * 104729 % 2147483647
    local v9 = (u0.SeasonId * 1000003 + (math.floor((tonumber(a2)) or 0)) * 9176 + v7 + v8) % 2147483647
    v8 = Random.new(v9)
    v9 = {}
    v7 = {}
    for i, v in ipairs({"Easy", "Medium", "Hard"}) do
        v1 = {}
        v2 = ipairs
        v3 = v5[v] or {}
        for i2, i3 in v2(v3) do
            if not v9[i3.family] then
                table.insert(v1, i3)
            end
        end
        if #v1 > 0 then
            v2 = v1[v8:NextInteger(1, #v1)]
            variants = v2.variants
            v4 = variants[v8:NextInteger(1, #variants)]
            v9[v2.family] = true
            table.insert(v7, (cloneDefinition(v4)))
        end
    end
    return v7
end

u0.Missions = {
    Daily = u0.GetMissions("Daily", 0),
    Weekly = u0.GetMissions("Weekly", 0),
    Monthly = u0.GetMissions("Monthly", 0),
}

local function compactAmount(a1) -- Line: 274
    local v1 = math.max(0, (math.floor((tonumber(a1)) or 0)))
    if v1 >= 1000 and v1 % 1000 == 0 then
        return (tostring(v1 / 1000)) .. "K"
    end
    return (tostring(v1))
end

local function currencyReward(a1, a2, a3) -- Line: 280
    local v1 = not (a1 ~= "Pops") and a2 * 0.01 or not (a1 ~= "Credits") and a2 * 6.756756756756757e-05 or not (a1 ~= "RoBal") and a2 or 0
    local v2 = {kind = a1, amount = a2}
    local v3 = math.max(0, (math.floor((tonumber(a2)) or 0)))
    v2.name = (if not (v3 >= 1000) or v3 % 1000 ~= 0 then tostring(v3) else (tostring(v3 / 1000)) .. "K") .. " " .. string.upper(a1)
    v2.icon = a3
    v2.estimatedRobuxValue = v1
    return v2
end

local function balloonReward(a1, a2, a3, a4) -- Line: 294
    return {
        kind = "Balloon",
        amount = 1,
        key = a1,
        name = (string.upper(a4 or a1)) .. "\nBALLOON",
        icon = a2,
        estimatedRobuxValue = a3,
    }
end

local function cosmeticCrateReward(a1, a2, a3) -- Line: 305
    return {
        kind = "CosmeticCrate",
        amount = 1,
        estimatedRobuxValue = 0,
        crateKey = a1,
        name = a2,
        icon = a3,
    }
end

local function titleReward(a1, a2, a3) -- Line: 316
    return {
        kind = "Title",
        amount = 1,
        estimatedRobuxValue = 0,
        key = a1,
        name = a2,
        icon = a3,
    }
end

local function withBonusTitle(a1, a2, a3) -- Line: 327
    a1.bonusTitleKey = a2
    a1.bonusTitleName = a3
    return a1
end

u0.RewardValueRates = {PopsToRobux = 0.01, CreditsToRobux = 6.756756756756757e-05, RoBalToRobux = 1}
local v1 = {}
local v2 = {}
local Pops = Assets.Pops
local v3 = {kind = "Pops", amount = 10, estimatedRobuxValue = 0.1}
local v4 = math.max(0, (math.floor(tonumber(10) or 0)))
v3.name = (if not (v4 >= 1000) or v4 % 1000 ~= 0 then tostring(v4) else (tostring(v4 / 1000)) .. "K") .. " " .. string.upper("Pops")
v3.icon = Pops
local Credits = Assets.Credits
local v5 = {kind = "Credits", amount = 250, estimatedRobuxValue = 0.016891891891891893}
local v6 = math.max(0, (math.floor(tonumber(250) or 0)))
v5.name = (if not (v6 >= 1000) or v6 % 1000 ~= 0 then tostring(v6) else (tostring(v6 / 1000)) .. "K") .. " " .. string.upper("Credits")
v5.icon = Credits
local Yellow = Assets.Yellow
local v7 = {
    kind = "Balloon",
    key = "Yellow",
    amount = 1,
    estimatedRobuxValue = 0.1,
    name = (string.upper("Yellow")) .. "\nBALLOON",
    icon = Yellow,
}
local Lime = Assets.Lime
local v8 = {
    kind = "Balloon",
    key = "Lime",
    amount = 1,
    estimatedRobuxValue = 0.2,
    name = (string.upper("Lime")) .. "\nBALLOON",
    icon = Lime,
}
local Pops_2 = Assets.Pops
v4 = {kind = "Pops", amount = 100, estimatedRobuxValue = 1}
local v9 = math.max(0, (math.floor(tonumber(100) or 0)))
v4.name = (if not (v9 >= 1000) or v9 % 1000 ~= 0 then tostring(v9) else (tostring(v9 / 1000)) .. "K") .. " " .. string.upper("Pops")
v4.icon = Pops_2
local Credits_2 = Assets.Credits
v6 = {kind = "Credits", amount = 1000, estimatedRobuxValue = 0.06756756756756757}
local v10 = math.max(0, (math.floor(tonumber(1000) or 0)))
v6.name = (if not (v10 >= 1000) or v10 % 1000 ~= 0 then tostring(v10) else (tostring(v10 / 1000)) .. "K") .. " " .. string.upper("Credits")
v6.icon = Credits_2
local Pops_3 = Assets.Pops
local v11 = {kind = "Pops", amount = 25, estimatedRobuxValue = 0.25}
local v12 = math.max(0, (math.floor(tonumber(25) or 0)))
v11.name = (if not (v12 >= 1000) or v12 % 1000 ~= 0 then tostring(v12) else (tostring(v12 / 1000)) .. "K") .. " " .. string.upper("Pops")
v11.icon = Pops_3
local Orange = Assets.Orange
local v13 = {
    kind = "Balloon",
    key = "Orange",
    amount = 1,
    estimatedRobuxValue = 0.03,
    name = (string.upper("Orange")) .. "\nBALLOON",
    icon = Orange,
}
local Credits_3 = Assets.Credits
v9 = {kind = "Credits", amount = 2500, estimatedRobuxValue = 0.16891891891891891}
local v14 = math.max(0, (math.floor(tonumber(2500) or 0)))
v9.name = (if not (v14 >= 1000) or v14 % 1000 ~= 0 then tostring(v14) else (tostring(v14 / 1000)) .. "K") .. " " .. string.upper("Credits")
v9.icon = Credits_3
local RoBal = Assets.RoBal
v10 = {kind = "RoBal", amount = 1, estimatedRobuxValue = 1}
local v15 = math.max(0, (math.floor(tonumber(1) or 0)))
v10.name = (if not (v15 >= 1000) or v15 % 1000 ~= 0 then tostring(v15) else (tostring(v15 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v10.icon = RoBal
local Pops_4 = Assets.Pops
v12 = {kind = "Pops", amount = 100, estimatedRobuxValue = 1}
local v16 = math.max(0, (math.floor(tonumber(100) or 0)))
v12.name = (if not (v16 >= 1000) or v16 % 1000 ~= 0 then tostring(v16) else (tostring(v16 / 1000)) .. "K") .. " " .. string.upper("Pops")
v12.icon = Pops_4
local Pops_5 = Assets.Pops
local v17 = {kind = "Pops", amount = 50, estimatedRobuxValue = 0.5}
local v18 = math.max(0, (math.floor(tonumber(50) or 0)))
v17.name = (if not (v18 >= 1000) or v18 % 1000 ~= 0 then tostring(v18) else (tostring(v18 / 1000)) .. "K") .. " " .. string.upper("Pops")
v17.icon = Pops_5
local Credits_4 = Assets.Credits
v14 = {kind = "Credits", amount = 5000, estimatedRobuxValue = 0.33783783783783783}
local v19 = math.max(0, (math.floor(tonumber(5000) or 0)))
v14.name = (if not (v19 >= 1000) or v19 % 1000 ~= 0 then tostring(v19) else (tostring(v19 / 1000)) .. "K") .. " " .. string.upper("Credits")
v14.icon = Credits_4
local Pops_6 = Assets.Pops
v15 = {kind = "Pops", amount = 50, estimatedRobuxValue = 0.5}
local v20 = math.max(0, (math.floor(tonumber(50) or 0)))
v15.name = (if not (v20 >= 1000) or v20 % 1000 ~= 0 then tostring(v20) else (tostring(v20 / 1000)) .. "K") .. " " .. string.upper("Pops")
v15.icon = Pops_6
local Green = Assets.Green
v16 = {
    kind = "Balloon",
    key = "Green",
    amount = 1,
    estimatedRobuxValue = 0.25,
    name = (string.upper("Green")) .. "\nBALLOON",
    icon = Green,
}
local Credits_5 = Assets.Credits
v18 = {kind = "Credits", amount = 10000, estimatedRobuxValue = 0.6756756756756757}
local v21 = math.max(0, (math.floor(tonumber(10000) or 0)))
v18.name = (if not (v21 >= 1000) or v21 % 1000 ~= 0 then tostring(v21) else (tostring(v21 / 1000)) .. "K") .. " " .. string.upper("Credits")
v18.icon = Credits_5
v2[1] = v3
v2[2] = v5
v2[3] = v7
v2[4] = v8
v2[5] = v4
v2[6] = v6
v2[7] = v11
v2[8] = v13
v2[9] = v9
v2[10] = v10
v2[11] = v12
v2[12] = v17
v2[13] = v14
v2[14] = v15
v2[15] = v16
v2[16] = v18
local Pops_7 = Assets.Pops
v3 = {kind = "Pops", amount = 100, estimatedRobuxValue = 1}
v4 = math.max(0, (math.floor(tonumber(100) or 0)))
v3.name = (if not (v4 >= 1000) or v4 % 1000 ~= 0 then tostring(v4) else (tostring(v4 / 1000)) .. "K") .. " " .. string.upper("Pops")
v3.icon = Pops_7
local Cyan = Assets.Cyan
v5 = {
    kind = "Balloon",
    key = "Blue",
    amount = 1,
    estimatedRobuxValue = 0.5,
    name = (string.upper("Blue")) .. "\nBALLOON",
    icon = Cyan,
}
local Credits_6 = Assets.Credits
v7 = {kind = "Credits", amount = 15000, estimatedRobuxValue = 1.0135135135135136}
v11 = math.max(0, (math.floor(tonumber(15000) or 0)))
v7.name = (if not (v11 >= 1000) or v11 % 1000 ~= 0 then tostring(v11) else (tostring(v11 / 1000)) .. "K") .. " " .. string.upper("Credits")
v7.icon = Credits_6
local RoBal_2 = Assets.RoBal
v8 = {kind = "RoBal", amount = 3, estimatedRobuxValue = 3}
v13 = math.max(0, (math.floor(tonumber(3) or 0)))
v8.name = (if not (v13 >= 1000) or v13 % 1000 ~= 0 then tostring(v13) else (tostring(v13 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v8.icon = RoBal_2
local Pops_8 = Assets.Pops
v4 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
v9 = math.max(0, (math.floor(tonumber(250) or 0)))
v4.name = (if not (v9 >= 1000) or v9 % 1000 ~= 0 then tostring(v9) else (tostring(v9 / 1000)) .. "K") .. " " .. string.upper("Pops")
v4.icon = Pops_8
local Violet = Assets.Violet
v6 = {
    kind = "Balloon",
    key = "Violet",
    amount = 1,
    estimatedRobuxValue = 1,
    name = (string.upper("Violet")) .. "\nBALLOON",
    icon = Violet,
}
local Credits_7 = Assets.Credits
v11 = {kind = "Credits", amount = 25000, estimatedRobuxValue = 1.6891891891891893}
v12 = math.max(0, (math.floor(tonumber(25000) or 0)))
v11.name = (if not (v12 >= 1000) or v12 % 1000 ~= 0 then tostring(v12) else (tostring(v12 / 1000)) .. "K") .. " " .. string.upper("Credits")
v11.icon = Credits_7
local Pops_9 = Assets.Pops
v13 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v17 = math.max(0, (math.floor(tonumber(500) or 0)))
v13.name = (if not (v17 >= 1000) or v17 % 1000 ~= 0 then tostring(v17) else (tostring(v17 / 1000)) .. "K") .. " " .. string.upper("Pops")
v13.icon = Pops_9
local RoBal_3 = Assets.RoBal
v9 = {kind = "RoBal", amount = 5, estimatedRobuxValue = 5}
v14 = math.max(0, (math.floor(tonumber(5) or 0)))
v9.name = (if not (v14 >= 1000) or v14 % 1000 ~= 0 then tostring(v14) else (tostring(v14 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v9.icon = RoBal_3
local Credits_8 = Assets.Credits
v10 = {kind = "Credits", amount = 10000, estimatedRobuxValue = 0.6756756756756757}
v15 = math.max(0, (math.floor(tonumber(10000) or 0)))
v10.name = (if not (v15 >= 1000) or v15 % 1000 ~= 0 then tostring(v15) else (tostring(v15 / 1000)) .. "K") .. " " .. string.upper("Credits")
v10.icon = Credits_8
local Pops_10 = Assets.Pops
v12 = {kind = "Pops", amount = 100, estimatedRobuxValue = 1}
v16 = math.max(0, (math.floor(tonumber(100) or 0)))
v12.name = (if not (v16 >= 1000) or v16 % 1000 ~= 0 then tostring(v16) else (tostring(v16 / 1000)) .. "K") .. " " .. string.upper("Pops")
v12.icon = Pops_10
local Green_3 = Assets.Green
v17 = {
    kind = "Balloon",
    key = "Green",
    amount = 1,
    estimatedRobuxValue = 0.25,
    name = (string.upper("Green")) .. "\nBALLOON",
    icon = Green_3,
}
local Credits_9 = Assets.Credits
v14 = {kind = "Credits", amount = 15000, estimatedRobuxValue = 1.0135135135135136}
v19 = math.max(0, (math.floor(tonumber(15000) or 0)))
v14.name = (if not (v19 >= 1000) or v19 % 1000 ~= 0 then tostring(v19) else (tostring(v19 / 1000)) .. "K") .. " " .. string.upper("Credits")
v14.icon = Credits_9
local RoBal_4 = Assets.RoBal
v15 = {kind = "RoBal", amount = 2, estimatedRobuxValue = 2}
v20 = math.max(0, (math.floor(tonumber(2) or 0)))
v15.name = (if not (v20 >= 1000) or v20 % 1000 ~= 0 then tostring(v20) else (tostring(v20 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v15.icon = RoBal_4
local Pops_11 = Assets.Pops
v16 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
local v22 = math.max(0, (math.floor(tonumber(250) or 0)))
v16.name = (if not (v22 >= 1000) or v22 % 1000 ~= 0 then tostring(v22) else (tostring(v22 / 1000)) .. "K") .. " " .. string.upper("Pops")
v16.icon = Pops_11
local Cyan_2 = Assets.Cyan
v18 = {
    kind = "Balloon",
    key = "Blue",
    amount = 1,
    estimatedRobuxValue = 0.5,
    name = (string.upper("Blue")) .. "\nBALLOON",
    icon = Cyan_2,
}
v2[17] = v3
v2[18] = v5
v2[19] = v7
v2[20] = v8
v2[21] = v4
v2[22] = v6
v2[23] = v11
v2[24] = v13
v2[25] = v9
v2[26] = v10
v2[27] = v12
v2[28] = v17
v2[29] = v14
v2[30] = v15
v2[31] = v16
v2[32] = v18
local Credits_10 = Assets.Credits
v3 = {kind = "Credits", amount = 25000, estimatedRobuxValue = 1.6891891891891893}
v4 = math.max(0, (math.floor(tonumber(25000) or 0)))
v3.name = (if not (v4 >= 1000) or v4 % 1000 ~= 0 then tostring(v4) else (tostring(v4 / 1000)) .. "K") .. " " .. string.upper("Credits")
v3.icon = Credits_10
local Pops_12 = Assets.Pops
v5 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
v6 = math.max(0, (math.floor(tonumber(250) or 0)))
v5.name = (if not (v6 >= 1000) or v6 % 1000 ~= 0 then tostring(v6) else (tostring(v6 / 1000)) .. "K") .. " " .. string.upper("Pops")
v5.icon = Pops_12
local Lime_3 = Assets.Lime
v7 = {
    kind = "Balloon",
    key = "Lime",
    amount = 1,
    estimatedRobuxValue = 0.2,
    name = (string.upper("Lime")) .. "\nBALLOON",
    icon = Lime_3,
}
local Credits_11 = Assets.Credits
v8 = {kind = "Credits", amount = 25000, estimatedRobuxValue = 1.6891891891891893}
v13 = math.max(0, (math.floor(tonumber(25000) or 0)))
v8.name = (if not (v13 >= 1000) or v13 % 1000 ~= 0 then tostring(v13) else (tostring(v13 / 1000)) .. "K") .. " " .. string.upper("Credits")
v8.icon = Credits_11
local Pops_13 = Assets.Pops
v4 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
v9 = math.max(0, (math.floor(tonumber(250) or 0)))
v4.name = (if not (v9 >= 1000) or v9 % 1000 ~= 0 then tostring(v9) else (tostring(v9 / 1000)) .. "K") .. " " .. string.upper("Pops")
v4.icon = Pops_13
local Violet_3 = Assets.Violet
v6 = {
    kind = "Balloon",
    key = "Violet",
    amount = 1,
    estimatedRobuxValue = 1,
    name = (string.upper("Violet")) .. "\nBALLOON",
    icon = Violet_3,
}
local Credits_12 = Assets.Credits
v11 = {kind = "Credits", amount = 50000, estimatedRobuxValue = 3.3783783783783785}
v12 = math.max(0, (math.floor(tonumber(50000) or 0)))
v11.name = (if not (v12 >= 1000) or v12 % 1000 ~= 0 then tostring(v12) else (tostring(v12 / 1000)) .. "K") .. " " .. string.upper("Credits")
v11.icon = Credits_12
local RoBal_5 = Assets.RoBal
v13 = {kind = "RoBal", amount = 3, estimatedRobuxValue = 3}
v17 = math.max(0, (math.floor(tonumber(3) or 0)))
v13.name = (if not (v17 >= 1000) or v17 % 1000 ~= 0 then tostring(v17) else (tostring(v17 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v13.icon = RoBal_5
local Pops_14 = Assets.Pops
v9 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v14 = math.max(0, (math.floor(tonumber(500) or 0)))
v9.name = (if not (v14 >= 1000) or v14 % 1000 ~= 0 then tostring(v14) else (tostring(v14 / 1000)) .. "K") .. " " .. string.upper("Pops")
v9.icon = Pops_14
local Violet_5 = Assets.Violet
v10 = {
    kind = "Balloon",
    key = "Violet",
    amount = 1,
    estimatedRobuxValue = 1,
    name = (string.upper("Violet")) .. "\nBALLOON",
    icon = Violet_5,
}
local Credits_13 = Assets.Credits
v12 = {kind = "Credits", amount = 35000, estimatedRobuxValue = 2.364864864864865}
v16 = math.max(0, (math.floor(tonumber(35000) or 0)))
v12.name = (if not (v16 >= 1000) or v16 % 1000 ~= 0 then tostring(v16) else (tostring(v16 / 1000)) .. "K") .. " " .. string.upper("Credits")
v12.icon = Credits_13
local Pops_15 = Assets.Pops
v17 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v18 = math.max(0, (math.floor(tonumber(500) or 0)))
v17.name = (if not (v18 >= 1000) or v18 % 1000 ~= 0 then tostring(v18) else (tostring(v18 / 1000)) .. "K") .. " " .. string.upper("Pops")
v17.icon = Pops_15
local RoBal_6 = Assets.RoBal
v14 = {kind = "RoBal", amount = 5, estimatedRobuxValue = 5}
v19 = math.max(0, (math.floor(tonumber(5) or 0)))
v14.name = (if not (v19 >= 1000) or v19 % 1000 ~= 0 then tostring(v19) else (tostring(v19 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v14.icon = RoBal_6
local Pops_16 = Assets.Pops
v15 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
v20 = math.max(0, (math.floor(tonumber(250) or 0)))
v15.name = (if not (v20 >= 1000) or v20 % 1000 ~= 0 then tostring(v20) else (tostring(v20 / 1000)) .. "K") .. " " .. string.upper("Pops")
v15.icon = Pops_16
local Credits_14 = Assets.Credits
v16 = {kind = "Credits", amount = 25000, estimatedRobuxValue = 1.6891891891891893}
v22 = math.max(0, (math.floor(tonumber(25000) or 0)))
v16.name = (if not (v22 >= 1000) or v22 % 1000 ~= 0 then tostring(v22) else (tostring(v22 / 1000)) .. "K") .. " " .. string.upper("Credits")
v16.icon = Credits_14
local Violet_7 = Assets.Violet
v18 = {
    kind = "Balloon",
    key = "Violet",
    amount = 1,
    estimatedRobuxValue = 1,
    name = (string.upper("Violet")) .. "\nBALLOON",
    icon = Violet_7,
}
v2[33] = v3
v2[34] = v5
v2[35] = v7
v2[36] = v8
v2[37] = v4
v2[38] = v6
v2[39] = v11
v2[40] = v13
v2[41] = v9
v2[42] = v10
v2[43] = v12
v2[44] = v17
v2[45] = v14
v2[46] = v15
v2[47] = v16
v2[48] = v18
local RoBal_7 = Assets.RoBal
v3 = {kind = "RoBal", amount = 3, estimatedRobuxValue = 3}
v4 = math.max(0, (math.floor(tonumber(3) or 0)))
v3.name = (if not (v4 >= 1000) or v4 % 1000 ~= 0 then tostring(v4) else (tostring(v4 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v3.icon = RoBal_7
local Rainbow = Assets.Rainbow
v5 = {
    kind = "Balloon",
    key = "Rainbow",
    amount = 1,
    estimatedRobuxValue = 49,
    name = (string.upper("Rainbow")) .. "\nBALLOON",
    icon = Rainbow,
    bonusTitleKey = "Season1Champion",
    bonusTitleName = "SEASON 1 CHAMPION",
}
v2[49] = v3
v2[50] = v5
v1.Free = v2
v2 = {}
local Pops_17 = Assets.Pops
v3 = {kind = "Pops", amount = 100, estimatedRobuxValue = 1}
v4 = math.max(0, (math.floor(tonumber(100) or 0)))
v3.name = (if not (v4 >= 1000) or v4 % 1000 ~= 0 then tostring(v4) else (tostring(v4 / 1000)) .. "K") .. " " .. string.upper("Pops")
v3.icon = Pops_17
local Credits_15 = Assets.Credits
v5 = {kind = "Credits", amount = 5000, estimatedRobuxValue = 0.33783783783783783}
v6 = math.max(0, (math.floor(tonumber(5000) or 0)))
v5.name = (if not (v6 >= 1000) or v6 % 1000 ~= 0 then tostring(v6) else (tostring(v6 / 1000)) .. "K") .. " " .. string.upper("Credits")
v5.icon = Credits_15
local Lime_5 = Assets.Lime
v7 = {
    kind = "Balloon",
    key = "Lime",
    amount = 1,
    estimatedRobuxValue = 0.2,
    name = (string.upper("Lime")) .. "\nBALLOON",
    icon = Lime_5,
}
local Credits_16 = Assets.Credits
v8 = {kind = "Credits", amount = 10000, estimatedRobuxValue = 0.6756756756756757}
v13 = math.max(0, (math.floor(tonumber(10000) or 0)))
v8.name = (if not (v13 >= 1000) or v13 % 1000 ~= 0 then tostring(v13) else (tostring(v13 / 1000)) .. "K") .. " " .. string.upper("Credits")
v8.icon = Credits_16
local RoBal_8 = Assets.RoBal
v4 = {kind = "RoBal", amount = 2, estimatedRobuxValue = 2}
v9 = math.max(0, (math.floor(tonumber(2) or 0)))
v4.name = (if not (v9 >= 1000) or v9 % 1000 ~= 0 then tostring(v9) else (tostring(v9 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v4.icon = RoBal_8
local Pops_18 = Assets.Pops
v6 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
v10 = math.max(0, (math.floor(tonumber(250) or 0)))
v6.name = (if not (v10 >= 1000) or v10 % 1000 ~= 0 then tostring(v10) else (tostring(v10 / 1000)) .. "K") .. " " .. string.upper("Pops")
v6.icon = Pops_18
local Green_5 = Assets.Green
v11 = {
    kind = "Balloon",
    key = "Green",
    amount = 1,
    estimatedRobuxValue = 0.25,
    name = (string.upper("Green")) .. "\nBALLOON",
    icon = Green_5,
}
local Credits_17 = Assets.Credits
v13 = {kind = "Credits", amount = 15000, estimatedRobuxValue = 1.0135135135135136}
v17 = math.max(0, (math.floor(tonumber(15000) or 0)))
v13.name = (if not (v17 >= 1000) or v17 % 1000 ~= 0 then tostring(v17) else (tostring(v17 / 1000)) .. "K") .. " " .. string.upper("Credits")
v13.icon = Credits_17
local Violet_9 = Assets.Violet
v9 = {
    kind = "Balloon",
    key = "Violet",
    amount = 1,
    estimatedRobuxValue = 1,
    name = (string.upper("Violet")) .. "\nBALLOON",
    icon = Violet_9,
}
local RoBal_9 = Assets.RoBal
v10 = {kind = "RoBal", amount = 3, estimatedRobuxValue = 3}
v15 = math.max(0, (math.floor(tonumber(3) or 0)))
v10.name = (if not (v15 >= 1000) or v15 % 1000 ~= 0 then tostring(v15) else (tostring(v15 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v10.icon = RoBal_9
local Pops_19 = Assets.Pops
v12 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
v16 = math.max(0, (math.floor(tonumber(250) or 0)))
v12.name = (if not (v16 >= 1000) or v16 % 1000 ~= 0 then tostring(v16) else (tostring(v16 / 1000)) .. "K") .. " " .. string.upper("Pops")
v12.icon = Pops_19
local Credits_18 = Assets.Credits
v17 = {kind = "Credits", amount = 25000, estimatedRobuxValue = 1.6891891891891893}
v18 = math.max(0, (math.floor(tonumber(25000) or 0)))
v17.name = (if not (v18 >= 1000) or v18 % 1000 ~= 0 then tostring(v18) else (tostring(v18 / 1000)) .. "K") .. " " .. string.upper("Credits")
v17.icon = Credits_18
local Cyan_3 = Assets.Cyan
v14 = {
    kind = "Balloon",
    key = "Blue",
    amount = 1,
    estimatedRobuxValue = 0.5,
    name = (string.upper("Blue")) .. "\nBALLOON",
    icon = Cyan_3,
}
local Pops_20 = Assets.Pops
v15 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v20 = math.max(0, (math.floor(tonumber(500) or 0)))
v15.name = (if not (v20 >= 1000) or v20 % 1000 ~= 0 then tostring(v20) else (tostring(v20 / 1000)) .. "K") .. " " .. string.upper("Pops")
v15.icon = Pops_20
local RoBal_10 = Assets.RoBal
v16 = {kind = "RoBal", amount = 5, estimatedRobuxValue = 5}
v22 = math.max(0, (math.floor(tonumber(5) or 0)))
v16.name = (if not (v22 >= 1000) or v22 % 1000 ~= 0 then tostring(v22) else (tostring(v22 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v16.icon = RoBal_10
local Credits_19 = Assets.Credits
v18 = {kind = "Credits", amount = 50000, estimatedRobuxValue = 3.3783783783783785}
v21 = math.max(0, (math.floor(tonumber(50000) or 0)))
v18.name = (if not (v21 >= 1000) or v21 % 1000 ~= 0 then tostring(v21) else (tostring(v21 / 1000)) .. "K") .. " " .. string.upper("Credits")
v18.icon = Credits_19
v2[1] = v3
v2[2] = v5
v2[3] = v7
v2[4] = v8
v2[5] = v4
v2[6] = v6
v2[7] = v11
v2[8] = v13
v2[9] = v9
v2[10] = v10
v2[11] = v12
v2[12] = v17
v2[13] = v14
v2[14] = v15
v2[15] = v16
v2[16] = v18
local Violet_11 = Assets.Violet
v3 = {
    kind = "Balloon",
    key = "Violet",
    amount = 1,
    estimatedRobuxValue = 1,
    name = (string.upper("Violet")) .. "\nBALLOON",
    icon = Violet_11,
}
local Pops_21 = Assets.Pops
v5 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v6 = math.max(0, (math.floor(tonumber(500) or 0)))
v5.name = (if not (v6 >= 1000) or v6 % 1000 ~= 0 then tostring(v6) else (tostring(v6 / 1000)) .. "K") .. " " .. string.upper("Pops")
v5.icon = Pops_21
local Credits_20 = Assets.Credits
v7 = {kind = "Credits", amount = 50000, estimatedRobuxValue = 3.3783783783783785}
v11 = math.max(0, (math.floor(tonumber(50000) or 0)))
v7.name = (if not (v11 >= 1000) or v11 % 1000 ~= 0 then tostring(v11) else (tostring(v11 / 1000)) .. "K") .. " " .. string.upper("Credits")
v7.icon = Credits_20
local Fuschia = Assets.Fuschia
v8 = {
    kind = "Balloon",
    key = "Fuschia",
    amount = 1,
    estimatedRobuxValue = 10,
    name = (string.upper("Fuschia")) .. "\nBALLOON",
    icon = Fuschia,
}
v6 = Assets.RoBal
v4 = {kind = "RoBal", amount = 5, estimatedRobuxValue = 5}
v9 = math.max(0, (math.floor(tonumber(5) or 0)))
v4.name = (if not (v9 >= 1000) or v9 % 1000 ~= 0 then tostring(v9) else (tostring(v9 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v4.icon = v6
v11 = Assets.Pops
v6 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v10 = math.max(0, (math.floor(tonumber(500) or 0)))
v6.name = (if not (v10 >= 1000) or v10 % 1000 ~= 0 then tostring(v10) else (tostring(v10 / 1000)) .. "K") .. " " .. string.upper("Pops")
v6.icon = v11
v13 = Assets.Credits
v11 = {kind = "Credits", amount = 50000, estimatedRobuxValue = 3.3783783783783785}
v12 = math.max(0, (math.floor(tonumber(50000) or 0)))
v11.name = (if not (v12 >= 1000) or v12 % 1000 ~= 0 then tostring(v12) else (tostring(v12 / 1000)) .. "K") .. " " .. string.upper("Credits")
v11.icon = v13
v9 = Assets.Fuschia
v13 = {
    kind = "Balloon",
    key = "Fuschia",
    amount = 1,
    estimatedRobuxValue = 10,
    name = (string.upper("Fuschia")) .. "\nBALLOON",
    icon = v9,
}
v10 = Assets.Pink
v9 = {
    kind = "Balloon",
    key = "Pink",
    amount = 1,
    estimatedRobuxValue = 50,
    name = (string.upper("Pink")) .. "\nBALLOON",
    icon = v10,
}
v12 = Assets.RoBal
v10 = {kind = "RoBal", amount = 3, estimatedRobuxValue = 3}
v15 = math.max(0, (math.floor(tonumber(3) or 0)))
v10.name = (if not (v15 >= 1000) or v15 % 1000 ~= 0 then tostring(v15) else (tostring(v15 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v10.icon = v12
v17 = Assets.Pops
v12 = {kind = "Pops", amount = 250, estimatedRobuxValue = 2.5}
v16 = math.max(0, (math.floor(tonumber(250) or 0)))
v12.name = (if not (v16 >= 1000) or v16 % 1000 ~= 0 then tostring(v16) else (tostring(v16 / 1000)) .. "K") .. " " .. string.upper("Pops")
v12.icon = v17
v14 = Assets.Credits
v17 = {kind = "Credits", amount = 25000, estimatedRobuxValue = 1.6891891891891893}
v18 = math.max(0, (math.floor(tonumber(25000) or 0)))
v17.name = (if not (v18 >= 1000) or v18 % 1000 ~= 0 then tostring(v18) else (tostring(v18 / 1000)) .. "K") .. " " .. string.upper("Credits")
v17.icon = v14
v15 = Assets.Violet
v14 = {
    kind = "Balloon",
    key = "Violet",
    amount = 1,
    estimatedRobuxValue = 1,
    name = (string.upper("Violet")) .. "\nBALLOON",
    icon = v15,
}
v16 = Assets.RoBal
v15 = {kind = "RoBal", amount = 5, estimatedRobuxValue = 5}
v20 = math.max(0, (math.floor(tonumber(5) or 0)))
v15.name = (if not (v20 >= 1000) or v20 % 1000 ~= 0 then tostring(v20) else (tostring(v20 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v15.icon = v16
v18 = Assets.Pops
v16 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v22 = math.max(0, (math.floor(tonumber(500) or 0)))
v16.name = (if not (v22 >= 1000) or v22 % 1000 ~= 0 then tostring(v22) else (tostring(v22 / 1000)) .. "K") .. " " .. string.upper("Pops")
v16.icon = v18
v19 = Assets.Credits
v18 = {kind = "Credits", amount = 50000, estimatedRobuxValue = 3.3783783783783785}
v21 = math.max(0, (math.floor(tonumber(50000) or 0)))
v18.name = (if not (v21 >= 1000) or v21 % 1000 ~= 0 then tostring(v21) else (tostring(v21 / 1000)) .. "K") .. " " .. string.upper("Credits")
v18.icon = v19
v2[17] = v3
v2[18] = v5
v2[19] = v7
v2[20] = v8
v2[21] = v4
v2[22] = v6
v2[23] = v11
v2[24] = v13
v2[25] = v9
v2[26] = v10
v2[27] = v12
v2[28] = v17
v2[29] = v14
v2[30] = v15
v2[31] = v16
v2[32] = v18
v5 = Assets.Fuschia
v3 = {
    kind = "Balloon",
    key = "Fuschia",
    amount = 1,
    estimatedRobuxValue = 10,
    name = (string.upper("Fuschia")) .. "\nBALLOON",
    icon = v5,
}
v7 = Assets.RoBal
v5 = {kind = "RoBal", amount = 5, estimatedRobuxValue = 5}
v6 = math.max(0, (math.floor(tonumber(5) or 0)))
v5.name = (if not (v6 >= 1000) or v6 % 1000 ~= 0 then tostring(v6) else (tostring(v6 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v5.icon = v7
v8 = Assets.Pops
v7 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v11 = math.max(0, (math.floor(tonumber(500) or 0)))
v7.name = (if not (v11 >= 1000) or v11 % 1000 ~= 0 then tostring(v11) else (tostring(v11 / 1000)) .. "K") .. " " .. string.upper("Pops")
v7.icon = v8
v4 = Assets.Credits
v8 = {kind = "Credits", amount = 50000, estimatedRobuxValue = 3.3783783783783785}
v13 = math.max(0, (math.floor(tonumber(50000) or 0)))
v8.name = (if not (v13 >= 1000) or v13 % 1000 ~= 0 then tostring(v13) else (tostring(v13 / 1000)) .. "K") .. " " .. string.upper("Credits")
v8.icon = v4
v6 = Assets.RoBal
v4 = {kind = "RoBal", amount = 10, estimatedRobuxValue = 10}
v9 = math.max(0, (math.floor(tonumber(10) or 0)))
v4.name = (if not (v9 >= 1000) or v9 % 1000 ~= 0 then tostring(v9) else (tostring(v9 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v4.icon = v6
v11 = Assets.Pops
v6 = {kind = "Pops", amount = 500, estimatedRobuxValue = 5}
v10 = math.max(0, (math.floor(tonumber(500) or 0)))
v6.name = (if not (v10 >= 1000) or v10 % 1000 ~= 0 then tostring(v10) else (tostring(v10 / 1000)) .. "K") .. " " .. string.upper("Pops")
v6.icon = v11
v13 = Assets.Credits
v11 = {kind = "Credits", amount = 75000, estimatedRobuxValue = 5.0675675675675675}
v12 = math.max(0, (math.floor(tonumber(75000) or 0)))
v11.name = (if not (v12 >= 1000) or v12 % 1000 ~= 0 then tostring(v12) else (tostring(v12 / 1000)) .. "K") .. " " .. string.upper("Credits")
v11.icon = v13
v9 = Assets.RoBal
v13 = {kind = "RoBal", amount = 10, estimatedRobuxValue = 10}
v17 = math.max(0, (math.floor(tonumber(10) or 0)))
v13.name = (if not (v17 >= 1000) or v17 % 1000 ~= 0 then tostring(v17) else (tostring(v17 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v13.icon = v9
v10 = Assets.Pops
v9 = {kind = "Pops", amount = 1000, estimatedRobuxValue = 10}
v14 = math.max(0, (math.floor(tonumber(1000) or 0)))
v9.name = (if not (v14 >= 1000) or v14 % 1000 ~= 0 then tostring(v14) else (tostring(v14 / 1000)) .. "K") .. " " .. string.upper("Pops")
v9.icon = v10
v12 = Assets.Credits
v10 = {kind = "Credits", amount = 100000, estimatedRobuxValue = 6.756756756756757}
v15 = math.max(0, (math.floor(tonumber(100000) or 0)))
v10.name = (if not (v15 >= 1000) or v15 % 1000 ~= 0 then tostring(v15) else (tostring(v15 / 1000)) .. "K") .. " " .. string.upper("Credits")
v10.icon = v12
v17 = Assets.Fuschia
v12 = {
    kind = "Balloon",
    key = "Fuschia",
    amount = 1,
    estimatedRobuxValue = 10,
    name = (string.upper("Fuschia")) .. "\nBALLOON",
    icon = v17,
}
v14 = Assets.RoBal
v17 = {kind = "RoBal", amount = 15, estimatedRobuxValue = 15}
v18 = math.max(0, (math.floor(tonumber(15) or 0)))
v17.name = (if not (v18 >= 1000) or v18 % 1000 ~= 0 then tostring(v18) else (tostring(v18 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v17.icon = v14
v15 = Assets.Pops
v14 = {kind = "Pops", amount = 1500, estimatedRobuxValue = 15}
v19 = math.max(0, (math.floor(tonumber(1500) or 0)))
v14.name = (if not (v19 >= 1000) or v19 % 1000 ~= 0 then tostring(v19) else (tostring(v19 / 1000)) .. "K") .. " " .. string.upper("Pops")
v14.icon = v15
v16 = Assets.Credits
v15 = {kind = "Credits", amount = 150000, estimatedRobuxValue = 10.135135135135135}
v20 = math.max(0, (math.floor(tonumber(150000) or 0)))
v15.name = (if not (v20 >= 1000) or v20 % 1000 ~= 0 then tostring(v20) else (tostring(v20 / 1000)) .. "K") .. " " .. string.upper("Credits")
v15.icon = v16
v18 = Assets.RoBal
v16 = {kind = "RoBal", amount = 20, estimatedRobuxValue = 20}
v22 = math.max(0, (math.floor(tonumber(20) or 0)))
v16.name = (if not (v22 >= 1000) or v22 % 1000 ~= 0 then tostring(v22) else (tostring(v22 / 1000)) .. "K") .. " " .. string.upper("RoBal")
v16.icon = v18
v19 = Assets.Pops
v18 = {kind = "Pops", amount = 2000, estimatedRobuxValue = 20}
v21 = math.max(0, (math.floor(tonumber(2000) or 0)))
v18.name = (if not (v21 >= 1000) or v21 % 1000 ~= 0 then tostring(v21) else (tostring(v21 / 1000)) .. "K") .. " " .. string.upper("Pops")
v18.icon = v19
v2[33] = v3
v2[34] = v5
v2[35] = v7
v2[36] = v8
v2[37] = v4
v2[38] = v6
v2[39] = v11
v2[40] = v13
v2[41] = v9
v2[42] = v10
v2[43] = v12
v2[44] = v17
v2[45] = v14
v2[46] = v15
v2[47] = v16
v2[48] = v18
v5 = Assets.Credits
v3 = {kind = "Credits", amount = 200000, estimatedRobuxValue = 13.513513513513514}
v4 = math.max(0, (math.floor(tonumber(200000) or 0)))
v3.name = (if not (v4 >= 1000) or v4 % 1000 ~= 0 then tostring(v4) else (tostring(v4 / 1000)) .. "K") .. " " .. string.upper("Credits")
v3.icon = v5
v19 = Assets.Summer
v5 = {
    kind = "Balloon",
    key = "Summer",
    amount = 1,
    estimatedRobuxValue = 199,
    name = (string.upper("Summer")) .. "\nBALLOON",
    icon = v19,
    bonusTitleKey = "Season1God",
    bonusTitleName = "SEASON 1 GOD",
}
v2[49] = v3
v2[50] = v5
v1.Premium = v2
u0.Rewards = v1
v1 = {
    SeasonId = u0.SeasonId,
    SeasonName = u0.SeasonName,
    SeasonStartUnix = u0.SeasonStartUnix,
    SeasonEndUnix = u0.SeasonEndUnix,
    MaxTier = u0.MaxTier,
    MaxSeasonXP = u0.MaxSeasonXP,
    PremiumPrice = u0.PremiumPrice,
    PremiumGamePassId = u0.PremiumGamePassId,
    SkipToEndPrice = u0.SkipToEndPrice,
    SkipToEndProductId = u0.SkipToEndProductId,
    MissionSkipProductIds = u0.MissionSkipProductIds,
    MissionPools = u0.MissionPools,
    MonthlyMissions = u0.MonthlyMissions,
    Rewards = u0.Rewards,
}
v3 = require((script.Parent:WaitForChild("SeasonPassSeason2")))({
    mission = mission,
    group = group,
    currencyReward = currencyReward,
    balloonReward = balloonReward,
    cosmeticCrateReward = cosmeticCrateReward,
    withBonusTitle = withBonusTitle,
    Assets = Assets,
    DifficultyXP = u0.DifficultyXP,
    MissionPools = u0.MissionPools,
})
local v23 = require((script.Parent:WaitForChild("SeasonPassSeason3")))({
    mission = mission,
    currencyReward = currencyReward,
    balloonReward = balloonReward,
    cosmeticCrateReward = cosmeticCrateReward,
    withBonusTitle = withBonusTitle,
    Assets = Assets,
    DifficultyXP = u0.DifficultyXP,
    Season2 = v3,
})
v5 = require((script.Parent:WaitForChild("SeasonPassSeason4")))({
    mission = mission,
    currencyReward = currencyReward,
    balloonReward = balloonReward,
    cosmeticCrateReward = cosmeticCrateReward,
    withBonusTitle = withBonusTitle,
    Assets = Assets,
    DifficultyXP = u0.DifficultyXP,
    Season3 = v23,
})
u0.Seasons = {
    [v1.SeasonId] = v1,
    [v3.SeasonId] = v3,
    [v23.SeasonId] = v23,
    [v5.SeasonId] = v5,
}
u0.SeasonOrder = {v1.SeasonId, v3.SeasonId, v23.SeasonId, v5.SeasonId}

function u0.GetSeasonById(a1) -- Line: 508 -- upvalues: u0 (val)
    return u0.Seasons[math.floor((tonumber(a1)) or 0)]
end

function u0.GetSeasonForTime(a1) -- Line: 512 -- upvalues: u0 (val)
    local v1
    local v2 = math.floor(tonumber(a1) or os.time())
    local v3 = u0.Seasons[u0.SeasonOrder[1]]
    for i, v in ipairs(u0.SeasonOrder) do
        v1 = u0.Seasons[v]
        if v1 then
            v3 = v1
            if v1.SeasonStartUnix <= v2 and v2 < v1.SeasonEndUnix then
                return v1
            end
            if v2 < v1.SeasonStartUnix then
                return v1
            end
        end
    end
    return v3
end

function u0.ActivateSeasonById(a1) -- Line: 531 -- upvalues: u0 (val)
    local v1 = u0.GetSeasonById(a1)
    if not v1 then
        return false, u0.SeasonId
    end
    local v2 = u0.SeasonId ~= v1.SeasonId
    for i, v in ipairs({
        "SeasonId",
        "SeasonName",
        "SeasonStartUnix",
        "SeasonEndUnix",
        "MaxTier",
        "MaxSeasonXP",
        "PremiumPrice",
        "PremiumGamePassId",
        "SkipToEndPrice",
        "SkipToEndProductId",
        "MissionSkipProductIds",
        "MissionPools",
        "MonthlyMissions",
        "Rewards",
    }) do
        u0[v] = v1[v]
    end
    u0.ActiveSeasonId = v1.SeasonId
    u0.Missions = {
        Daily = u0.GetMissions("Daily", 0),
        Weekly = u0.GetMissions("Weekly", 0),
        Monthly = u0.GetMissions("Monthly", 0),
    }
    return v2, v1.SeasonId
end

function u0.Refresh(a1) -- Line: 552 -- upvalues: u0 (val)
    local v1 = u0.GetSeasonForTime(a1)
    if not v1 then
        return false, u0.SeasonId
    end
    return u0.ActivateSeasonById(v1.SeasonId)
end

u0.Refresh(os.time())

function u0.GetTrackEstimatedRobuxValue(a1) -- Line: 560 -- upvalues: u0 (val)
    local v1 = 0
    local v2 = ipairs
    local v3 = u0.Rewards[a1] or {}
    for i, v in v2(v3) do
        v1 = v1 + (tonumber(v.estimatedRobuxValue) or 0)
    end
    return v1
end

function u0.GetTierStartXP(a1) -- Line: 568 -- upvalues: u0 (val)
    local v1 = math.clamp(math.floor((tonumber(a1)) or 1), 1, u0.MaxTier)
    if v1 <= 1 then
        return 0
    end
    local v2 = (v1 - 1) / (u0.MaxTier - 1)
    return (math.floor(u0.MaxSeasonXP * v2 * v2 + 0.5))
end

function u0.GetTierFromXP(a1) -- Line: 575 -- upvalues: u0 (val)
    local v1 = math.clamp(math.floor((tonumber(a1)) or 0), 0, u0.MaxSeasonXP)
    for i = u0.MaxTier, 1, -1 do
        if u0.GetTierStartXP(i) <= v1 then
            return i
        end
    end
    return 1
end

function u0.GetTierProgress(a1) -- Line: 583 -- upvalues: u0 (val)
    local v1
    local v2 = math.clamp(math.floor((tonumber(a1)) or 0), 0, u0.MaxSeasonXP)
    local v3 = u0.GetTierFromXP(v2)
    if u0.MaxTier <= v3 then
        v1 = math.max(1, u0.MaxSeasonXP - (u0.GetTierStartXP(u0.MaxTier - 1)))
        return v3, v1, v1
    end
    local v4 = u0.GetTierStartXP(v3)
    v1 = u0.GetTierStartXP(v3 + 1)
    return v3, v2 - v4, (math.max(1, v1 - v4))
end

return u0