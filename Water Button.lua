local clickDetector = script.Parent.ClickDetector
local sound = script.Parent.Sound
local cupModel = script.Parent.Cup
local toolName = "Cup"
local renamedTool = "Water"
local emitter = script.Parent.Emitter.Beam

clickDetector.MouseClick:Connect(function(player)
	local backpack = player:FindFirstChild("Backpack")
	if backpack then
		local tool = backpack:FindFirstChild(toolName)
		if tool then
			tool:Destroy()

			sound:Play() 
			cupModel.Transparency = 0 
			emitter.Enabled = true
			
			
	
			for _, descendant in ipairs(cupModel:GetDescendants()) do
				if descendant:IsA("Decal") then
					descendant.Transparency = 0
				end
			end

			sound.Ended:Connect(function()
				local newTool = game.ServerStorage.Cup:Clone()
				newTool.Name = renamedTool
				newTool.Parent = backpack
				cupModel.Transparency = 1 
				emitter.Enabled = false

				for _, descendant in ipairs(cupModel:GetDescendants()) do
					if descendant:IsA("Decal") then
						descendant.Transparency = 1
					end
				end
			end)
		end
	end
end)
