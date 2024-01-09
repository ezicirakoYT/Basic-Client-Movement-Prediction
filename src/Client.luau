local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")

local function CreatePart(Color)
	local Part = script.Part:Clone()
	Part.Parent = workspace
	Part.Color = Color
	
	return Part
end

local Parts: {[any]: Part} = {
	Part1 = CreatePart(Color3.fromRGB(255)),
	Part2 = CreatePart(Color3.fromRGB(85, 255, 0)),
	Part3 = CreatePart(Color3.fromRGB(255, 255, 127))
}


game.ReplicatedStorage.UnreliableRemoteEvent.OnClientEvent:Connect(function(CF,Player: Player)
	if Player.Character == nil then
		return
	end
	
	if Player.Character.PrimaryPart == nil then
		return
	end
	
	TweenService:Create(
		Player.Character.HumanoidRootPart,
		TweenInfo.new(workspace:GetAttribute("PredictTween"),Enum.EasingStyle.Linear),
		{
			CFrame = CF
		}
	):Play()
	
	--[[TweenService:Create(
		Parts.Part3,
		TweenInfo.new(workspace:GetAttribute("PredictTween"),Enum.EasingStyle.Linear),
		{
			CFrame = CF
		}
	):Play()]]
end)
