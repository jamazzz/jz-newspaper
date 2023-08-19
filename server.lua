local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent("jz-newspaper:giveitem") 
AddEventHandler("jz-newspaper:giveitem", function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local index = math.random(1, #Config.Rewards)
    if Config.Framework == 'qb' then
        if Config.Inventory == 'qb' then
            player.Functions.AddItem(Config.Rewards[index].item, Config.Rewards[index].amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Rewards[index].item], 'add')
        else if Config.Inventory == 'ox' then
            exports.ox_inventory:AddItem(player, Config.Rewards[index].item, Config.Rewards[index].amount)
        end
    end 
end)