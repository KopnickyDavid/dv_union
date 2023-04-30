Config = {}
----FRAMEWORK----
Config.progressbar = 'esx'                      -- qb/esx
Config.vehicle = 'esx'                          -- qb/esx
Config.car = 1747439474                        -- car hash
Config.loaded = 'esx:playerLoaded' -- 'QBCore:Client:OnPlayerLoaded'/'esx:playerLoaded'
----IPL----
Config.ipl = 'dv_union'                        -- if you already have ipl loader change to other name
----BLIP-----
Config.blip = false                            -- false = disable blip
----Collect----
Config.textdistance = 1.5                      --distance to show 3D text
----LOCATIONS----
Config.Locations = {
  Start = vector3(443.4632, -1900.1699, 31.7320), -- start location
  Collect = {                                     -- collect points
    vector3(4.69, -675.87, 16.13),
    vector3(-5.29, -670.0, 16.13),
    vector3(-7.28, -675.82, 16.13),
    vector3(3.41, -678.07, 16.13)
  },
  Hack = vector3(-4.33, -686.97, 16.13),            -- hacking location
  Escape = {
    TeleportCoords = vector3(7.78, -655.88, 16.09), -- teleport for escape
    TextCoords = vector3(6.08, -659.55, 16.13)      --text for escape
  },
  Teleports = {
    Up = vector3(9.89, -668.18, 33.45),  -- teleport up coords
    Down = vector3(1.08, -702.76, 16.13) -- teleport down coords
  }
}
----DRAWTEXT----
Config.DrawTexts = {
  "~g~[E]~s~ to escape",
  "~g~[E]~s~ DOWN",
  "~g~[E]~s~ UP",
  "~g~[E]~s~ to start heist",
  "~g~[E]~s~ to open vault",
  "~g~[E]~s~ to collect money",
  "Collecting money"
}
