--[[

Layered Clothing Removal Tool

   __  ___          __       __                _       __      
  /  |/  /___ _ ___/ /___   / /  __ __  _  __ (_)___  / /_ ___ 
 / /|_/ // _ `// _  // -_) / _ \/ // / | |/ // // _ \/ __// _ \
/_/  /_/ \_,_/ \_,_/ \__/ /_.__/\_, /  |___//_//_//_/\__/ \___/
                               /___/                           

This code was whipped up by vinto himself
31/05/2022

EXCEL#8402
]]--



ClothingRemover = require(script.Remove3DClothing)
StaffGroupID = 0


local function isStaff(plr)
	if plr:IsInGroup(StaffGroupID) then
		return(true)
	else
		return(false)
	end
end


local function RemovalProcess(plr)
	repeat 
		wait()
	until plr:HasAppearanceLoaded() == true
	ClothingRemover.RemoveClothing(plr)
end



game:GetService("Players").PlayerAdded:Connect(function(plr)
	if isStaff(plr) == true then
		spawn(function()
			RemovalProcess(plr)
		end)
	end
end)

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	if isStaff(v) == true then
		spawn(function()
			RemovalProcess(v)
		end)
	end	
end
