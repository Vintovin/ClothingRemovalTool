--[[

Layered Clothing Removal Tool --> Removal Module

   __  ___          __       __                _       __      
  /  |/  /___ _ ___/ /___   / /  __ __  _  __ (_)___  / /_ ___ 
 / /|_/ // _ `// _  // -_) / _ \/ // / | |/ // // _ \/ __// _ \
/_/  /_/ \_,_/ \_,_/ \__/ /_.__/\_, /  |___//_//_//_/\__/ \___/
                               /___/                           

This code was whipped up by vinto himself
31/05/2022

https://github.com/Vintovin/ClothingRemovalTool

EXCEL#8402
]]--


local module = {}


local function is3dClothing(ac)
	if ac.AccessoryType == Enum.AccessoryType.Hair then
		return false
	elseif ac.AccessoryType == Enum.AccessoryType.Hat then
		return false
	elseif ac.AccessoryType == Enum.AccessoryType.Face then
		return false
	else
		return true
	end
	
	
end


module.RemoveClothing = function(plr)
	local char = plr.Character
	if char == nil then
		plr.CharacterAdded:Wait()
		char = plr.Character
	end
	
	for i,v in pairs(char:GetChildren()) do
		if v:IsA("Accessory") then
			if is3dClothing(v) == true then
				v:Destroy()
			end
		end
	end
	print("Removed clothing successfully for: "..plr.Name)
end



return module
