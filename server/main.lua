if Config.Framework == 'ESX' then
    ESX = exports["es_extended"]:getSharedObject()
end

local animal_prices = {}
for k, v in pairs(Config.Animals) do
	animal_prices[k] = v.Worth
end

if Config.Framework == 'ESX' then
    RegisterNetEvent("AG_Hunting:SellSkin", animal)
    AddEventHandler("AG_Hunting:SellSkin", function(animal)
	    local xPlayer = ESX.GetPlayerFromId(source)

	    if animal_prices[animal] then
		    xPlayer.addMoney(animal_prices[animal]) -- Adds the money
        else
		    xPlayer.showNotification("~r~[ERROR]~s~ The item doesn't seem to exist in the config", false, true, 90) -- Shows notification
	    end
    end)
end
