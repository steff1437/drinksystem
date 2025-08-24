local ToolNames = {"Cup"}
local Storage = game:GetService("ServerStorage")

local Part = script.Parent
local ProximityPrompt = Part:WaitForChild("ProximityPrompt")

local function giveToolsToPlayer(Player)
	if Player and Player.Character then
		local Backpack = Player:WaitForChild("Backpack")
		local Character = Player.Character

		for _, toolName in ipairs(ToolNames) do
			local hasToolInBackpack = Backpack:FindFirstChild(toolName) ~= nil
			local hasToolInCharacter = Character:FindFirstChild(toolName) ~= nil

			if not hasToolInBackpack and not hasToolInCharacter then
				local Tool = Storage:FindFirstChild(toolName)
				if Tool then
					local ToolClone = Tool:Clone()
					ToolClone.Parent = Backpack
				end
			end
		end
	end
end

ProximityPrompt.Triggered:Connect(giveToolsToPlayer)
