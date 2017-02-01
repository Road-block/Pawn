-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2010 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- User interface code
------------------------------------------------------------



------------------------------------------------------------
-- Globals
------------------------------------------------------------

PawnUICurrentScale = nil
PawnUICurrentTabNumber = nil
PawnUICurrentListIndex = 0
PawnUICurrentStatIndex = 0

-- An array with indices 1 and 2 for the left and right compare items, respectively; each one is of the type returned by GetItemData.
local PawnUIComparisonItems = {}
-- An array with indices 1 and 2 for the first and second left side shortcut items.
local PawnUIShortcutItems = {}

local PawnUITotalScaleLines = 0
local PawnUITotalComparisonLines = 0
local PawnUITotalGemLines = 0

------------------------------------------------------------
-- "Constants"
------------------------------------------------------------

local PawnUIScaleLineHeight = 16 -- each scale line is 16 pixels tall
local PawnUIScaleSelectorPaddingBottom = 5 -- add 5 pixels of padding to the bottom of the scrolling area

local PawnUIStatsListHeight = 20 -- the stats list contains 20 items
local PawnUIStatsListItemHeight = 16 -- each item is 16 pixels tall

local PawnUIComparisonLineHeight = 20 -- each comparison line is 20 pixels tall
local PawnUIComparisonAreaPaddingBottom = 10 -- add 10 pixels of padding to the bottom of the scrolling area

local PawnUIGemLineHeight = 17 -- each comparison line is 17 pixels tall
local PawnUIGemAreaPaddingBottom = 0 -- add no padding to the bottom of the scrolling area

local PawnUIFrameNeedsScaleSelector = { true, true, true, true, false, false, false }


-- The 1-based indes of the stat headers for gems.
PawnUIStats_RedSocketIndex = 8
PawnUIStats_YellowSocketIndex = 9
PawnUIStats_BlueSocketIndex = 10
PawnUIStats_MetaSocketIndex = 11
PawnUIStats_MetaSocketEffectIndex = 12
PawnUIStats_SocketBonusBefore = 13


------------------------------------------------------------
-- Inventory button
------------------------------------------------------------

-- Moves the Pawn inventory sheet button and inspect button to the location specified by the user's current preferences.
function PawnUI_InventoryPawnButton_Move()
	if PawnCommon.ButtonPosition == PawnButtonPositionRight then
		PawnUI_InventoryPawnButton:ClearAllPoints()
		if CharacterFrameExpandButton then -- WoW 4.0
			PawnUI_InventoryPawnButton:SetPoint("TOPRIGHT", "CharacterTrinket1Slot", "BOTTOMRIGHT", -35, -8)
		else
			PawnUI_InventoryPawnButton:SetPoint("TOPRIGHT", "CharacterTrinket1Slot", "BOTTOMRIGHT", -1, -8)
		end
		PawnUI_InventoryPawnButton:Show()
		if PawnUI_InspectPawnButton then
			PawnUI_InspectPawnButton:ClearAllPoints()
			PawnUI_InspectPawnButton:SetPoint("TOPRIGHT", "InspectTrinket1Slot", "BOTTOMRIGHT", -1, -8)
			PawnUI_InspectPawnButton:Show()
		end
		if PawnUI_SocketingPawnButton then
			PawnUI_SocketingPawnButton:ClearAllPoints()
			PawnUI_SocketingPawnButton:SetPoint("TOPRIGHT", "ItemSocketingFrame", "TOPRIGHT", -18, -46)
			PawnUI_SocketingPawnButton:Show()
		end
	elseif PawnCommon.ButtonPosition == PawnButtonPositionLeft then
		PawnUI_InventoryPawnButton:ClearAllPoints()
		PawnUI_InventoryPawnButton:SetPoint("TOPLEFT", "CharacterWristSlot", "BOTTOMLEFT", 1, -8)
		PawnUI_InventoryPawnButton:Show()
		if PawnUI_InspectPawnButton then
			PawnUI_InspectPawnButton:ClearAllPoints()
			PawnUI_InspectPawnButton:SetPoint("TOPLEFT", "InspectWristSlot", "BOTTOMLEFT", 1, -8)
			PawnUI_InspectPawnButton:Show()
		end
	else
		PawnUI_InventoryPawnButton:Hide()
		if PawnUI_InspectPawnButton then
			PawnUI_InspectPawnButton:Hide()
		end
		if PawnUI_SocketingPawnButton then
			PawnUI_SocketingPawnButton:Hide()
		end
	end
end

function PawnUI_InventoryPawnButton_OnEnter(this)
	-- Even if there are no scales, we'll at least display this much.
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine("Pawn", 1, 1, 1, 1)
	GameTooltip:AddLine(PawnUI_InventoryPawnButton_Tooltip, nil, nil, nil, 1)

	-- If the user has at least one scale and at least one type of value is enabled, calculate a total of all equipped items' values.
	PawnUI_AddInventoryTotalsToTooltip(GameTooltip, "player")
	
	-- Finally, display the tooltip.
	GameTooltip:Show()
end

function PawnUI_InspectPawnButton_OnEnter(this)
	-- Even if there are no scales, we'll at least display this much.
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine("Pawn", 1, 1, 1, 1)

	-- If the user has at least one scale and at least one type of value is enabled, calculate a total of all equipped items' values.
	PawnUI_AddInventoryTotalsToTooltip(GameTooltip, "playertarget")
	
	-- Finally, display the tooltip.
	GameTooltip:Show()
end

function PawnUI_SocketingPawnButton_OnEnter(this)
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine("Pawn", 1, 1, 1, 1)
	GameTooltip:AddLine(PawnUI_SocketingPawnButton_Tooltip)
	
	-- Finally, display the tooltip.
	GameTooltip:Show()
end

function PawnUI_AddInventoryTotalsToTooltip(Tooltip, Unit)
	if PawnCommon.ShowUnenchanted or PawnCommon.ShowEnchanted then
		-- Get the total stats for all items.
		local ItemValues, Count, EpicItemLevel = PawnGetInventoryItemValues(Unit)
		if Count > 0 then
			Tooltip:AddLine(" ")
			Tooltip:AddLine(PawnUI_InventoryPawnButton_Subheader, 1, 1, 1, 1)
			PawnAddValuesToTooltip(Tooltip, ItemValues, true)
			if PawnCommon.AlignNumbersRight then
				Tooltip:AddDoubleLine(PawnLocal.AverageItemLevelTooltipLine,  EpicItemLevel, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB)
			else
				Tooltip:AddLine(PawnLocal.AverageItemLevelTooltipLine .. ":  " .. EpicItemLevel, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB)
			end
		end
	end
end

function PawnUI_InspectPawnButton_Attach()
	-- It's possible that this will happen before the main initialization code, so we need to ensure that the
	-- default Pawn options have been set already.  Doing this multiple times is harmless.
	PawnInitializeOptions()

	VgerCore.Assert(InspectPaperDollFrame ~= nil, "InspectPaperDollFrame should be loaded by now!")
	CreateFrame("Button", "PawnUI_InspectPawnButton", InspectPaperDollFrame, "PawnUI_InspectPawnButtonTemplate")
	PawnUI_InspectPawnButton:SetParent(InspectPaperDollFrame)
	PawnUI_InventoryPawnButton_Move()
end

function PawnUI_SocketingPawnButton_Attach()
	-- It's possible that this will happen before the main initialization code, so we need to ensure that the
	-- default Pawn options have been set already.  Doing this multiple times is harmless.
	PawnInitializeOptions()

	-- Attach the socketing button.
	VgerCore.Assert(ItemSocketingFrame ~= nil, "ItemSocketingFrame should be loaded by now!")
	CreateFrame("Button", "PawnUI_SocketingPawnButton", ItemSocketingFrame, "PawnUI_SocketingPawnButtonTemplate")
	PawnUI_SocketingPawnButton:SetParent(ItemSocketingFrame)
	PawnUI_InventoryPawnButton_Move()
	
	-- Hook the item update event.
	VgerCore.HookInsecureFunction(ItemSocketingDescription, "SetSocketedItem", PawnUI_OnSocketUpdate)
end

------------------------------------------------------------
-- Scale selector events
------------------------------------------------------------

function PawnUIFrame_ScaleSelector_Refresh()
	-- First, delete the existing scale lines.
	for i = 1, PawnUITotalScaleLines do
		local LineName = "PawnUIScaleLine" .. i
		local Line = getglobal(LineName)
		if Line then Line:Hide() end
		setglobal(LineName, nil)
	end
	PawnUITotalScaleLines = 0

	-- Get a sorted list of scale data and display it all.
	local NewSelectedScale, FirstScale, ScaleData, LastHeader
	for _, ScaleData in pairs(PawnGetAllScalesEx()) do
		local ScaleName = ScaleData.Name
		if ScaleName == PawnUICurrentScale then NewSelectedScale = ScaleName end
		if not FirstScale then FirstScale = ScaleName end
		-- Add the header if necessary.
		if ScaleData.Header ~= LastHeader then
			LastHeader = ScaleData.Header
			PawnUIFrame_ScaleSelector_AddHeaderLine(LastHeader)
		end
		-- Then, list the scale.
		PawnUIFrame_ScaleSelector_AddScaleLine(ScaleName, ScaleData.LocalizedName, ScaleData.IsVisible)
	end
	
	PawnUIScaleSelectorScrollContent:SetHeight(PawnUIScaleLineHeight * PawnUITotalScaleLines + PawnUIScaleSelectorPaddingBottom)

	-- If the scale that they previously selected isn't in the list, or they didn't have a previously-selected
	-- scale, just select the first visible one, or the first one if there's no visible scale.
	PawnUICurrentScale = NewSelectedScale or FirstScale or PawnUINoScale
	PawnUI_HighlightCurrentScale()
	
	-- Also refresh a few other related UI elements.
	PawnUIUpdateHeader()
	PawnUIFrame_ShowScaleCheck_Update()
end

function PawnUIFrame_ScaleSelector_AddHeaderLine(Text)
	local Line = PawnUIFrame_ScaleSelector_AddLineCore(Text)
	Line:Disable()
end

function PawnUIFrame_ScaleSelector_AddScaleLine(ScaleName, LocalizedName, IsActive)
	local ColoredName
	--if IsActive then
	--	ColoredName = PawnGetScaleColor(ScaleName) .. ScaleName
	--else
		ColoredName = LocalizedName
	--end
	local Line = PawnUIFrame_ScaleSelector_AddLineCore(" " .. ColoredName)
	if not IsActive then
		Line:SetNormalFontObject("PawnFontSilver")
	end
	Line.ScaleName = ScaleName
end

function PawnUIFrame_ScaleSelector_AddLineCore(Text)
	PawnUITotalScaleLines = PawnUITotalScaleLines + 1
	local LineName = "PawnUIScaleLine" .. PawnUITotalScaleLines
	local Line = CreateFrame("Button", LineName, PawnUIScaleSelectorScrollContent, "PawnUIFrame_ScaleSelector_ItemTemplate")
	Line:SetPoint("TOPLEFT", PawnUIScaleSelectorScrollContent, "TOPLEFT", 0, -PawnUIScaleLineHeight * (PawnUITotalScaleLines - 1))
	Line:SetText(Text)
	return Line, LineName
end

function PawnUIFrame_ScaleSelector_OnClick(self)
	PawnUI_SelectScale(self.ScaleName)
end

-- Selects a scale in CurrentScaleDropDown.
function PawnUI_SelectScale(ScaleName)
	-- Close popup UI as necessary.
	PawnUIStringDialog:Hide()
	ColorPickerFrame:Hide()
	-- Select the scale.
	PawnUICurrentScale = ScaleName
	PawnUI_HighlightCurrentScale()
	-- After selecting a new scale, update the rest of the UI.
	PawnUIFrame_ShowScaleCheck_Update()
	PawnUIUpdateHeader()
	if PawnUIScalesTabPage:IsVisible() then
		PawnUI_ScalesTab_Refresh()
	end
	if PawnUIValuesTabPage:IsVisible() then
		PawnUI_ValuesTab_Refresh()
	end
	if PawnUICompareTabPage:IsVisible() then
		PawnUI_CompareItems()
	end
	if PawnUIGemsTabPage:IsVisible() then
		PawnUI_ShowBestGems()
	end
end

function PawnUI_HighlightCurrentScale()
	PawnUIFrame_ScaleSelector_HighlightFrame:ClearAllPoints()
	PawnUIFrame_ScaleSelector_HighlightFrame:Hide()
	for i = 1, PawnUITotalScaleLines do
		local LineName = "PawnUIScaleLine" .. i
		local Line = getglobal(LineName)
		if Line and Line.ScaleName == PawnUICurrentScale then
			PawnUIFrame_ScaleSelector_HighlightFrame:SetPoint("TOPLEFT", "PawnUIScaleLine" .. i, "TOPLEFT", 0, 0)
			PawnUIFrame_ScaleSelector_HighlightFrame:Show()
			break
		end
	end
end

------------------------------------------------------------
-- Scales tab events
------------------------------------------------------------

function PawnUI_ScalesTab_Refresh()
	PawnUIFrame_ScaleColorSwatch_Update()
	
	if PawnUICurrentScale ~= PawnUINoScale then
		PawnUIFrame_ScaleNameLabel:SetText(PawnGetScaleColor(PawnUICurrentScale) .. PawnGetScaleLocalizedName(PawnUICurrentScale))
		if PawnScaleIsReadOnly(PawnUICurrentScale) then
			PawnUIFrame_ScaleTypeLabel:SetText(PawnUIFrame_ScaleTypeLabel_ReadOnlyScaleText)
			PawnUIFrame_RenameScaleButton:Disable()
			PawnUIFrame_DeleteScaleButton:Disable()
		else
			PawnUIFrame_ScaleTypeLabel:SetText(PawnUIFrame_ScaleTypeLabel_NormalScaleText)
			PawnUIFrame_RenameScaleButton:Enable()
			PawnUIFrame_DeleteScaleButton:Enable()
		end
		PawnUIFrame_CopyScaleButton:Enable()
		PawnUIFrame_ExportScaleButton:Enable()
	else
		PawnUIFrame_ScaleNameLabel:SetText(PawnUINoScale)
		PawnUIFrame_CopyScaleButton:Disable()
		PawnUIFrame_RenameScaleButton:Disable()
		PawnUIFrame_DeleteScaleButton:Disable()
		PawnUIFrame_ExportScaleButton:Disable()
	end
end

------------------------------------------------------------
-- Values tab events
------------------------------------------------------------

function PawnUI_ValuesTab_Refresh()
	PawnUIFrame_StatsList_Update()
	PawnUIFrame_StatsList_SelectStat(PawnUICurrentStatIndex)
	local Scale
	if PawnUICurrentScale ~= PawnUINoScale then Scale = PawnCommon.Scales[PawnUICurrentScale] end
	
	if PawnUICurrentScale == PawnUINoScale then
		PawnUIFrame_ValuesWelcomeLabel:SetText(PawnUIFrame_ValuesWelcomeLabel_NoScalesText)
	elseif PawnScaleIsReadOnly(PawnUICurrentScale) then
		PawnUIFrame_ValuesWelcomeLabel:SetText(PawnUIFrame_ValuesWelcomeLabel_ReadOnlyScaleText)
		PawnUIFrame_NormalizeValuesCheck:Disable()
	else
		PawnUIFrame_ValuesWelcomeLabel:SetText(PawnUIFrame_ValuesWelcomeLabel_NormalText)
		PawnUIFrame_NormalizeValuesCheck:Enable()
	end
	if Scale then
		PawnUIFrame_NormalizeValuesCheck:SetChecked(Scale.NormalizationFactor and Scale.NormalizationFactor > 0)
		PawnUIFrame_NormalizeValuesCheck:Show()
	else
		PawnUIFrame_NormalizeValuesCheck:Hide()
	end
end

function PawnUIFrame_ImportScaleButton_OnClick()
	PawnUIImportScale()
end

function PawnUIFrame_NewScaleButton_OnClick()
	PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScale_OnOK)
end

function PawnUIFrame_NewScale_OnOK(NewScaleName)
	-- Does this scale already exist?
	if NewScaleName == PawnUINoScale then
		PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScale_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_NewScale_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, NewScaleName, PawnUIFrame_NewScale_OnOK)
		return
	end
	
	-- Add and select the scale.
	PawnAddEmptyScale(NewScaleName)
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
	PawnUISwitchToTab(PawnUIValuesTabPage)
end

function PawnUIFrame_NewScaleFromDefaultsButton_OnClick()
	PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScaleFromDefaults_OnOK)
end

function PawnUIFrame_NewScaleFromDefaults_OnOK(NewScaleName)
	-- Does this scale already exist?
	if NewScaleName == PawnUINoScale then
		PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScaleFromDefaults_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_NewScaleFromDefaults_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, NewScaleName, PawnUIFrame_NewScaleFromDefaults_OnOK)
		return
	end
	
	-- Add and select the scale.
	PawnAddDefaultScale(NewScaleName)
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
	PawnUISwitchToTab(PawnUIValuesTabPage)
end

function PawnUIFrame_ExportScaleButton_OnClick()
	PawnUIExportScale(PawnUICurrentScale)
end

function PawnUIFrame_RenameScaleButton_OnClick()
	PawnUIGetString(format(PawnLocal.RenameScaleEnterName, PawnUICurrentScale), PawnUICurrentScale, PawnUIFrame_RenameScale_OnOK)
end

function PawnUIFrame_CopyScaleButton_OnClick()
	PawnUIGetString(format(PawnLocal.CopyScaleEnterName, PawnGetScaleLocalizedName(PawnUICurrentScale)), "", PawnUIFrame_CopyScale_OnOK)
end

-- Shows a dialog where the user can copy a scale tag for a given scale to the clipboard.
-- Immediately returns true if successful, or false if not.
function PawnUIExportScale(ScaleName)
	local ScaleTag = PawnGetScaleTag(ScaleName)
	if ScaleTag then
		PawnUIShowCopyableString(format(PawnLocal.ExportScaleMessage, PawnGetScaleLocalizedName(PawnUICurrentScale)), ScaleTag)
		return true
	else
		return false
	end
end

-- Exports all custom scales as a series of scale tags.
function PawnUIExportAllScales()
	local ScaleTags, ScaleName, Scale
	ScaleTags = ""
	for ScaleName in pairs(PawnCommon.Scales) do
		if not PawnScaleIsReadOnly(ScaleName) then ScaleTags = ScaleTags .. PawnGetScaleTag(ScaleName) .. "    " end
	end
	if ScaleTags and ScaleTags ~= "" then
		PawnUIShowCopyableString(PawnLocal.ExportAllScalesMessage, ScaleTags)
		return true
	else
		return false
	end
end

-- Shows a dialog where the user can paste a scale tag from the clipboard.
-- Immediately returns.
function PawnUIImportScale()
	PawnUIGetString(PawnLocal.ImportScaleMessage, "", PawnUIImportScaleCallback)
end

-- Callback function for PawnUIImportScale.
function PawnUIImportScaleCallback(ScaleTag)
	-- Try to import the scale.  If successful, we don't need to do anything else.
	local Status, ScaleName = PawnImportScale(ScaleTag, true) -- allow overwriting a scale with the same name
	if Status == PawnImportScaleResultSuccess then
		if PawnUIFrame_ScaleSelector_Refresh then
			-- Select the new scale if the UI is up.
			PawnUIFrame_ScaleSelector_Refresh()
			PawnUI_SelectScale(ScaleName)
			PawnUISwitchToTab(PawnUIValuesTabPage)
		end
		return
	end
	
	-- If there was a problem, show an error message or reshow the dialog as appropriate.
	if Status == PawnImportScaleResultAlreadyExists then
		VgerCore.Message(VgerCore.Color.Salmon .. format(PawnLocal.ImportScaleAlreadyExistsMessage, ScaleName))
		return
	end
	if Status == PawnImportScaleResultTagError then
		-- Don't use the tag that was pasted as the default value; it makes it harder to paste.
		PawnUIGetString(PawnLocal.ImportScaleTagErrorMessage, "", PawnUIImportScaleCallback)
		return
	end
	
	VgerCore.Fail("Unexpected PawnImportScaleResult value: " .. tostring(Status))
end

function PawnUIFrame_RenameScale_OnOK(NewScaleName)
	-- Did they change anything?
	if NewScaleName == PawnUICurrentScale then return end
	
	-- Does this scale already exist?
	if NewScaleName == PawnUINoScale then
		PawnUIGetString(format(PawnLocal.RenameScaleEnterName, PawnUICurrentScale), PawnUICurrentScale, PawnUIFrame_RenameScale_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_RenameScale_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, PawnUICurrentScale, PawnUIFrame_RenameScale_OnOK)
		return
	end
	
	-- Rename and select the scale.
	PawnRenameScale(PawnUICurrentScale, NewScaleName)
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
end

function PawnUIFrame_CopyScale_OnOK(NewScaleName)
	-- Does this scale already exist?
	if NewScaleName == PawnUINoScale then
		PawnUIGetString(PawnLocal.CopyScaleEnterName, "", PawnUIFrame_CopyScale_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_CopyScale_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, NewScaleName, PawnUIFrame_CopyScale_OnOK)
		return
	end
	
	-- Create the new scale.
	PawnDuplicateScale(PawnUICurrentScale, NewScaleName)
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
	PawnUISwitchToTab(PawnUIValuesTabPage)
end

function PawnUIFrame_DeleteScaleButton_OnClick()
	if IsShiftKeyDown() then
		-- If the user held down the shift key when clicking the Delete button, just do it immediately.
		PawnUIFrame_DeleteScaleButton_OnOK(DELETE_ITEM_CONFIRM_STRING)
	else
		PawnUIGetString(format(PawnLocal.DeleteScaleConfirmation, PawnUICurrentScale, DELETE_ITEM_CONFIRM_STRING), "", PawnUIFrame_DeleteScaleButton_OnOK)
	end
end

function PawnUIFrame_DeleteScaleButton_OnOK(ConfirmationText)
	-- If they didn't type "DELETE" (ignoring case), just exit.
	if strlower(ConfirmationText) ~= strlower(DELETE_ITEM_CONFIRM_STRING) then return end
	
	PawnDeleteScale(PawnUICurrentScale)
	PawnUICurrentScale = nil
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_ScalesTab_Refresh()
end

function PawnUIFrame_StatsList_Update()
	if not PawnStats then return end
	
	-- First, update the control and get our new offset.
	FauxScrollFrame_Update(PawnUIFrame_StatsList, #PawnStats, PawnUIStatsListHeight, PawnUIStatsListItemHeight) -- list, number of items, number of items visible per page, item height
	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)
	
	-- Then, update the list items as necessary.
	local ThisScale
	if PawnUICurrentScale ~= PawnUINoScale then ThisScale = PawnGetAllStatValues(PawnUICurrentScale) end
	local i
	for i = 1, PawnUIStatsListHeight do
		local Index = i + Offset
		PawnUIFrame_StatsList_UpdateStatItem(i, Index, ThisScale)
	end
	
	-- After the user scrolled, we need to adjust their selection.
	PawnUIFrame_StatsList_MoveHighlight()
	
end

-- Updates a single stat in the list based on its index into the PawnStats table.
function PawnUIFrame_StatsList_UpdateStat(Index)
	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)
	local i = Index - Offset
	if i <= 0 or i > PawnUIStatsListHeight then return end
	
	PawnUIFrame_StatsList_UpdateStatItem(i, Index, PawnGetAllStatValues(PawnUICurrentScale))	
end

-- Updates a single stat in the list.
function PawnUIFrame_StatsList_UpdateStatItem(i, Index, ThisScale)
	local Title = PawnStats[Index][1]
	local ThisStat = PawnStats[Index][2]
	local Line = getglobal("PawnUIFrame_StatsList_Item" .. i)
	
	if Index <= #PawnStats then
		if not ThisStat then
			-- This is a header row.
			Line:SetText(Title)
			Line:Disable()
		elseif ThisScale and ThisScale[ThisStat] then
			-- This is a stat that's in the current scale.
			if ThisScale[ThisStat] <= PawnIgnoreStatValue then
				-- Well, technically, it's ignored.
				Line:SetText("  " .. Title .. " " .. PawnLocal.Unusable)
				Line:SetNormalFontObject("PawnFontSilver")
			else
				Line:SetText("  " .. Title .. " = " .. format("%g", ThisScale[ThisStat]))
				Line:SetNormalFontObject("GameFontHighlight")
			end
			Line:Enable()
		else
			-- This is a stat that's not in the current scale.
			Line:SetText("  " .. Title)
			Line:SetNormalFontObject("PawnFontSilver")
			Line:Enable()
		end
		Line:Show()
	else
		Line:Hide()
	end
end

-- Adjusts PawnUICurrentListIndex and the position of the highlight based on PawnUICurrentStatIndex.
function PawnUIFrame_StatsList_MoveHighlight()
	-- If no stat is selected, just hide the highlight.
	if not PawnUICurrentStatIndex or PawnUICurrentStatIndex == 0 then
		PawnUICurrentListIndex = 0
		PawnUIFrame_StatsList_HighlightFrame:Hide()
		return
	end
	
	-- Otherwise, see if we need to draw a highlight.  If the selected stat isn't visible, we shouldn't draw anything.
	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)
	local i = PawnUICurrentStatIndex - Offset
	if i <= 0 or i > PawnUIStatsListHeight then
		PawnUICurrentListIndex = 0
		PawnUIFrame_StatsList_HighlightFrame:Hide()
		return
	end
	
	-- If we made it this far, then we need to draw a highlight.
	PawnUICurrentListIndex = i
	PawnUIFrame_StatsList_HighlightFrame:ClearAllPoints()
	PawnUIFrame_StatsList_HighlightFrame:SetPoint("TOPLEFT", "PawnUIFrame_StatsList_Item" .. i, "TOPLEFT", 0, 0)
	PawnUIFrame_StatsList_HighlightFrame:Show()
end

-- This is the click handler for list item #i.
function PawnUIFrame_StatsList_OnClick(i)
	if not i or i <= 0 or i > PawnUIStatsListHeight then return end
	
	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)
	local Index = i + Offset
	
	PawnUIFrame_StatsList_SelectStat(Index)
end

function PawnUIFrame_StatsList_SelectStat(Index)
	-- First, make sure that the stat is in the correct range.
	if not Index or Index < 0 or Index > #PawnStats then
		Index = 0
	end
	
	-- Then, find out what they've clicked on.
	local Title, ThisStat, ThisDescription, ThisPrompt
	if Index > 0 then
		Title = PawnStats[Index][1]
		ThisStat = PawnStats[Index][2]
		if ThisStat then
			-- This is a stat, not a header row.
		else
			-- This is a header row, or empty space.
			Index = 0
		end
	end
	PawnUICurrentStatIndex = Index
		
	-- Show, move, or hide the highlight as appropriate.
	PawnUIFrame_StatsList_MoveHighlight()
	
	-- Finally, change the UI to the right.
	local ThisScale
	local ThisScaleIsReadOnly = PawnScaleIsReadOnly(PawnUICurrentScale)
	if PawnUICurrentScale ~= PawnUINoScale then ThisScale = PawnGetAllStatValues(PawnUICurrentScale) end
	if Index > 0 and ThisScale then
		-- They've selected a stat.
		local ThisStatIsIgnored = ThisScale[ThisStat] and ThisScale[ThisStat] <= PawnIgnoreStatValue
		ThisDescription = PawnStats[Index][3]
		PawnUIFrame_DescriptionLabel:SetText(ThisDescription)
		ThisPrompt = PawnStats[Index][5]
		if ThisPrompt then
			PawnUIFrame_StatNameLabel:SetText(ThisPrompt)
		else
			PawnUIFrame_StatNameLabel:SetText(format(PawnLocal.StatNameText, Title))
		end
		PawnUIFrame_StatNameLabel:Show()
		local ThisScaleValue = ThisScale[ThisStat]
		local ThisScaleValueUneditable = ThisScaleValue
		if ThisStatIsIgnored then ThisScaleValueUneditable = "0" end
		if not ThisScaleValueUneditable then ThisScaleValueUneditable = "0" end
		if not ThisScaleValue or ThisScaleValue == 0 then ThisScaleValue = "" else ThisScaleValue = tostring(ThisScaleValue) end
		PawnUIFrame_StatValueBox.SettingValue = (PawnUIFrame_StatValueBox:GetText() ~= ThisScaleValue)
		PawnUIFrame_StatValueBox:SetText(ThisScaleValue)
		PawnUIFrame_StatValueLabel:SetText(ThisScaleValueUneditable)
		PawnUIFrame_IgnoreStatCheck:SetChecked(ThisStatIsIgnored)
		if (not ThisScaleIsReadOnly) and (not PawnStats[Index][4]) then
			-- Shown and editable: scale is editable and stat is not unignorable
			PawnUIFrame_IgnoreStatCheck:Show()
			PawnUIFrame_IgnoreStatCheck:Enable()
		elseif ThisScaleIsReadOnly and (ThisStatIsIgnored) then
			-- Shown but not editable: scale is not editable and stat is currently ignored
			PawnUIFrame_IgnoreStatCheck:Show()
			PawnUIFrame_IgnoreStatCheck:Disable()
		else
			-- Hidden: anytime else
			PawnUIFrame_IgnoreStatCheck:Hide()
			PawnUIFrame_IgnoreStatCheck:Disable()
		end
		PawnUIFrame_ScaleSocketOptionsList_UpdateSelection()
	elseif PawnUICurrentScale == PawnUINoScale then
		-- They don't have any scales.
		PawnUIFrame_DescriptionLabel:SetText(PawnLocal.NoScalesDescription)
		PawnUIFrame_StatNameLabel:Hide()
		PawnUIFrame_StatValueBox:Hide()
		PawnUIFrame_StatValueLabel:Hide()
		PawnUIFrame_ClearValueButton:Hide()
		PawnUIFrame_IgnoreStatCheck:Hide()
		PawnUIFrame_ScaleSocketOptionsList:Hide()
	else
		-- They haven't selected a stat.
		PawnUIFrame_DescriptionLabel:SetText(PawnLocal.NoStatDescription)
		PawnUIFrame_StatNameLabel:Hide()
		PawnUIFrame_StatValueBox:Hide()
		PawnUIFrame_StatValueLabel:Hide()
		PawnUIFrame_ClearValueButton:Hide()
		PawnUIFrame_IgnoreStatCheck:Hide()
		PawnUIFrame_ScaleSocketOptionsList:Hide()
	end

end

function PawnUIFrame_IgnoreStatCheck_OnClick()
	if PawnScaleIsReadOnly(PawnUICurrentScale) then return end
	
	local IsIgnoredNow = PawnUIFrame_IgnoreStatCheck:GetChecked()
	if IsIgnoredNow then
		PawnUIFrame_ClearValueButton:Hide()
		PawnUIFrame_StatValueBox:Hide()
		PawnUIFrame_StatValueLabel:Show()
		PawnUIFrame_StatValueLabel:SetText("0")
		PawnSetStatValue(PawnUICurrentScale, PawnStats[PawnUICurrentStatIndex][2], PawnIgnoreStatValue)
	else
		PawnUIFrame_ClearValueButton:Disable()
		PawnUIFrame_ClearValueButton:Show()
		PawnUIFrame_StatValueBox:SetText("")
		PawnUIFrame_StatValueBox:Show()
		PawnSetStatValue(PawnUICurrentScale, PawnStats[PawnUICurrentStatIndex][2], 0)
	end
	PawnUIFrame_StatsList_UpdateStat(PawnUICurrentStatIndex)
end

function PawnUIFrame_StatValueBox_OnTextChanged()
	if PawnScaleIsReadOnly(PawnUICurrentScale) then return end
	
	local NewString = gsub(PawnUIFrame_StatValueBox:GetText(), ",", ".")
	local NewValue = tonumber(NewString)
	if NewValue == 0 then NewValue = nil end
	
	if NewValue then
		if NewValue <= PawnIgnoreStatValue then
			PawnUIFrame_StatValueBox:Hide()
			PawnUIFrame_ClearValueButton:Hide()
			PawnUIFrame_IgnoreStatCheck:SetChecked(true)
		else
			PawnUIFrame_StatValueBox:Show()
			PawnUIFrame_ClearValueButton:Show()
			PawnUIFrame_ClearValueButton:Enable()
			PawnUIFrame_IgnoreStatCheck:SetChecked(false)
		end
	else
		PawnUIFrame_StatValueBox:Show()
		PawnUIFrame_ClearValueButton:Show()
		PawnUIFrame_ClearValueButton:Disable()
		PawnUIFrame_IgnoreStatCheck:SetChecked(false)
	end
	
	-- If other code is setting this value, we should ignore this event and not set any values.
	if PawnUIFrame_StatValueBox.SettingValue then
		PawnUIFrame_StatValueBox.SettingValue = false
		return
	end
	PawnSetStatValue(PawnUICurrentScale, PawnStats[PawnUICurrentStatIndex][2], NewValue)
	PawnUIFrame_StatsList_UpdateStat(PawnUICurrentStatIndex)
	
	-- If the user edited a non-socket value and smart socketing is on, update the sockets too.
	-- (The socket values were already updated in PawnSetStatValue.)
	if PawnUICurrentStatIndex and
		PawnUICurrentStatIndex ~= PawnUIStats_RedSocketIndex and
		PawnUICurrentStatIndex ~= PawnUIStats_YellowSocketIndex and
		PawnUICurrentStatIndex ~= PawnUIStats_BlueSocketIndex and
		PawnUICurrentStatIndex ~= PawnUIStats_MetaSocketIndex and
		PawnUICurrentStatIndex ~= PawnUIStats_MetaStatsSocketIndex then
		if PawnCommon.Scales[PawnUICurrentScale].SmartGemSocketing then
			PawnUIFrame_StatsList_UpdateStat(PawnUIStats_RedSocketIndex)
			PawnUIFrame_StatsList_UpdateStat(PawnUIStats_YellowSocketIndex)
			PawnUIFrame_StatsList_UpdateStat(PawnUIStats_BlueSocketIndex)
		end
		if PawnCommon.Scales[PawnUICurrentScale].SmartMetaGemSocketing then
			PawnUIFrame_StatsList_UpdateStat(PawnUIStats_MetaSocketIndex)
		end
	end
end

function PawnUIFrame_ClearValueButton_OnClick()
	PawnUIFrame_StatValueBox:SetText("")
end

function PawnUIFrame_GetCurrentScaleColor()
	local r, g, b
	if PawnUICurrentScale and PawnUICurrentScale ~= PawnUINoScale then r, g, b = VgerCore.HexToRGB(PawnCommon.Scales[PawnUICurrentScale].Color) end
	if not r then
		r, g, b = VgerCore.Color.BlueR, VgerCore.Color.BlueG, VgerCore.Color.BlueB
	end
	return r, g, b
end

function PawnUIFrame_ScaleColorSwatch_OnClick()
	-- Get the color of the current scale.
	local r, g, b = PawnUIFrame_GetCurrentScaleColor()
	ColorPickerFrame.func = PawnUIFrame_ScaleColorSwatch_OnChange
	ColorPickerFrame.cancelFunc = PawnUIFrame_ScaleColorSwatch_OnCancel
	ColorPickerFrame.previousValues = { r, g, b }
	ColorPickerFrame.hasOpacity = false
	ColorPickerFrame:SetColorRGB(r, g, b)
	ColorPickerFrame:SetFrameStrata("HIGH")
	ColorPickerFrame:Show()
end

function PawnUIFrame_ScaleColorSwatch_OnChange()
	local r, g, b = ColorPickerFrame:GetColorRGB()
	PawnUIFrame_ScaleColorSwatch_SetColor(r, g, b)
end

function PawnUIFrame_ScaleColorSwatch_OnCancel(rgb)
	local r, g, b = unpack(rgb)
	PawnUIFrame_ScaleColorSwatch_SetColor(r, g, b)
end

function PawnUIFrame_ScaleColorSwatch_SetColor(r, g, b)
	PawnSetScaleColor(PawnUICurrentScale, VgerCore.RGBToHex(r, g, b))
	PawnUI_ScalesTab_Refresh()
	PawnResetTooltips()
end

function PawnUIFrame_ScaleColorSwatch_Update()
	if PawnUICurrentScale ~= PawnUINoScale then
		local r, g, b = PawnUIFrame_GetCurrentScaleColor()
		PawnUIFrame_ScaleColorSwatch_Color:SetTexture(r, g, b)
		PawnUIFrame_ScaleColorSwatch_Label:Show()
		PawnUIFrame_ScaleColorSwatch:Show()
	else
		PawnUIFrame_ScaleColorSwatch_Label:Hide()
		PawnUIFrame_ScaleColorSwatch:Hide()
	end
end

function PawnUIFrame_ShowScaleCheck_Update()
	if PawnUICurrentScale ~= PawnUINoScale then
		PawnUIFrame_ShowScaleCheck:SetChecked(PawnIsScaleVisible(PawnUICurrentScale))
		PawnUIFrame_ShowScaleCheck:Show()
	else
		PawnUIFrame_ShowScaleCheck:Hide()
	end
end

function PawnUIFrame_ShowScaleCheck_OnClick()
	PawnSetScaleVisible(PawnUICurrentScale, PawnUIFrame_ShowScaleCheck:GetChecked())
	PawnUIFrame_ScaleSelector_Refresh()
end

function PawnUIFrame_ScaleSocketOptionsList_SetSelection(Value)
	if PawnUICurrentScale == PawnUINoScale then return end
	if not PawnCommon.Scales[PawnUICurrentScale] then return end
	if PawnUICurrentStatIndex == PawnUIStats_MetaSocketIndex then
		PawnCommon.Scales[PawnUICurrentScale].SmartMetaGemSocketing = Value
	else
		PawnCommon.Scales[PawnUICurrentScale].SmartGemSocketing = Value
	end
	PawnUIFrame_ScaleSocketOptionsList_UpdateSelection()
	-- Changing the socketing option affects scale values, so we'll have to recalculate everything.
	PawnRecalculateScaleTotal(PawnUICurrentScale)
	PawnResetTooltips()
	PawnUIFrame_StatsList_UpdateStat(PawnUIStats_RedSocketIndex)
	PawnUIFrame_StatsList_UpdateStat(PawnUIStats_YellowSocketIndex)
	PawnUIFrame_StatsList_UpdateStat(PawnUIStats_BlueSocketIndex)
	PawnUIFrame_StatsList_UpdateStat(PawnUIStats_MetaSocketIndex)
end

function PawnUIFrame_ScaleSocketOptionsList_UpdateSelection()
	if PawnUICurrentScale == PawnUINoScale then return end
	if not PawnCommon.Scales[PawnUICurrentScale] then return end
	
	local IsReadOnly = PawnScaleIsReadOnly(PawnUICurrentScale)
	local ShowEditingUI = not IsReadOnly
	if (not IsReadOnly) and
		(PawnUICurrentStatIndex == PawnUIStats_RedSocketIndex or
		PawnUICurrentStatIndex == PawnUIStats_YellowSocketIndex or
		PawnUICurrentStatIndex == PawnUIStats_BlueSocketIndex or
		PawnUICurrentStatIndex == PawnUIStats_MetaSocketIndex) then
		local SmartSocketing
		if PawnUICurrentStatIndex == PawnUIStats_MetaSocketIndex then
			SmartSocketing = PawnCommon.Scales[PawnUICurrentScale].SmartMetaGemSocketing
		else
			SmartSocketing = PawnCommon.Scales[PawnUICurrentScale].SmartGemSocketing
		end
		if SmartSocketing then
			ShowEditingUI = false
			PawnUIFrame_ScaleSocketBestRadio:SetChecked(true)
			PawnUIFrame_ScaleSocketCorrectRadio:SetChecked(false)
		else
			PawnUIFrame_ScaleSocketBestRadio:SetChecked(false)
			PawnUIFrame_ScaleSocketCorrectRadio:SetChecked(true)
		end
		PawnUIFrame_ScaleSocketOptionsList:Show()
	else
		PawnUIFrame_ScaleSocketOptionsList:Hide()
	end
	
	local ThisStat = PawnStats[PawnUICurrentStatIndex][2]
	local ThisStatValue = PawnGetStatValue(PawnUICurrentScale, ThisStat)
	local IsIgnored = ThisStatValue and ThisStatValue <= PawnIgnoreStatValue
	if IsIgnored then
		ShowEditingUI = false
	end

	if ShowEditingUI then
		PawnUIFrame_StatValueBox:Show()
		PawnUIFrame_StatValueLabel:Hide()
		PawnUIFrame_ClearValueButton:Show()
	else
		PawnUIFrame_StatValueBox:Hide()
		PawnUIFrame_StatValueLabel:Show()
		PawnUIFrame_ClearValueButton:Hide()
	end
end

function PawnUIFrame_NormalizeValuesCheck_OnClick()
	if PawnUICurrentScale == PawnUINoScale or PawnScaleIsReadOnly(PawnUICurrentScale) then return end
	local Scale = PawnCommon.Scales[PawnUICurrentScale]
	
	if PawnUIFrame_NormalizeValuesCheck:GetChecked() then
		Scale.NormalizationFactor = 1
	else
		Scale.NormalizationFactor = nil
	end
	PawnResetTooltips()
end

------------------------------------------------------------
-- Compare tab
------------------------------------------------------------

-- Initializes the Compare tab if it hasn't already been initialized.
local PawnUI_CompareTabInitialized
function PawnUI_InitCompareTab()
	-- This only needs to be run once.
	if PawnUI_CompareTabInitialized then return end
	PawnUI_CompareTabInitialized = true
	
	-- All the Compare tab needs to do here is clear out the comparison items so the UI is in the default state.
	PawnUI_ClearCompareItems()
end

-- Sets either the left (index 1) or right (index 2) comparison item, using an item link.  If the passed item
-- link is nil, that comparison item is instead cleared out.  Returns true if an item was actually placed in the
-- slot or cleared from the slot.
function PawnUI_SetCompareItem(Index, ItemLink)
	PawnUI_InitCompareTab()
	if Index ~= 1 and Index ~= 2 then
		VgerCore.Fail("Index must be 1 or 2.")
		return
	end
	
	-- Get the item data for this item link; we can't do a comparison without it.
	local Item
	if ItemLink then
		-- If they passed item data instead of an item link, just use that.  Otherwise, get item data from the link.
		if type(ItemLink) == "table" then
			Item = ItemLink
			ItemLink = Item.Link
			if not ItemLink then
				VgerCore.Fail("Second parameter must be an item link or item data from PawnGetItemData.")
				return
			end
		else
			-- Unenchant the item link.
			local UnenchantedLink = PawnUnenchantItemLink(ItemLink)
			if UnenchantedLink then ItemLink = UnenchantedLink end
			Item = PawnGetItemData(ItemLink)
			VgerCore.Assert(Item, "Failed to get item data while setting an comparison item!")
		end
	end
	local ItemName, ItemRarity, ItemEquipLoc, ItemTexture
	local SlotID1, SlotID2
	if ItemLink then
		ItemName, _, ItemRarity, _, _, _, _, _, ItemEquipLoc, ItemTexture = GetItemInfo(ItemLink)
		SlotID1, SlotID2 = PawnGetSlotsForItemType(ItemEquipLoc)
	else
		ItemName = PawnUIFrame_VersusHeader_NoItem
		ItemRarity = 0
	end
	
	-- Items that are not equippable cannot be placed in the Compare slots.
	if ItemLink and SlotID1 == nil and SlotID2 == nil then return end
	
	-- Save the item data locally, in case the item is later removed from the main Pawn item cache.
	PawnUIComparisonItems[Index] = Item
	
	-- Now, update the item name and icon.
	local Label = getglobal("PawnUICompareItemName" .. Index)
	local Texture = getglobal("PawnUICompareItemIconTexture" .. Index)
	Label:SetText(ItemName)
	-- Workaround: ITEM_QUALITY_COLORS does not have a [7].  :(
	if ItemRarity == 7 then ItemRarity = 6 end
	local Color = ITEM_QUALITY_COLORS[ItemRarity]
	if Color then Label:SetVertexColor(Color.r, Color.g, Color.b) end
	Texture:SetTexture(ItemTexture)
	
	-- If this item is a different type than the existing item, clear out the existing item.
	if ItemLink then
		local OtherIndex
		if Index == 1 then OtherIndex = 2 else OtherIndex = 1 end
		if PawnUIComparisonItems[OtherIndex] then
			_, _, _, _, _, _, _, _, OtherItemEquipLoc = GetItemInfo(PawnUIComparisonItems[OtherIndex].Link)
			local OtherSlotID1, OtherSlotID2 = PawnGetSlotsForItemType(OtherItemEquipLoc)
			if not (
				(SlotID1 == nil and SlotID2 == nil and OtherSlotID1 == nil and OtherSlotID2 == nil) or
				(SlotID1 and (SlotID1 == OtherSlotID1 or SlotID1 == OtherSlotID2)) or
				(SlotID2 and (SlotID2 == OtherSlotID1 or SlotID2 == OtherSlotID2))
			) then
				PawnUI_SetCompareItem(OtherIndex, nil)
			end
		end	
	end
	
	-- Update the item shortcuts.  The item shortcuts appear on the left side, but they're based on what's equipped on
	-- the right side.
	if Index == 2 then
		PawnUI_SetShortcutItemForSlot(1, SlotID1)
		PawnUI_SetShortcutItemForSlot(2, SlotID2)
	end
	
	-- Finally, either compare the two items, or remove the current comparison, whichever is appropriate.
	PawnUI_CompareItems()
	
	-- Return true to indicate success to the caller.
	return true
end

-- Same as PawnUI_SetCompareItem, but shows the Pawn Compare UI if not already visible.
function PawnUI_SetCompareItemAndShow(Index, ItemLink)
	if Index ~= 1 and Index ~= 2 then
		VgerCore.Fail("Index must be 1 or 2.")
		return
	end
	if not ItemLink or PawnGetHyperlinkType(ItemLink) ~= "item" then return end
	
	-- Set this as a compare item.
	local Success = PawnUI_SetCompareItem(Index, ItemLink)
	if Success then
		-- Automatically pick a comparison item when possible.
		PawnUI_AutoCompare()
		
		-- If the Pawn Compare UI is not visible, show it.
		PawnUIShowTab(PawnUICompareTabPage)
	end
	
	return Success
end

-- If there is an item in slot 2 and nothing in slot 1, and the player has an item equipped in the proper slot, automatically
-- compare the slot 2 item with the equipped item.
function PawnUI_AutoCompare()
	if PawnUIComparisonItems[2] and not PawnUIComparisonItems[1] and (PawnUIShortcutItems[1] or PawnUIShortcutItems[2]) then
		-- Normally, use the first shortcut.  But, if the first shortcut is missing or matches the item just compared, use the second
		-- shortcut item instead.
		local ShortcutToUse = PawnUIShortcutItems[1]
		if (not PawnUIShortcutItems[1]) or (PawnUIShortcutItems[2] and (PawnUIShortcutItems[1].Link == PawnUIComparisonItems[2].Link)) then
			ShortcutToUse = PawnUIShortcutItems[2]
		end
		-- Don't bother with an auto-comparison at all if the best item we found was the same item.
		if ShortcutToUse.Link ~= PawnUIComparisonItems[2].Link then
			PawnUI_SetCompareItem(1, ShortcutToUse)
		end
	end
end

-- Tries to set one of the compare items based on what the user is currently hovering over.  Meant for keybindings.
function PawnUI_SetCompareFromHover(Index)
	PawnUI_SetCompareItemAndShow(Index, PawnLastHoveredItem)
end

-- Enables or disables one of the "currently equipped" shortcut buttons based on an inventory slot ID.  If there is an item in that
-- slot, that item will appear in the shortcut button.  If not, or if Slot is nil, that shortcut button will be hidden.
function PawnUI_SetShortcutItemForSlot(ShortcutIndex, Slot)
	if ShortcutIndex ~= 1 and ShortcutIndex ~= 2 then
		VgerCore.Fail("ShortcutIndex must be 1 or 2.")
		return
	end

	-- Find the currently equipped inventory item, and save it for later.
	local ButtonName = "PawnUICompareItemShortcut" .. ShortcutIndex
	local ShortcutButton = getglobal(ButtonName)
	local CurrentlyEquippedItem
	if Slot then CurrentlyEquippedItem = PawnGetItemDataForInventorySlot(Slot, true) end
	PawnUIShortcutItems[ShortcutIndex] = CurrentlyEquippedItem
	
	-- Now, update the button.
	if CurrentlyEquippedItem then
		-- There is a currently equipped item to put in this slot; get information about it.
		local Texture = getglobal(ButtonName .. "Texture")
		local _, _, _, _, _, _, _, _, _, ItemTexture = GetItemInfo(CurrentlyEquippedItem.Link)
		Texture:SetTexture(ItemTexture)
		ShortcutButton:Show()
	else
		ShortcutButton:Hide()
	end
end

-- Clears both comparison items and all comparison data.
function PawnUI_ClearCompareItems()
	PawnUI_SetCompareItem(1, nil)
	PawnUI_SetCompareItem(2, nil)
end

-- Swaps the left and right comparison items.
function PawnUI_SwapCompareItems()
	local Item1, Item2 = PawnUIComparisonItems[1], PawnUIComparisonItems[2]
	PlaySound("igMainMenuOptionCheckBoxOn")
	-- Set the right item to nil first so that unnecessary comparisons aren't performed.
	PawnUI_SetCompareItem(2, nil)
	PawnUI_SetCompareItem(1, Item2)
	PawnUI_SetCompareItem(2, Item1)
end

-- Performs an item comparison.  If the item in either index 1 or index 2 is currently empty, no
-- item comparison is made and the function silently exits.
function PawnUI_CompareItems()
	-- Before doing anything else, clear out the existing comparison data.
	PawnUICompareItemScore1:SetText("")
	PawnUICompareItemScore2:SetText("")
	PawnUICompareItemScoreDifference1:SetText("")
	PawnUICompareItemScoreDifference2:SetText("")
	PawnUICompareItemScoreHighlight1:Hide()
	PawnUICompareItemScoreHighlight2:Hide()
	PawnUICompareItemScoreArrow1:Hide()
	PawnUICompareItemScoreArrow2:Hide()
	PawnUIFrame_CompareSwapButton:Hide()
	PawnUI_DeleteComparisonLines()
	
	-- There must be a scale selected to perform a comparison.
	PawnUI_EnsureLoaded()
	if (not PawnUICurrentScale) or (PawnUICurrentScale == PawnUINoScale) then return end

	-- There must be two valid comparison items set to perform a comparison.
	local Item1, Item2 = PawnUIComparisonItems[1], PawnUIComparisonItems[2]
	if Item1 or Item2 then PawnUIFrame_CompareSwapButton:Show() end
	if (not Item1) or (not Item2) then return end

	-- We have two comparison items set.  Do the compare!
	local ItemStats1 = Item1.UnenchantedStats
	local ItemSocketBonusStats1 = Item1.UnenchantedSocketBonusStats
	local ItemStats2 = Item2.UnenchantedStats
	local ItemSocketBonusStats2 = Item2.UnenchantedSocketBonusStats
	local ThisScale = PawnCommon.Scales[PawnUICurrentScale]
	local ThisScaleValues = ThisScale.Values
	
	-- For items that have socket bonuses, we actually go through the list twice -- the first loop goes until we get to
	-- the place in the list where the socket bonus should be displayed, and then we pause the first loop and go into
	-- the second loop.  Once the second loop completes, we return to the first loop and finish it.
	if (not ItemStats1) or (not ItemStats2) then return end
	local CurrentItemStats1, CurrentItemStats2 = ItemStats1, ItemStats2
	local InSocketBonusLoop
	local FinishedSocketBonusLoop
	
	local StatCount = #PawnStats
	local LastFoundHeader
	local i = 1
	while true do
		if i == PawnUIStats_SocketBonusBefore and not FinishedSocketBonusLoop and not InSocketBonusLoop then
			-- If we're still in the outer loop, and we've reached the point in the stat list where socket bonuses should be inserted, enter
			-- the inner loop.
			InSocketBonusLoop = true
			i = 1
			CurrentItemStats1, CurrentItemStats2 = ItemSocketBonusStats1, ItemSocketBonusStats2
			LastFoundHeader = PawnUIFrame_CompareSocketBonusHeader_Text
		elseif i > StatCount then
			if FinishedSocketBonusLoop then
				-- We've finished the outer loop, so exit.
				break
			else
				-- We've finished the inner loop, so return to the outer loop.
				InSocketBonusLoop = nil
				FinishedSocketBonusLoop = true
				i = PawnUIStats_SocketBonusBefore
				if i > StatCount then break end
				CurrentItemStats1, CurrentItemStats2 = ItemStats1, ItemStats2
				LastFoundHeader = nil
			end
		end
		
		local ThisStatInfo = PawnStats[i]
		VgerCore.Assert(ThisStatInfo, "Failed to find stat info at PawnStats[" .. i .. "]")
		local Title, StatName = ThisStatInfo[1], ThisStatInfo[2]
		
		-- Is this a stat header, or an actual stat?
		if StatName then
			-- This is a stat name.  Is this stat present in the scale AND one of the items?
			local StatValue = ThisScaleValues[StatName]
			local Stats1, Stats2 = CurrentItemStats1[StatName], CurrentItemStats2[StatName]
			if StatValue and StatValue > PawnIgnoreStatValue and (Stats1 or Stats2) then
				-- We should show this stat.  Do we need to add a header first?
				if LastFoundHeader then
					PawnUI_AddComparisonHeaderLine(LastFoundHeader)
					LastFoundHeader = nil
				end
				-- Now, add the stat line.
				local StatNameAndValue = Title .. " @ " .. format("%g", StatValue)
				PawnUI_AddComparisonStatLineNumbers(StatNameAndValue, Stats1, Stats2)
			end
		else
			-- This is a header; remember it.  (But, for socket bonuses, ignore all headers.)
			if not InSocketBonusLoop then LastFoundHeader = Title end
		end
		
		-- Increment the counter and continue.
		i = i + 1
		if i > 1000 then
			VgerCore.Fail("Failed to break out of item comparison loop!")
			break
		end
	end
	LastFoundHeader = PawnUIFrame_CompareOtherInfoHeader_Text
	
	-- Add item level information if the user normally has item levels visible.
	local Level1, Level2 = Item1.Level, Item2.Level
	if not Level1 or Level1 <= 1 then Level1 = nil end
	if not Level2 or Level2 <= 1 then Level2 = nil end
	if GetCVar("showItemLevel") == "1" and ((Level1 and Level1 > 0) or (Level2 and Level2 > 0)) then
		if LastFoundHeader then
			PawnUI_AddComparisonHeaderLine(LastFoundHeader)
			LastFoundHeader = nil
		end
		PawnUI_AddComparisonStatLineNumbers(PawnLocal.ItemLevelTooltipLine, Level1, Level2)
	end
	
	-- Add asterisk indicator.
	if PawnCommon.ShowAsterisks ~= PawnShowAsterisksNever then
		local Asterisk1, Asterisk2
		if Item1.UnknownLines then Asterisk1 = PawnUIFrame_CompareAsterisk_Yes end
		if Item2.UnknownLines then Asterisk2 = PawnUIFrame_CompareAsterisk_Yes end
		if Asterisk1 or Asterisk2 then
			if LastFoundHeader then
				PawnUI_AddComparisonHeaderLine(LastFoundHeader)
				LastFoundHeader = nil
			end
			PawnUI_AddComparisonStatLineStrings(PawnUIFrame_CompareAsterisk, Asterisk1, Asterisk2)
		end
	end
	
	-- Update the scrolling stat area's height.
	PawnUI_RefreshCompareScrollFrame()
	
	-- Update the total item score row.
	local ValueFormat = "%." .. PawnCommon.Digits .. "f"
	local r, g, b = VgerCore.HexToRGB(PawnCommon.Scales[PawnUICurrentScale].Color)
	if not r then r, g, b = VgerCore.Color.BlueR, VgerCore.Color.BlueG, VgerCore.Color.BlueB end
	local _, Value1 = PawnGetSingleValueFromItem(Item1, PawnUICurrentScale)
	local _, Value2 = PawnGetSingleValueFromItem(Item2, PawnUICurrentScale)
	local Value1String, Value2String
	if Value1 then Value1String = format(ValueFormat, Value1) else Value1 = 0 end
	if Value2 then Value2String = format(ValueFormat, Value2) else Value2 = 0 end
	if Value1 > 0 then
		PawnUICompareItemScore1:SetText(Value1String)
		PawnUICompareItemScore1:SetVertexColor(r, g, b)
		if Value1 > Value2 then
			PawnUICompareItemScoreDifference1:SetText("(+" .. format(ValueFormat, Value1 - Value2) .. ")")
			PawnUICompareItemScoreHighlight1:Show()
			PawnUICompareItemScoreArrow1:Show()
		end
	end
	if Value2 > 0 then
		PawnUICompareItemScore2:SetText(Value2String)
		PawnUICompareItemScore2:SetVertexColor(r, g, b)
		if Value2 > Value1 then
			PawnUICompareItemScoreDifference2:SetText("(+" .. format(ValueFormat, Value2 - Value1) .. ")")
			PawnUICompareItemScoreHighlight2:Show()
			PawnUICompareItemScoreArrow2:Show()
		end
	end
end

-- Deletes all comparison stat and header lines.
function PawnUI_DeleteComparisonLines()
	for i = 1, PawnUITotalComparisonLines do
		local LineName = "PawnUICompareStatLine" .. i
		local Line = getglobal(LineName)
		if Line then Line:Hide() end
		setglobal(LineName, nil)
		setglobal(LineName .. "Name", nil)
		setglobal(LineName .. "Quantity1", nil)
		setglobal(LineName .. "Quantity2", nil)
		setglobal(LineName .. "Difference1", nil)
		setglobal(LineName .. "Difference2", nil)
	end
	PawnUITotalComparisonLines = 0
	PawnUI_RefreshCompareScrollFrame()
end

-- Adds a stat line to the comparison stat area, passing in the strings to use.
function PawnUI_AddComparisonStatLineStrings(StatNameAndValue, Quantity1, Quantity2, Difference1, Difference2)
	local Line, LineName = PawnUI_AddComparisonLineCore("PawnUICompareStatLineTemplate")
	getglobal(LineName .. "Name"):SetText(StatNameAndValue)	
	getglobal(LineName .. "Quantity1"):SetText(Quantity1)	
	getglobal(LineName .. "Quantity2"):SetText(Quantity2)	
	getglobal(LineName .. "Difference1"):SetText(Difference1)	
	getglobal(LineName .. "Difference2"):SetText(Difference2)	
	Line:Show()
end

-- Adds a stat line to the comparison stat area, passing in the numbers to use.  It is acceptable to use nil for either or both
-- of the numbers.  Differences are calculated automatically.
function PawnUI_AddComparisonStatLineNumbers(StatNameAndValue, Quantity1, Quantity2)
	local QuantityString1 = PawnFormatShortDecimal(Quantity1)
	local QuantityString2 = PawnFormatShortDecimal(Quantity2)
	local Difference1, Difference2
	if not Quantity1 then Quantity1 = 0 end
	if not Quantity2 then Quantity2 = 0 end
	if Quantity1 > Quantity2 then
		Difference1 = "(+" .. PawnFormatShortDecimal(Quantity1 - Quantity2) .. ")"
	elseif Quantity2 > Quantity1 then
		Difference2 = "(+" .. PawnFormatShortDecimal(Quantity2 - Quantity1) .. ")"
	end
	
	PawnUI_AddComparisonStatLineStrings(StatNameAndValue, QuantityString1, QuantityString2, Difference1, Difference2)
end

-- Adds a header line to the comparison stat area.
function PawnUI_AddComparisonHeaderLine(HeaderText)
	local Line, LineName = PawnUI_AddComparisonLineCore("PawnUICompareStatLineHeaderTemplate")
	local HeaderLabel = getglobal(LineName .. "Name")
	HeaderLabel:SetText(HeaderText)
	Line:Show()
end

-- Adds a line to the comparison stat area.
-- Arguments: Template
--	Template: The XML UI template to use when creating the new line.
-- Returns: Line, LineName
--	Line: A reference to the newly added line.
--	LineName: The string name of the newly added line.
function PawnUI_AddComparisonLineCore(Template)
	PawnUITotalComparisonLines = PawnUITotalComparisonLines + 1
	local LineName = "PawnUICompareStatLine" .. PawnUITotalComparisonLines
	local Line = CreateFrame("Frame", LineName, PawnUICompareScrollContent, Template)
	Line:SetPoint("TOPLEFT", PawnUICompareScrollContent, "TOPLEFT", 0, -PawnUIComparisonLineHeight * (PawnUITotalComparisonLines - 1))
	return Line, LineName
end

-- Updates the height of the comparison stat list scroll area's inner frame.  Call this after adding or removing a block of
-- comparison lines to ensure that the scroll area is correct.
function PawnUI_RefreshCompareScrollFrame()
	PawnUICompareScrollContent:SetHeight(PawnUIComparisonLineHeight * PawnUITotalComparisonLines + PawnUIComparisonAreaPaddingBottom)
	if PawnUITotalComparisonLines > 0 then
		PawnUICompareMissingItemInfoFrame:Hide()
		PawnUICompareScrollFrame:Show()
	else
		PawnUICompareScrollFrame:Hide()
		PawnUICompareMissingItemInfoFrame:Show()
	end
end

-- Links an item in chat.
function PawnUILinkItemInChat(Item)
	if not Item then return end
	local EditBox = DEFAULT_CHAT_FRAME.editBox
	if EditBox then
		if not EditBox:IsShown() then
			EditBox:SetText("")
			EditBox:Show()
		end
		EditBox:Insert(Item.Link)
	else
		VgerCore.Fail("Can't insert item link into chat because the edit box was not found.")
	end
end

-- Called when one of the two upper item slots are clicked.
function PawnUICompareItemIcon_OnClick(Index)
	PlaySound("igMainMenuOptionCheckBoxOn")
	
	-- Are they shift-clicking it to insert the item into chat?
	if IsModifiedClick("CHATLINK") then
		PawnUILinkItemInChat(PawnUIComparisonItems[Index])
		return
	end
	
	-- Are they dropping an item from their inventory?
	local InfoType, Info1, Info2 = GetCursorInfo()
	if InfoType == "item" then
		ClearCursor()
		PawnUI_SetCompareItem(Index, Info2)
		if Index == 2 then PawnUI_AutoCompare() end
		return
	end
	
	-- Are they dropping an item from a merchant's inventory?
	if InfoType == "merchant" then
		ClearCursor()
		local ItemLink = GetMerchantItemLink(Info1)
		if not ItemLink then return end
		PawnUI_SetCompareItem(Index, ItemLink)
		if Index == 2 then PawnUI_AutoCompare() end
		return
	end
end

-- Shows the tooltip for an item comparison slot.
function PawnUICompareItemIcon_TooltipOn(Index)
	-- Is there an item set for this slot?
	local Item = PawnUIComparisonItems[Index]
	if Item then
		if Index == 1 then
			GameTooltip:SetOwner(PawnUICompareItemIcon1, "ANCHOR_BOTTOMLEFT")
		elseif Index == 2 then
			GameTooltip:SetOwner(PawnUICompareItemIcon2, "ANCHOR_BOTTOMRIGHT")
		end
		GameTooltip:SetHyperlink(Item.Link)
	end
end

-- Hides the tooltip for an item comparison slot.
function PawnUICompareItemIcon_TooltipOff()
	GameTooltip:Hide()
end

-- Sets the left item to the item depicted in the "currently equipped" shortcut button.
function PawnUICompareItemShortcut_OnClick(ShortcutIndex, Button)
	PlaySound("igMainMenuOptionCheckBoxOn")

	-- Are they shift-clicking it to insert the item into chat?
	if IsModifiedClick("CHATLINK") then
		PawnUILinkItemInChat(PawnUIShortcutItems[ShortcutIndex])
		return
	end
	
	-- Nope; they want to set the compare item.
	local Index = 1
	if Button == "RightButton" then Index = 2 end
	PawnUI_SetCompareItem(Index, PawnUIShortcutItems[ShortcutIndex])
end

-- Shows the tooltip for the shortcut button.
function PawnUICompareItemShortcut_TooltipOn(ShortcutIndex)
	local Item = PawnUIShortcutItems[ShortcutIndex]
	if Item then
		GameTooltip:SetOwner(getglobal("PawnUICompareItemShortcut" .. ShortcutIndex), "ANCHOR_TOPLEFT")
		local UnenchantedLink = PawnUnenchantItemLink(Item.Link)
		if not UnenchantedLink then UnenchantedLink = Item.Link end
		GameTooltip:SetHyperlink(UnenchantedLink)
	end
end

-- Hides the tooltip for the shortcut button.
function PawnUICompareItemShortcut_TooltipOff()
	GameTooltip:Hide()
end

------------------------------------------------------------
-- Gems tab
------------------------------------------------------------

function PawnUI_InitGemsTab()
	-- Each time the gems tab is shown, immediately refresh its contents.
	PawnUI_ShowBestGems()
end

-- When GemQualityDropDown is first shown, initialize it.
local PawnUIFrame_GemQualityDropDown_IsInitialized = false
function PawnUIFrame_GemQualityDropDown_OnShow()
	if PawnUIFrame_GemQualityDropDown_IsInitialized then return end
	PawnUIFrame_GemQualityDropDown_IsInitialized = true

	UIDropDownMenu_SetWidth(PawnUIFrame_GemQualityDropDown, 140)
	PawnUIFrame_GemQualityDropDown_Reset()
end

-- Resets GemQualityDropDown.
function PawnUIFrame_GemQualityDropDown_Reset()
	UIDropDownMenu_Initialize(PawnUIFrame_GemQualityDropDown, PawnUIFrame_GemQualityDropDown_Initialize)
end

-- Function used by the UIDropDownMenu code to initialize GemQualityDropDown.
function PawnUIFrame_GemQualityDropDown_Initialize()
	if PawnUICurrentScale == PawnUINoScale then return end

	
	-- Add the item quality levels to the dropdown.
	local QualityData
	for _, QualityData in pairs(PawnGemQualityLevels) do
		UIDropDownMenu_AddButton({
			func = PawnUIFrame_GemQualityDropDown_ItemClicked,
			value = QualityData[1],
			text = QualityData[2],
		})
	end
end

function PawnUIFrame_GemQualityDropDown_ItemClicked(self)
	local QualityLevel = self.value
	PawnSetGemQualityLevel(PawnUICurrentScale, QualityLevel)
	PawnUI_ShowBestGems()
end

function PawnUIFrame_GemQualityDropDown_SelectQualityLevel(QualityLevel)
	UIDropDownMenu_SetSelectedValue(PawnUIFrame_GemQualityDropDown, QualityLevel)
	
	-- Painfully stupid: manually update the text on the dropdown to handle the case where the
	-- user has just switched scales and the gem quality level needs to be updated.
	local QualityData
	for _, QualityData in pairs(PawnGemQualityLevels) do
		if QualityData[1] == QualityLevel then
			UIDropDownMenu_SetText(PawnUIFrame_GemQualityDropDown, QualityData[2])
			return
		end
	end
end

function PawnUI_ShowBestGems()
	-- Always clear out the existing gems, no matter what happens next.
	PawnUI_DeleteGemLines()
	if not PawnUICurrentScale or PawnUICurrentScale == PawnUINoScale then return end
	
	-- Update the gem list for this scale.
	PawnUIFrame_GemQualityDropDown_SelectQualityLevel(PawnGetGemQualityLevel(PawnUICurrentScale))
	
	-- If no scale is selected, we can't show a gem list.  (This is a valid case!)
	if not PawnScaleBestGems[PawnUICurrentScale] then
		VgerCore.Fail("Failed to build a gem list because no best-gem data was available for this scale.")
		return
	end
	
	-- Otherwise, we're good -- show the gem list.
	local ShownGems = false

	if #(PawnScaleBestGems[PawnUICurrentScale].RedSocket) > 0 then
		PawnUI_AddGemHeaderLine(format(PawnUIFrame_FindGemColorHeader_Text, RED_GEM))
		for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].RedSocket) do
			PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
		end
		ShownGems = true
	end

	if #(PawnScaleBestGems[PawnUICurrentScale].YellowSocket) > 0 then
		PawnUI_AddGemHeaderLine(format(PawnUIFrame_FindGemColorHeader_Text, YELLOW_GEM))
		for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].YellowSocket) do
			PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
		end
		ShownGems = true
	end

	if #(PawnScaleBestGems[PawnUICurrentScale].BlueSocket) > 0 then
		PawnUI_AddGemHeaderLine(format(PawnUIFrame_FindGemColorHeader_Text, BLUE_GEM))
		for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].BlueSocket) do
			PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
		end
		ShownGems = true
	end
	
	if #(PawnScaleBestGems[PawnUICurrentScale].MetaSocket) > 0 then
		PawnUI_AddGemHeaderLine(PawnUIFrame_FindGemColorHeader_Meta_Text)
		for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].MetaSocket) do
			PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
		end
		ShownGems = true
	end
	
	if not ShownGems then
		PawnUI_AddGemHeaderLine(PawnUIFrame_FindGemNoGemsHeader_Text)
	end

	PawnUI_RefreshGemScrollFrame()
end

-- Deletes all gem lines.
function PawnUI_DeleteGemLines()
	for i = 1, PawnUITotalGemLines do
		local LineName = "PawnUIGemLine" .. i
		local Line = getglobal(LineName)
		if Line then Line:Hide() end
		setglobal(LineName, nil)
		setglobal(LineName .. "Icon", nil)
		setglobal(LineName .. "Name", nil)
		setglobal(LineName .. "Highlight", nil)
	end
	PawnUITotalGemLines = 0
	PawnUI_RefreshGemScrollFrame()
end

-- Adds a gem line to the gem list area, passing in the string and icon to use.
function PawnUI_AddGemLine(GemName, Icon, ItemID)
	local Line, LineName = PawnUI_AddGemLineCore("PawnUIGemLineTemplate")
	Line:SetID(ItemID)
	
	-- Prefer data from the Pawn cache if available.  It's more up-to-date if the user
	-- has hovered over anything.
	local Item = PawnGetItemData("item:" .. ItemID)
	if Item and Item.Name then
		GemName = Item.Name
		Icon = Item.Texture
	end
	
	getglobal(LineName .. "Name"):SetText(GemName)	
	getglobal(LineName .. "Icon"):SetTexture(Icon)
	Line:Show()
end

-- Adds a header to the gem list area.
function PawnUI_AddGemHeaderLine(Text)
	local Line, LineName = PawnUI_AddGemLineCore("PawnUIGemHeaderLineTemplate")
	getglobal(LineName .. "Name"):SetText(Text)	
	Line:Show()
end

-- Adds a line to the gem list area.
-- Arguments: Template
--	Template: The XML UI template to use when creating the new line.
-- Returns: Line, LineName
--	Line: A reference to the newly added line.
--	LineName: The string name of the newly added line.
function PawnUI_AddGemLineCore(Template)
	PawnUITotalGemLines = PawnUITotalGemLines + 1
	local LineName = "PawnUIGemLine" .. PawnUITotalGemLines
	local Line = CreateFrame("Button", LineName, PawnUIGemScrollContent, Template)
	Line:SetPoint("TOPLEFT", PawnUIGemScrollContent, "TOPLEFT", 0, -PawnUIGemLineHeight * (PawnUITotalGemLines - 1))
	return Line, LineName
end

-- Updates the height of the gem list scroll area's inner frame.  Call this after adding or removing a block of
-- gem lines to ensure that the scroll area is correct.
function PawnUI_RefreshGemScrollFrame()
	PawnUIGemScrollContent:SetHeight(PawnUIGemLineHeight * PawnUITotalGemLines + PawnUIGemAreaPaddingBottom)
end

-- Raised when the user hovers over a gem in the Gems tab.
function PawnUIFrame_GemList_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetHyperlink("item:" .. self:GetID())
	PawnUIFrame_GemList_UpdateInfo(self)
end

-- Raised when the user stops hovering over a gem in the Gems tab.
function PawnUIFrame_GemList_OnLeave(self)
	GameTooltip:Hide()
	PawnUIFrame_GemList_UpdateInfo(self)
end

-- Updates the name and icon for a gem in the gem list if necessary.
function PawnUIFrame_GemList_UpdateInfo(self)
	-- If Icon already has a texture set, then we already have item information, so skip this.
	local Icon = getglobal(tostring(self:GetName()) .. "Icon")
	if Icon and not Icon:GetTexture() then
		local Label = getglobal(tostring(self:GetName()) .. "Name")
		local Item = PawnGetItemData("item:" .. self:GetID())
		if PawnRefreshCachedItem(Item) then
			Label:SetText(Item.Name)
			Icon:SetTexture(Item.Texture)
		end
	end
end

-- Raised when the user clicks a gem in the Gems tab.
function PawnUIFrame_GemList_OnClick(self)
	-- Are they shift-clicking it to insert the item into chat?
	if IsModifiedClick("CHATLINK") then
		PawnUILinkItemInChat(PawnGetItemData("item:" .. tostring(self:GetID())))
		return
	end
end

------------------------------------------------------------
-- Options tab
------------------------------------------------------------

-- When the Options tab is first shown, set the values of all of the controls based on the user's settings.
function PawnUIOptionsTabPage_OnShow()
	-- Tooltip options
	PawnUIFrame_ShowItemIDsCheck:SetChecked(PawnCommon.ShowItemID)
	PawnUIFrame_ShowIconsCheck:SetChecked(PawnCommon.ShowTooltipIcons)
	PawnUIFrame_ShowExtraSpaceCheck:SetChecked(PawnCommon.ShowSpace)
	PawnUIFrame_AlignRightCheck:SetChecked(PawnCommon.AlignNumbersRight)
	PawnUIFrame_AsterisksList_UpdateSelection()
	
	-- Calculation options
	PawnUIFrame_DigitsBox:SetText(PawnCommon.Digits)
	PawnUIFrame_UnenchantedValuesCheck:SetChecked(PawnCommon.ShowUnenchanted)
	PawnUIFrame_EnchantedValuesCheck:SetChecked(PawnCommon.ShowEnchanted)
	PawnUIFrame_DebugCheck:SetChecked(PawnCommon.Debug)
	
	-- Other options
	PawnUIFrame_ButtonPositionList_UpdateSelection()
end

function PawnUIFrame_ShowItemIDsCheck_OnClick()
	PawnCommon.ShowItemID = PawnUIFrame_ShowItemIDsCheck:GetChecked() ~= nil
	PawnResetTooltips()
end

function PawnUIFrame_ShowIconsCheck_OnClick()
	PawnCommon.ShowTooltipIcons = PawnUIFrame_ShowIconsCheck:GetChecked() ~= nil
	PawnToggleTooltipIcons()
end

function PawnUIFrame_ShowExtraSpaceCheck_OnClick()
	PawnCommon.ShowSpace = PawnUIFrame_ShowExtraSpaceCheck:GetChecked() ~= nil
	PawnResetTooltips()
end

function PawnUIFrame_AlignRightCheck_OnClick()
	PawnCommon.AlignNumbersRight = PawnUIFrame_AlignRightCheck:GetChecked() ~= nil
	PawnResetTooltips()
end

function PawnUIFrame_AsterisksList_SetSelection(Value)
	PawnCommon.ShowAsterisks = Value
	PawnUIFrame_AsterisksList_UpdateSelection()
	PawnResetTooltips()
end

function PawnUIFrame_AsterisksList_UpdateSelection()
	PawnUIFrame_AsterisksAutoRadio:SetChecked(PawnCommon.ShowAsterisks == PawnShowAsterisksNonzero)
	PawnUIFrame_AsterisksAutoNoTextRadio:SetChecked(PawnCommon.ShowAsterisks == PawnShowAsterisksNonzeroNoText)
	PawnUIFrame_AsterisksOffRadio:SetChecked(PawnCommon.ShowAsterisks == PawnShowAsterisksNever)
end

function PawnUIFrame_DigitsBox_OnTextChanged()
	local Digits = tonumber(PawnUIFrame_DigitsBox:GetText())
	if not Digits then Digits = 0 end
	PawnCommon.Digits = Digits
	PawnRecreateAnnotationFormats()
	PawnResetTooltips()
end

function PawnUIFrame_UnenchantedValuesCheck_OnClick()
	PawnCommon.ShowUnenchanted = PawnUIFrame_UnenchantedValuesCheck:GetChecked() ~= nil
	PawnResetTooltips()
end

function PawnUIFrame_EnchantedValuesCheck_OnClick()
	PawnCommon.ShowEnchanted = PawnUIFrame_EnchantedValuesCheck:GetChecked() ~= nil
	PawnResetTooltips()
end

function PawnUIFrame_DebugCheck_OnClick()
	PawnCommon.Debug = PawnUIFrame_DebugCheck:GetChecked() ~= nil
	PawnResetTooltips()
end

function PawnUIFrame_ButtonPositionList_SetSelection(Value)
	PawnCommon.ButtonPosition = Value
	PawnUIFrame_ButtonPositionList_UpdateSelection()
	PawnUI_InventoryPawnButton_Move()
end

function PawnUIFrame_ButtonPositionList_UpdateSelection()
	PawnUIFrame_ButtonRightRadio:SetChecked(PawnCommon.ButtonPosition == PawnButtonPositionRight)
	PawnUIFrame_ButtonLeftRadio:SetChecked(PawnCommon.ButtonPosition == PawnButtonPositionLeft)
	PawnUIFrame_ButtonOffRadio:SetChecked(PawnCommon.ButtonPosition == PawnButtonPositionHidden)
end

------------------------------------------------------------
-- About tab methods
------------------------------------------------------------

function PawnUIAboutTabPage_OnShow()
	local Version = GetAddOnMetadata("Pawn", "Version")
	if Version then 
		PawnUIFrame_AboutVersionLabel:SetText(format(PawnUIFrame_AboutVersionLabel_Text, Version))
	end
end

------------------------------------------------------------
-- Item socketing UI
------------------------------------------------------------

function PawnUI_OnSocketUpdate()
	-- Find out what item it is.
	local _, ItemLink = ItemSocketingDescription:GetItem()
	local Item = PawnGetItemData(ItemLink)
	if not Item or not Item.Values then
		VgerCore.Fail("Failed to update the socketing UI because we didn't know what item was in it.")
		return
	end
	if not Item.UnenchantedStats then return end -- Can't do anything interesting if we couldn't get unenchanted item data
	
	-- Add the annotation lines to the tooltip.
	CreateFrame("GameTooltip", "PawnSocketingTooltip", ItemSocketingFrame, "PawnUI_FattyTooltip")
	PawnSocketingTooltip:SetOwner(ItemSocketingFrame, "ANCHOR_NONE")
	PawnSocketingTooltip:SetPoint("TOPLEFT", ItemSocketingFrame, "BOTTOMLEFT", 10, 30)
	PawnSocketingTooltip:SetText("Pawn", 1, 1, 1)
	PawnSocketingTooltip:AddLine(PawnUI_ItemSocketingDescription_Header)
	
	for _, Entry in pairs(Item.Values) do
		local ScaleName, UseRed, UseYellow, UseBlue = Entry[1], Entry[4], Entry[5], Entry[6]
		if PawnIsScaleVisible(ScaleName) then
			local Scale = PawnCommon.Scales[ScaleName]
			local ScaleValues = Scale.Values
			local ItemStats = Item.UnenchantedStats
			local TextColor = VgerCore.Color.Blue
			if Scale.Color and strlen(Scale.Color) == 6 then TextColor = "|cff" .. Scale.Color end
			
			-- Count the number of prismatic sockets.  We have to rely on the item socketing UI
			-- for this, because unenchanted items don't have prismatic sockets, and enchanted items
			-- have gems in those sockets.
			local SocketCount = GetNumSockets()
			local PrismaticSockets = 0
			for i = 1, SocketCount do
				if GetSocketTypes(i) == "Socket" then PrismaticSockets = PrismaticSockets + 1 end
			end
			
			local BestGems = ""
			if UseRed or UseYellow or UseBlue then
				-- Use all of a single color.
				local TotalColoredSockets = 0
				if ItemStats.RedSocket then TotalColoredSockets = TotalColoredSockets + ItemStats.RedSocket end
				if ItemStats.YellowSocket then TotalColoredSockets = TotalColoredSockets + ItemStats.YellowSocket end
				if ItemStats.BlueSocket then TotalColoredSockets = TotalColoredSockets + ItemStats.BlueSocket end
				if PrismaticSockets then TotalColoredSockets = TotalColoredSockets + PrismaticSockets end
				BestGems = PawnGetGemListString(TotalColoredSockets, UseRed, UseYellow, UseBlue, ScaleName)
			else
				-- Use the proper colors.
				if PrismaticSockets and PrismaticSockets > 0 then
					-- If there are prismatic sockets, we'll try to merge them with other sockets.
					UseRed, UseYellow, UseBlue = PawnGetBestGemColorsForScale(ScaleName)
				end
				if ItemStats.RedSocket then
					local RedSockets = ItemStats.RedSocket
					if UseRed and not UseYellow and not UseBlue then
						RedSockets = RedSockets + PrismaticSockets
						PrismaticSockets = 0
					end
					if BestGems ~= "" then BestGems = BestGems .. ", " end
					BestGems = BestGems .. PawnGetGemListString(RedSockets, true, false, false, ScaleName)
				end
				if ItemStats.YellowSocket then
					local YellowSockets = ItemStats.YellowSocket
					if not UseRed and UseYellow and not UseBlue then
						YellowSockets = YellowSockets + PrismaticSockets
						PrismaticSockets = 0
					end
					if BestGems ~= "" then BestGems = BestGems .. ", " end
					BestGems = BestGems .. PawnGetGemListString(YellowSockets, false, true, false, ScaleName)
				end
				if ItemStats.BlueSocket then
					local BlueSockets = ItemStats.BlueSocket
					if not UseRed and not UseYellow and UseBlue then
						BlueSockets = BlueSockets + PrismaticSockets
						PrismaticSockets = 0
					end
					if BestGems ~= "" then BestGems = BestGems .. ", " end
					BestGems = BestGems .. PawnGetGemListString(BlueSockets, false, false, true, ScaleName)
				end
				if PrismaticSockets and PrismaticSockets > 0 then
					-- If the prismatic sockets were merged with another color, this will be skipped.
					if BestGems ~= "" then BestGems = BestGems .. ", " end
					BestGems = BestGems .. PawnGetGemListString(PrismaticSockets, UseRed, UseYellow, UseBlue, ScaleName)
				end
			end
			if ItemStats.MetaSocket then
				if BestGems ~= "" then BestGems = BestGems .. ", " end
				BestGems = BestGems .. tostring(ItemStats.MetaSocket) .. " " .. META_GEM
			end
			local TooltipText = TextColor .. PawnGetScaleLocalizedName(ScaleName) .. ":  |r" .. BestGems
			PawnSocketingTooltip:AddLine(TooltipText, 1, 1, 1)
		end
	end
	
	-- Show our annotations tooltip.
	PawnSocketingTooltip:Show()
end

------------------------------------------------------------
-- Interface Options
------------------------------------------------------------

function PawnInterfaceOptionsFrame_OnLoad()
	-- NOTE: If you need anything from PawnCommon in the future, you should call PawnInitializeOptions first.

	-- Register the Interface Options page.
	PawnInterfaceOptionsFrame.name = "Pawn"
	InterfaceOptions_AddCategory(PawnInterfaceOptionsFrame)
	-- Update the version display.
	local Version = GetAddOnMetadata("Pawn", "Version")
	if Version then 
		PawnInterfaceOptionsFrame_AboutVersionLabel:SetText(format(PawnUIFrame_AboutVersionLabel_Text, Version))
	end
end

------------------------------------------------------------
-- Other Pawn UI methods
------------------------------------------------------------

-- Switches to a tab by its Page.
function PawnUISwitchToTab(Tab)
	local TabCount = #PawnUITabList
	if not Tab then
		VgerCore.Fail("You must specify a valid Pawn tab.")
		return
	end
	
	-- Hide popup UI.
	PawnUIStringDialog:Hide()
	ColorPickerFrame:Hide()
	
	-- Loop through all tab frames, showing all but the current one.
	local TabNumber
	for i = 1, TabCount do
		local ThisTab = PawnUITabList[i]
		if ThisTab == Tab  then
			ThisTab:Show()
			TabNumber = i
		else
			ThisTab:Hide()
		end
	end
	VgerCore.Assert(TabNumber, "Oh noes, we couldn't find that tab.")
	PawnUICurrentTabNumber = TabNumber
	
	-- Then, update the tabstrip itself.
	VgerCore.Assert(TabNumber, "Couldn't find the tab to show!")
	PanelTemplates_SetTab(PawnUIFrame, TabNumber)
	
	-- Show/hide the scale selector as appropriate.
	if PawnUIFrameNeedsScaleSelector[PawnUICurrentTabNumber] then
		PawnUIScaleSelector:Show()
	else
		PawnUIScaleSelector:Hide()
	end
	
	-- Then, update the header text.
	PawnUIUpdateHeader()
end

function PawnUIUpdateHeader()
	if not PawnUIHeaders[PawnUICurrentTabNumber] then return end
	local ColoredName
	if PawnUICurrentScale and PawnUICurrentScale ~= PawnUINoScale then
		ColoredName = PawnGetScaleColor(PawnUICurrentScale) .. PawnGetScaleLocalizedName(PawnUICurrentScale) .. "|r"
	else
		ColoredName = PawnUINoScale
	end
	PawnUIHeader:SetText(format(PawnUIHeaders[PawnUICurrentTabNumber], ColoredName))
end

-- Switches to a tab and shows the Pawn UI if not already visible.
-- If Toggle is true, close the Pawn UI if it was already visible on that page.
function PawnUIShowTab(Tab, Toggle)
	if not PawnUIFrame:IsShown() then
		PawnUIShow()
		PawnUISwitchToTab(Tab)
	elseif not Tab:IsShown() then
		PlaySound("igCharacterInfoTab")
		PawnUISwitchToTab(Tab)
	else
		if Toggle then
			PawnUIShow()
		else
			PlaySound("igMainMenuOptionCheckBoxOn")
		end
	end
end

-- Makes sure that all first-open initialization has been performed.
function PawnUI_EnsureLoaded()
	if not PawnUIOpenedYet then
		PawnUIOpenedYet = true
		PawnUIFrame_ScaleSelector_Refresh()
		PawnUIFrame_ShowScaleCheck_Label:SetText(format(PawnUIFrame_ShowScaleCheck_Label_Text, UnitName("player")))
		if not PawnCommon then
			VgerCore.Fail("Pawn UI OnShow handler was called before PawnCommon was initialized.")
			PawnUISwitchToTab(PawnUIHelpTabPage)
		elseif not PawnCommon.ShownGettingStarted then
			PawnCommon.ShownGettingStarted = true
			PawnUISwitchToTab(PawnUIHelpTabPage)
		else
			PawnUISwitchToTab(PawnUIValuesTabPage)
		end
	end
end

-- Shows a tooltip for a given control if available.
-- The tooltip used will be the string with the name of the control plus "_Tooltip" on the end.
-- The title of the tooltip will be the text on a control with the same name plus "_Label" on the
-- end if available, or otherwise the actual text on the control if there is any.  If the tooltip text
-- OR title is missing, no tooltip is displayed.
function PawnUIFrame_TooltipOn(self)
	local TooltipText = getglobal(self:GetName() .. "_Tooltip")
	if TooltipText then
		local Label
		local FontString = getglobal(self:GetName() .. "_Label")
		if type(FontString) == "string" then
			Label = FontString
		elseif FontString then
			Label = FontString:GetText()
		elseif self.GetText and self:GetText() then
			Label = self:GetText()
		end
		if Label then
			GameTooltip:ClearLines()
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
			GameTooltip:AddLine(Label, 1, 1, 1, 1)
			GameTooltip:AddLine(TooltipText, nil, nil, nil, 1, 1)
			GameTooltip:Show()
		end
	end
end

-- Hides the game tooltip.
function PawnUIFrame_TooltipOff()
	GameTooltip:Hide()
end

------------------------------------------------------------
-- PawnUIStringDialog methods
------------------------------------------------------------

-- Shows a dialog containing given prompt text, asking the user for a string.
-- Calls OKCallbackFunction with the typed string as the only input if the user clicked OK.
-- Calls CancelCallbackFunction if the user clicked Cancel.
function PawnUIGetString(Prompt, DefaultValue, OKCallbackFunction, CancelCallbackFunction)
	PawnUIGetStringCore(Prompt, DefaultValue, true, OKCallbackFunction, CancelCallbackFunction)
end

-- Shows a dialog with a copyable string.
-- Calls CallbackFunction when the user closes the dialog.
-- Note: Successfully tested with strings of about 900 characters.
function PawnUIShowCopyableString(Prompt, Value, CallbackFunction)
	PawnUIGetStringCore(Prompt, Value, false, CallbackFunction, nil)
end

-- Core function called by PawnUIGetString.
function PawnUIGetStringCore(Prompt, DefaultValue, Cancelable, OKCallbackFunction, CancelCallbackFunction)
	PawnUIStringDialog_PromptText:SetText(Prompt)
	PawnUIStringDialog_TextBox:SetText("") -- Causes the insertion point to move to the end on the next SetText
	PawnUIStringDialog_TextBox:SetText(DefaultValue)
	if Cancelable then
		PawnUIStringDialog_OKButton:Show()
		PawnUIStringDialog_OKButton:SetText(PawnLocal.OKButton)
		PawnUIStringDialog_CancelButton:SetText(PawnLocal.CancelButton)
	else
		PawnUIStringDialog_OKButton:Hide()
		PawnUIStringDialog_CancelButton:SetText(PawnLocal.CloseButton)
	end
	PawnUIStringDialog.OKCallbackFunction = OKCallbackFunction
	PawnUIStringDialog.CancelCallbackFunction = CancelCallbackFunction
	PawnUIStringDialog:Show()
	PawnUIStringDialog_TextBox:SetFocus()
end

-- Cancels the string dialog if it's open.
function PawnUIGetStringCancel()
	if not PawnUIStringDialog:IsVisible() then return end
	PawnUIStringDialog_CancelButton_OnClick()
end

function PawnUIStringDialog_OKButton_OnClick()
	PawnUIStringDialog:Hide()
	if PawnUIStringDialog.OKCallbackFunction then PawnUIStringDialog.OKCallbackFunction(PawnUIStringDialog_TextBox:GetText()) end
end

function PawnUIStringDialog_CancelButton_OnClick()
	PawnUIStringDialog:Hide()
	if PawnUIStringDialog.CancelCallbackFunction then PawnUIStringDialog.CancelCallbackFunction() end
end

function PawnUIStringDialog_TextBox_OnTextChanged()
	if PawnUIStringDialog_TextBox:GetText() ~= "" then
		PawnUIStringDialog_OKButton:Enable()
	else
		PawnUIStringDialog_OKButton:Disable()
	end
end