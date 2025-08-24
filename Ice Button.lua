local clickDetector = script.Parent.ClickDetector
local part = script.Parent
local sound = part.Sound
local cup = part.Cup
local emitter = part.Emmiter.liq

clickDetector.MouseClick:Connect(function(player)
	local function findTool(player)
		local backpack = player:FindFirstChild("Backpack")
		local character = player.Character

		for _, container in ipairs({backpack, character}) do
			if container then
				for _, tool in ipairs(container:GetChildren()) do
					if tool:IsA("Tool") and tool:GetAttribute("JTDRINKSYS") then
						return tool
					end
				end
			end
		end
		return nil
	end

	local tool = findTool(player)
	if tool then
		tool.Parent = nil -- Remove tool from inventory

		-- Make the cup visible
		cup.Transparency = 0 

		-- Make all Decals inside the cup visible
		for _, decal in ipairs(cup:GetChildren()) do
			if decal:IsA("Decal") then
				decal.Transparency = 0
			end
		end

		emitter.Enabled = true
	

		sound:Play()
		sound.Ended:Wait() -- Wait for the sound to finish

		emitter.Enabled = false

		-- Hide the cup again
		cup.Transparency = 1

		-- Hide all Decals again
		for _, decal in ipairs(cup:GetChildren()) do
			if decal:IsA("Decal") then
				decal.Transparency = 1
			end
		end

		-- Give the player a new tool with " w/ Ice" added
		local newTool = tool:Clone()
		newTool.Name = tool.Name .. " w/ Ice"
		newTool.Parent = player.Backpack -- Put the new tool in their inventory
	end
end)
