WoWJapanizerGarrisonToolTip = WoWJapanizerToolTip:New("WoWJapanizerGarrisonToolTip")
WoWJapanizerGarrisonToolTip.Tooltip = WoWJapanizerAssistTooltip

function WoWJapanizerGarrisonToolTip:OnEnable()
	hooksecurefunc("Garrison_LoadUI", function()				
		hooksecurefunc("GarrisonBuildingList_SelectTab", function(tab)
			for _, button in next, GarrisonBuildingFrame.BuildingList.Buttons do
				button:HookScript("OnEnter", function(_button)
					self:OnShowList(_button)
				end)

				button:HookScript("OnLeave", function(_button)
					self:OnHide()
				end)
			end

			for _, plot in next, GarrisonBuildingFrame.MapFrame.Plots do
				plot:HookScript("OnEnter", function(_plot)
					self:OnShowPlot(_plot)
				end)

				plot:HookScript("OnLeave", function(_plot)
					self:OnHide()
				end)
			end
		end)			
	end)
end

function WoWJapanizerGarrisonToolTip:OnShowPlot(_plot)
	self:OnShow(_plot, nil, _plot.buildingID )
end

function WoWJapanizerGarrisonToolTip:OnShowList(_button)
	self:OnShow(_button, _button.info.name, _button.info.buildingID)	
end

function WoWJapanizerGarrisonToolTip:OnShow(_button, name, id)
	if id == nil then 
		return 
	end
    
	local w = GameTooltip:GetWidth()
	
	if name == nil then
		self.Tooltip:SetOwner(_button, "ANCHOR_TOPRIGHT", 0, 0)
	else
		self.Tooltip:SetOwner(_button, "ANCHOR_BOTTOMLEFT", w, 0)
	end
    
	w = w - 20
    self.Tooltip:ClearLines()
    self.Tooltip:SetMinimumWidth(w)
	
	local txt = WoWJapanizer_Garrison:Get(id)
	
	if txt == nil then	
		txt = "翻訳データがありません"
		if name == nil then
			self:AddText("(" .. id .. ")" .. "\n\n" .. txt)	
		else
			self:AddText(name .. "(" .. id .. ")" .. "\n\n" .. txt)	
		end
	else
		if name == nil then
			self:AddText(txt)
		else
			self:AddText(name .. "(" .. id .. ")" .. "\n\n" .. txt)
		end
		
	end
	
	self.Tooltip:SetWidth(200)
    self.Tooltip:Show()
	
end

function WoWJapanizerGarrisonToolTip:OnHide()
    if self.Tooltip:IsShown() then
        self.Tooltip:Hide()

        self.Tooltip:SetWidth(0)
        self.Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
    end
end

function WoWJapanizerGarrisonToolTip:DebugPrint(txt)
    if WoWJapanizerDebugFrame:IsShown() then
        local editbox = WoWJapanizerDebugFrameScrollFrameText

        editbox:SetText(editbox:GetText() .. "\n" .. txt)
    end
end	









