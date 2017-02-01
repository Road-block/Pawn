-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2010 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Wowhead scales
------------------------------------------------------------

local ScaleProviderName = "Wowhead"

function PawnWowheadScaleProvider_AddScales()



------------------------------------------------------------
-- Warrior
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"WarriorArms",
	PawnWowheadScale_WarriorArms,
	"c79c6e",
	{
		["Strength"] = 100, ["HitRating"] = 90, ["ExpertiseRating"] = 85, ["CritRating"] = 80, ["Agility"] = 65, ["ArmorPenetration"] = 65, ["HasteRating"] = 50, ["Ap"] = 45, ["Armor"] = 1, ["Stamina"] = .1, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"WarriorFury",
	PawnWowheadScale_WarriorFury,
	"c79c6e",
	{
		["ExpertiseRating"] = 100, ["Strength"] = 82, ["CritRating"] = 66, ["Agility"] = 53, ["ArmorPenetration"] = 52, ["HitRating"] = 48, ["HasteRating"] = 36, ["Ap"] = 31, ["Armor"] = 5, ["Stamina"] = .1, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"WarriorTank",
	PawnWowheadScale_WarriorTank,
	"c79c6e",
	{
		["Stamina"] = 100, ["DodgeRating"] = 90, ["DefenseRating"] = 86, ["BlockValue"] = 81, ["Agility"] = 67, ["ParryRating"] = 67, ["BlockRating"] = 48, ["Strength"] = 48, ["ExpertiseRating"] = 19, ["HitRating"] = 10, ["ArmorPenetration"] = 10, ["CritRating"] = 7, ["Armor"] = 6, ["HasteRating"] = 1, ["Ap"] = 1, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Paladin
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"PaladinHoly",
	PawnWowheadScale_PaladinHoly,
	"f58cba",
	{
		["Intellect"] = 100, ["Mp5"] = 88, ["SpellPower"] = 58, ["CritRating"] = 46, ["HasteRating"] = 35, ["Stamina"] = .1, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"PaladinTank",
	PawnWowheadScale_PaladinTank,
	"f58cba",
	{
		["Stamina"] = 100, ["Agility"] = 60, ["ExpertiseRating"] = 59, ["DodgeRating"] = 55, ["DefenseRating"] = 45, ["ParryRating"] = 30, ["Strength"] = 16, ["Armor"] = 8, ["BlockRating"] = 7, ["BlockValue"] = 6, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"PaladinRetribution",
	PawnWowheadScale_PaladinRetribution,
	"f58cba",
	{
		["MeleeDps"] = 470, ["HitRating"] = 100, ["Strength"] = 80, ["ExpertiseRating"] = 66, ["CritRating"] = 40, ["Ap"] = 34, ["Agility"] = 32, ["HasteRating"] = 30, ["ArmorPenetration"] = 22, ["SpellPower"] = 9, ["Stamina"] = .1, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Hunter
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"HunterBeastMastery",
	PawnWowheadScale_HunterBeastMastery,
	"abd473",
	{
		["RangedDps"] = 213, ["HitRating"] = 100, ["Agility"] = 58, ["CritRating"] = 40, ["Intellect"] = 37, ["Ap"] = 30, ["ArmorPenetration"] = 28, ["HasteRating"] = 21, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsShield"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"HunterMarksman",
	PawnWowheadScale_HunterMarksman,
	"abd473",
	{
		["RangedDps"] = 379, ["HitRating"] = 100, ["Agility"] = 74, ["CritRating"] = 57, ["ArmorPenetration"] = 40, ["Intellect"] = 39, ["Ap"] = 32, ["HasteRating"] = 24, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsShield"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"HunterSurvival",
	PawnWowheadScale_HunterSurvival,
	"abd473",
	{
		["RangedDps"] = 181, ["HitRating"] = 100, ["Agility"] = 76, ["CritRating"] = 42, ["Intellect"] = 35, ["HasteRating"] = 31, ["Ap"] = 29, ["ArmorPenetration"] = 26, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsShield"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Rogue
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"RogueAssassination",
	PawnWowheadScale_RogueAssassination,
	"fff569",
	{
		["MeleeDps"] = 170, ["Agility"] = 100, ["ExpertiseRating"] = 87, ["HitRating"] = 83, ["CritRating"] = 81, ["Ap"] = 65, ["ArmorPenetration"] = 65, ["HasteRating"] = 64, ["Strength"] = 55, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsShield"] = -1000000, ["IsPolearm"] = -1000000, ["IsStaff"] = -1000000, ["Is2HAxe"] = -1000000, ["Is2HMace"] = -1000000, ["Is2HSword"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"RogueCombat",
	PawnWowheadScale_RogueCombat,
	"fff569",
	{
		["MeleeDps"] = 220, ["ArmorPenetration"] = 100, ["Agility"] = 100, ["ExpertiseRating"] = 82, ["HitRating"] = 80, ["CritRating"] = 75, ["HasteRating"] = 73, ["Strength"] = 55, ["Ap"] = 50, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsShield"] = -1000000, ["IsPolearm"] = -1000000, ["IsStaff"] = -1000000, ["Is2HAxe"] = -1000000, ["Is2HMace"] = -1000000, ["Is2HSword"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"RogueSubtlety",
	PawnWowheadScale_RogueSubtlety,
	"fff569",
	{
		["MeleeDps"] = 228, ["ExpertiseRating"] = 100, ["Agility"] = 100, ["HitRating"] = 80, ["ArmorPenetration"] = 75, ["CritRating"] = 75, ["HasteRating"] = 75, ["Strength"] = 55, ["Ap"] = 50, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsShield"] = -1000000, ["IsPolearm"] = -1000000, ["IsStaff"] = -1000000, ["Is2HAxe"] = -1000000, ["Is2HMace"] = -1000000, ["Is2HSword"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Priest
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"PriestDiscipline",
	PawnWowheadScale_PriestDiscipline,
	"ffffff",
	{
		["SpellPower"] = 100, ["Mp5"] = 67, ["Intellect"] = 65, ["HasteRating"] = 59, ["CritRating"] = 48, ["Spirit"] = 22, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsPolearm"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["Is2HMace"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"PriestHoly",
	PawnWowheadScale_PriestHoly,
	"ffffff",
	{
		["Mp5"] = 100, ["Intellect"] = 69, ["SpellPower"] = 60, ["Spirit"] = 52, ["CritRating"] = 38, ["HasteRating"] = 31, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsPolearm"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["Is2HMace"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"PriestShadow",
	PawnWowheadScale_PriestShadow,
	"ffffff",
	{
		["HitRating"] = 100, ["ShadowSpellDamage"] = 76, ["SpellPower"] = 76, ["CritRating"] = 54, ["HasteRating"] = 50, ["Spirit"] = 16, ["Intellect"] = 16, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsPolearm"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["Is2HMace"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- DK
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"DeathKnightBloodDps",
	PawnWowheadScale_DeathKnightBloodDps,
	"ff4d6b",
	{
		["MeleeDps"] = 360, ["ArmorPenetration"] = 100, ["Strength"] = 99, ["HitRating"] = 91, ["ExpertiseRating"] = 90, ["CritRating"] = 57, ["HasteRating"] = 55, ["Ap"] = 36, ["Armor"] = 1, ["Stamina"] = .1, ["IsShield"] = -1000000, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"DeathKnightBloodTank",
	PawnWowheadScale_DeathKnightBloodTank,
	"ff4d6b",
	{
		["MeleeDps"] = 500, ["Stamina"] = 100, ["DefenseRating"] = 90, ["Agility"] = 69, ["DodgeRating"] = 50, ["ParryRating"] = 43, ["ExpertiseRating"] = 38, ["Strength"] = 31, ["ArmorPenetration"] = 26, ["CritRating"] = 22, ["Armor"] = 18, ["HitRating"] = 16, ["HasteRating"] = 16, ["BonusArmor"] = 11, ["Ap"] = 8, ["IsShield"] = -1000000, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"DeathKnightFrostDps",
	PawnWowheadScale_DeathKnightFrostDps,
	"ff4d6b",
	{
		["MeleeDps"] = 337, ["HitRating"] = 100, ["Strength"] = 97, ["ExpertiseRating"] = 81, ["ArmorPenetration"] = 61, ["CritRating"] = 45, ["Ap"] = 35, ["HasteRating"] = 28, ["Armor"] = 1, ["Stamina"] = .1, ["IsShield"] = -1000000, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"DeathKnightFrostTank",
	PawnWowheadScale_DeathKnightFrostTank,
	"ff4d6b",
	{
		["MeleeDps"] = 419, ["ParryRating"] = 100, ["HitRating"] = 97, ["Strength"] = 96, ["DefenseRating"] = 85, ["ExpertiseRating"] = 69, ["DodgeRating"] = 61, ["Agility"] = 61, ["Stamina"] = 61, ["CritRating"] = 49, ["Ap"] = 41, ["ArmorPenetration"] = 31, ["Armor"] = 5, ["IsShield"] = -1000000, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"DeathKnightUnholyDps",
	PawnWowheadScale_DeathKnightUnholyDps,
	"ff4d6b",
	{
		["MeleeDps"] = 209, ["Strength"] = 100, ["HitRating"] = 66, ["ExpertiseRating"] = 51, ["HasteRating"] = 48, ["CritRating"] = 45, ["Ap"] = 34, ["ArmorPenetration"] = 32, ["Armor"] = 1, ["Stamina"] = .1, ["IsShield"] = -1000000, ["IsDagger"] = -1000000, ["IsFist"] = -1000000, ["IsStaff"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Shaman
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"ShamanElemental",
	PawnWowheadScale_ShamanElemental,
	"6e95ff",
	{
		["HitRating"] = 100, ["SpellPower"] = 60, ["HasteRating"] = 56, ["CritRating"] = 40, ["Intellect"] = 11, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsPolearm"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"ShamanEnhancement",
	PawnWowheadScale_ShamanEnhancement,
	"6e95ff",
	{
		["MeleeDps"] = 135, ["HitRating"] = 100, ["ExpertiseRating"] = 84, ["Agility"] = 55, ["Intellect"] = 55, ["CritRating"] = 55, ["HasteRating"] = 42, ["Strength"] = 35, ["Ap"] = 32, ["SpellPower"] = 29, ["ArmorPenetration"] = 26, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsPolearm"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"ShamanRestoration",
	PawnWowheadScale_ShamanRestoration,
	"6e95ff",
	{
		["Mp5"] = 100, ["Intellect"] = 85, ["SpellPower"] = 77, ["CritRating"] = 62, ["HasteRating"] = 35, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsPolearm"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Mage
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"MageArcane",
	PawnWowheadScale_MageArcane,
	"69ccf0",
	{
		["HitRating"] = 100, ["HasteRating"] = 54, ["ArcaneSpellDamage"] = 49, ["SpellPower"] = 49, ["CritRating"] = 37, ["Intellect"] = 34, ["FrostSpellDamage"] = 24, ["FireSpellDamage"] = 24, ["Spirit"] = 14, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsPolearm"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"MageFire",
	PawnWowheadScale_MageFire,
	"69ccf0",
	{
		["HitRating"] = 100, ["HasteRating"] = 53, ["FireSpellDamage"] = 46, ["SpellPower"] = 46, ["CritRating"] = 43, ["FrostSpellDamage"] = 23, ["ArcaneSpellDamage"] = 23, ["Intellect"] = 13, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsPolearm"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"MageFrost",
	PawnWowheadScale_MageFrost,
	"69ccf0",
	{
		["HitRating"] = 100, ["HasteRating"] = 42, ["FrostSpellDamage"] = 39, ["SpellPower"] = 39, ["ArcaneSpellDamage"] = 19, ["FireSpellDamage"] = 19, ["CritRating"] = 19, ["Intellect"] = 6, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsPolearm"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Warlock
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"WarlockAffliction",
	PawnWowheadScale_WarlockAffliction,
	"bca5ff",
	{
		["HitRating"] = 100, ["ShadowSpellDamage"] = 72, ["SpellPower"] = 72, ["HasteRating"] = 61, ["CritRating"] = 38, ["FireSpellDamage"] = 36, ["Spirit"] = 34, ["Intellect"] = 15, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsPolearm"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"WarlockDemonology",
	PawnWowheadScale_WarlockDemonology,
	"bca5ff",
	{
		["HitRating"] = 100, ["HasteRating"] = 50, ["FireSpellDamage"] = 45, ["ShadowSpellDamage"] = 45, ["SpellPower"] = 45, ["CritRating"] = 31, ["Spirit"] = 29, ["Intellect"] = 13, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsPolearm"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"WarlockDestruction",
	PawnWowheadScale_WarlockDestruction,
	"bca5ff",
	{
		["HitRating"] = 100, ["FireSpellDamage"] = 47, ["SpellPower"] = 47, ["HasteRating"] = 46, ["Spirit"] = 26, ["ShadowSpellDamage"] = 23, ["CritRating"] = 16, ["Intellect"] = 13, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsLeather"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsFist"] = -1000000, ["IsMace"] = -1000000, ["Is2HMace"] = -1000000, ["IsPolearm"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------
-- Druid
------------------------------------------------------------

PawnAddPluginScale(
	ScaleProviderName,
	"DruidBalance",
	PawnWowheadScale_DruidBalance,
	"ff7d0a",
	{
		["HitRating"] = 100, ["SpellPower"] = 66, ["HasteRating"] = 54, ["CritRating"] = 43, ["Spirit"] = 22, ["Intellect"] = 22, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"DruidFeralDps",
	PawnWowheadScale_DruidFeralDps,
	"ff7d0a",
	{
		["Agility"] = 100, ["ArmorPenetration"] = 90, ["Strength"] = 80, ["CritRating"] = 55, ["ExpertiseRating"] = 50, ["HitRating"] = 50, ["FeralAp"] = 40, ["Ap"] = 40, ["HasteRating"] = 35, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"DruidFeralTank",
	PawnWowheadScale_DruidFeralTank,
	"ff7d0a",
	{
		["Agility"] = 100, ["Stamina"] = 75, ["DodgeRating"] = 65, ["DefenseRating"] = 60, ["ExpertiseRating"] = 16, ["Strength"] = 10, ["Armor"] = 10, ["HitRating"] = 8, ["HasteRating"] = 5, ["Ap"] = 4, ["FeralAp"] = 4, ["CritRating"] = 3, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

PawnAddPluginScale(
	ScaleProviderName,
	"DruidRestoration",
	PawnWowheadScale_DruidRestoration,
	"ff7d0a",
	{
		["SpellPower"] = 100, ["Mp5"] = 73, ["HasteRating"] = 57, ["Intellect"] = 51, ["Spirit"] = 32, ["CritRating"] = 11, ["Stamina"] = .1, ["IsPlate"] = -1000000, ["IsMail"] = -1000000, ["IsShield"] = -1000000, ["IsAxe"] = -1000000, ["Is2HAxe"] = -1000000, ["IsSword"] = -1000000, ["Is2HSword"] = -1000000, ["IsBow"] = -1000000, ["IsCrossbow"] = -1000000, ["IsGun"] = -1000000, ["IsThrown"] = -1000000, ["IsWand"] = -1000000, ["MetaSocketEffect"] = 3600
	},
	1
)

------------------------------------------------------------

-- PawnWowheadScaleProviderOptions.LastAdded keeps track of the last time that we tried to automatically enable scales for this character.
if not PawnWowheadScaleProviderOptions then PawnWowheadScaleProviderOptions = { } end
if not PawnWowheadScaleProviderOptions.LastAdded then PawnWowheadScaleProviderOptions.LastAdded = 0 end

local _, Class = UnitClass("player")
if PawnWowheadScaleProviderOptions.LastAdded < 1 then
	-- Enable round one of scales based on the player's class.
	if Class == "WARRIOR" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "WarriorFury"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "WarriorTank"), true)
	elseif Class == "PALADIN" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "PaladinHoly"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "PaladinTank"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "PaladinRetribution"), true)
	elseif Class == "HUNTER" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "HunterBeastMastery"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "HunterMarksman"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "HunterSurvival"), true)
	elseif Class == "ROGUE" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "RogueAssassination"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "RogueCombat"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "RogueSubtlety"), true)
	elseif Class == "PRIEST" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "PriestDiscipline"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "PriestHoly"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "PriestShadow"), true)
	elseif Class == "DEATHKNIGHT" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DeathKnightBloodDps"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DeathKnightBloodTank"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DeathKnightFrostDps"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DeathKnightFrostTank"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DeathKnightUnholyDps"), true)
	elseif Class == "SHAMAN" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "ShamanElemental"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "ShamanEnhancement"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "ShamanRestoration"), true)
	elseif Class == "MAGE" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "MageArcane"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "MageFire"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "MageFrost"), true)
	elseif Class == "WARLOCK" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "WarlockAffliction"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "WarlockDemonology"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "WarlockDestruction"), true)
	elseif Class == "DRUID" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DruidBalance"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DruidFeralDps"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DruidFeralTank"), true)
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "DruidRestoration"), true)
	end
end

if PawnWowheadScaleProviderOptions.LastAdded < 2 then
	if Class == "WARRIOR" then
		PawnSetScaleVisible(PawnGetProviderScaleName(ScaleProviderName, "WarriorArms"), true)
	end
end

-- Don't reenable those scales again after the user has disabled them previously.
PawnWowheadScaleProviderOptions.LastAdded = 2

-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
PawnWowheadScaleProvider_AddScales = nil

end -- PawnWowheadScaleProvider_AddScales

------------------------------------------------------------

PawnAddPluginScaleProvider(ScaleProviderName, PawnWowheadScale_Provider, PawnWowheadScaleProvider_AddScales)
