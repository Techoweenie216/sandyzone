
Citizen.CreateThread(function()
   
	while true do
	local ped = PlayerPedId()
	local playerCoords = GetEntityCoords(ped)
	local x,y,z = table.unpack(GetEntityCoords(ped, true))
	CurrentZone = GetNameOfZone(x, y, z)

	Citizen.Wait(0)

	-- find out if player is in the Sandy Zone
	InArea = IsEntityInZone(ped, 'SANDY')	

	if InArea == 1 then

		-- if player is in the zone see if they are in a vehicle
		if IsPedInAnyVehicle(PlayerPedId(), false) then
    			
			local vehicle = GetVehiclePedIsIn(ped, false)
			local class = GetVehicleClass(vehicle)
			
			-- player is in a vehicle now check what class of vehicle  
			if class >= 4 and class <= 8 then

				SetRelationshipBetweenGroups(5, GetHashKey('AMBIENT_GANG_HILLBILLY'), GetHashKey('PLAYER'))
				SetRelationshipBetweenGroups(5, GetHashKey('SPECIAL'), GetHashKey('PLAYER'))	
				SetRelationshipBetweenGroups(5, GetHashKey('NO_RELATIONSHIP'), GetHashKey('PLAYER'))
				SetRelationshipBetweenGroups(5, GetHashKey('CIVMALE'), GetHashKey('PLAYER'))
				SetRelationshipBetweenGroups(5, GetHashKey('CIVFEMALE'), GetHashKey('PLAYER'))

				TaskCombatPed(GetHashKey('AMBIENT_GANG_HILLBILLY'), ped)
				TaskCombatPed(GetHashKey('SPECIAL'), ped)
				TaskCombatPed(GetHashKey('NO_RELATIONSHIP'), ped)
				TaskCombatPed(GetHashKey('CIVMALE'), ped)
				TaskCombatPed(GetHashKey('CIVFEMALE'), ped)
			else
				SetRelationshipBetweenGroups(3, GetHashKey('AMBIENT_GANG_HILLBILLY'), GetHashKey('PLAYER'))
				SetRelationshipBetweenGroups(3, GetHashKey('SPECIAL'), GetHashKey('PLAYER'))	
				SetRelationshipBetweenGroups(3, GetHashKey('NO_RELATIONSHIP'), GetHashKey('PLAYER'))
				SetRelationshipBetweenGroups(3, GetHashKey('CIVMALE'), GetHashKey('PLAYER'))
				SetRelationshipBetweenGroups(3, GetHashKey('CIVFEMALE'), GetHashKey('PLAYER'))			
			end
		end
	else
		SetRelationshipBetweenGroups(3, GetHashKey('AMBIENT_GANG_HILLBILLY'), GetHashKey('PLAYER'))
		SetRelationshipBetweenGroups(3, GetHashKey('SPECIAL'), GetHashKey('PLAYER'))	
		SetRelationshipBetweenGroups(3, GetHashKey('NO_RELATIONSHIP'), GetHashKey('PLAYER'))
		SetRelationshipBetweenGroups(3, GetHashKey('CIVMALE'), GetHashKey('PLAYER'))
		SetRelationshipBetweenGroups(3, GetHashKey('CIVFEMALE'), GetHashKey('PLAYER'))	
		
	end

   end
end)
