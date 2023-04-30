Config = {}
----FRAMEWORK/ALERT/DEBUG----
Config.framework = 'esx' -- qb/esx
Config.alert = 'linden' -- QB/linden/CD
Config.Debug = false --some more logs
Config.version = 10000 --every 10s check for version
----Money----
Config.getMin = 1 --minimum
Config.getMax = 30 --maximum
----Item----
Config.item = "cashroll" --item you get
Config.hackingitem = "laptop" -- item that you need for hacking
Config.givecash = 500
----WEBHOOKS----
Config.webhook = "https://discord.com/api/webhooks/xxxx" --discord webhooks
----PEDS----
Config.peds = { -- coords for ped spawn
    vector3(0.89, -701.91, 16.13),
    vector3(-1.46, -692.76, 16.13),
    vector3(-8.25, -692.35, 16.13),
    vector3(-13.5, -695.92, 16.13),
    vector3(14.04, -644.79, 16.09)
}
Config.ped = { --peds
    "s_m_y_cop_01", -- 3 male police peds
    "s_f_y_cop_01" -- 2 female police peds
}
Config.pedweapon = 'WEAPON_CARBINERIFLE' -- what weapon will ped have
Config.pedarmour = 200 -- what armour will ped have
