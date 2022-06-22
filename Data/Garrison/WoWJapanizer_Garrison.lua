WoWJapanizer_Garrison = { }

function WoWJapanizer_Garrison:Get(id)	
	id = tostring(id)
	
	if not self.Chain[id] then
		return nil
	end
	
	id1 = self.Chain[id][1]
	id2 = self.Chain[id][2]
	id3 = self.Chain[id][3]
	
	text = ""
	
	if id1 == nil then
        return nil
    end
	if id2 == nil then
        return nil
    end
	if id3 == nil then
        return nil
    end
	
	if self.Data[id1] and self.Data[id1][1] then
		text = "Level 1:\n" .. self.Data[id1][1] .. "\n\n" ..
			   "Level 2:\n" .. self.Data[id2][1] .. "\n\n" .. 
			   "Level 3:\n" .. self.Data[id3][1] .. "\n"
	end
	
    if not text or text == "" then
        return nil
    end

    return text
end

