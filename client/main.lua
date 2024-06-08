if Config.Framework == 'ESX' then
    ESX = exports["es_extended"]:getSharedObject()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local radius = 3.0
        local closestPed, distance = getClosestPed(playerPed, radius)

        if closestPed and distance <= radius then
            local closestModel = GetEntityModel(closestPed)

            for k,v in pairs(Config.Animals) do
				local modelCheck = GetHashKey(k)
                if modelCheck == closestModel then
                    while #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestPed)) <= 1.5 do
                        Citizen.Wait(0)
                        local closestPedCoords = GetEntityCoords(closestPed)

                        if IsEntityDead(closestPed) then
                            DrawText3D(closestPedCoords, "Press [~b~E~w~] to skin animal", 1.0, 1)
                            if IsControlJustReleased(0, 51) then
                                RequestAnimDict("random@domestic")
                                while not HasAnimDictLoaded("random@domestic") do
                                    Citizen.Wait(1)
                                end
                                TaskPlayAnim(playerPed, "random@domestic", "pickup_low", 8.0, -8, 2000, 2, 0, 0, 0, 0)
                                Citizen.Wait(2000)
                                DeleteEntity(closestPed)
				InfoMessage('Animal skin is worth ~g~$' .. v.Worth)
                                if Config.Framework == 'ESX' then
                                    TriggerServerEvent('AG_Hunting:SellSkin', k)
                                else
                                    AddMoneyCode(v.Worth)
                                end
                                break
                            end
                        end
                    end
                    break
                end
            end
        end
    end
end)
