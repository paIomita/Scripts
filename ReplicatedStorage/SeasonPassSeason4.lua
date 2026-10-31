-- Path: ReplicatedStorage.SeasonPassSeason4

-- Script path: ReplicatedStorage.SeasonPassSeason4
-- Decompile time: 2.90 ms

return function(a1) -- Line: 4
    local deepClone, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local mission = a1.mission
    local currencyReward = a1.currencyReward
    local balloonReward = a1.balloonReward
    local cosmeticCrateReward = a1.cosmeticCrateReward
    local withBonusTitle = a1.withBonusTitle
    local Assets = a1.Assets
    local Monthly = a1.DifficultyXP.Monthly

    function deepClone(a1) -- Line: 13 -- upvalues: deepClone (val)
        if type(a1) ~= "table" then
            return a1
        end
        local v1 = {}
        for k, v in pairs(a1) do
            v1[k] = (deepClone(v))
        end
        return v1
    end

    assert(type(a1.Season3) == "table", "Season 4 requires Season 3 content")
    local v10 = deepClone(a1.Season3.MissionPools)
    local v11 = {
        mission(
            "s4_monthly_easy_arena",
            "Easy",
            "arena_kills",
            "arena_kill",
            50,
            Monthly.Easy,
            "GET 50 SWORD ARENA KILLS",
            "Defeat fifty players in the swordfight arena",
            Assets.Sword
        ),
        mission(
            "s4_monthly_medium_obby_mastery",
            "Medium",
            "obby_variety",
            "distinct_obbies_threshold",
            7,
            Monthly.Medium,
            "MASTER ALL 7 OBBIES",
            "Complete every obby twenty-five times each",
            Assets.Obby,
            {uniqueTargetPerKey = 25}
        ),
        (mission(
            "s4_monthly_hard_speedruns",
            "Hard",
            "speedrun",
            "speedrun_complete",
            300,
            Monthly.Hard,
            "BEAT 300 SPEEDRUNS",
            "Complete the full Speedrun three hundred times",
            Assets.Obby
        )),
    }
    local v12 = {
        currencyReward("Credits", 5000, Assets.Credits),
        currencyReward("Pops", 50, Assets.Pops),
        balloonReward("Orange", Assets.Orange, 0.03),
        currencyReward("Credits", 5000, Assets.Credits),
        currencyReward("RoBal", 1, Assets.RoBal),
        balloonReward("Yellow", Assets.Yellow, 0.1),
        currencyReward("Pops", 75, Assets.Pops),
        currencyReward("Credits", 6000, Assets.Credits),
        cosmeticCrateReward("ItemsCredits", "ITEMS\nCRATE", Assets.ItemsCrate),
        currencyReward("Pops", 100, Assets.Pops),
        currencyReward("RoBal", 1, Assets.RoBal),
        balloonReward("Lime", Assets.Lime, 0.2),
        currencyReward("Credits", 7000, Assets.Credits),
        currencyReward("Pops", 125, Assets.Pops),
        balloonReward("Green", Assets.Green, 0.25),
        currencyReward("Credits", 8000, Assets.Credits),
        currencyReward("RoBal", 2, Assets.RoBal),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("Pops", 150, Assets.Pops),
        currencyReward("Credits", 9000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 175, Assets.Pops),
        currencyReward("RoBal", 2, Assets.RoBal),
        cosmeticCrateReward("SpinnerSkinsCredits", "SPINNER SKIN\nCRATE", Assets.SpinnerSkinsCrate),
        currencyReward("Credits", 10000, Assets.Credits),
        currencyReward("Pops", 200, Assets.Pops),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Credits", 12000, Assets.Credits),
        currencyReward("RoBal", 3, Assets.RoBal),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Pops", 225, Assets.Pops),
        currencyReward("Credits", 14000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("RoBal", 3, Assets.RoBal),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Credits", 16000, Assets.Credits),
        currencyReward("Pops", 275, Assets.Pops),
        cosmeticCrateReward("AurasCredits", "AURA\nCRATE", Assets.AuraCrate),
        currencyReward("Credits", 20000, Assets.Credits),
        currencyReward("RoBal", 4, Assets.RoBal),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 360, Assets.Pops),
        currencyReward("Credits", 25000, Assets.Credits),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Pops", 450, Assets.Pops),
        currencyReward("Credits", 35000, Assets.Credits),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Credits", 45000, Assets.Credits),
        (withBonusTitle(balloonReward("Rainbow", Assets.Rainbow, 49), "Season4Champion", "SEASON 4 CHAMPION")),
    }
    local v13 = {
        currencyReward("Credits", 10000, Assets.Credits),
        currencyReward("Pops", 100, Assets.Pops),
        balloonReward("Blue", Assets.Cyan, 0.5),
        currencyReward("Credits", 12000, Assets.Credits),
        currencyReward("RoBal", 2, Assets.RoBal),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("Pops", 150, Assets.Pops),
        currencyReward("Credits", 15000, Assets.Credits),
        cosmeticCrateReward("ItemsRobux", "PREMIUM ITEMS\nCRATE", Assets.PremiumItemsCrate),
        currencyReward("Pops", 200, Assets.Pops),
        currencyReward("RoBal", 3, Assets.RoBal),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("Credits", 18000, Assets.Credits),
        currencyReward("Pops", 250, Assets.Pops),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("Credits", 20000, Assets.Credits),
        currencyReward("RoBal", 4, Assets.RoBal),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 300, Assets.Pops),
        balloonReward("Violet", Assets.Violet, 1),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Pops", 350, Assets.Pops),
        currencyReward("RoBal", 5, Assets.RoBal),
        cosmeticCrateReward("SpinnerSkinsRobux", "PREMIUM SKINS\nCRATE", Assets.PremiumSpinnerSkinsCrate),
        currencyReward("Credits", 25000, Assets.Credits),
        currencyReward("Pops", 400, Assets.Pops),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Credits", 30000, Assets.Credits),
        currencyReward("RoBal", 6, Assets.RoBal),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Pops", 450, Assets.Pops),
        currencyReward("Credits", 35000, Assets.Credits),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Pops", 500, Assets.Pops),
        currencyReward("RoBal", 8, Assets.RoBal),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Credits", 40000, Assets.Credits),
        currencyReward("Pops", 550, Assets.Pops),
        cosmeticCrateReward("AurasRobux", "PREMIUM AURAS\nCRATE", Assets.PremiumAuraCrate),
        currencyReward("Pops", 600, Assets.Pops),
        currencyReward("RoBal", 10, Assets.RoBal),
        currencyReward("Credits", 50000, Assets.Credits),
        currencyReward("Pops", 800, Assets.Pops),
        currencyReward("Credits", 65000, Assets.Credits),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Pops", 1200, Assets.Pops),
        currencyReward("Credits", 100000, Assets.Credits),
        balloonReward("Pink", Assets.Pink, 50),
        currencyReward("Credits", 160000, Assets.Credits),
        (withBonusTitle(balloonReward("Cosmic", Assets.Cosmic, 299), "Season4God", "SEASON 4 GOD")),
    }
    local v14 = false
    if #v12 == 50 then
        v14 = #v13 == 50
    end
    assert(v14, "Season 4 must define exactly 50 rewards per track")
    for i = 1, 50 do
        v9 = v12[i]
        v8 = v13[i]
        v7 = false
        if v9.kind == "CosmeticCrate" then
            v7 = false
            if v8.kind == "CosmeticCrate" then
                v7 = false
                if tostring(v9.crateKey):sub(-7) == "Credits" then
                    v7 = tostring(v8.crateKey):sub(-5) == "Robux"
                end
            end
        end
        v2 = v7
        if not v2 then
            v3 = tonumber(v8.estimatedRobuxValue) or 0
            v2 = (tonumber(v9.estimatedRobuxValue) or 0) < v3
        end
        assert(v2, (("Season 4 Premium tier %d must be strictly better than Free"):format(i)))
    end

    local function trackValue(a1) -- Line: 151
        local v1 = 0
        for i, v in ipairs(a1) do
            v1 = v1 + (tonumber(v.estimatedRobuxValue) or 0)
        end
        return v1
    end

    for k, v in pairs({Free = v12, Premium = v13}) do
        v3 = v1.Season3.Rewards[k]
        v5 = 0
        for i2, j in ipairs(v3) do
            v5 = v5 + (tonumber(j.estimatedRobuxValue) or 0)
        end
        v6 = 0
        for i3, k2 in ipairs(v) do
            v6 = v6 + (tonumber(k2.estimatedRobuxValue) or 0)
        end
        v4 = ("Season 4 %s track value must match Season 3 (%.4f)"):format(k, v5)
        assert((math.abs(v6 - v5)) < 0.001, v4)
    end
    return {
        SeasonId = 5,
        SeasonName = "SEASON 4",
        MaxTier = 50,
        MaxSeasonXP = 14300,
        PremiumPrice = 399,
        PremiumGamePassId = 2040231480,
        SkipToEndPrice = 999,
        SkipToEndProductId = 3719578110,
        SeasonStartUnix = DateTime.fromUniversalTime(2026, 10, 18, 4, 0, 0).UnixTimestamp,
        SeasonEndUnix = DateTime.fromUniversalTime(2026, 11, 15, 4, 0, 0).UnixTimestamp,
        MissionSkipProductIds = deepClone(v1.Season3.MissionSkipProductIds),
        MissionPools = v10,
        MonthlyMissions = v11,
        Rewards = {Free = v12, Premium = v13},
    }
end