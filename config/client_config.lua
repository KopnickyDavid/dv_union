Config = {}
----IPL----
Config.ipl = 'dv_union' -- if you already have ipl loader change to other name
----BLIP-----
Config.blip = true
----Collect----
Config.goldprop = `prop_gold_trolly_full`
Config.textdistance = 3 --distance to show 3D text
----LOCATIONS----
Config.Locations = {
  Start = vector3(443.4632, -1900.1699, 31.7320),
  Collect = {
    vector3(4.69, -675.87, 16.13),
    vector3(-5.29, -670.0, 16.13),
    vector3(-7.28, -675.82, 16.13),
    vector3(3.41, -678.07, 16.13)
  },
  Hack = vector3(-4.33, -686.97, 16.13),
  Escape = {
    TeleportCoords = vector3(7.78, -655.88, 16.09),
    TextCoords = vector3(6.08, -659.55, 16.13)
  },
  Teleports = {
    Up = vector3(9.89, -668.18, 33.45), -- Lokace kde budeš teleportovat
    Down = vector3(1.08, -702.76, 16.13)
  }
}
----DRAWTEXT----
Config.DrawTexts = {
    "[E] to escape",
    "[E] DOWN", 
    "[E] UP",
    "[E] to start heist",
    "[E] to open vault",
    "[E] to collect money",
  }