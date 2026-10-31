-- Path: ReplicatedStorage.CosmeticsCatalog

-- Script path: ReplicatedStorage.CosmeticsCatalog
-- Decompile time: 7.40 ms

local luckBonusPercent, v1, v2, v3
local u1021 = {
    Version = 3,
    CurrencyIcons = {
        Credits = "rbxassetid://126410030134519",
        Robux = "rbxassetid://97015972462614",
        Pops = "rbxassetid://140173109015230",
    },
    RarityOrder = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Exclusive", "OneOfOne"},
}
u1021.Rarities = {
    Common = {order = 1, color = Color3.fromRGB(178, 186, 197)},
    Uncommon = {order = 2, color = Color3.fromRGB(80, 220, 112)},
    Rare = {order = 3, color = Color3.fromRGB(73, 150, 255)},
    Epic = {order = 4, color = Color3.fromRGB(185, 85, 255)},
    Legendary = {order = 5, color = Color3.fromRGB(255, 177, 52)},
    Mythic = {order = 6, color = Color3.fromRGB(255, 73, 141)},
    Exclusive = {order = 7, color = Color3.fromRGB(255, 220, 60)},
    OneOfOne = {order = 8, color = Color3.fromRGB(255, 255, 255)},
}
u1021.CosmeticLuckByRarity = {
    Common = 0.1,
    Uncommon = 0.2,
    Rare = 0.5,
    Epic = 1,
    Legendary = 2,
    Mythic = 5,
    Exclusive = 100,
    OneOfOne = 100,
}
u1021.SpinnerSkinLuckByRarity = u1021.CosmeticLuckByRarity

function u1021.FormatLuckBonusPercent(a1) -- Line: 50
    return "+" .. ((string.format("%.1f", (math.max(0, (tonumber(a1)) or 0)))):gsub("%.0$", "")) .. "% LUCK"
end

u1021.Crates = {
    ItemsCredits = {
        key = "ItemsCredits",
        displayName = "ITEMS CRATE",
        category = "Items",
        currency = "Credits",
        unitCost = 25000,
        productIds = {},
    },
    SpinnerSkinsCredits = {
        key = "SpinnerSkinsCredits",
        displayName = "SPINNER SKINS",
        category = "SpinnerSkins",
        currency = "Credits",
        unitCost = 75000,
        productIds = {},
    },
    AurasCredits = {
        key = "AurasCredits",
        displayName = "AURAS",
        category = "Auras",
        currency = "Credits",
        unitCost = 150000,
        productIds = {},
    },
    ItemsRobux = {
        key = "ItemsRobux",
        displayName = "PREMIUM ITEMS CRATE",
        category = "Items",
        currency = "Robux",
        unitCost = 49,
        productIds = {3665979391, 3666001918, 3666008828, 3666016589},
    },
    SpinnerSkinsRobux = {
        key = "SpinnerSkinsRobux",
        displayName = "PREMIUM SKINS",
        category = "SpinnerSkins",
        currency = "Robux",
        unitCost = 99,
        productIds = {3666017642, 3666018572, 3666019508, 3666020482},
    },
    AurasRobux = {
        key = "AurasRobux",
        displayName = "PREMIUM AURAS",
        category = "Auras",
        currency = "Robux",
        unitCost = 149,
        productIds = {3666028373, 3666029400, 3666030413, 3666031488},
    },
}
u1021.LegacyItemToItem = {
    RedRobloxCap = "AstronautHelmet",
    RBaseballCap = "SinisterBranches",
    NavyBunnyCap = "SilverthornAntlers",
    LavenderUpdo = "ClassicRobloxFedora",
    TrueBlueHair = "ClockworksHeadphones",
    OrangeBeanie = "ArcaneFedora",
    JadeShell = "RedSparkleTimeFedora",
    ZhethArmor = "IceValkyrie",
    PurpleEclipse = "DominusFrigidus",
    DarkWings = "DominusInfernus",
    RelicWings = "MidnightBlueSparkleTime",
    StratosphereCrown = "DominusAstra",
}
u1021.LegacyTrailToSpinnerSkin = {
    EmberWake = "InfernoCore",
    BubblegumRush = "BubblegumDrive",
    ToxicSlime = "ToxicReactor",
    GlacierMist = "FrostCircuit",
    VioletPulse = "VioletVelocity",
    SolarFlare = "SolarEngine",
    ThunderCurrent = "StormCore",
    VoidRift = "VoidMachina",
    PrismRush = "PrismOverdrive",
    Dragonfire = "DragonForge",
    AuroraCrown = "AuroraDrive",
    TimeFracture = "SingularityOne",
}
u1021.LegacyClaimKeys = {["SpinnerSkins:SingularityOne"] = "Trails:TimeFracture"}

local function assetThumb(a1) -- Line: 142
    return ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(a1)
end

u1021.Rewards = {
    Items = {
        {
            key = "AstronautHelmet",
            displayName = "ASTRONAUT HELMET",
            description = "A polished Roblox space classic.",
            rarity = "Common",
            assetId = 1081366,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(1081366),
        },
        {
            key = "SinisterBranches",
            displayName = "SINISTER BRANCHES",
            description = "Twisted limited branches with a sharp silhouette.",
            rarity = "Common",
            assetId = 71484026,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(71484026),
        },
        {
            key = "SilverthornAntlers",
            displayName = "SILVERTHORN ANTLERS",
            description = "Bright silver antlers from Roblox history.",
            rarity = "Common",
            assetId = 9255011,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(9255011),
        },
        {
            key = "ClassicRobloxFedora",
            displayName = "CLASSIC ROBLOX FEDORA",
            description = "The iconic original Roblox fedora.",
            rarity = "Uncommon",
            assetId = 1029025,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(1029025),
        },
        {
            key = "ClockworksHeadphones",
            displayName = "CLOCKWORK'S HEADPHONES",
            description = "One of Roblox's most recognizable limited accessories.",
            rarity = "Uncommon",
            assetId = 1235488,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(1235488),
        },
        {
            key = "ArcaneFedora",
            displayName = "ARCANE FEDORA",
            description = "A premium arcane fedora with serious presence.",
            rarity = "Rare",
            assetId = 73030805068953,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(73030805068953),
        },
        {
            key = "RedSparkleTimeFedora",
            displayName = "RED SPARKLE TIME FEDORA",
            description = "An iconic high-value Sparkle Time limited.",
            rarity = "Epic",
            assetId = 72082328,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(72082328),
        },
        {
            key = "IceValkyrie",
            displayName = "ICE VALKYRIE",
            description = "Frozen Valkyrie wings built for legendary drops.",
            rarity = "Legendary",
            assetId = 4390891467,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(4390891467),
        },
        {
            key = "DominusFrigidus",
            displayName = "DOMINUS FRIGIDUS",
            description = "A mythic frozen Dominus from the Roblox catalog.",
            rarity = "Mythic",
            assetId = 48545806,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(48545806),
        },
        {
            key = "DominusInfernus",
            displayName = "DOMINUS INFERNUS",
            description = "Premium exclusive. The legendary fire Dominus.",
            rarity = "Exclusive",
            premiumExclusive = true,
            assetId = 31101391,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(31101391),
        },
        {
            key = "MidnightBlueSparkleTime",
            displayName = "MIDNIGHT BLUE SPARKLE TIME",
            description = "Premium exclusive. A top-tier Sparkle Time Fedora.",
            rarity = "Exclusive",
            premiumExclusive = true,
            assetId = 119916949,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(119916949),
        },
        {
            key = "DominusAstra",
            displayName = "DOMINUS ASTRA",
            description = "The only one that will ever drop.",
            rarity = "OneOfOne",
            premiumExclusive = true,
            oneOfOne = true,
            assetId = 162067148,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(162067148),
        },
    },
    SpinnerSkins = {
        {
            key = "InfernoCore",
            displayName = "INFERNO CORE",
            description = "Rebuilds the spinner in hot ember red and molten gold.",
            rarity = "Common",
            icon = "rbxassetid://102819329828855",
            colors = {Color3.fromRGB(255, 66, 35), (Color3.fromRGB(255, 194, 54))},
            skin = {
                spinnerColor = Color3.fromRGB(255, 225, 210),
                wheelColor = Color3.fromRGB(115, 48, 36),
                optionsColor = Color3.fromRGB(92, 45, 38),
                accentColor = Color3.fromRGB(255, 199, 46),
                strokeColor = Color3.fromRGB(76, 20, 13),
            },
        },
        {
            key = "BubblegumDrive",
            displayName = "BUBBLEGUM DRIVE",
            description = "A candy-bright pink and cyan spinner skin.",
            rarity = "Common",
            icon = "rbxassetid://97392772497852",
            colors = {Color3.fromRGB(255, 92, 198), (Color3.fromRGB(72, 205, 255))},
            skin = {
                spinnerColor = Color3.fromRGB(255, 222, 242),
                wheelColor = Color3.fromRGB(91, 185, 221),
                optionsColor = Color3.fromRGB(205, 76, 154),
                accentColor = Color3.fromRGB(90, 238, 255),
                strokeColor = Color3.fromRGB(93, 32, 95),
            },
        },
        {
            key = "ToxicReactor",
            displayName = "TOXIC REACTOR",
            description = "Neon hazard green powers every reel.",
            rarity = "Common",
            icon = "rbxassetid://140168737861560",
            colors = {Color3.fromRGB(37, 255, 72), (Color3.fromRGB(190, 255, 37))},
            skin = {
                spinnerColor = Color3.fromRGB(211, 255, 203),
                wheelColor = Color3.fromRGB(44, 103, 48),
                optionsColor = Color3.fromRGB(38, 70, 39),
                accentColor = Color3.fromRGB(164, 255, 45),
                strokeColor = Color3.fromRGB(9, 51, 15),
            },
        },
        {
            key = "FrostCircuit",
            displayName = "FROST CIRCUIT",
            description = "Frosted glass panels with an icy electric accent.",
            rarity = "Uncommon",
            icon = "rbxassetid://124216845986745",
            colors = {Color3.fromRGB(224, 254, 255), (Color3.fromRGB(52, 186, 255))},
            skin = {
                spinnerColor = Color3.fromRGB(225, 249, 255),
                wheelColor = Color3.fromRGB(122, 188, 214),
                optionsColor = Color3.fromRGB(77, 142, 177),
                accentColor = Color3.fromRGB(218, 255, 255),
                strokeColor = Color3.fromRGB(24, 78, 108),
            },
        },
        {
            key = "VioletVelocity",
            displayName = "VIOLET VELOCITY",
            description = "Electric violet panels pulse around the reels.",
            rarity = "Uncommon",
            icon = "rbxassetid://107810393503526",
            colors = {Color3.fromRGB(117, 48, 255), (Color3.fromRGB(255, 77, 235))},
            skin = {
                spinnerColor = Color3.fromRGB(236, 216, 255),
                wheelColor = Color3.fromRGB(105, 65, 156),
                optionsColor = Color3.fromRGB(76, 43, 115),
                accentColor = Color3.fromRGB(239, 88, 255),
                strokeColor = Color3.fromRGB(37, 15, 70),
            },
        },
        {
            key = "SolarEngine",
            displayName = "SOLAR ENGINE",
            description = "A blazing orange engine with a sunlit finish.",
            rarity = "Rare",
            icon = "rbxassetid://81748517935330",
            colors = {Color3.fromRGB(255, 239, 78), (Color3.fromRGB(255, 91, 21))},
            skin = {
                spinnerColor = Color3.fromRGB(255, 237, 183),
                wheelColor = Color3.fromRGB(212, 125, 39),
                optionsColor = Color3.fromRGB(151, 73, 27),
                accentColor = Color3.fromRGB(255, 237, 61),
                strokeColor = Color3.fromRGB(104, 43, 9),
            },
        },
        {
            key = "StormCore",
            displayName = "STORM CORE",
            description = "White-hot lightning cuts through deep storm blue.",
            rarity = "Epic",
            icon = "rbxassetid://126227757528568",
            colors = {Color3.fromRGB(255, 255, 255), (Color3.fromRGB(33, 111, 255))},
            skin = {
                spinnerColor = Color3.fromRGB(220, 234, 255),
                wheelColor = Color3.fromRGB(47, 89, 167),
                optionsColor = Color3.fromRGB(31, 57, 116),
                accentColor = Color3.fromRGB(243, 252, 255),
                strokeColor = Color3.fromRGB(13, 33, 82),
            },
        },
        {
            key = "VoidMachina",
            displayName = "VOID MACHINA",
            description = "A legendary machine assembled from violet darkness.",
            rarity = "Legendary",
            icon = "rbxassetid://75119300819409",
            colors = {Color3.fromRGB(18, 8, 38), (Color3.fromRGB(166, 47, 255))},
            skin = {
                spinnerColor = Color3.fromRGB(72, 52, 94),
                wheelColor = Color3.fromRGB(39, 25, 58),
                optionsColor = Color3.fromRGB(25, 16, 39),
                accentColor = Color3.fromRGB(196, 94, 255),
                strokeColor = Color3.fromRGB(9, 4, 18),
            },
        },
        {
            key = "PrismOverdrive",
            displayName = "PRISM OVERDRIVE",
            description = "A mythic full-spectrum skin for every spinner panel.",
            rarity = "Mythic",
            icon = "rbxassetid://111098382409241",
            colors = {
                Color3.fromRGB(255, 55, 69),
                Color3.fromRGB(255, 229, 55),
                Color3.fromRGB(49, 255, 108),
                Color3.fromRGB(50, 160, 255),
                (Color3.fromRGB(211, 65, 255)),
            },
            skin = {
                spinnerColor = Color3.fromRGB(242, 230, 255),
                wheelColor = Color3.fromRGB(86, 85, 151),
                optionsColor = Color3.fromRGB(63, 48, 108),
                accentColor = Color3.fromRGB(255, 232, 64),
                strokeColor = Color3.fromRGB(30, 18, 60),
            },
        },
        {
            key = "DragonForge",
            displayName = "DRAGON FORGE",
            description = "Premium exclusive. Forged in dragon flame and black steel.",
            rarity = "Exclusive",
            premiumExclusive = true,
            icon = "rbxassetid://88134018256507",
            colors = {
                Color3.fromRGB(255, 45, 15),
                Color3.fromRGB(255, 210, 36),
                (Color3.fromRGB(64, 0, 0)),
            },
            skin = {
                spinnerColor = Color3.fromRGB(255, 205, 178),
                wheelColor = Color3.fromRGB(105, 30, 20),
                optionsColor = Color3.fromRGB(57, 15, 15),
                accentColor = Color3.fromRGB(255, 198, 42),
                strokeColor = Color3.fromRGB(28, 4, 4),
            },
        },
        {
            key = "AuroraDrive",
            displayName = "AURORA DRIVE",
            description = "Premium exclusive. Northern lights flow through the interface.",
            rarity = "Exclusive",
            premiumExclusive = true,
            icon = "rbxassetid://94481051967049",
            colors = {
                Color3.fromRGB(48, 255, 195),
                Color3.fromRGB(91, 120, 255),
                (Color3.fromRGB(255, 91, 226)),
            },
            skin = {
                spinnerColor = Color3.fromRGB(218, 255, 244),
                wheelColor = Color3.fromRGB(67, 127, 147),
                optionsColor = Color3.fromRGB(50, 77, 118),
                accentColor = Color3.fromRGB(102, 255, 222),
                strokeColor = Color3.fromRGB(19, 47, 72),
            },
        },
        {
            key = "SingularityOne",
            displayName = "SINGULARITY ONE",
            description = "The one-of-one spinner skin: white-gold light over a black singularity.",
            rarity = "OneOfOne",
            premiumExclusive = true,
            oneOfOne = true,
            icon = "rbxassetid://73026343943214",
            colors = {
                Color3.fromRGB(255, 255, 255),
                Color3.fromRGB(255, 214, 55),
                (Color3.fromRGB(12, 12, 18)),
            },
            skin = {
                spinnerColor = Color3.fromRGB(244, 241, 224),
                wheelColor = Color3.fromRGB(26, 25, 31),
                optionsColor = Color3.fromRGB(13, 13, 18),
                accentColor = Color3.fromRGB(255, 218, 77),
                strokeColor = Color3.fromRGB(0, 0, 0),
            },
        },
    },
    Auras = {
        {
            key = "ScarletSparks",
            displayName = "SCARLET SPARKS",
            description = "Clean red sparks rise around your character.",
            rarity = "Common",
            assetId = 13820452638,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(13820452638),
            colors = {Color3.fromRGB(255, 44, 44), (Color3.fromRGB(255, 145, 70))},
            aura = {preset = "Sparks", intensity = 1},
        },
        {
            key = "ArcticShimmer",
            displayName = "ARCTIC SHIMMER",
            description = "Cold blue motes drift in an icy shimmer.",
            rarity = "Common",
            assetId = 12261917350,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(12261917350),
            colors = {Color3.fromRGB(105, 225, 255), (Color3.fromRGB(225, 252, 255))},
            aura = {preset = "Sparks", intensity = 1},
        },
        {
            key = "SolarMotes",
            displayName = "SOLAR MOTES",
            description = "Warm golden particles orbit in a soft glow.",
            rarity = "Common",
            assetId = 128076867561836,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(128076867561836),
            colors = {Color3.fromRGB(255, 221, 72), (Color3.fromRGB(255, 132, 35))},
            aura = {preset = "Sparks", intensity = 1.05},
        },
        {
            key = "GhastlyWisps",
            displayName = "GHASTLY WISPS",
            description = "Green spectral wisps curl around every step.",
            rarity = "Uncommon",
            assetId = 6909069901,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(6909069901),
            colors = {Color3.fromRGB(96, 255, 137), (Color3.fromRGB(25, 112, 79))},
            aura = {preset = "Wisps", intensity = 1.2},
        },
        {
            key = "BladeHalo",
            displayName = "BLADE HALO",
            description = "Silver sparks slice through a crimson halo.",
            rarity = "Uncommon",
            assetId = 14202561604,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(14202561604),
            colors = {Color3.fromRGB(242, 247, 255), (Color3.fromRGB(255, 49, 76))},
            aura = {preset = "Halo", intensity = 1.25},
        },
        {
            key = "QuadriSkullStorm",
            displayName = "QUADRI-SKULL STORM",
            description = "A rare violet skull-storm energy field.",
            rarity = "Rare",
            assetId = 14524326503,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(14524326503),
            colors = {Color3.fromRGB(183, 65, 255), (Color3.fromRGB(63, 14, 112))},
            aura = {preset = "Storm", intensity = 1.5},
        },
        {
            key = "DarkEggNova",
            displayName = "DARK EGG NOVA",
            description = "An epic black-red nova pulses from your core.",
            rarity = "Epic",
            assetId = 129928402940197,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(129928402940197),
            colors = {Color3.fromRGB(255, 54, 87), (Color3.fromRGB(35, 3, 20))},
            aura = {preset = "Nova", intensity = 1.8},
        },
        {
            key = "SolarSystem",
            displayName = "SOLAR SYSTEM",
            description = "Legendary starlight and planetary rings surround you.",
            rarity = "Legendary",
            assetId = 15381472359,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(15381472359),
            colors = {
                Color3.fromRGB(255, 232, 84),
                Color3.fromRGB(62, 152, 255),
                (Color3.fromRGB(255, 91, 54)),
            },
            aura = {preset = "Orbit", intensity = 2.1},
        },
        {
            key = "KaelodromeRadiance",
            displayName = "KAELODROME RADIANCE",
            description = "Mythic cyan-magenta energy tears through the air.",
            rarity = "Mythic",
            assetId = 18612623671,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(18612623671),
            colors = {
                Color3.fromRGB(45, 255, 241),
                Color3.fromRGB(255, 65, 223),
                (Color3.fromRGB(102, 68, 255)),
            },
            aura = {preset = "Radiance", intensity = 2.5},
        },
        {
            key = "InterstellarTide",
            displayName = "INTERSTELLAR TIDE",
            description = "Premium exclusive. A layered galaxy aura with orbiting starlight.",
            rarity = "Exclusive",
            premiumExclusive = true,
            assetId = 113177392561115,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(113177392561115),
            colors = {
                Color3.fromRGB(83, 119, 255),
                Color3.fromRGB(224, 74, 255),
                (Color3.fromRGB(255, 244, 185)),
            },
            aura = {preset = "Galaxy", intensity = 3},
        },
        {
            key = "ReanimatedVoid",
            displayName = "REANIMATED VOID",
            description = "Premium exclusive. Void flame, ghost light, and a dark core.",
            rarity = "Exclusive",
            premiumExclusive = true,
            assetId = 114942541459994,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(114942541459994),
            colors = {
                Color3.fromRGB(106, 255, 151),
                Color3.fromRGB(115, 40, 255),
                (Color3.fromRGB(8, 5, 20)),
            },
            aura = {preset = "Void", intensity = 3.2},
        },
        {
            key = "KnowledgeAscendant",
            displayName = "KNOWLEDGE ASCENDANT",
            description = "The one-of-one aura: white-gold ascension wrapped in prismatic energy.",
            rarity = "OneOfOne",
            premiumExclusive = true,
            oneOfOne = true,
            assetId = 100061531345826,
            icon = ("rbxthumb://type=Asset&id=%d&w=420&h=420"):format(100061531345826),
            colors = {
                Color3.fromRGB(255, 255, 255),
                Color3.fromRGB(255, 214, 55),
                Color3.fromRGB(72, 219, 255),
                (Color3.fromRGB(221, 74, 255)),
            },
            aura = {preset = "Ascendant", intensity = 4},
        },
    },
}
local v4 = {
    Common = 18.333333333333332,
    Uncommon = 12.5,
    Rare = 12,
    Epic = 5,
    Legendary = 2.5,
    Mythic = 0.5,
}
local v5 = {
    Common = 10,
    Uncommon = 12,
    Rare = 18,
    Epic = 12,
    Legendary = 8,
    Mythic = 3,
}
local v6 = {3, 1.75, 0.25}
local v7 = {5, 10, 25}
local u1077 = {}
for k, v in pairs(u1021.Rewards) do
    v1 = {}
    v2 = 0
    for i, i2 in ipairs(v) do
        i2.category = k
        i2.order = i
        v3 = u1021.CosmeticLuckByRarity[i2.rarity] or 0
        i2.luckBonusPercent = v3
        i2.description = u1021.FormatLuckBonusPercent(i2.luckBonusPercent)
        if not i2.premiumExclusive then
            v3 = v4[i2.rarity] or 0
            i2.creditWeight = v3
            v3 = v5[i2.rarity] or 0
            i2.robuxWeight = v3
        else
            v2 = v2 + 1
            luckBonusPercent = v7[v2] or i2.luckBonusPercent
            i2.luckBonusPercent = luckBonusPercent
            i2.description = u1021.FormatLuckBonusPercent(i2.luckBonusPercent)
            v3 = v6[v2] or 0
            i2.robuxWeight = v3
            i2.creditWeight = 0
        end
        if k ~= "SpinnerSkins" then
            if k == "Auras" and not i2.icon then
                i2.icon = u1021.CurrencyIcons.Pops
            end
        elseif not i2.icon or k == "Auras" and not i2.icon then
            i2.icon = u1021.CurrencyIcons.Pops
        end
        v1[i2.key] = i2
    end
    u1077[k] = v1
end

function u1021.GetCrateKey(a1, a2) -- Line: 243 -- upvalues: u1021 (val)
    local v1 = (tostring(a1 or "")) .. tostring(a2 or "")
    return u1021.Crates[v1] and v1 or nil
end

function u1021.GetCrate(a1) -- Line: 248 -- upvalues: u1021 (val)
    return u1021.Crates[tostring(a1 or "")]
end

function u1021.GetReward(a1, a2) -- Line: 252 -- upvalues: u1077 (val)
    local v1 = u1077[tostring(a1 or "")]
    return v1 and v1[tostring(a2 or "")] or nil
end

function u1021.GetCosmeticLuckBonusPercent(a1, a2) -- Line: 257 -- upvalues: u1021 (val)
    local v1 = u1021.GetReward(a1, a2)
    return v1 and math.max(0, (tonumber(v1.luckBonusPercent)) or 0) or 0
end

function u1021.GetCosmeticLuckText(a1, a2) -- Line: 262 -- upvalues: u1021 (val)
    return u1021.FormatLuckBonusPercent(u1021.GetCosmeticLuckBonusPercent(a1, a2))
end

function u1021.GetSpinnerSkinLuckBonusPercent(a1) -- Line: 266 -- upvalues: u1021 (val)
    return u1021.GetCosmeticLuckBonusPercent("SpinnerSkins", a1)
end

function u1021.GetSpinnerSkinLuckText(a1) -- Line: 270 -- upvalues: u1021 (val)
    return u1021.GetCosmeticLuckText("SpinnerSkins", a1)
end

function u1021.GetRewardsForCrate(a1) -- Line: 274 -- upvalues: u1021 (val)
    local robuxWeight
    local v1 = u1021.GetCrate(a1)
    if not v1 then
        return {}
    end
    local v2 = {}
    local v3 = ipairs
    local v4 = u1021.Rewards[v1.category] or {}
    for i, v in v3(v4) do
        robuxWeight = not (v1.currency ~= "Robux") and v.robuxWeight or v.creditWeight
        if robuxWeight and robuxWeight > 0 then
            table.insert(v2, v)
        end
    end
    return v2
end

function u1021.GetWeight(a1, a2) -- Line: 289 -- upvalues: u1021 (val)
    local v1 = u1021.GetCrate(a1)
    if v1 and a2 then
        if v1.currency ~= "Robux" then
            return a2.creditWeight or 0
        end
        local robuxWeight = a2.robuxWeight
        if not robuxWeight then
            return 0
        end
        return robuxWeight
    end
    return 0
end

local u936 = {Epic = true, Legendary = true, Mythic = true}
local u937 = {Common = true, Uncommon = true, Rare = true}

function u1021.GetAdjustedWeights(a1, a2) -- Line: 309 -- upvalues: u1021 (val), u936 (val), u937 (val)
    local v1 = u1021.GetCrate(a1)
    local v2 = u1021.GetRewardsForCrate(a1)
    local v3 = {}
    for i, v in ipairs(v2) do
        v3[v.key] = (math.max(0, (tonumber((u1021.GetWeight(a1, v)))) or 0))
    end
    if v1 and v1.currency == "Credits" then
        local v4
        v1 = math.max(0, (tonumber(a2)) or 0) / 100
        if v1 <= 0 then
            return v3
        end
        local v5 = 0
        local v6 = 0
        for i2, i3 in ipairs(v2) do
            v4 = v3[i3.key] or 0
            if u936[i3.rarity] then
                v5 = v5 + v4 * v1
            elseif u937[i3.rarity] then
                v6 = v6 + v4
            end
        end
        if not (v5 <= 0) and not (v6 <= 0) then
            local v7 = math.min(v5, v6 * 0.95)
            local v8 = v7 / v5
            for i4, j in ipairs(v2) do
                v5 = v3[j.key] or 0
                if u936[j.rarity] then
                    v3[j.key] = v5 + v5 * v1 * v8
                elseif u937[j.rarity] then
                    v3[j.key] = (math.max(0, v5 - v7 * (v5 / v6)))
                end
            end
            return v3
        end
        return v3
    end
    return v3
end

function u1021.GetDisplayChance(a1, a2, a3) -- Line: 352 -- upvalues: u1021 (val)
    local v1 = 0
    local v2 = u1021.GetAdjustedWeights(a1, a3)
    for i, v in ipairs(u1021.GetRewardsForCrate(a1)) do
        v1 = v1 + (v2[v.key] or 0)
    end
    if v1 <= 0 then
        return 0
    end
    return (v2[a2 and a2.key] or 0) / v1
end

function u1021.GetProductMapping() -- Line: 364 -- upvalues: u1021 (val)
    local productIds, v1, v2
    local v3 = {}
    for k, v in pairs(u1021.Crates) do
        if v.currency == "Robux" then
            v2 = pairs
            productIds = v.productIds or {}
            for k2, i in v2(productIds) do
                v1 = math.floor((tonumber(i)) or 0)
                if v1 > 0 then
                    v3[v1] = {
                        crateKey = k,
                        count = math.clamp(math.floor((tonumber(k2)) or 1), 1, 4),
                    }
                end
            end
        end
    end
    return v3
end

return u1021