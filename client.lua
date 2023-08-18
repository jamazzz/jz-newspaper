local QBCore = exports['qb-core']:GetCoreObject()
local objects = {}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('jz-mail:server:GetObjects', function(incObjects)
        objects = incObjects
    end)
end)

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

--Events
local rob = false
RegisterNetEvent("jz-mail:client:StealMail", function(data)
    local ped = PlayerPedId()
    if rob then
        QBCore.Functions.Notify(Config.CooldownText, "error")
        Citizen.Wait(Config.cooldown)
        rob = false
    else
    if IsPedInAnyVehicle(ped) then
        TriggerEvent('QBCore:Notify', Config.CarText, 'error')
        return
    end
    local seconds = math.random(9,12)
    local circles = math.random(1,3)
            exports['ps-ui']:Circle(function(success)
                if success then
                    rob = true
                    loadAnimDict("amb@prop_human_bum_bin@base")
                    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("robbing_mail", Config.ProgressbarText, math.random(5000, 7000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, function()
                    end, function()
                        local coords = GetEntityCoords(data.entity)
                        SetEntityAsMissionEntity(data.entity, true, true)
                        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
                        TriggerServerEvent("jz-mail:giveitem")
                        local randl = math.random(1,10)
                        if  randl > Config.Chance then
                            exports['ps-dispatch']:SuspiciousActivity()
                        end
                    end)
                end
            end, circles, seconds)
            rob = true
    StopAnimTask(ped, "melee@large_wpn@streamed_core", "base", 1.0)
end
end)
--
exports['qb-target']:AddTargetModel(Config.MailboxModels, {
    options = {
        {
            type = "client",
            event = "jz-mail:client:StealMail",
            icon = Config.Icon,
            label = Config.Label,
            item = Config.RequiredItem,
        },
    },
    distance = 2.5
})


