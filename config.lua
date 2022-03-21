Config = {}
----FRAMEWORK/ALERT/DEBUG----
Config.framework = QB --now only QB 
Config.alert = 'linden' -- QB/linden
Config.Debug = true --some more logs
Config.version = 10000 --every 10s check for version
----BLIP-----
Config.blip = true
----START HEIST----
Config.startheist = vector3(443.4632, -1900.1699, 31.7320) --start heist
----Money----
Config.getMin = 1 --minimum
Config.getMax = 20 --maximum
----Item----
Config.item = "markedbills" --item you get
----Collect----
Config.collectpoint = vector3(4.69, -675.87, 16.13)--collecting money
Config.collectpoint1 = vector3(-5.29, -670.0, 16.13)--collecting money
Config.collectpoint2 = vector3(-7.28, -675.82, 16.13)--collecting money
Config.collectpoint3 = vector3(3.41, -678.07, 16.13)--collecting money
Config.TEXTdistance = 5 --distance to show 3D text
----HACKING----
Config.hack = vector3(-4.33, -686.97, 16.13) --location for hacking/opening vault
----ESCAPE----
Config.escape = vector3(7.78, -655.88, 16.09)--where teleport
Config.escapetext = vector3(6.08, -659.55, 16.13)--where show text
----TELEPORT----
Config.teleportuptext = vector3(9.89, -668.18, 33.45)--where show text
Config.teleportup = vector3(1.08, -702.76, 16.13)--where teleport
Config.teleportdowntext = vector3(1.08, -702.76, 16.13)--where show text
Config.teleportdown = vector3(9.89, -668.18, 33.45)--where teleport
----WEBHOOKS----
Config.webhook = "https://discord.com/api/webhooks/xxxx"
----DRAWTEXT----
Config.draw1 = "[E] to escape"
Config.draw2 = "[E] DOWN"
Config.draw3 = "[E] UP"
Config.draw4 = "[E] to start heist"
Config.draw5 = "[E] to open vault"
Config.draw6 = "[E] to collect money"

