-- Path: ReplicatedStorage.SeasonPassSeason3

-- Script path: ReplicatedStorage.SeasonPassSeason3
-- Decompile time: 2.59 ms

return function(a1) -- Line: 2
    local deepClone, v1, v2, v3, v4, v5, v6
    local mission = a1.mission
    local currencyReward = a1.currencyReward
    local balloonReward = a1.balloonReward
    local cosmeticCrateReward = a1.cosmeticCrateReward
    local withBonusTitle = a1.withBonusTitle
    local Assets = a1.Assets
    local Monthly = a1.DifficultyXP.Monthly

    function deepClone(a1) -- Line: 11 -- upvalues: deepClone (val)
        if type(a1) ~= "table" then
            return a1
        end
        local v1 = {}
        for k, v in pairs(a1) do
            v1[k] = (deepClone(v))
        end
        return v1
    end

    assert(type(a1.Season2) == "table", "Season 3 requires Season 2 content")
    local v7 = deepClone(a1.Season2.MissionPools)
    table.insert(v7.Daily.Medium, {
        family = "battle_wins",
        variants = {
            mission(
                "s3_daily_medium_battle_win",
                "Medium",
                "battle_wins",
                "battle_win",
                1,
                a1.DifficultyXP.Daily.Medium,
                "WIN 1 BATTLE",
                "Win one completed battle match",
                Assets.Sword
            ),
        },
    })
    table.insert(v7.Weekly.Medium, {
        family = "battle_wins",
        variants = {
            mission(
                "s3_weekly_medium_battle_wins",
                "Medium",
                "battle_wins",
                "battle_win",
                10,
                a1.DifficultyXP.Weekly.Medium,
                "WIN 10 BATTLES",
                "Win ten completed battle matches",
                Assets.Sword
            ),
        },
    })
    local v8 = {
        mission(
            "s3_monthly_easy_battle_wins",
            "Easy",
            "battle_wins",
            "battle_win",
            20,
            Monthly.Easy,
            "WIN 20 BATTLES",
            "Win twenty completed battle matches",
            Assets.Sword
        ),
        mission(
            "s3_monthly_medium_obbies",
            "Medium",
            "obby_total",
            "obby_total",
            750,
            Monthly.Medium,
            "COMPLETE 750 OBBIES",
            "Complete 750 obbies",
            Assets.Obby
        ),
        (mission(
            "s3_monthly_hard_credits",
            "Hard",
            "earn_credits",
            "earn_credits_from_spins",
            3000000,
            Monthly.Hard,
            "EARN 3M CREDITS",
            "Earn 3,000,000 Credits from completed balloon spins",
            Assets.Credits
        )),
    }
    local v9 = {
        currencyReward("Credits", 5000, Assets.Credits),
        balloonReward("Orange", Assets.Orange, 0.03),
        currencyReward("Pops", 50, Assets.Pops),
        currencyReward("RoBal", 1, Assets.RoBal),
        currencyReward("Credits", 5000, Assets.Credits),
        balloonReward("Yellow", Assets.Yellow, 0.1),
        cosmeticCrateReward("ItemsCredits", "ITEMS\nCRATE", Assets.ItemsCrate),
        currencyReward("Pops", 75, Assets.Pops),
        currencyReward("Credits", 5000, Assets.Credits),
        balloonReward("Lime", Assets.Lime, 0.2),
        currencyReward("RoBal", 1, Assets.RoBal),
        currencyReward("Pops", 95, Assets.Pops),
        currencyReward("Credits", 7000, Assets.Credits),
        balloonReward("Green", Assets.Green, 0.25),
        currencyReward("Pops", 125, Assets.Pops),
        currencyReward("Credits", 9000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("RoBal", 2, Assets.RoBal),
        currencyReward("Pops", 150, Assets.Pops),
        currencyReward("Credits", 11000, Assets.Credits),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("Credits", 13000, Assets.Credits),
        currencyReward("Pops", 175, Assets.Pops),
        cosmeticCrateReward("SpinnerSkinsCredits", "SPINNER SKIN\nCRATE", Assets.SpinnerSkinsCrate),
        currencyReward("RoBal", 2, Assets.RoBal),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Credits", 10000, Assets.Credits),
        currencyReward("Pops", 200, Assets.Pops),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Credits", 17000, Assets.Credits),
        currencyReward("Pops", 225, Assets.Pops),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("RoBal", 3, Assets.RoBal),
        currencyReward("Credits", 19000, Assets.Credits),
        currencyReward("Pops", 250, Assets.Pops),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Credits", 21000, Assets.Credits),
        currencyReward("Pops", 240, Assets.Pops),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("RoBal", 3, Assets.RoBal),
        cosmeticCrateReward("AurasCredits", "AURA\nCRATE", Assets.AuraCrate),
        currencyReward("Credits", 25000, Assets.Credits),
        currencyReward("Pops", 350, Assets.Pops),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Credits", 30000, Assets.Credits),
        currencyReward("RoBal", 4, Assets.RoBal),
        currencyReward("Pops", 500, Assets.Pops),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Credits", 40000, Assets.Credits),
        (withBonusTitle(balloonReward("Rainbow", Assets.Rainbow, 49), "Season3Champion", "SEASON 3 CHAMPION")),
    }
    local v10 = {
        currencyReward("Pops", 100, Assets.Pops),
        currencyReward("Credits", 5000, Assets.Credits),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("Credits", 20000, Assets.Credits),
        currencyReward("Pops", 150, Assets.Pops),
        currencyReward("RoBal", 2, Assets.RoBal),
        cosmeticCrateReward("ItemsRobux", "PREMIUM ITEMS\nCRATE", Assets.PremiumItemsCrate),
        currencyReward("Credits", 15000, Assets.Credits),
        balloonReward("Blue", Assets.Cyan, 0.5),
        currencyReward("Pops", 200, Assets.Pops),
        currencyReward("Credits", 15000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("RoBal", 3, Assets.RoBal),
        currencyReward("Pops", 250, Assets.Pops),
        currencyReward("Credits", 20000, Assets.Credits),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("RoBal", 4, Assets.RoBal),
        currencyReward("Pops", 300, Assets.Pops),
        currencyReward("Credits", 25000, Assets.Credits),
        balloonReward("Violet", Assets.Violet, 1),
        currencyReward("Pops", 375, Assets.Pops),
        currencyReward("RoBal", 5, Assets.RoBal),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        cosmeticCrateReward("SpinnerSkinsRobux", "PREMIUM SKINS\nCRATE", Assets.PremiumSpinnerSkinsCrate),
        currencyReward("Credits", 30000, Assets.Credits),
        currencyReward("Pops", 400, Assets.Pops),
        balloonReward("Cobalt", Assets.Cobalt, 0.75),
        currencyReward("RoBal", 6, Assets.RoBal),
        currencyReward("Credits", 35000, Assets.Credits),
        currencyReward("Pops", 450, Assets.Pops),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Credits", 40000, Assets.Credits),
        currencyReward("Pops", 525, Assets.Pops),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("RoBal", 8, Assets.RoBal),
        currencyReward("Credits", 50000, Assets.Credits),
        currencyReward("Pops", 575, Assets.Pops),
        balloonReward("Orchid", Assets.Orchid, 2.5),
        currencyReward("Credits", 65000, Assets.Credits),
        currencyReward("Pops", 600, Assets.Pops),
        cosmeticCrateReward("AurasRobux", "PREMIUM AURAS\nCRATE", Assets.PremiumAuraCrate),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("RoBal", 10, Assets.RoBal),
        currencyReward("Credits", 100000, Assets.Credits),
        currencyReward("Pops", 800, Assets.Pops),
        balloonReward("Fuschia", Assets.Fuschia, 10),
        currencyReward("Credits", 160000, Assets.Credits),
        balloonReward("Pink", Assets.Pink, 50),
        currencyReward("Pops", 1125, Assets.Pops),
        (withBonusTitle(balloonReward("Cosmic", Assets.Cosmic, 299), "Season3God", "SEASON 3 GOD")),
    }
    local v11 = false
    if #v9 == 50 then
        v11 = #v10 == 50
    end
    assert(v11, "Season 3 must define exactly 50 rewards per track")
    for i = 1, 50 do
        v6 = v9[i]
        v5 = v10[i]
        v4 = false
        if v6.kind == "CosmeticCrate" then
            v4 = false
            if v5.kind == "CosmeticCrate" then
                v4 = false
                if tostring(v6.crateKey):sub(-7) == "Credits" then
                    v4 = tostring(v5.crateKey):sub(-5) == "Robux"
                end
            end
        end
        v2 = v4
        if not v2 then
            v3 = tonumber(v5.estimatedRobuxValue) or 0
            v2 = (tonumber(v6.estimatedRobuxValue) or 0) < v3
        end
        assert(v2, (("Season 3 Premium tier %d must be strictly better than Free"):format(i)))
    end
    return {
        SeasonId = 4,
        SeasonName = "SEASON 3",
        MaxTier = 50,
        MaxSeasonXP = 14300,
        PremiumPrice = 399,
        PremiumGamePassId = 1985373512,
        SkipToEndPrice = 999,
        SkipToEndProductId = 3713844662,
        SeasonStartUnix = DateTime.fromUniversalTime(2026, 9, 20, 4, 0, 0).UnixTimestamp,
        SeasonEndUnix = DateTime.fromUniversalTime(2026, 10, 18, 4, 0, 0).UnixTimestamp,
        MissionSkipProductIds = deepClone(v1.Season2.MissionSkipProductIds),
        MissionPools = v7,
        MonthlyMissions = v8,
        Rewards = {Free = v9, Premium = v10},
    }
end