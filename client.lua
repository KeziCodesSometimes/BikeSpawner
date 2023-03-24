Config = {
    coords = vector3(-191.82, -1612.79, 33.92),
     vehicleSpawnCoords = vector4(-191.82, -1612.79, 33.92, 0.0),
     key = 38 -- key to open menu
}

-- DONT EDIT BELOW THIS 
local menu = MenuV:CreateMenu(GetPlayerName(PlayerId()), 'Bike Spawner', 'topright', 255, 255, 0, 'size-125', 'default', 'menuv', 'bikespawner', 'native')

local menu_button = menu:AddButton({  label = 'Sanchez', value = ""  })
local menu2_button = menu:AddButton({  label = 'Enduro', value = "" })

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end





Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local distance = #(playerCoords - Config.coords)
    if distance < 5 then
        alert("Press ~INPUT_PARACHUTE_BRAKE_RIGHT~ to open bike spawner.")
        if IsControlJustReleased(0, Config.key) then 
      menu:Open()
        end
    end
  end
end)

local vehicleModel = "Sanchez" 
local vehicleModel1 =  "enduro" 
menu_button:On('select', function()
    RequestModel(vehicleModel)
  while not HasModelLoaded(vehicleModel) do
    Citizen.Wait(0)
  end

  local vehicle = CreateVehicle(vehicleModel, Config.vehicleSpawnCoords.x, Config.vehicleSpawnCoords.y, Config.vehicleSpawnCoords.z, Config.vehicleSpawnCoords.w, true, false)
  TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

end)


menu2_button:On('select', function()
    RequestModel(vehicleModel)
  while not HasModelLoaded(vehicleModel) do
    Citizen.Wait(0)
  end

  local vehicle = CreateVehicle(vehicleModel1, Config.vehicleSpawnCoords.x, Config.vehicleSpawnCoords.y, Config.vehicleSpawnCoords.z, Config.vehicleSpawnCoords.w, true, false)
  TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

end)

print([[
   [Bike Spawner]: [Script Loaded.]
]])
