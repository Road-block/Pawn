-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2010 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

-- 
-- English resources
------------------------------------------------------------


------------------------------------------------------------
-- "Constants"
------------------------------------------------------------

PawnQuestionTexture = "|TInterface\\AddOns\\Pawn\\Textures\\Question:0|t" -- Texture string that represents a (?).  Don't need to localize this.
PawnUINoScale = "(none)" -- The name that shows up in lists of scales if you have no scales

------------------------------------------------------------
-- Master table of stats
------------------------------------------------------------

-- The master list of all stats that Pawn supports.
-- First column is the friendly translated name of the stat.
-- Second column is the Pawn name of the stat; this can't be translated.
-- Third column is the description of the stat.
-- Fourth column is true if the stat can't be ignored.
-- Fifth column is an optional chunk of text instead of the "1 ___ is worth:" prompt.
-- If only a name is present, the row becomes an uneditable header in the UI and is otherwise ignored.
PawnStats =
{
	{"Base stats"},
	{"Strength", "Strength", "The primary stat, Strength."},
	{"Agility", "Agility", "The primary stat, Agility."},
	{"Stamina", "Stamina", "The primary stat, Stamina."},
	{"Intellect", "Intellect", "The primary stat, Intellect."},
	{"Spirit", "Spirit", "The primary stat, Spirit."},
	
	{"Sockets"},
	{"Red socket", "RedSocket", "An empty red socket.  Only counts for an item's base value.", true},
	{"Yellow socket", "YellowSocket", "An empty yellow socket.  Only counts for an item's base value.", true},
	{"Blue socket", "BlueSocket", "An empty blue socket.  Only counts for an item's base value.", true},
	{"Meta: stats", "MetaSocket", "An empty meta socket.  Only counts the stat bonus of a meta gem, not the additional effect.  The item's value will be the same whether or not the meta gem requirements are met.", true},
	{"Meta: effect", "MetaSocketEffect", "A meta socket, whether empty or full.  Only counts the additional effect of a meta gem, not its stat bonus.", true},
	
	{"Weapon stats"},
	{"DPS", "Dps", "Weapon damage per second.  (If you want to value DPS differently for different types of weapons, see the \"Special weapon stats\" section.)"},
	{"Speed", "Speed", "Weapon speed, in seconds per swing.  (If you prefer fast weapons, this number should be negative.  See also: \"speed baseline\" in the \"Special weapon stats\" section.)"},
	
	{"Hybrid ratings"},
	{"Hit rating", "HitRating", "Hit rating.  Affects melee attacks, ranged attacks, and spells."},
	{"Crit rating", "CritRating", "Critical strike rating.  Affects melee attacks, ranged attacks, and spells."},
	{"Haste rating", "HasteRating", "Haste rating.  Affects melee attacks, ranged attacks, and spells."},
	{"Mastery rating", "MasteryRating", VgerCore.Color.Salmon .. "New stat coming in Cataclysm.  " .. VgerCore.Color.Reset .. "Improves the unique bonus of the talent tree that you have the most points in."},
	
	{"Offensive physical stats"},
	{"Attack power", "Ap", "Attack power.  Does not include attack power that you will receive from Strength or Agility, or weapon DPS (for druids)."},
	{"Ranged AP", "Rap", "Ranged attack power."},
	{"Feral AP", "FeralAp", "Attack power that a weapon would grant a druid in feral forms.  If you assign a value to this stat, you should not also assign a value to weapon DPS."},
	{"Expertise rating", "ExpertiseRating", "Expertise rating."},
	{"Armor pen.", "ArmorPenetration", "Armor penetration rating causes your attacks to ignore some of your opponent's armor.\n\n" .. VgerCore.Color.Salmon .. "Cataclysm:  " .. VgerCore.Color.Reset .. "Items with ArPen will instead have other offensive stats."},
	
	{"Spell stats"},
	{"Spell power", "SpellPower", "Spell power, which affects both spell damage and healing."},
	{"Mana per 5", "Mp5", "Mana regeneration per 5 seconds.\n\n" .. VgerCore.Color.Salmon .. "Cataclysm:  " .. VgerCore.Color.Reset .. "Items with 1 MP5 will instead have 2 Spirit."},
	{"Spell penetration", "SpellPenetration", "Spell penetration causes your spells to ignore some of your opponent's resistances."},
	
	{"Defense stats"},
	{"Armor", "Armor", "Armor, regardless of item type.  Classes with abilties that give armor bonuses should assign a value to base and bonus armor instead."},
	{"Armor: base", "BaseArmor", "Base armor value on cloth, leather, mail, and plate.  Can be multiplied by abilities such as Thick Hide and Frost Presence.\n\nTank items with bonus armor in green text will have all of their armor count as base armor, as mods cannot determine how much of the armor is bonus armor."},
	{"Armor: bonus", "BonusArmor", "Bonus armor value on weapons, trinkets, and rings.  Not affected by abilities and talents that modify armor."},
	{"Block value", "BlockValue", "Block value increases the amount of damage absorbed with each successful shield block.\n\n" .. VgerCore.Color.Salmon .. "Cataclysm:  " .. VgerCore.Color.Reset .. "Items with block value will instead have different tanking stats."},
	{"Block rating", "BlockRating", "Block rating increases your chances of blocking with a shield."},
	{"Defense rating", "DefenseRating", "Defense rating.\n\n" .. VgerCore.Color.Salmon .. "Cataclysm:  " .. VgerCore.Color.Reset .. "Items with defense will instead have different tanking stats."},
	{"Dodge rating", "DodgeRating", "Dodge rating."},
	{"Parry rating", "ParryRating", "Parry rating."},
	{"Resilience rating", "ResilienceRating", "Resilience rating."},
	
	{"Very rare stats"},
	{"Fire spell power", "FireSpellDamage", "Fire-only spell power.  This stat does not appear on items that give spell power to all schools."},
	{"Shadow spell power", "ShadowSpellDamage", "Shadow-only spell power.  This stat does not appear on items that give spell power to all schools."},
	{"Nature spell power", "NatureSpellDamage", "Nature-only spell power.  This stat does not appear on items that give spell power to all schools."},
	{"Arcane spell power", "ArcaneSpellDamage", "Arcane-only spell power.  This stat does not appear on items that give spell power to all schools."},
	{"Frost spell power", "FrostSpellDamage", "Frost-only spell power.  This stat does not appear on items that give spell power to all schools."},
	{"Holy spell power", "HolySpellDamage", "Holy-only spell power.  This stat is quite rare, and does not appear on items that give spell power to all schools."},
	{"All resistances", "AllResist", "All elemental resistances."},
	{"Fire resistance", "FireResist", "Fire resistance.  This stat does not appear on items that give all elemental resistances."},
	{"Shadow resistance", "ShadowResist", "Shadow resistance.  This stat does not appear on items that give all elemental resistances."},
	{"Nature resistance", "NatureResist", "Nature resistance.  This stat does not appear on items that give all elemental resistances."},
	{"Arcane resistance", "ArcaneResist", "Arcane resistance.  This stat does not appear on items that give all elemental resistances."},
	{"Frost resistance", "FrostResist", "Frost resistance.  This stat does not appear on items that give all elemental resistances."},
	{"Health per 5", "Hp5", "Health regeneration per 5 seconds.  Generally only appears on enchantments."},
	{"Health", "Health", "Raw health.  Does not include health from Stamina.  This generally appears only on enchantments."},
	{"Mana", "Mana", "Raw mana.  Does not include mana from Intellect.  This generally appears only on enchantments."},
	
	{"Weapon types"},
	{"Axe: 1H", "IsAxe", "Points to be assigned if the item is a one-handed axe."},
	{"Axe: 2H", "Is2HAxe", "Points to be assigned if the item is a two-handed axe."},
	{"Bow", "IsBow", "Points to be assigned if the item is a bow, or a stack of arrows."}, -- *** Cataclysm: ammo removed
	{"Crossbow", "IsCrossbow", "Points to be assigned if the item is a crossbow."},
	{"Dagger", "IsDagger", "Points to be assigned if the item is a dagger."},
	{"Fist weapon", "IsFist", "Points to be assigned if the item is a fist weapon."},
	{"Gun", "IsGun", "Points to be assigned if the item is a gun, or a stack of bullets."}, -- *** Cataclysm: ammo removed
	{"Mace: 1H", "IsMace", "Points to be assigned if the item is a one-handed mace."},
	{"Mace: 2H", "Is2HMace", "Points to be assigned if the item is a two-handed mace."},
	{"Polearm", "IsPolearm", "Points to be assigned if the item is a polearm."},
	{"Staff", "IsStaff", "Points to be assigned if the item is a staff."},
	{"Sword: 1H", "IsSword", "Points to be assigned if the item is a one-handed sword."},
	{"Sword: 2H", "Is2HSword", "Points to be assigned if the item is a two-handed sword."},
	{"Thrown", "IsThrown", "Points to be assigned if the item is a thrown weapon."},
	{"Wand", "IsWand", "Points to be assigned if the item is a wand."},

	{"Armor types"},
	{"Cloth", "IsCloth", "Points to be assigned if the item is cloth."},
	{"Leather", "IsLeather", "Points to be assigned if the item is leather."},
	{"Mail", "IsMail", "Points to be assigned if the item is mail."},
	{"Plate", "IsPlate", "Points to be assigned if the item is plate."},
	{"Shield", "IsShield", "Points to be assigned if the item is a shield."},

	{"Special weapon stats"},
	{"Minimum damage", "MinDamage", "Weapon minimum damage."},
	{"Maximum damage", "MaxDamage", "Weapon maximum damage."},
	{"Melee: DPS", "MeleeDps", "Weapon damage per second, only for melee weapons."},
	{"Melee: min damage", "MeleeMinDamage", "Weapon minimum damage, only for melee weapons."},
	{"Melee: max damage", "MeleeMaxDamage", "Weapon maximum damage, only for melee weapons."},
	{"Melee: speed", "MeleeSpeed", "Weapon speed, only for melee weapons."},
	{"Ranged: DPS", "RangedDps", "Weapon damage per second, only for ranged weapons."},
	{"Ranged: min damage", "RangedMinDamage", "Weapon minimum damage, only for ranged weapons."},
	{"Ranged: max damage", "RangedMaxDamage", "Weapon maximum damage, only for ranged weapons."},
	{"Ranged: speed", "RangedSped", "Weapon speed, only for ranged weapons."},
	{"MH: DPS", "MainHandDps", "Weapon damage per second, only for main hand weapons."},
	{"MH: min damage", "MainHandMinDamage", "Weapon minimum damage, only for main hand weapons."},
	{"MH: max damage", "MainHandMaxDamage", "Weapon maximum damage, only for main hand weapons."},
	{"MH: speed", "MainHandSpeed", "Weapon speed, only for main hand weapons."},
	{"OH: DPS", "OffHandDps", "Weapon damage per second, only for off-hand weapons."},
	{"OH: min damage", "OffHandMinDamage", "Weapon minimum damage, only for off-hand weapons."},
	{"OH: max damage", "OffHandMaxDamage", "Weapon maximum damage, only for off-hand weapons."},
	{"OH: speed", "OffHandSpeed", "Weapon speed, only for off-hand weapons."},
	{"1H: DPS", "OneHandDps", "Weapon damage per second, only for weapons marked One Hand, not including Main Hand or Off Hand weapons."},
	{"1H: min damage", "OneHandMinDamage", "Weapon minimum damage, only for weapons marked One Hand, not including Main Hand or Off Hand weapons."},
	{"1H: max damage", "OneHandMaxDamage", "Weapon maximum damage, only for weapons marked One Hand, not including Main Hand or Off Hand weapons."},
	{"1H: speed", "OneHandSpeed", "Weapon speed, only for weapons marked One Hand, not including Main Hand or Off Hand weapons."},
	{"2H: DPS", "TwoHandDps", "Weapon damage per second, only for two-handed weapons."},
	{"2H: min damage", "TwoHandMinDamage", "Weapon minimum damage, only for two-handed weapons."},
	{"2H: max damage", "TwoHandMaxDamage", "Weapon maximum damage, only for two-handed weapons."},
	{"2H: speed", "TwoHandSpeed", "Weapon speed, only for two-handed weapons."},
	{"Speed baseline", "SpeedBaseline", "Not an actual stat, per se.  This number is subtracted from the Speed stat before multiplying it by the scale value.", true, "|cffffffffSpeed baseline|r is:"},
}


------------------------------------------------------------
-- UI strings
------------------------------------------------------------

-- Translation note: All of the strings ending in _Text should be translated; those will show up in the UI.  The strings ending
-- in _Tooltip are only used in tooltips, and can be safely left out.  If you don't want to translate them right now, delete those
-- lines or set them to nil, and Pawn won't show tooltips for those UI elements.


-- Configuration UI
PawnUIFrame_CloseButton_Text = "Close"
PawnUIHeaders = -- (%s is the name of the current scale)
{
	"Manage your Pawn scales", -- Scale tab
	"Scale values for %s", -- Values tab
	"Compare items using %s", -- Compare tab
	"Gems for %s", -- Gems tab
	"Adjust Pawn options", -- Options tab
	"About Pawn", -- About tab
	"Welcome to Pawn!", -- Getting Started tab
}

-- Configuration UI, Scale selector
PawnUIFrame_ScaleSelector_Header_Text = "Select a scale:"

-- Configuration UI, Scale tab (this is a new tab; the old Scales tab is now the Values tab)
PawnUIFrame_ScalesTab_Text = "Scale"

PawnUIFrame_ScalesWelcomeLabel_Text = "Scales are sets of stats and values that are used to assign point values to items.  You can customize your own or use scale values that others have created."

PawnUIFrame_ShowScaleCheck_Label_Text = "Show scale in tooltips"
PawnUIFrame_ShowScaleCheck_Tooltip = "When this option is checked, values for this scale will show up in item tooltips for this character.  Each scale can show up for one of your characters, multiple characters, or no characters at all."
PawnUIFrame_RenameScaleButton_Text = "Rename"
PawnUIFrame_RenameScaleButton_Tooltip = "Rename this scale."
PawnUIFrame_DeleteScaleButton_Text = "Delete"
PawnUIFrame_DeleteScaleButton_Tooltip = "Delete this scale.\n\nThis command cannot be undone!"
PawnUIFrame_ScaleColorSwatch_Label_Text = "Change color"
PawnUIFrame_ScaleColorSwatch_Tooltip = "Change the color that this scale's name and value appear in on item tooltips."
PawnUIFrame_ScaleTypeLabel_NormalScaleText = "You can change this scale on the Values tab."
PawnUIFrame_ScaleTypeLabel_ReadOnlyScaleText = "You must make a copy of this scale if you want to customize it."

PawnUIFrame_ScaleSettingsShareHeader_Text = "Share your scales"

PawnUIFrame_ImportScaleButton_Text = "Import"
PawnUIFrame_ImportScaleButton_Label_Text = "Add a new scale by pasting a scale tag from the internet."
PawnUIFrame_ExportScaleButton_Text = "Export"
PawnUIFrame_ExportScaleButton_Label_Text = "Share your scale with others on the internet."

PawnUIFrame_ScaleSettingsNewHeader_Text = "Create a new scale"

PawnUIFrame_CopyScaleButton_Text = "Copy"
PawnUIFrame_CopyScaleButton_Label_Text = "Create a new scale by making a copy of this one."
PawnUIFrame_NewScaleButton_Text = "Empty"
PawnUIFrame_NewScaleButton_Label_Text = "Create a new scale from scratch."
PawnUIFrame_NewScaleFromDefaultsButton_Text = "Defaults"
PawnUIFrame_NewScaleFromDefaultsButton_Label_Text = "Create a new scale by making a copy of the defaults."

-- Configuration UI, Values tab (previously the Scales tab)
PawnUIFrame_ValuesTab_Text = "Values"

PawnUIFrame_ValuesWelcomeLabel_NormalText = "You can customize the values that are assigned to each stat for this scale.  To manage your scales and add new ones, use the Scale tab."
PawnUIFrame_ValuesWelcomeLabel_NoScalesText = "You have no scale selected.  To get started, go to the Scale tab and start a new scale or paste one from the internet."
PawnUIFrame_ValuesWelcomeLabel_ReadOnlyScaleText = "The scale that you have selected can't be changed.  If you'd like to change these values, go to the Scale tab and make a copy of this scale or start a new one."

PawnUIFrame_ClearValueButton_Text = "Remove"
PawnUIFrame_ClearValueButton_Tooltip = "Remove this stat from the scale."

PawnUIFrame_IgnoreStatCheck_Text = "Items with this are unusable"
PawnUIFrame_IgnoreStatCheck_Tooltip = "Enable this option to cause any item with this stat to not get a value for this scale.  For example, shamans can't wear plate, so a scale designed for a shaman can mark plate as unusable so that plate armor doesn't get a value for that scale."

PawnUIFrame_ScaleSocketOptionsHeaderLabel_Text = "When calculating a value for this scale:"
PawnUIFrame_ScaleSocketBestRadio_Text = "Automatically handle sockets for me"
PawnUIFrame_ScaleSocketBestRadio_Tooltip = "Pawn will calculate a value for this scale assuming that you would socket the item with the gems that would maximize the value of the item."
PawnUIFrame_ScaleSocketCorrectRadio_Text = "Let me manually pick a socket value"
PawnUIFrame_ScaleSocketCorrectRadio_Tooltip = "Pawn will calculate a value for this scale based on the number you specify."

PawnUIFrame_NormalizeValuesCheck_Text = "Normalize values (like Wowhead)"
PawnUIFrame_NormalizeValuesCheck_Tooltip = "Enable this option to divide the final calculated value for an item by the sum of all stat values in your scale, like Wowhead and Lootzor do.  This helps to even out situations like where one scale has stat values around 1 and another has values around 5.  It also helps to keep numbers manageably small.\n\nFor more information on this setting, see the readme file."

-- Configuration UI, Compare tab
PawnUIFrame_CompareTab_Text = "Compare"

PawnUIFrame_VersusHeader_Text = "—vs.—" -- Short for "versus."  Appears between the names of the two items.
PawnUIFrame_VersusHeader_NoItem = "(no item)" -- Text displayed next to empty item slots.

PawnUIFrame_CompareMissingItemInfo_TextLeft = "First, pick a scale from the list on the left."
PawnUIFrame_CompareMissingItemInfo_TextRight = "Then, drop an item in this box.\n\nPawn will compare it versus your equipped item."

PawnUIFrame_CompareSocketBonusHeader_Text = "Socket bonus" -- Heading that appears above the item socket bonuses.

PawnUIFrame_CompareOtherInfoHeader_Text = "Other" -- Heading that appears above the item's level and the following stats:
PawnUIFrame_CompareAsterisk = "Special effects " .. PawnQuestionTexture
PawnUIFrame_CompareAsterisk_Yes = "Yes" -- Appears on the Compare tab when an item has special effects (?).

PawnUIFrame_CurrentCompareScaleDropDown_Label_Text = "Comparison scale"
PawnUIFrame_CurrentCompareScaleDropDown_Tooltip = "Select a new scale to use when comparing the two items."

PawnUIFrame_ClearItemsButton_Label = "Clear"
PawnUIFrame_ClearItemsButton_Tooltip = "Remove both comparison items."

PawnUIFrame_CompareSwapButton_Text = "< Swap >"
PawnUIFrame_CompareSwapButton_Tooltip = "Swap the item on the left side with the one on the right."

-- Configuration UI, Gems tab
PawnUIFrame_GemsTab_Text = "Gems"
PawnUIFrame_GemsHeaderLabel_Text = "Choose a scale to have Pawn determine the best gems available according to the values in that scale."

PawnUIFrame_CurrentGemsScaleDropDown_Label_Text = "Find the best gems for:"
PawnUIFrame_CurrentGemsScaleDropDown_Tooltip = "Select a scale for which to calculate gem values."

PawnUIFrame_GemQualityDropDown_Label_Text = "Quality:"
PawnUIFrame_GemQualityDropDown_Tooltip = "Select the quality of gems for Pawn to consider."

PawnUIFrame_FindGemColorHeader_Text = "%s gems" -- Red
PawnUIFrame_FindGemColorHeader_Meta_Text = "Meta gems (ignoring effects)"
PawnUIFrame_FindGemNoGemsHeader_Text = "No gems found."

-- Configuration UI, Options tab
PawnUIFrame_OptionsTab_Text = "Options"
PawnUIFrame_OptionsHeaderLabel_Text = "Configure Pawn the way you like it.  Changes will take effect immediately."

PawnUIFrame_TooltipOptionsHeaderLabel_Text = "Tooltip options"
PawnUIFrame_ShowItemLevelsCheck_Text = "Show item levels"
PawnUIFrame_ShowItemLevelsCheck_Tooltip = "Enable this option to have Pawn display the item level of every item you come across.\n\nEvery item in World of Warcraft has a hidden level that is used to determine how many stats it can have.  In general, an item of the same type (helmet, cloak) and quality (green, blue) and a higher level will have more, or at least better, stats."
PawnUIFrame_ShowItemIDsCheck_Text = "Show item IDs"
PawnUIFrame_ShowItemIDsCheck_Tooltip = "Enable this option to have Pawn display the item ID of every item you come across, as well as the IDs of all enchantments and gems.\n\nEvery item in World of Warcraft has an ID number associated with it.  This information is generally only useful to mod authors."
PawnUIFrame_ShowIconsCheck_Text = "Show inventory icons"
PawnUIFrame_ShowIconsCheck_Tooltip = "Enable this option to show inventory icons next to item link windows."
PawnUIFrame_ShowExtraSpaceCheck_Text = "Add a blank line before values"
PawnUIFrame_ShowExtraSpaceCheck_Tooltip = "Keep your item tooltips extra tidy by enabling this option, which adds a blank line before the Pawn values."
PawnUIFrame_AlignRightCheck_Text = "Align values to right edge of tooltip"
PawnUIFrame_AlignRightCheck_Tooltip = "Enable this option to align your Pawn values (as well as item levels and item IDs) to the right edge of the tooltip instead of the left."
PawnUIFrame_AsterisksHeaderLabel_Text = "Show " .. PawnQuestionTexture .. " on special effects:"
PawnUIFrame_AsterisksAutoRadio_Text = "On"
PawnUIFrame_AsterisksAutoRadio_Tooltip = "Show the " .. PawnQuestionTexture .. " icon on items that have special effects (like trinkets)."
PawnUIFrame_AsterisksAutoNoTextRadio_Text = "On, but don't add the warning"
PawnUIFrame_AsterisksAutoNoTextRadio_Tooltip = "Same as On, but don't show the 'Special effects not included' warning message."
PawnUIFrame_AsterisksOffRadio_Text = "Off"
PawnUIFrame_AsterisksOffRadio_Tooltip = "Don't show the " .. PawnQuestionTexture .. " icon or the warning message."

PawnUIFrame_CalculationOptionsHeaderLabel_Text = "Calculation options"
PawnUIFrame_DigitsBox_Label_Text = "Digits of precision:"
PawnUIFrame_DigitsBox_Tooltip = "Specify how many digits of precision you want in your Pawn values, 0-9.  0 rounds all Pawn values to whole numbers ('25').  1 is the default ('24.5')."
PawnUIFrame_UnenchantedValuesCheck_Text = "Show base values for items"
PawnUIFrame_UnenchantedValuesCheck_Tooltip = "Enable this option to have Pawn show values for unmodified versions of items, as if they were just dropped or was bought from the vendor.\n\nIf the current value and base value are both visible and not equal, the base value will be shown second, in parentheses."
PawnUIFrame_EnchantedValuesCheck_Text = "Show current values for items"
PawnUIFrame_EnchantedValuesCheck_Tooltip = "Enable this option to have Pawn show values for items exactly as they are, including all enchantments and gems if present.  Empty sockets are ignored.\n\nIf the current value and base value are both visible and not equal, the current value will be shown first."
PawnUIFrame_DebugCheck_Text = "Show debug info"
PawnUIFrame_DebugCheck_Tooltip = "If you're not sure how Pawn is calculating the values for a particular item, enable this option to make Pawn spam all sorts of 'useful' data to the chat console whenever you hover over an item.  This information includes which stats Pawn thinks the item has, which parts of the item Pawn doesn't understand, and how it took each one into account for each of your scales.\n\nThis option will fill up your chat log quickly, so you'll want to turn it off once you're finished investigating.\n\nShortcuts:\n/pawn debug on\n/pawn debug off"

PawnUIFrame_OtherOptionsHeaderLabel_Text = "Other options"
PawnUIFrame_ButtonPositionHeaderLabel_Text = "Show the Pawn button:"
PawnUIFrame_ButtonRightRadio_Text = "On the right"
PawnUIFrame_ButtonRightRadio_Tooltip = "Show the Pawn button in the lower-right corner of the Character Info panel."
PawnUIFrame_ButtonLeftRadio_Text = "On the left"
PawnUIFrame_ButtonLeftRadio_Tooltip = "Show the Pawn button in the lower-left corner of the Character Info panel."
PawnUIFrame_ButtonOffRadio_Text = "Hide it"
PawnUIFrame_ButtonOffRadio_Tooltip = "Don't show the Pawn button on the Character Info panel."

-- Configuration UI, About tab
PawnUIFrame_AboutTab_Text = "About"
PawnUIFrame_AboutHeaderLabel_Text = "by Vger-Azjol-Nerub"
PawnUIFrame_AboutVersionLabel_Text = "Version %s"
PawnUIFrame_AboutTranslationLabel_Text = "Official English version" -- Translators: credit yourself here... "Klingon translation by Stovokor"
PawnUIFrame_ReadmeLabel_Text = "New to Pawn?  See the getting started tab for a really basic introduction.  You can learn about more advanced features in the readme file that comes with Pawn."
PawnUIFrame_WebsiteLabel_Text = "For other mods by Vger, visit vgermods.com.\n\nWowhead stat weights used with permission.  If you have feedback on the scale values, please direct it to the appropriate Wowhead Theorycrafting forum threads."

-- Configuration UI, Help tab
PawnUIFrame_HelpTab_Text = "Getting started"
PawnUIFrame_GettingStartedLabel_Text =
	"Pawn calculates scores for items that let you easily see which one is better for you.  These scores show up at the bottom of all your item tooltips.\n\n\n" ..
	"Each item will get multiple scores: one for each “scale” that is active for your character.  A scale lists the stats that are important to you, and how many points each stat is worth.\n\n\n" ..
	"Pawn comes with scales from Wowhead for each class and spec.  You can turn scales on and off, create your own by assigning point values to each stat, and even share scales on the internet.\n\n\n" ..
	VgerCore.Color.Blue .. "Try out these features once you learn the basics:\n" .. VgerCore.Color.Reset ..
	" • Compare the stats of two items by using Pawn's Compare tab.\n" ..
	" • Right-click on an item link window to see how it compares to your current item.\n" ..
	" • Shift-right-click an item with sockets to have Pawn suggest gems for it.\n" ..
	" • Make a copy of one of your scales on the Scale tab, and customize the stat values on the Values tab.\n" ..
	" • Find more scales for your class on the internet, or build a custom one with Rawr.\n" ..
	" • Check out the readme file to learn more about Pawn's advanced features."
	
-- Inventory button
PawnUI_InventoryPawnButton_Tooltip = "Click to show the Pawn UI."
PawnUI_InventoryPawnButton_Subheader = "Totals for all equipped items:"

-- Socketing button
PawnUI_SocketingPawnButton_Tooltip = "Click to show the Pawn Gems UI."

-- Item socketing UI
PawnUI_ItemSocketingDescription_Header = "Pawn suggests the following gems:"

-- Interface Options page
PawnInterfaceOptionsFrame_OptionsHeaderLabel_Text = "Pawn options are found in the Pawn UI."
PawnInterfaceOptionsFrame_OptionsSubHeaderLabel_Text = "Click the Pawn button to go there.  You can also open Pawn from your inventory page, or by binding a key to it."

-- Bindings UI
BINDING_HEADER_PAWN = "Pawn"
BINDING_NAME_PAWN_TOGGLE_UI = "Toggle Pawn UI" -- Show or hide the Pawn UI
PAWN_TOGGLE_UI_DEFAULT_KEY = "P" -- Default key to assign to this command
BINDING_NAME_PAWN_COMPARE_LEFT = "Compare item (left)" -- Set the currently hovered item to be the left-side Compare item
PAWN_COMPARE_LEFT_DEFAULT_KEY = "[" -- Default key to assign to this command
BINDING_NAME_PAWN_COMPARE_RIGHT = "Compare item (right)" -- Set the currently hovered item to be the right-side Compare item
PAWN_COMPARE_RIGHT_DEFAULT_KEY = "]" -- Default key to assign to this command


PawnLocal =
{

	-- General messages
	["NeedNewerVgerCoreMessage"] = "Pawn needs a newer version of VgerCore.  Please use the version of VgerCore that came with Pawn.",
	
	-- Scale management dialog messages
	["NewScaleEnterName"] = "Enter a name for your scale:",
	["NewScaleNoQuotes"] = "A scale can't have \" in its name.  Enter a name for your scale:",
	["NewScaleDuplicateName"] = "A scale with that name already exists.  Enter a name for your scale:",
	
	["CopyScaleEnterName"] = "Enter a name for your new scale, a copy of %s:", -- %s is the name of the existing scale
	["RenameScaleEnterName"] = "Enter a new name for %s:", -- %s is the old name of the scale
	["DeleteScaleConfirmation"] = "Are you sure you want to delete %s? This can't be undone. Type \"%s\" to confirm:", -- First %s is the name of the scale, second %s is DELETE
	
	["ImportScaleMessage"] = "Press Ctrl+V to paste a scale tag that you've copied from another source here:",
	["ImportScaleTagErrorMessage"] = "Pawn doesn't understand that scale tag.  Did you copy the whole tag?  Try copying and pasting again:",
	
	["ExportScaleMessage"] = "Press Ctrl+C to copy the following scale tag for |cffffffff%s|r, and then press Ctrl+V to paste it later.", -- %s is name of scale
	["ExportAllScalesMessage"] = "Press Ctrl+C to copy your scale tags, create a file on your computer to save them in for backup, and then press Ctrl+V to paste them.",
	
	-- Scale selector
	["VisibleScalesHeader"] = "%s's scales", -- %s is name of character
	["HiddenScalesHeader"] = "Other scales",
	
	-- Configuration UI, Values tab
	["Unusable"] = "(unusable)",
	["NoStatDescription"] = "Choose a stat from the list on the left.",
	["NoScalesDescription"] = "To begin, import a scale or start a new one.",
	["StatNameText"] = "1 |cffffffff%s|r is worth:", -- |cffffffff%s|r is the name of the stat, in white
	
	-- Generic string dialogs
	["OKButton"] = "OK",
	["CancelButton"] = "Cancel",
	["CloseButton"] = "Close",
	
	-- Debug messages
	["EnchantedStatsHeader"] = "(Current value)",
	["UnenchantedStatsHeader"] = "(Base value)",
	["FailedToGetItemLinkMessage"] = "   Failed to get item link from tooltip.  This may be due to a mod conflict.",
	["FailedToGetUnenchantedItemMessage"] = "   Failed to get base item values.  This may be due to a mod conflict.",
	["DidntUnderstandMessage"] = "   (?) Didn't understand \"%s\".",
	["FoundStatMessage"] = "   %d %s", -- 25 Stamina
	
	["ValueCalculationMessage"] = "   %g %s x %g each = %g", -- 25 Stamina x 1 each = 25
	["UnusableStatMessage"] = "   -- %s is unusable, so stopping.", -- IsPlate is unusable, so stopping
	["SocketBonusValueCalculationMessage"] = "   -- Socket bonus would be worth:",
	["MissocketWorthwhileMessage"] = "   -- But it's better to use only %s gems:", -- Better to use only Red/Blue gems:
	["NormalizationMessage"] = "   ---- Normalized by dividing by %g", -- Normalized by dividing by 3.5
	["TotalValueMessage"] = "   ---- Total: %g", -- Total: 25
	
	-- Tooltip annotations
	["ItemIDTooltipLine"] = "Item ID",
	["ItemLevelTooltipLine"] = "Item level",
	["AverageItemLevelTooltipLine"] = "Epic gear level",
	["BaseValueWord"] = "base", -- 123.45 (98.76 base)
	["AsteriskTooltipLine"] = "|TInterface\\AddOns\\Pawn\\Textures\\Question:0|t Special effects not included in the value.",
	
	-- Gem stuff
	["GenericGemName"] = "(Gem %d)", -- (Gem 12345)
	["GenericGemLink"] = "|Hitem:%d|h[Gem %d]|h", -- [Gem 12345]
	["GemColorList1"] = "%d %s", -- 2 Red
	["GemColorList2"] = "%d %s or %s", -- 3 Red or Yellow
	["GemColorList3"] = "%d of any color", -- 1 of any color
	
	["GemQualityLevel80Uncommon"] = "Level 80 uncommon",
	["GemQualityLevel80Rare"] = "Level 80 rare",
	["GemQualityLevel80Epic"] = "Level 80 epic",
	["MetaGemQualityLevel80Rare"] = "Level 80 crafted",
	["GemQualityLevel85Uncommon"] = "Level 85 uncommon",
	["GemQualityLevel85Rare"] = "Level 85 rare",
	["GemQualityLevel85Epic"] = "Level 85 epic",
	["MetaGemQualityLevel85Rare"] = "Level 85 crafted",
	
	-- Slash commands
	["DebugOnCommand"] = "debug on",
	["DebugOffCommand"] = "debug off",
	["BackupCommand"] = "backup",
	
	["Usage"] = [[
Pawn by Vger-Azjol-Nerub
www.vgermods.com
 
/pawn -- show or hide the Pawn UI
/pawn debug [ on | off ] -- spam debug messages to the console
/pawn backup -- backup all of your scales to scale tags
 
For more information on customizing Pawn, please see the help file (Readme.htm) that comes with the mod.
]],

}


------------------------------------------------------------
-- Localized scale names
------------------------------------------------------------

PawnWowheadScale_Provider = "Wowhead scales"
PawnWowheadScale_WarriorArms = "Warrior: arms"
PawnWowheadScale_WarriorFury = "Warrior: fury"
PawnWowheadScale_WarriorTank = "Warrior: tank"
PawnWowheadScale_PaladinHoly = "Paladin: holy"
PawnWowheadScale_PaladinTank = "Paladin: tank"
PawnWowheadScale_PaladinRetribution = "Paladin: retribution"
PawnWowheadScale_HunterBeastMastery = "Hunter: beast mastery"
PawnWowheadScale_HunterMarksman = "Hunter: marksman"
PawnWowheadScale_HunterSurvival = "Hunter: survival"
PawnWowheadScale_RogueAssassination = "Rogue: assassination"
PawnWowheadScale_RogueCombat = "Rogue: combat"
PawnWowheadScale_RogueSubtlety = "Rogue: subtlety"
PawnWowheadScale_PriestDiscipline = "Priest: discipline"
PawnWowheadScale_PriestHoly = "Priest: holy"
PawnWowheadScale_PriestShadow = "Priest: shadow"
PawnWowheadScale_DeathKnightBloodDps = "DK: blood DPS"
PawnWowheadScale_DeathKnightBloodTank = "DK: blood tank"
PawnWowheadScale_DeathKnightFrostDps = "DK: frost DPS"
PawnWowheadScale_DeathKnightFrostTank = "DK: frost tank"
PawnWowheadScale_DeathKnightUnholyDps = "DK: unholy DPS"
PawnWowheadScale_ShamanElemental = "Shaman: elemental"
PawnWowheadScale_ShamanEnhancement = "Shaman: enhancement"
PawnWowheadScale_ShamanRestoration = "Shaman: restoration"
PawnWowheadScale_MageArcane = "Mage: arcane"
PawnWowheadScale_MageFire = "Mage: fire"
PawnWowheadScale_MageFrost = "Mage: frost"
PawnWowheadScale_WarlockAffliction = "Warlock: affliction"
PawnWowheadScale_WarlockDemonology = "Warlock: demonology"
PawnWowheadScale_WarlockDestruction = "Warlock: destruction"
PawnWowheadScale_DruidBalance = "Druid: balance"
PawnWowheadScale_DruidFeralDps = "Druid: feral cat"
PawnWowheadScale_DruidFeralTank = "Druid: feral bear"
PawnWowheadScale_DruidRestoration = "Druid: restoration"

------------------------------------------------------------
-- Tooltip parsing expressions
------------------------------------------------------------

-- Turns a game constant into a regular expression.
function PawnGameConstant(Text)
	return "^" .. PawnGameConstantUnwrapped(Text) .. "$"
end
function PawnGameConstantUnwrapped(Text)
	-- REVIEW: This function seems stupid.
	return gsub(gsub(Text, "%%", "%%%%"), "%-", "%%-")
end

-- These strings indicate that a given line might contain multiple stats, such as complex enchantments
-- (ZG, AQ) and gems.  These are sorted in priority order.  If a string earlier in the table is present, any
-- string later in the table can be ignored.
PawnSeparators =
{
	", ",
	"/",
	" & ",
	" and ",
}

-- This string indicates that whatever stats follow it on the same line is the item's socket bonus.
PawnSocketBonusPrefix = "Socket Bonus: "

-- Lines that match any of the following patterns will cause all further tooltip parsing to stop.
PawnKillLines =
{
	"^ \n$", -- The blank line before set items before WoW 2.3
	" %(%d+/%d+%)$", -- The (1/8) on set items for all versions of WoW
	"^|cff00e0ffDropped By", -- Mod compatibility: MobInfo-2 (should match mifontLightBlue .. MI_TXT_DROPPED_BY)
}

-- Lines that begin with any of the following strings will not be searched for separator strings.
PawnSeparatorIgnorePrefixes =
{
	'"', -- double quote
	"Equip:",
	"Use:",
	"Chance on hit:",
}

-- Items that begin with any of the following strings will never be parsed.
PawnIgnoreNames =
{
	"Design:",
	"Formula:",
	"Manual:",
	"Pattern:",
	"Plans:",
	"Recipe:",
	"Schematic:",
}

-- This is a list of regular expression substitutions that Pawn performs to normalize stat names before running
-- them through the normal gauntlet of expressions.
PawnNormalizationRegexes =
{
	{"^([%w%s%.]+) %+(%d+)$", "+%2 %1"}, -- "Stamina +5" --> "+5 Stamina"
	{"^(.-)|r.*", "%1"}, -- For removing meta gem requirements
}

-- These regular expressions are used to parse item tooltips.
-- The first string is the regular expression to match.  Stat values should be denoted with "(%d+)".
-- Subsequent strings follow this pattern: Stat, Number, Source
-- Stat is the name of a statistic.
-- Number is either the amount of that stat to include, or the 1-based index into the matches array produced by the regex.
-- If it's an index, it can also be negative to mean that the stat should be subtracted instead of added.  If nil, defaults to 1.
-- Source is either PawnMultipleStatsFixed if Number is the amount of the stat, or PawnMultipleStatsExtract or nil if Number is the matches array index.
-- Note that certain strings don't need to be translated: for example, the game defines
-- ITEM_BIND_ON_PICKUP to be "Binds when picked up" in English, and the correct string
-- in other languages automatically.
PawnMultipleStatsFixed = "_MultipleFixed"
PawnMultipleStatsExtract = "_MultipleExtract"
PawnRegexes =
{
	-- ========================================
	-- Strings that are ignored for compatibility with other mods
	-- ========================================
	{"^Used by outfits:"}, -- Mod compatibility: Outfitter
	
	-- ========================================
	-- Common strings that are ignored (rare ones are at the bottom of the file)
	-- ========================================
	{PawnGameConstant(ITEM_QUALITY0_DESC)}, -- Poor
	{PawnGameConstant(ITEM_QUALITY1_DESC)}, -- Common
	{PawnGameConstant(ITEM_QUALITY2_DESC)}, -- Uncommon
	{PawnGameConstant(ITEM_QUALITY3_DESC)}, -- Rare
	{PawnGameConstant(ITEM_QUALITY4_DESC)}, -- Epic
	{PawnGameConstant(ITEM_QUALITY5_DESC)}, -- Legendary
	{PawnGameConstant(ITEM_QUALITY7_DESC)}, -- Heirloom
	{PawnGameConstant(ITEM_HEROIC)}, -- Heroic (Thrall's Chestguard of Triumph, level 258 version)
	{PawnGameConstant(ITEM_HEROIC_EPIC)}, -- Heroic Epic (Thrall's Chestguard of Triumph, level 258 version, with colorblind mode on)
	{"^" .. ITEM_LEVEL}, -- Item Level 200
	{PawnGameConstant(ITEM_UNSELLABLE)}, -- No sell price
	{PawnGameConstant(ITEM_SOULBOUND)}, -- Soulbound
	{PawnGameConstant(ITEM_BIND_ON_EQUIP)}, -- Binds when equipped
	{PawnGameConstant(ITEM_BIND_ON_PICKUP)}, -- Binds when picked up
	{PawnGameConstant(ITEM_BIND_ON_USE)}, -- Binds when used
	{PawnGameConstant(ITEM_BIND_TO_ACCOUNT)}, -- Binds to account (Polished Spaulders of Valor)
	{"^" .. PawnGameConstantUnwrapped(ITEM_UNIQUE)}, -- Unique; leave off the $ for Unique(20)
	{"^" .. PawnGameConstantUnwrapped(ITEM_BIND_QUEST)}, -- Leave off the $ for MonkeyQuest mod compatibility
	{PawnGameConstant(ITEM_STARTS_QUEST)}, -- This Item Begins a Quest
	{PawnGameConstant(ITEM_CONJURED)}, -- Conjured Item
	{PawnGameConstant(ITEM_PROSPECTABLE)}, -- Prospectable
	{PawnGameConstant(ITEM_MILLABLE)}, -- Millable
	{PawnGameConstant(ITEM_DISENCHANT_NOT_DISENCHANTABLE)}, -- Cannot be disenchanted
	{"^Will receive"}, -- Appears in the trade window when an item is about to be enchanted ("Will receive +8 Stamina")
	{"^Disenchanting requires"}, -- Appears on item tooltips when the Disenchant ability is specified ("Disenchanting requires Enchanting (25)")
	{PawnGameConstant(ITEM_ENCHANT_DISCLAIMER)}, -- Item will not be traded!
	{"^.+ Charges?$"}, -- Brilliant Mana Oil
	{PawnGameConstant(LOCKED)}, -- Locked
	{PawnGameConstant(ENCRYPTED)}, -- Encrypted (Floral Foundations) (does not seem to exist in the game yet)
	{PawnGameConstant(ITEM_SPELL_KNOWN)}, -- Already Known
	{PawnGameConstant(INVTYPE_HEAD)}, -- Head
	{PawnGameConstant(INVTYPE_NECK)}, -- Neck
	{PawnGameConstant(INVTYPE_SHOULDER)}, -- Shoulder
	{PawnGameConstant(INVTYPE_CLOAK), "IsCloth", 1, PawnMultipleStatsFixed}, -- Back (cloaks are cloth even though they don't list it)
	{PawnGameConstant(INVTYPE_ROBE)}, -- Chest
	{PawnGameConstant(INVTYPE_BODY)}, -- Shirt
	{PawnGameConstant(INVTYPE_TABARD)}, -- Tabard
	{PawnGameConstant(INVTYPE_WRIST)}, -- Wrist
	{PawnGameConstant(INVTYPE_HAND)}, -- Hands
	{PawnGameConstant(INVTYPE_WAIST)}, -- Waist
	{PawnGameConstant(INVTYPE_FEET)}, -- Feet
	{PawnGameConstant(INVTYPE_LEGS)}, -- Legs
	{PawnGameConstant(INVTYPE_FINGER)}, -- Finger
	{PawnGameConstant(INVTYPE_TRINKET)}, -- Trinket
	{PawnGameConstant(MAJOR_GLYPH)}, -- Major Glyph
	{PawnGameConstant(MINOR_GLYPH)}, -- Minor Glyph
	{"^Totem$"},
	{"^Relic$"},
	{"^Idol$"},
	{"^Libram$"},
	{"^Mount$"}, -- Cenarion War Hippogryph
	{"^Classes:"},
	{"^Races:"},
	{"^Requires"},
	{"^Durability"},
	{"^Duration:"},
	{"^Cooldown remaining:"},
	{"<.+>"}, -- Made by, Right-click to read, etc. (No ^$; can be prefixed by a color)
	{"^Written by "},
	{"|cff%x%x%x%x%x%xRequires"}, -- Meta gem requirements
	{"^%d+ Slot .+$"}, -- Bags of all kinds
	{"^.+%(%d+ sec%)$"}, -- Temporary item buff
	{"^.+%(%d+ min%)$"}, -- Temporary item buff
	{"^Enchantment Requires"}, -- Seen on the enchanter-only ring enchantments when you're not an enchanter, and socketed jewelcrafter-only BoP gems
	
	-- ========================================
	-- Strings that represent statistics that Pawn cares about
	-- ========================================
	{PawnGameConstant(INVTYPE_RANGED), "IsRanged", 1, PawnMultipleStatsFixed}, -- Ranged
	{"^Projectile$", "IsRanged", 1, PawnMultipleStatsFixed}, -- Projectile
	{PawnGameConstant(INVTYPE_THROWN), "IsRanged", 1, PawnMultipleStatsFixed}, -- Thrown
	{PawnGameConstant(INVTYPE_WEAPON), "IsOneHand", 1, PawnMultipleStatsFixed}, -- One-Hand
	{PawnGameConstant(INVTYPE_2HWEAPON), "IsTwoHand", 1, PawnMultipleStatsFixed}, -- Two-Hand
	{PawnGameConstant(INVTYPE_WEAPONMAINHAND), "IsMainHand", 1, PawnMultipleStatsFixed}, -- Main Hand
	{PawnGameConstant(INVTYPE_WEAPONOFFHAND), "IsOffHand", 1, PawnMultipleStatsFixed}, -- Off Hand
	{PawnGameConstant(INVTYPE_HOLDABLE)}, -- Held In Off-Hand; no Pawn stat for this
	{"^(%d-) %- (%d-) Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Standard weapon
	{"^%+?(%d-) %- (%d-) Fire Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Wand
	{"^%+?(%d-) %- (%d-) Shadow Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Wand
	{"^%+?(%d-) %- (%d-) Nature Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Wand, Thunderfury
	{"^%+?(%d-) %- (%d-) Arcane Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Wand
	{"^%+?(%d-) %- (%d-) Frost Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Wand
	{"^%+?(%d-) %- (%d-) Holy Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Wand, Ashbringer
	{"^%+?(%d-) Weapon Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Weapon enchantments
	{"^Equip: %+?(%d-) Weapon Damage%.$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Braided Eternium Chain
	{"^%+?(%d-) Damage$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Weapons with no damage range: Crossbow of the Albatross
	{"^Scope %(%+(%d-) Damage%)$", "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Ranged weapon scopes
	{"^%+?(%d+) [Aa]ll [Ss]tats$", "Strength", 1, PawnMultipleStatsExtract, "Agility", 1, PawnMultipleStatsExtract, "Stamina", 1, PawnMultipleStatsExtract, "Intellect", 1, PawnMultipleStatsExtract, "Spirit", 1, PawnMultipleStatsExtract},
	{"^%+?(%d+) to All Stats$", "Strength", 1, PawnMultipleStatsExtract, "Agility", 1, PawnMultipleStatsExtract, "Stamina", 1, PawnMultipleStatsExtract, "Intellect", 1, PawnMultipleStatsExtract, "Spirit", 1, PawnMultipleStatsExtract}, -- Enchanted Pearl, Enchanted Tear
	{"^%+?(%-?%d+) Strength$", "Strength"},
	{"^Potency$", "Strength", 20, PawnMultipleStatsFixed}, -- weapon enchantment (untested)
	{"^%+?(%-?%d+) Agility$", "Agility"},
	{"^%+?(%-?%d+) Stamina$", "Stamina"},
	{"^%+?(%-?%d+) Intellect$", "Intellect"}, -- negative Intellect: Kreeg's Mug
	{"^%+?(%-?%d+) Spirit$", "Spirit"},
	{"^Titanium Weapon Chain$", "HitRating", 28, PawnMultipleStatsFixed}, -- Weapon enchantment; has additional effects
	{"^%+?(%d+) Block$", "BlockValue"},
	{"^%+(%d+) Block Value$", "BlockValue"}, -- part of complex warrior helm enchantment
	{"^%+(%d+) Shield Block Value$", "BlockValue"}, -- Titanium Plating
	{"^Equip: Increases the block value of your shield by (%d+)%.$", "BlockValue"},
	{"^Equip: Increases your block rating by (%d+)%.$", "BlockRating"}, -- Waistband of Wrath
	{"^Equip: Increases your shield block rating by (%d+)%.$", "BlockRating"}, -- Warbringer Chestguard
	{"^%+?(%d+) Block Rating$", "BlockRating"}, -- Northman's Shield of Blocking
	{"^%+?(%d+) Shield Block Rating$", "BlockRating"}, -- enchantment
	{"^Equip: Increases defense rating by (%d+)%.$", "DefenseRating"}, -- Bulwark of Kings
	{"^Defense Rating %+(%d)%$", "DefenseRating"},
	{"^%+?(%d+) Defense$", "DefenseRating"}, -- compound paladin enchantment
	{"^%+?(%d+) Defense Rating$", "DefenseRating"}, -- Thick Amber; Bloodscale Legguards of Defense
	{"^%+?(%d+) Dodge Rating$", "DodgeRating"}, -- Arctic Ring of Eluding
	{"^Equip: Increases your dodge rating by (%d+)%.$", "DodgeRating"}, -- Frostwolf Insignia Rank 6
	{"^Equip: Increases your parry rating by (%d+)%.$", "ParryRating"}, -- Draconic Avenger
	{"^%+?(%d+) Parry Rating$", "ParryRating"},
	{"^%(([%d%.,]+) damage per second%)$"}, -- Ignore this; DPS is calculated manually
	{"^Adds ([%d%.,]+) damage per second$", "Dps"},
	{"^Fiery Weapon$", "Dps", 4, PawnMultipleStatsFixed}, -- weapon enchantment, 
	{"^Equip: Increases your expertise rating by (%d+)%.$", "ExpertiseRating"}, -- Earthwarden
	{"^%+?(%d+) Expertise Rating$", "ExpertiseRating"}, -- Guardian's Shadow Crystal
	{"^Equip: Improves critical strike rating by (%d+)%.$", "CritRating"},
	{"^Equip: Increases your critical strike rating by (%d+)%.$", "CritRating"},
	{"^%+?(%d+) Crit Rating$", "CritRating"}, -- Mantle of Malorne
	{"^%+?(%d+) Critical Rating$", "CritRating"}, -- Enscribed Fire Opal (after normalization)
	{"^%+?(%d+) Critical [Ss]trike [Rr]ating%.?$", "CritRating"}, -- One head enchantment is "20 Critical strike rating." with a dot and lowercase
	{"^Scope %(%+(%d+) Critical Strike Rating%)$", "CritRating"},
	{"^%+?(%d+) Ranged Critical Strike$", "CritRating"}, -- Heartseeker Scope (untested); Pawn doesn't distinguish between ranged and hybrid crit rating
	{"^Equip: Increases your hit rating by (%d+)%.$", "HitRating"}, -- Don Julio's Band
	{"^Equip: Improves hit rating by (%d+)%.$", "HitRating"},
	{"^%+?(%d+) Hit Rating$", "HitRating"}, -- 3% hit scope
	{"^Surefooted$", "HitRating", 10, PawnMultipleStatsFixed}, -- Enchantment (untested); has additional effects
	{"^Accuracy$", "HitRating", 25, PawnMultipleStatsFixed, "CritRating", 25, PawnMultipleStatsFixed}, -- weapon enchantment
	{"^Equip: Improves your resilience rating by (%d+)%.$", "ResilienceRating"},
	{"^%+?(%d+) Resilience Rating$", "ResilienceRating"},
	{"^%+?(%d+) Resilience$", "ResilienceRating"}, -- Sublime Mystic Dawnstone
	{"^Counterweight %(%+(%d+) Haste Rating%)", "HasteRating"},
	{"^Equip: Improves haste rating by (%d+)%.$", "HasteRating"}, -- Swiftsteel Shoulders
	{"^%+?(%d+) Haste Rating$", "HasteRating"}, -- Leggings of the Betrayed
	{"^Equip: Increases your mastery rating by (%d+)%.", "MasteryRating"}, -- Elementium Poleaxe (4.0) (Do not include $; mastery rating now includes the name of your mastery on the item.)
	{"^%+?(%d+) Mastery Rating$", "MasteryRating"}, -- Fractured Amberjewel (4.0).
	{"^Equip: Increases attack power by (%d+)%.$", "Ap"},
	{"^%+?(%d+) Attack Power$", "Ap"},
	{"^%+?(%d+) Ranged Attack Power$", "Rap"},
	{"^Equip: Increases ranged attack power by (%d+)%.$", "Rap"},
	{"^Equip: Restores (%d+) mana per 5 sec%.$", "Mp5"},
	{"^%+?(%d+) Mana Regen$", "Mp5"}, -- Shoulder enchantment, Scryers?
	{"^Mana Regen (%d+) per 5 sec%.$", "Mp5"},
	{"^%+?(%d+) [mM]ana [pP]er 5 [sS]ec%.?$", "Mp5"}, 
	{"^%+?(%d+) [mM]ana [eE]very 5 [sS]ec%.?$", "Mp5"}, 
	{"^%+?(%d+) [mM]ana [pP]er 5 [sS]econds$", "Mp5"}, -- Royal Shadow Draenite
	{"^%+?(%d+) [mM]ana every 5 [sS]ec%.$", "Mp5"},
	{"^%+?(%d+) [mM]ana every 5 seconds$", "Mp5"},
	{"^%+(%d+) Mana restored per 5 seconds$", "Mp5"}, -- Magister's armor kit
	{"^Equip: Restores (%d+) health every 5 sec%.$", "Hp5"},
	{"^Equip: Restores (%d+) health per 5 sec%.$", "Hp5"}, -- Yes, both "every" and "per" are used on items...
	{"^%+?(%d+) [hH]ealth [eE]very 5 [sS]ec%.?$", "Hp5"}, -- Aquamarine Signet of Regeneration
	{"^%+?(%d+) [hH]ealth [pP]er 5 [sS]ec%.?$", "Hp5"}, -- Anglesite Choker of Regeneration
	{"^%+(%d+) Health and Mana every 5 sec$", "Mp5", 1, PawnMultipleStatsExtract, "Hp5", 1, PawnMultipleStatsExtract}, -- Greater Vitality boots enchantment
	{"^%+(%d+) Mana$", "Mana"}, -- +150 mana enchantment
	{"^%+(%d+) HP$", "Health"}, -- +100 health head/leg enchantment
	{"^%+(%d+) Health$", "Health"}, -- +150 health enchantment
	{"^(%d+) Armor$", "AutoArmor"}, -- normal armor
	{"^%+(%d+) Armor$", "BonusArmor"}, -- cloak armor enchantments
	{"^Reinforced %(%+(%d+) Armor%)$", "BonusArmor"}, -- armor kits
	{"^Equip: %+(%d+) Armor%.$", "BonusArmor"}, -- paladin Royal Seal of Eldre'Thalas
	{"^Equip: Increases spell power by (%d+)%.$", "SpellPower"}, -- Overlaid Chain Spaulders
	{"^%+?(%d+) Spell Power$", "SpellPower"}, -- Reckless Monarch Topaz
	{"^Equip: Increases armor penetration rating by (%d+)%.$", "ArmorPenetration"}, -- Onslaught Breastplate, Vereesa's Silver Chain Belt
	{"^Equip: Increases your armor penetration rating by (%d+)%.$", "ArmorPenetration"}, -- Argent Skeleton Crusher
	{"^%+?(%d+) Armor Penetration Rating$", "ArmorPenetration"}, -- Fractured Scarlet Ruby
	{"^Equip: Increases your spell penetration by (%d+)%.$", "SpellPenetration"}, -- Frostfire Robe
	{"^%+?(%d+) Spell Penetration$", "SpellPenetration"}, -- Radiant Talasite
	{"^%+(%d+) Fire Damage$", "FireSpellDamage"},
	{"^%+(%d+) Fire Spell Damage$", "FireSpellDamage"},
	{"^Equip: Increases damage done by Fire spells and effects by up to (%d+)%.$", "FireSpellDamage"},
	{"^Equip: Increases fire spell power by (%d+)%.$", "FireSpellDamage"},
	{"^%+(%d+) Shadow Damage$", "ShadowSpellDamage"},
	{"^%+(%d+) Shadow Spell Damage$", "ShadowSpellDamage"},
	{"^Equip: Increases damage done by Shadow spells and effects by up to (%d+)%.$", "ShadowSpellDamage"},
	{"^Equip: Increases shadow spell power by (%d+)%.$", "FrostSpellDamage"}, -- Frozen Shadoweave Shoulders
	{"^%+(%d+) Nature Damage$", "NatureSpellDamage"}, -- Netherstalker Legguards of Nature's Wrath
	{"^%+(%d+) Nature Spell Damage$", "NatureSpellDamage"},
	{"^Equip: Increases damage done by Nature spells and effects by up to (%d+)%.$", "NatureSpellDamage"},
	{"^Equip: Increases nature spell power by (%d+)%.$", "NatureSpellDamage"},
	{"^%+(%d+) Arcane Damage$", "ArcaneSpellDamage"},
	{"^%+(%d+) Arcane Spell Damage$", "ArcaneSpellDamage"}, -- Dragon Finger of Arcane Wrath
	{"^Equip: Increases damage done by Arcane spells and effects by up to (%d+)%.$", "ArcaneSpellDamage"},
	{"^Equip: Increases arcane spell power by (%d+)%.$", "ArcaneSpellDamage"},
	{"^%+(%d+) Frost Damage$", "FrostSpellDamage"},
	{"^%+(%d+) Frost Spell Damage$", "FrostSpellDamage"}, -- enchantment
	{"^Equip: Increases damage done by Frost spells and effects by up to (%d+)%.$", "FrostSpellDamage"},
	{"^Equip: Increases frost spell power by (%d+)%.$", "FrostSpellDamage"}, -- Frozen Shadoweave Shoulders
	{"^%+(%d+) Holy Damage$", "HolySpellDamage"},
	{"^%+(%d+) Holy Spell Damage$", "HolySpellDamage"},
	{"^Equip: Increases damage done by Holy spells and effects by up to (%d+)%.$", "HolySpellDamage"}, -- Lightforged Blade
	{"^Equip: Increases the damage done by Holy spells and effects by up to (%d+)%.$", "HolySpellDamage"}, -- Drape of the Righteous
	{"^Equip: Increases holy spell power by (%d+)%.$", "HolySpellDamage"},
	{"^%+?(%d+) All Resistances$", "AllResist"},
	{"^%+?(%d+) Resist All$", "AllResist"}, -- Prismatic Sphere
	{"^%+?(%d+) Fire Resistance$", "FireResist"},
	{"^%+?(%d+) Shadow Resistance$", "ShadowResist"},
	{"^%+?(%d+) Nature Resistance$", "NatureResist"},
	{"^%+?(%d+) Arcane Resistance$", "ArcaneResist"},
	{"^%+?(%d+) Frost Resistance$", "FrostResist"},
	{"^Red Socket$", "RedSocket", 1, PawnMultipleStatsFixed},
	{"^Yellow Socket$", "YellowSocket", 1, PawnMultipleStatsFixed},
	{"^Blue Socket$", "BlueSocket", 1, PawnMultipleStatsFixed},
	{"^Prismatic Socket$", "PrismaticSocket", 1, PawnMultipleStatsFixed}, -- Prismatic / colorless sockets are added by blacksmithing
	{"^Meta Socket$", "MetaSocket", 1, PawnMultipleStatsFixed},
	{"^\"Only fits in a meta gem slot%.\"$", "MetaSocketEffect", 1, PawnMultipleStatsFixed}, -- Actual meta gems, not the socket

	-- ========================================
	-- Rare strings that are ignored (common ones are at the top of the file)
	-- ========================================
	{'^"'}, -- Flavor text
	{"^Increases attack power by (%d+) in Cat, Bear, Dire Bear, and Moonkin forms only%.$"}, -- Shows up on weapons for druids
	{"^Alterac Valley$"}, -- Stormpike Soldier's Blood
	{"^Blackrock Depths$"}, -- Dark Brewmaiden's Brew
	{"^Blade's Edge Mountains$"}, -- Felsworn Gas Mask
	{"^Black Temple$"}, -- Naj'entus Spine
	{"^Dire Maul$"}, -- Gordok Courtyard Key
	{"^Grizzly Hills$"}, -- Element 115
	{"^Hyjal Summit$"}, -- Tears of the Goddess
	{"^Icecrown$"}, -- (Argent Tournament dailies)
	{"^Karazhan$"}, -- Torment of the Worgen
	{"^Old Hillsbrad Foothills$"}, -- Pack of Incendiary Bombs
	{"^Serpentshrine Cavern$"}, -- Tainted Core
	{"^Shadowmoon Valley$"}, -- Enchanted Illidari Tabard
	{"^Stratholme$"}, -- Andonisus, Reaper of Souls
	{"^Tempest Keep$"}, -- Cosmic Infuser
	{"^The Escape From Durnholde$"}, -- Pack of Incendiary Bombs
	{"^The Black Morass$"}, -- Chrono-beacon
	{"^Wintergrasp$"}, -- Inflatable Land Mines
	{"^Zul'Aman$"}, -- Amani Hex Stick
}

-- These regexes work exactly the same as PawnRegexes, but they're used to parse the right side of tooltips.
-- Unrecognized stats on the right side are always ignored.
-- Two-handed Axes, Maces, and Swords will have their stats converted to the 2H version later.
PawnRightHandRegexes =
{
	{"^Speed ([%d%.,]+)$", "Speed"},
	{"^Arrow$", "IsBow", 1, PawnMultipleStatsFixed},
	{"^Axe$", "IsAxe", 1, PawnMultipleStatsFixed},
	{"^Bow$", "IsBow", 1, PawnMultipleStatsFixed},
	{"^Bullet$", "IsGun", 1, PawnMultipleStatsFixed},
	{"^Crossbow$", "IsCrossbow", 1, PawnMultipleStatsFixed},
	{"^Dagger$", "IsDagger", 1, PawnMultipleStatsFixed},
	{"^Fist Weapon$", "IsFist", 1, PawnMultipleStatsFixed},
	{"^Gun$", "IsGun", 1, PawnMultipleStatsFixed},
	{"^Mace$", "IsMace", 1, PawnMultipleStatsFixed},
	{"^Polearm$", "IsPolearm", 1, PawnMultipleStatsFixed},
	{"^Staff$", "IsStaff", 1, PawnMultipleStatsFixed},
	{"^Sword$", "IsSword", 1, PawnMultipleStatsFixed},
	{"^Thrown$", "IsThrown", 1, PawnMultipleStatsFixed},
	{"^Wand$", "IsWand", 1, PawnMultipleStatsFixed},
	{"^Cloth$", "IsCloth", 1, PawnMultipleStatsFixed},
	{"^Leather$", "IsLeather", 1, PawnMultipleStatsFixed},
	{"^Mail$", "IsMail", 1, PawnMultipleStatsFixed},
	{"^Plate$", "IsPlate", 1, PawnMultipleStatsFixed},
	{"^Shield$", "IsShield", 1, PawnMultipleStatsFixed},
}