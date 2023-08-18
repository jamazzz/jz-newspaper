local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent("jz-mail:giveitem") 
AddEventHandler("jz-mail:giveitem", function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local rand3 = math.random(1,3)
    if rand3 == 1 then
    player.Functions.AddItem(Config.Reward1, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Reward1], 'add')
    elseif rand3 == 2 then
    player.Functions.AddItem(Config.Reward2, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Reward2], 'add')
    else
    player.Functions.AddItem(Config.Reward3, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Reward3], 'add')
    end
end)