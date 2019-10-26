local match = string.match
local strsplit = strsplit
local VERSION = "1.2.1"

local MrrlFirstLogin = CreateFrame("Frame", "MrrlFirstLoginFrame")
MrrlFirstLogin:RegisterEvent("PLAYER_LOGIN")
MrrlFirstLogin:SetScript("OnEvent",
	function(self, event, ...)
		MRI("Mrrls Item Information loaded. Version: " .. VERSION)
		MrrlFirstLogin:UnregisterEvent("PLAYER_LOGIN")
	end)

local function GameTooltip_OnTooltipSetItem(tooltip)
	local _, link = tooltip:GetItem()
	if not link then return; end
	
	local itemString = match(link, "item[%-?%d:]+")
	-- if not itemString then return;end --Test to see if an error with dungeon keystones is fixed.


	function getitemId(itemInformation) --Get the itemId, and return it. For use in a pcall function.
		local _, itemId = strsplit(":", itemInformation)
		return itemId
	end


	success, itemId = pcall(getitemId, itemString)
    if ( success ) then
		-- local _, itemId = strsplit(":", itemString)

		--From idTip: http://www.wowinterface.com/downloads/info17033-idTip.html
		if itemId == "0" and TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() then
			if (GetMouseFocus():GetName()) == "TradeSkillSkillIcon" then
				itemId = GetTradeSkillItemLink(TradeSkillFrame.selectedSkill):match("item:(%d+):") or nil
			else
				for i = 1, 8 do
					if (GetMouseFocus():GetName()) == "TradeSkillReagent"..i then
						itemId = GetTradeSkillReagentItemLink(TradeSkillFrame.selectedSkill, i):match("item:(%d+):") or nil
						break
					end
				end
			end
		end

		if itemId and itemId == "168094" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("1x Scrying Stone")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "168091" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("1x Barnacled Lockbox")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "168092" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("Mardivas reagent")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "168093" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("3x Prismatic Manapearls")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "168095" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("Azerite power")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "168096" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Contains:")
			tooltip:AddLine("different Nazjatar items.")
			tooltip:AddLine("Might not open if you already have the unique item in your bags.")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "168097" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("1x Benthic Token")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "170158" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("7x Prismatic Manapearl")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "170101" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("1x Benthic Token")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "170162" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Contains:")
			tooltip:AddLine("different Nazjatar items.")
			tooltip:AddLine("Might not open if you already have the unique item in your bags.")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "170157" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("Mardivas reagent")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "170152" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("Abyssal Conch")
			tooltip:AddLine("Gives 150 rep with Nazjatar faction")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "170159" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Becomes:")
			tooltip:AddLine("3x Prismatic Manapearl")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "170153" then
			tooltip:AddLine(" ") --blank line
			tooltip:AddLine("Gives 150 experience to each bodyguard")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "169202" then
			tooltip:AddLine(" ")
			tooltip:AddLine("Attention!")
			tooltip:AddLine("This is the mount")
			tooltip:AddLine(" Buy if you can, it will go away for a while")
			tooltip:AddLine(" ")
		end
		if itemId and itemId == "169885" then
			tooltip:AddLine(" ")
			tooltip:AddLine("This is not consume on use!")
			tooltip:AddLine("The buff is permanent.")
			tooltip:AddLine(" ")
		end
	else
	end
end

GameTooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)

function MRI(text, prefix)
	local frame = DEFAULT_CHAT_FRAME
	frame:AddMessage(text, 0.2, 0.66, 0.8);
end
