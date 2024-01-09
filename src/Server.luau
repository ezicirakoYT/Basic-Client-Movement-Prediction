local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
--OOOf
local function FireAllExcept(Remote: UnreliableRemoteEvent,Expection,func)
	for index,value in Players:GetPlayers() do
		if value ~= Expection then
			Remote:FireClient(value,func(value))
		end
	end
end

while task.wait() do
	for index,player in Players:GetPlayers() do
		local Character = player.Character
		
		if Character == nil then 
			continue
		end
		if Character.PrimaryPart == nil then 
			continue 	
		end
		
		local CurrentCF = Character.HumanoidRootPart.CFrame
		
	--	game.ReplicatedStorage.UnreliableRemoteEvent:FireAllClients(CurrentCF,"Part1")
		
		task.delay(player:GetNetworkPing()*2,function()			
		--	game.ReplicatedStorage.UnreliableRemoteEvent:FireAllClients(CurrentCF,"Part2")
		end)
		FireAllExcept(
			game.ReplicatedStorage.UnreliableRemoteEvent,
			player,
			function(OtherPlayer: Player)
				return CurrentCF + Character.HumanoidRootPart.AssemblyLinearVelocity * (player:GetNetworkPing()), player
			end
		)
	end
end
