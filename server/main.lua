local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-gallery:server:sellItems', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price)
        exports['qb-management']:AddMoney('gallery', amount)
        TriggerClientEvent('QBCore:Notify', src, "You have sold your items")
    else 
		TriggerClientEvent('QBCore:Notify', src, "You are not a pawnshop employee!")
	end
end)

RegisterServerEvent("qb-gallery:server:Charge", function(citizen, price)
    local src = source
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(citizen))
    local amount = tonumber(price)
    local commission = amount * Config.Commission -- AMOUNT THE EMPLOYEE RECEIVES AS COMMISSION (12% BY DEFAULT)
	if billed ~= nil then
		if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
			if amount and amount > 0 then
                billed.Functions.AddMoney('cash', amount, "gallery-payment")
                exports['qb-management']:RemoveMoney('gallery', amount)
                biller.Functions.AddMoney('bank', commission)
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, '$'..amount..' payment received.', 'success') -- CUSTOMER NOTIFICATION OF PAYMENT
                TriggerClientEvent('QBCore:Notify', biller.PlayerData.source, '$'..amount..' payment sent, commission received successfully.', 'success') -- EMPLOYEE NOTIFICATION OF PAYMENT
			else TriggerClientEvent('QBCore:Notify', src, 'Must Be A Valid Amount Above 0', 'error')	end
		else TriggerClientEvent('QBCore:Notify', src, 'You cannot pay yourself...', 'error') end
	else TriggerClientEvent('QBCore:Notify', src, 'Person not available', 'error') end
end) 

-- Uncomment Below if you do not want a job check (mw-shopseller) 

--[[ RegisterServerEvent("qb-gallery:server:sellItems")
AddEventHandler("qb-gallery:server:sellItems", function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = 0
    if Player.PlayerData.items ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "rolex" then 
                    price = price + (Config.Items["rolex"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("rolex", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "goldbar" then 
					price = price + (Config.Items["goldbar"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("goldbar", Player.PlayerData.items[k].amount, k)
				end
            end
        end
        Player.Functions.AddMoney("cash", price)
		TriggerClientEvent('QBCore:Notify', src, "Sold, check your cash!")
	end
end) ]]