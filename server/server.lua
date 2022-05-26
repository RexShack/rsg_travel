local sharedItems = exports['qbr-core']:GetItems()

RegisterServerEvent('rsg_travel:server:buyticket')
AddEventHandler('rsg_travel:server:buyticket', function(price)
	local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
	local cashBalance = Player.PlayerData.money["cash"]
	if cashBalance >= price then
		Player.Functions.RemoveMoney("cash", price, "purchase-ticket")
		Player.Functions.AddItem('boatticket', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['boatticket'], "add")
		TriggerClientEvent('rsg_notify:client:notifiy', src, 'boat ticket bought for $'..price)
	else 
		TriggerClientEvent('rsg_notify:client:notifiy', src, 'you don\'t have enough cash to do that!')
	end
end)