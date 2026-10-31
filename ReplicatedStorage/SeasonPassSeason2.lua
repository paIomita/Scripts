-- Path: ReplicatedStorage.SeasonPassSeason2

-- Script path: ReplicatedStorage.SeasonPassSeason2
-- Decompile time: 6.63 ms

return function(a1) -- Line: 2
    local deepClone
    local mission = a1.mission
    local group = a1.group
    local currencyReward = a1.currencyReward
    local balloonReward = a1.balloonReward
    local cosmeticCrateReward = a1.cosmeticCrateReward
    local withBonusTitle = a1.withBonusTitle
    local Assets = a1.Assets
    local Daily = a1.DifficultyXP.Daily
    local Weekly = a1.DifficultyXP.Weekly
    local Monthly = a1.DifficultyXP.Monthly
    local v1 = {
        Daily = {
            Easy = {
                group("playtime", mission(
                    "s2_daily_easy_play",
                    "Easy",
                    "playtime",
                    "play_seconds",
                    600,
                    Daily.Easy,
                    "PLAY FOR 10 MINUTES",
                    "Stay in the server for 10 minutes",
                    Assets.Clock,
                    {displayDivisor = 60}
                )),
                group("open_balloons", mission(
                    "s2_daily_easy_open",
                    "Easy",
                    "open_balloons",
                    "spin_total",
                    5,
                    Daily.Easy,
                    "OPEN 5 BALLOONS",
                    "Every completed balloon spin counts",
                    Assets.Red
                )),
                group("specific_obby", mission(
                    "s2_daily_easy_medium_obby",
                    "Easy",
                    "specific_obby",
                    "obby_complete",
                    2,
                    Daily.Easy,
                    "COMPLETE MEDIUM OBBY 2 TIMES",
                    "Finish the Medium obby twice",
                    Assets.Obby,
                    {obbyIndex = 2}
                )),
                group("credit_single", mission(
                    "s2_daily_easy_credit_spin",
                    "Easy",
                    "credit_single",
                    "credit_single",
                    250,
                    Daily.Easy,
                    "GET 250+ CREDITS IN ONE SPIN",
                    "Land at least 250 Credits from one balloon",
                    Assets.Credits
                )),
                group("earn_pops", mission(
                    "s2_daily_easy_pops",
                    "Easy",
                    "earn_pops",
                    "earn_pops_non_lime",
                    15,
                    Daily.Easy,
                    "EARN 15 POPS",
                    "Lime balloon rewards do not count",
                    Assets.Pops
                )),
                group("balloon_variety", mission(
                    "s2_daily_easy_balloon_variety",
                    "Easy",
                    "balloon_variety",
                    "distinct_balloons",
                    4,
                    Daily.Easy,
                    "SPIN 4 DIFFERENT BALLOONS",
                    "Try four different balloon types",
                    Assets.Cosmic
                )),
                (group("obby_variety", mission(
                    "s2_daily_easy_obby_variety",
                    "Easy",
                    "obby_variety",
                    "distinct_obbies",
                    3,
                    Daily.Easy,
                    "COMPLETE 3 DIFFERENT OBBIES",
                    "Finish three different obbies",
                    Assets.Obby
                ))),
            },
            Medium = {
                group("playtime", mission(
                    "s2_daily_medium_play",
                    "Medium",
                    "playtime",
                    "play_seconds",
                    2700,
                    Daily.Medium,
                    "PLAY FOR 45 MINUTES",
                    "Stay in the server for 45 minutes",
                    Assets.Clock,
                    {displayDivisor = 60}
                )),
                group("open_balloons", mission(
                    "s2_daily_medium_open",
                    "Medium",
                    "open_balloons",
                    "spin_total",
                    25,
                    Daily.Medium,
                    "OPEN 25 BALLOONS",
                    "Every completed balloon spin counts",
                    Assets.Cosmic
                )),
                group("specific_obby", mission(
                    "s2_daily_medium_long_obby",
                    "Medium",
                    "specific_obby",
                    "obby_complete",
                    5,
                    Daily.Medium,
                    "COMPLETE LONG OBBY 5 TIMES",
                    "Finish the Long obby five times",
                    Assets.Obby,
                    {obbyIndex = 5}
                ), mission(
                    "s2_daily_medium_rainbow_obby",
                    "Medium",
                    "specific_obby",
                    "obby_complete",
                    8,
                    Daily.Medium,
                    "COMPLETE RAINBOW OBBY 8 TIMES",
                    "Finish the Rainbow obby eight times",
                    Assets.Obby,
                    {obbyIndex = 6}
                )),
                group("credit_single", mission(
                    "s2_daily_medium_credit_spin",
                    "Medium",
                    "credit_single",
                    "credit_single",
                    1000,
                    Daily.Medium,
                    "GET 1K+ CREDITS IN ONE SPIN",
                    "Land at least 1,000 Credits from one balloon",
                    Assets.Credits
                )),
                group("earn_pops", mission(
                    "s2_daily_medium_pops",
                    "Medium",
                    "earn_pops",
                    "earn_pops_non_lime",
                    100,
                    Daily.Medium,
                    "EARN 100 POPS",
                    "Lime balloon rewards do not count",
                    Assets.Pops
                )),
                group("balloon_variety", mission(
                    "s2_daily_medium_balloon_variety",
                    "Medium",
                    "balloon_variety",
                    "distinct_balloons",
                    6,
                    Daily.Medium,
                    "SPIN 6 DIFFERENT BALLOONS",
                    "Try six different balloon types",
                    Assets.Cosmic
                )),
                (group("obby_variety", mission(
                    "s2_daily_medium_obby_variety",
                    "Medium",
                    "obby_variety",
                    "distinct_obbies",
                    5,
                    Daily.Medium,
                    "COMPLETE 5 DIFFERENT OBBIES",
                    "Finish five different obbies",
                    Assets.Obby
                ))),
            },
            Hard = {
                group("playtime", mission(
                    "s2_daily_hard_play",
                    "Hard",
                    "playtime",
                    "play_seconds",
                    7200,
                    Daily.Hard,
                    "PLAY FOR 120 MINUTES",
                    "Stay in the server for 120 minutes",
                    Assets.Clock,
                    {displayDivisor = 60}
                )),
                group("open_balloons", mission(
                    "s2_daily_hard_open",
                    "Hard",
                    "open_balloons",
                    "spin_total",
                    75,
                    Daily.Hard,
                    "OPEN 75 BALLOONS",
                    "Every completed balloon spin counts",
                    Assets.Cosmic
                )),
                group("specific_obby", mission(
                    "s2_daily_hard_expert_obby",
                    "Hard",
                    "specific_obby",
                    "obby_complete",
                    15,
                    Daily.Hard,
                    "COMPLETE EXPERT OBBY 15 TIMES",
                    "Finish the Expert obby fifteen times",
                    Assets.Obby,
                    {obbyIndex = 4}
                ), mission(
                    "s2_daily_hard_bridge_obby",
                    "Hard",
                    "specific_obby",
                    "obby_complete",
                    15,
                    Daily.Hard,
                    "COMPLETE GLASS BRIDGE 15 TIMES",
                    "Finish the Glass Bridge fifteen times",
                    Assets.Obby,
                    {obbyIndex = 7}
                )),
                group("credit_single", mission(
                    "s2_daily_hard_credit_spin",
                    "Hard",
                    "credit_single",
                    "credit_single",
                    10000,
                    Daily.Hard,
                    "GET 10K+ CREDITS IN ONE SPIN",
                    "A Robux reward also completes this mission",
                    Assets.Credits,
                    {robuxCounts = true}
                )),
                group("earn_pops", mission(
                    "s2_daily_hard_pops",
                    "Hard",
                    "earn_pops",
                    "earn_pops_non_lime",
                    250,
                    Daily.Hard,
                    "EARN 250 POPS",
                    "Lime balloon rewards do not count",
                    Assets.Pops
                )),
                group("balloon_variety", mission(
                    "s2_daily_hard_balloon_variety",
                    "Hard",
                    "balloon_variety",
                    "distinct_balloons",
                    7,
                    Daily.Hard,
                    "SPIN 7 DIFFERENT BALLOONS",
                    "Try seven different balloon types",
                    Assets.Cosmic
                )),
                (group("obby_mastery", mission(
                    "s2_daily_hard_obby_mastery",
                    "Hard",
                    "obby_mastery",
                    "distinct_obbies_threshold",
                    3,
                    Daily.Hard,
                    "MASTER 3 DIFFERENT OBBIES",
                    "Complete three different obbies five times each",
                    Assets.Obby,
                    {uniqueTargetPerKey = 5}
                ))),
            },
        },
        Weekly = {
            Easy = {
                group("playtime", mission(
                    "s2_weekly_easy_play",
                    "Easy",
                    "playtime",
                    "play_seconds",
                    10800,
                    Weekly.Easy,
                    "PLAY FOR 180 MINUTES",
                    "Playtime adds up throughout the week",
                    Assets.Clock,
                    {displayDivisor = 60}
                )),
                group("open_balloons", mission(
                    "s2_weekly_easy_open",
                    "Easy",
                    "open_balloons",
                    "spin_total",
                    100,
                    Weekly.Easy,
                    "OPEN 100 BALLOONS",
                    "Every completed balloon spin counts",
                    Assets.Cosmic
                )),
                group("specific_balloon", mission(
                    "s2_weekly_easy_orange",
                    "Easy",
                    "specific_balloon",
                    "spin_balloon",
                    25,
                    Weekly.Easy,
                    "SPIN ORANGE BALLOON 25 TIMES",
                    "Complete twenty-five Orange balloon spins",
                    Assets.Orange,
                    {balloonKey = "Orange"}
                ), mission(
                    "s2_weekly_easy_yellow",
                    "Easy",
                    "specific_balloon",
                    "spin_balloon",
                    20,
                    Weekly.Easy,
                    "SPIN YELLOW BALLOON 20 TIMES",
                    "Complete twenty Yellow balloon spins",
                    Assets.Yellow,
                    {balloonKey = "Yellow"}
                )),
                group("arena_kills", mission(
                    "s2_weekly_easy_arena",
                    "Easy",
                    "arena_kills",
                    "arena_kill",
                    15,
                    Weekly.Easy,
                    "GET 15 SWORD ARENA KILLS",
                    "Defeat fifteen players in the swordfight arena",
                    Assets.Sword
                )),
                group("specific_obby", mission(
                    "s2_weekly_easy_easy_obby",
                    "Easy",
                    "specific_obby",
                    "obby_complete",
                    30,
                    Weekly.Easy,
                    "COMPLETE EASY OBBY 30 TIMES",
                    "Finish the Easy obby thirty times",
                    Assets.Obby,
                    {obbyIndex = 1}
                ), mission(
                    "s2_weekly_easy_medium_obby",
                    "Easy",
                    "specific_obby",
                    "obby_complete",
                    15,
                    Weekly.Easy,
                    "COMPLETE MEDIUM OBBY 15 TIMES",
                    "Finish the Medium obby fifteen times",
                    Assets.Obby,
                    {obbyIndex = 2}
                )),
                group("credit_single", mission(
                    "s2_weekly_easy_credit_spin",
                    "Easy",
                    "credit_single",
                    "credit_single",
                    10000,
                    Weekly.Easy,
                    "GET 10K+ CREDITS IN ONE SPIN",
                    "A Robux reward also completes this mission",
                    Assets.Credits,
                    {robuxCounts = true}
                )),
                group("earn_pops", mission(
                    "s2_weekly_easy_pops",
                    "Easy",
                    "earn_pops",
                    "earn_pops_non_lime",
                    200,
                    Weekly.Easy,
                    "EARN 200 POPS",
                    "Lime balloon rewards do not count",
                    Assets.Pops
                )),
                group("daily_missions", mission(
                    "s2_weekly_easy_dailies",
                    "Easy",
                    "daily_missions",
                    "claim_daily_mission",
                    5,
                    Weekly.Easy,
                    "COMPLETE 5 DAILY MISSIONS",
                    "Claim five Daily mission rewards",
                    Assets.Gift
                )),
                group("balloon_variety", mission(
                    "s2_weekly_easy_balloon_variety",
                    "Easy",
                    "balloon_variety",
                    "distinct_balloons",
                    5,
                    Weekly.Easy,
                    "SPIN 5 DIFFERENT BALLOONS",
                    "Try five different balloon types",
                    Assets.Cosmic
                )),
                (group("obby_variety", mission(
                    "s2_weekly_easy_obby_variety",
                    "Easy",
                    "obby_variety",
                    "distinct_obbies",
                    4,
                    Weekly.Easy,
                    "COMPLETE 4 DIFFERENT OBBIES",
                    "Finish four different obbies",
                    Assets.Obby
                ))),
            },
            Medium = {
                group("playtime", mission(
                    "s2_weekly_medium_play",
                    "Medium",
                    "playtime",
                    "play_seconds",
                    21600,
                    Weekly.Medium,
                    "PLAY FOR 360 MINUTES",
                    "Playtime adds up throughout the week",
                    Assets.Clock,
                    {displayDivisor = 60}
                )),
                group("open_balloons", mission(
                    "s2_weekly_medium_open",
                    "Medium",
                    "open_balloons",
                    "spin_total",
                    250,
                    Weekly.Medium,
                    "OPEN 250 BALLOONS",
                    "Every completed balloon spin counts",
                    Assets.Cosmic
                )),
                group("specific_balloon", mission(
                    "s2_weekly_medium_green",
                    "Medium",
                    "specific_balloon",
                    "spin_balloon",
                    25,
                    Weekly.Medium,
                    "SPIN GREEN BALLOON 25 TIMES",
                    "Complete twenty-five Green balloon spins",
                    Assets.Green,
                    {balloonKey = "Green"}
                ), mission(
                    "s2_weekly_medium_blue",
                    "Medium",
                    "specific_balloon",
                    "spin_balloon",
                    10,
                    Weekly.Medium,
                    "SPIN BLUE BALLOON 10 TIMES",
                    "Complete ten Blue balloon spins",
                    Assets.Cyan,
                    {balloonKey = "Blue"}
                )),
                group("arena_kills", mission(
                    "s2_weekly_medium_arena",
                    "Medium",
                    "arena_kills",
                    "arena_kill",
                    35,
                    Weekly.Medium,
                    "GET 35 SWORD ARENA KILLS",
                    "Defeat thirty-five players in the swordfight arena",
                    Assets.Sword
                )),
                group("specific_obby", mission(
                    "s2_weekly_medium_long_obby",
                    "Medium",
                    "specific_obby",
                    "obby_complete",
                    35,
                    Weekly.Medium,
                    "COMPLETE LONG OBBY 35 TIMES",
                    "Finish the Long obby thirty-five times",
                    Assets.Obby,
                    {obbyIndex = 5}
                ), mission(
                    "s2_weekly_medium_rainbow_obby",
                    "Medium",
                    "specific_obby",
                    "obby_complete",
                    60,
                    Weekly.Medium,
                    "COMPLETE RAINBOW OBBY 60 TIMES",
                    "Finish the Rainbow obby sixty times",
                    Assets.Obby,
                    {obbyIndex = 6}
                ), mission(
                    "s2_weekly_medium_bridge_obby",
                    "Medium",
                    "specific_obby",
                    "obby_complete",
                    40,
                    Weekly.Medium,
                    "COMPLETE GLASS BRIDGE 40 TIMES",
                    "Finish the Glass Bridge forty times",
                    Assets.Obby,
                    {obbyIndex = 7}
                )),
                group("credit_single", mission(
                    "s2_weekly_medium_credit_spin",
                    "Medium",
                    "credit_single",
                    "credit_single",
                    25000,
                    Weekly.Medium,
                    "GET 25K+ CREDITS IN ONE SPIN",
                    "A Robux reward also completes this mission",
                    Assets.Credits,
                    {robuxCounts = true}
                )),
                group("earn_pops", mission(
                    "s2_weekly_medium_pops",
                    "Medium",
                    "earn_pops",
                    "earn_pops_non_lime",
                    750,
                    Weekly.Medium,
                    "EARN 750 POPS",
                    "Lime balloon rewards do not count",
                    Assets.Pops
                )),
                group("daily_missions", mission(
                    "s2_weekly_medium_dailies",
                    "Medium",
                    "daily_missions",
                    "claim_daily_mission",
                    9,
                    Weekly.Medium,
                    "COMPLETE 9 DAILY MISSIONS",
                    "Claim nine Daily mission rewards",
                    Assets.Gift
                )),
                group("balloon_variety", mission(
                    "s2_weekly_medium_balloon_variety",
                    "Medium",
                    "balloon_variety",
                    "distinct_balloons",
                    7,
                    Weekly.Medium,
                    "SPIN 7 DIFFERENT BALLOONS",
                    "Try seven different balloon types",
                    Assets.Cosmic
                )),
                (group("obby_variety", mission(
                    "s2_weekly_medium_obby_variety",
                    "Medium",
                    "obby_variety",
                    "distinct_obbies",
                    6,
                    Weekly.Medium,
                    "COMPLETE 6 DIFFERENT OBBIES",
                    "Finish six different obbies",
                    Assets.Obby
                ))),
            },
            Hard = {
                group("playtime", mission(
                    "s2_weekly_hard_play",
                    "Hard",
                    "playtime",
                    "play_seconds",
                    43200,
                    Weekly.Hard,
                    "PLAY FOR 720 MINUTES",
                    "Playtime adds up throughout the week",
                    Assets.Clock,
                    {displayDivisor = 60}
                )),
                group("open_balloons", mission(
                    "s2_weekly_hard_open",
                    "Hard",
                    "open_balloons",
                    "spin_total",
                    600,
                    Weekly.Hard,
                    "OPEN 600 BALLOONS",
                    "Every completed balloon spin counts",
                    Assets.Cosmic
                )),
                group("specific_balloon", mission(
                    "s2_weekly_hard_yellow",
                    "Hard",
                    "specific_balloon",
                    "spin_balloon",
                    150,
                    Weekly.Hard,
                    "SPIN YELLOW BALLOON 150 TIMES",
                    "Complete one hundred fifty Yellow balloon spins",
                    Assets.Yellow,
                    {balloonKey = "Yellow"}
                ), mission(
                    "s2_weekly_hard_lime",
                    "Hard",
                    "specific_balloon",
                    "spin_balloon",
                    100,
                    Weekly.Hard,
                    "SPIN LIME BALLOON 100 TIMES",
                    "Complete one hundred Lime balloon spins",
                    Assets.Lime,
                    {balloonKey = "Lime"}
                ), mission(
                    "s2_weekly_hard_green",
                    "Hard",
                    "specific_balloon",
                    "spin_balloon",
                    75,
                    Weekly.Hard,
                    "SPIN GREEN BALLOON 75 TIMES",
                    "Complete seventy-five Green balloon spins",
                    Assets.Green,
                    {balloonKey = "Green"}
                )),
                group("arena_kills", mission(
                    "s2_weekly_hard_arena",
                    "Hard",
                    "arena_kills",
                    "arena_kill",
                    75,
                    Weekly.Hard,
                    "GET 75 SWORD ARENA KILLS",
                    "Defeat seventy-five players in the swordfight arena",
                    Assets.Sword
                )),
                group("obby_mastery", mission(
                    "s2_weekly_hard_obby_mastery",
                    "Hard",
                    "obby_mastery",
                    "distinct_obbies_threshold",
                    6,
                    Weekly.Hard,
                    "MASTER 6 DIFFERENT OBBIES",
                    "Complete six different obbies twelve times each",
                    Assets.Obby,
                    {uniqueTargetPerKey = 12}
                )),
                group("robux_reward", mission(
                    "s2_weekly_hard_robux",
                    "Hard",
                    "robux_reward",
                    "robux_spin",
                    2,
                    Weekly.Hard,
                    "GET ROBUX IN 2 SPINS",
                    "Land a Robux reward from two balloon spins",
                    Assets.RoBal
                )),
                group("earn_pops", mission(
                    "s2_weekly_hard_pops",
                    "Hard",
                    "earn_pops",
                    "earn_pops_non_lime",
                    2500,
                    Weekly.Hard,
                    "EARN 2,500 POPS",
                    "Lime balloon rewards do not count",
                    Assets.Pops
                )),
                group("daily_missions", mission(
                    "s2_weekly_hard_dailies",
                    "Hard",
                    "daily_missions",
                    "claim_daily_mission",
                    15,
                    Weekly.Hard,
                    "COMPLETE 15 DAILY MISSIONS",
                    "Claim fifteen Daily mission rewards",
                    Assets.Gift
                )),
                group("balloon_variety", mission(
                    "s2_weekly_hard_balloon_variety",
                    "Hard",
                    "balloon_variety",
                    "distinct_balloons",
                    9,
                    Weekly.Hard,
                    "SPIN 9 DIFFERENT BALLOONS",
                    "Try nine different balloon types",
                    Assets.Cosmic
                )),
                (group("obby_variety", mission(
                    "s2_weekly_hard_obby_variety",
                    "Hard",
                    "obby_variety",
                    "distinct_obbies",
                    7,
                    Weekly.Hard,
                    "COMPLETE ALL 7 OBBIES",
                    "Finish every obby during the week",
                    Assets.Obby
                ))),
            },
        },
    }

    function deepClone(a1) -- Line: 110 -- upvalues: deepClone (val)
        if type(a1) ~= "table" then
            return a1
        end
        local v1 = {}
        for k, v in pairs(a1) do
            v1[k] = (deepClone(v))
        end
        return v1
    end

    v1 = deepClone(a1.MissionPools)
    table.insert(v1.Daily.Easy, (group("speedrun", (mission(
        "s2_daily_easy_speedrun",
        "Easy",
        "speedrun",
        "speedrun_stage",
        3,
        Daily.Easy,
        "BEAT 3 SPEEDRUN STAGES",
        "Finish three validated stages in the Speedrun",
        Assets.Obby
    )))))
    table.insert(v1.Daily.Medium, (group("speedrun", (mission(
        "s2_daily_medium_speedrun",
        "Medium",
        "speedrun",
        "speedrun_stage",
        8,
        Daily.Medium,
        "BEAT 8 SPEEDRUN STAGES",
        "Finish eight validated stages in the Speedrun",
        Assets.Obby
    )))))
    table.insert(v1.Daily.Hard, (group("speedrun", (mission(
        "s2_daily_hard_speedrun",
        "Hard",
        "speedrun",
        "speedrun_complete",
        1,
        Daily.Hard,
        "BEAT THE SPEEDRUN",
        "Complete all ten Speedrun stages",
        Assets.Obby
    )))))
    table.insert(v1.Weekly.Easy, (group("speedrun", (mission(
        "s2_weekly_easy_speedrun",
        "Easy",
        "speedrun",
        "speedrun_complete",
        1,
        Weekly.Easy,
        "BEAT THE SPEEDRUN",
        "Complete the full Speedrun once this week",
        Assets.Obby
    )))))
    table.insert(v1.Weekly.Medium, (group("speedrun", (mission(
        "s2_weekly_medium_speedrun",
        "Medium",
        "speedrun",
        "speedrun_complete",
        10,
        Weekly.Medium,
        "BEAT 10 SPEEDRUNS",
        "Complete the full Speedrun ten times this week",
        Assets.Obby
    )))))
    table.insert(v1.Weekly.Hard, (group("speedrun", (mission(
        "s2_weekly_hard_speedrun",
        "Hard",
        "speedrun",
        "speedrun_complete",
        30,
        Weekly.Hard,
        "BEAT 30 SPEEDRUNS",
        "Complete the full Speedrun thirty times this week",
        Assets.Obby
    )))))
    local v2 = {
        mission(
            "s2_monthly_easy_dailies",
            "Easy",
            "daily_missions",
            "claim_daily_mission",
            20,
            Monthly.Easy,
            "COMPLETE 20 DAILY MISSIONS",
            "Claim twenty Daily mission rewards during Season 2",
            Assets.Gift
        ),
        mission(
            "s2_monthly_medium_open",
            "Medium",
            "open_balloons",
            "spin_total",
            1500,
            Monthly.Medium,
            "OPEN 1,500 BALLOONS",
            "Every completed balloon spin counts across the season",
            Assets.Cosmic
        ),
        (mission(
            "s2_monthly_hard_obbies",
            "Hard",
            "obbies",
            "obby_total",
            5000,
            Monthly.Hard,
            "BEAT 5,000 OBBIES",
            "Every validated obby completion counts, including a completed Speedrun",
            Assets.Obby
        )),
    }
    local v3 = {
        currencyReward("Pops", 100, Assets.Pops),
        currencyReward("Credits", 5000, Assets.Credits),
        balloonReward("Yellow", Assets.Yellow, 0.1),
        currencyReward("Pops", 100, Assets.Pops),
        currencyReward("RoBal", 1, Assets.RoBal),
        currencyReward("Credits", 5000, Assets.Credits),
        balloonReward("Lime", Assets.Lime, 0.2),
        currencyReward("Pops", 100, Assets.Pops),
        currencyReward("Credits", 10000, Assets.Credits),
        cosmeticCrateReward("ItemsCredits", "ITEMS\nCRATE", Assets.ItemsCrate),
        currencyReward("Pops", 100, Assets.Pops),
        currencyReward("Credits", 10000, Assets.Credits),
        balloonReward("Orange", Assets.Orange, 0.03),
        currencyReward("Pops", 100, Assets.Pops),
        currencyReward("RoBal", 2, Assets.RoBal),
        currencyReward("Credits", 10000, Assets.Credits),
        currencyReward("Pops", 150, Assets.Pops),
        balloonReward("Green", Assets.Green, 0.25),
        currencyReward("Credits", 15000, Assets.Credits),
        currencyReward("RoBal", 2, Assets.RoBal),
        currencyReward("Pops", 150, Assets.Pops),
        currencyReward("Credits", 15000, Assets.Credits),
        balloonReward("Blue", Assets.Cyan, 0.5),
        currencyReward("Pops", 150, Assets.Pops),
        currencyReward("RoBal", 3, Assets.RoBal),
        currencyReward("Credits", 20000, Assets.Credits),
        cosmeticCrateReward("SpinnerSkinsCredits", "SPINNER SKIN\nCRATE", Assets.SpinnerSkinsCrate),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 200, Assets.Pops),
        currencyReward("RoBal", 3, Assets.RoBal),
        currencyReward("Credits", 20000, Assets.Credits),
        currencyReward("Pops", 200, Assets.Pops),
        currencyReward("Credits", 20000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("RoBal", 4, Assets.RoBal),
        currencyReward("Pops", 200, Assets.Pops),
        currencyReward("Credits", 25000, Assets.Credits),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("Credits", 25000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("Credits", 30000, Assets.Credits),
        cosmeticCrateReward("AurasCredits", "AURA\nCRATE", Assets.AuraCrate),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("RoBal", 5, Assets.RoBal),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("Credits", 30000, Assets.Credits),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("Pops", 200, Assets.Pops),
        (withBonusTitle(balloonReward("Rainbow", Assets.Rainbow, 49), "Season2Champion", "SEASON 2 CHAMPION")),
    }
    local v4 = {
        currencyReward("Pops", 125, Assets.Pops),
        currencyReward("Credits", 7500, Assets.Credits),
        balloonReward("Lime", Assets.Lime, 0.2),
        currencyReward("Pops", 150, Assets.Pops),
        currencyReward("RoBal", 2, Assets.RoBal),
        currencyReward("Credits", 10000, Assets.Credits),
        balloonReward("Green", Assets.Green, 0.25),
        currencyReward("RoBal", 2, Assets.RoBal),
        currencyReward("Pops", 200, Assets.Pops),
        cosmeticCrateReward("ItemsRobux", "PREMIUM ITEMS\nCRATE", Assets.PremiumItemsCrate),
        currencyReward("Pops", 125, Assets.Pops),
        currencyReward("Credits", 15000, Assets.Credits),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("RoBal", 2, Assets.RoBal),
        currencyReward("Credits", 35000, Assets.Credits),
        currencyReward("Credits", 20000, Assets.Credits),
        currencyReward("Pops", 300, Assets.Pops),
        currencyReward("Credits", 25000, Assets.Credits),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("RoBal", 3, Assets.RoBal),
        currencyReward("Pops", 350, Assets.Pops),
        currencyReward("Credits", 35000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 400, Assets.Pops),
        currencyReward("RoBal", 4, Assets.RoBal),
        currencyReward("Credits", 45000, Assets.Credits),
        cosmeticCrateReward("SpinnerSkinsRobux", "PREMIUM SKINS\nCRATE", Assets.PremiumSpinnerSkinsCrate),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Pops", 450, Assets.Pops),
        currencyReward("RoBal", 4, Assets.RoBal),
        currencyReward("Credits", 55000, Assets.Credits),
        balloonReward("Pink", Assets.Pink, 50),
        currencyReward("Pops", 500, Assets.Pops),
        currencyReward("Credits", 75000, Assets.Credits),
        currencyReward("RoBal", 5, Assets.RoBal),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("Pops", 550, Assets.Pops),
        currencyReward("Credits", 95000, Assets.Credits),
        currencyReward("RoBal", 3, Assets.RoBal),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Pops", 600, Assets.Pops),
        currencyReward("RoBal", 4, Assets.RoBal),
        cosmeticCrateReward("AurasRobux", "PREMIUM AURAS\nCRATE", Assets.PremiumAuraCrate),
        currencyReward("Credits", 150000, Assets.Credits),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Pops", 650, Assets.Pops),
        currencyReward("RoBal", 5, Assets.RoBal),
        currencyReward("Credits", 150000, Assets.Credits),
        currencyReward("RoBal", 5, Assets.RoBal),
        (withBonusTitle(balloonReward("Cosmic", Assets.Cosmic, 299), "Season2God", "SEASON 2 GOD")),
    }

    local function premiumStrictlyBeatsFree(a1, a2) -- Line: 244
        if a1.kind ~= "CosmeticCrate" and a2.kind ~= "CosmeticCrate" then
            local v1 = tonumber(a2.estimatedRobuxValue) or 0
            return (tonumber(a1.estimatedRobuxValue) or 0) < v1
        end
        local v2 = false
        if a1.kind == "CosmeticCrate" then
            v2 = false
            if a2.kind == "CosmeticCrate" then
                v2 = false
                if tostring(a1.crateKey):sub(-7) == "Credits" then
                    v2 = tostring(a2.crateKey):sub(-5) == "Robux"
                end
            end
        end
        return v2
    end

    local v5 = #v3
    for i = 1, v5 do
        assert(premiumStrictlyBeatsFree(v3[i], v4[i]), (("Season 2 Premium tier %d must be strictly better than Free"):format(i)))
    end
    return {
        SeasonId = 3,
        SeasonName = "SEASON 2",
        MaxTier = 50,
        MaxSeasonXP = 14300,
        PremiumPrice = 399,
        PremiumGamePassId = 1953641293,
        SkipToEndPrice = 999,
        SkipToEndProductId = 3709497740,
        SeasonStartUnix = DateTime.fromUniversalTime(2026, 8, 23, 4, 0, 0).UnixTimestamp,
        SeasonEndUnix = DateTime.fromUniversalTime(2026, 9, 20, 4, 0, 0).UnixTimestamp,
        MissionSkipProductIds = {
            Daily = {Easy = 3612124491, Medium = 3612124656, Hard = 3612124737},
            Weekly = {Easy = 3612124839, Medium = 3612124871, Hard = 3612124882},
            Monthly = {Easy = 3612124910, Medium = 3612124970, Hard = 3612124984},
        },
        MissionPools = v1,
        MonthlyMissions = v2,
        Rewards = {Free = v3, Premium = v4},
    }
end