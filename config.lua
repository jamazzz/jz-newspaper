Config = {}
Config.MailboxModels = {
    "prop_news_disp_03a",
    "prop_news_disp_02a",
    "prop_news_disp_01a",
    "prop_news_disp_03e",
}

Config.RequiredItem = "weapon_crowbar" -- Change this to whatever item you want to require to steal a mailbox

Config.Cooldown = 10000 -- in milliseconds

Config.Chance = 5 -- 1-10, 10 being 100% chance of cops being called

Config.Reward1 = "water_bottle" -- Change this to whatever item you want to give out (item name)

Config.Reward2 = "sandwich" -- Change this to whatever item you want to give out (item name)

Config.Reward3 = "ligther" -- Change this to whatever item you want to give out (item name)

Config.CooldownText = "Empty : (" -- Change this to whatever you want the notification to say when the player attempts to steal another mailbox before the cooldown is up

Config.CarText = "You can't do this in a car!" -- Change this to whatever you want the notification to say when the player attempts to steal a mailbox while in a car

Config.Label = "Steal Mail" -- Change this to whatever you want the label to be on the mailbox

Config.Icon = "fa-solid fa-envelope" -- Change this to whatever you want the icon to be on the mailbox

Config.ProgressbarText = "Stealing Mail" -- Change this to whatever you want the progressbar text to be