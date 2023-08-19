local QBCore = exports['qb-core']:GetCoreObject()
local objects = {}

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

--Events
local rob = false
RegisterNetEvent("jz-newspaper:client:Stealnewspaper", function(data)
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
    local seconds = Config.CircleTime
    local circles = Config.CircleNumber
            exports['ps-ui']:Circle(function(success)
                if success then
                    rob = true
                    loadAnimDict("amb@prop_human_bum_bin@base")
                    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("robbing_newspaper", Config.ProgressbarText, math.random(5000, 7000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, function()
                    end, function()
                        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
                        TriggerServerEvent("jz-newspaper:giveitem")
                        local randl = math.random(1,10)
                        if  randl > Config.Chance then
                            exports['ps-dispatch']:SuspiciousActivity()
                        end
                    end)
                end
            end, circles, seconds)
            rob = true
end
end)
--

if Config.Target == 'qb' then
exports['qb-target']:AddTargetModel(Config.newspaperboxModels, {
    options = {
        {
            type = "client",
            event = "jz-newspaper:client:Stealnewspaper",
            icon = Config.Icon,
            label = Config.Label,
            item = Config.RequiredItem,
        },
    },
    distance = 2.5
})
else if Config.Target == 'ox' then
    exports.ox_target:addModel(Config.newspaperboxModels, {
        {
            type = "client",
            event = "jz-newspaper:client:Stealnewspaper",
            icon = Config.Icon,
            label = Config.Label,
            item = Config.RequiredItem,
            distance = 2.5
        }
      })
end
end


