local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent("jz-mail:giveitem") 
AddEventHandler("jz-mail:giveitem", function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local index = math.random(1, #Config.Rewards)
    player.Functions.AddItem(Config.Rewards[index].item, Config.Rewards[index].amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Rewards[index].item], 'add')
end)