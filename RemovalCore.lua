--[[

Layered Clothing Removal Tool

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



local ClothingRemover = require(script.Remove3DClothing)

local function RemovalProcess(plr)
	repeat 
		wait()
	until plr:HasAppearanceLoaded() == true
	ClothingRemover.RemoveClothing(plr)
end



game:GetService("Players").PlayerAdded:Connect(function(plr)
	wait(2)
	spawn(function()
		RemovalProcess(plr)
	end)
	
end)

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function()
		RemovalProcess(v)
	end)
end
