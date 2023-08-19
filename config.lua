Config = {}

Config.Framework = 'qb' 

Config.Target = 'qb'

Config.Inventory = 'qb'

-- In qb you can use it in this 2 ways:
-- Config.Framework = 'qb' Config.Target = 'qb'
-- Config.Framework = 'qb' Config.Target = 'ox'

-- In ESX you can use it in this way: (Coming Soon)
-- Config.Framework = 'esx' Config.Target = 'ox' (Coming Soon)

-- Inventory Options 
-- QB / OX / ESX (Coming Soon)

Config.newspaperboxModels = {
    "prop_news_disp_03a",
    "prop_news_disp_02a",
    "prop_news_disp_01a",
    "prop_news_disp_03e",
}

Config.RequiredItem = "weapon_crowbar" -- Change this to whatever item you want to require to steal a newspaperbox

Config.Cooldown = 10000 -- in milliseconds

Config.Chance = 5 -- 1-10, 10 being 100% chance of cops being called

Config.Rewards = {
    {
        item = 'water_bottle',
        amount = 1
    },
    {
        item = 'sandwich',
        amount = 1
    },
    {
        item = 'lighter',
        amount = 1
    }
}

Config.CircleTime = math.random(9,12)

Config.CircleNumber = math.random(1,3)

Config.CooldownText = "Empty : (" -- Change this to whatever you want the notification to say when the player attempts to steal another newspaperbox before the cooldown is up

Config.CarText = "You can't do this in a car!" -- Change this to whatever you want the notification to say when the player attempts to steal a newspaperbox while in a car

Config.Label = "Steal newspaper" -- Change this to whatever you want the label to be on the newspaperbox

Config.Icon = "fa-solid fa-envelope" -- Change this to whatever you want the icon to be on the newspaperbox

Config.ProgressbarText = "Stealing newspaper" -- Change this to whatever you want the progressbar text to be