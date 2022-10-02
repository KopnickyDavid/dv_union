----LOCALS----
local rob = false
----RESOURCE NAME----
if GetCurrentResourceName() ~= 'dv_union' then
    print('[dv_union]: ^1You are not allowed to change the resource name ^0')
    return
end
print('[dv_union]: ^2Resource started successfuly^0')
----EVENTS----
--adding money
RegisterNetEvent('dv-unionrobbery:server:addmoney', function()
    local rand = math.random(Config.getMin, Config.getMax)
    local license = GetPlayerIdentifier(source,0)
        local id1 = GetPlayerIdentifier(source,1)
        local id2 = GetPlayerIdentifier(source,2)
        local id4 = GetPlayerIdentifier(source,3)
        local id3 = GetPlayerIdentifier(source,4)
        local id5 = GetPlayerIdentifier(source,6)
        local name = GetPlayerName(source)
        local ped = GetPlayerPed(source)
        local playerCoords = GetEntityCoords(ped)
        local distance = #(playerCoords - vector3(-4.37, -690.07, 16.13))
    if distance < 50 and rob then 
        exports['dv-lib']:GiveItem(source,Config.item,rand)
        sendToDiscord( GetPlayerName(source) ,  Config.item .." added to inventory." , FF0000)
    if Config.Debug then 
        sendToDiscord( GetPlayerName(source) ,  GetPlayerIdentifiers(source) , FF0000)
           end
else
    sendToDiscord("Danger collecting item","**".."Player is probaly using cheats because distance is:"..' '..distance .."**".."\n ".."**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Xbox:".."**"..' '..id1.."\n".."**".."Live:"..' '.."**"..id2.."\n".."**".."Fivem:"..' '.."**"..id3.."\n".."**".."Discord:"..' '.."**"..id4.."\n".."**".."IP:"..' '.."**"..'||'..id5..'||',EE2F06)
end
end)
--stoping robbery
RegisterNetEvent('dv-unionrobbery:server:stoprobbery', function()
    if rob == true then
        TriggerClientEvent('dv-unionrobbery:client:stoprobbery',-1)
       rob = false
       sendToDiscord( "ALARM" , "Robbery ended.", FF0000)
    end
end)
--sending alert to police about robbery
RegisterNetEvent('dv-union:server:callpd', function()
    TriggerEvent('dv-union:server:peds')
    if Config.alert == 'linden' then
        local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '30000', infoM = 'fa-info-circle', info = 'Union Depository'}
        local dispatchData = {dispatchData = data, caller = 'Alarm', coords = vector3(-5.6612, -669.8186, 32.3381)}
        TriggerEvent('wf-alerts:svNotify', dispatchData)
        sendToDiscord( "ALARM" ,  " Union depository is being robbed.", FF0000)
        sendToDiscord( GetPlayerName(source) ,  "Started robbery.", FF0000)
    elseif Config.alert == 'QB' then
        local alertData = {
            title = "Union Depository",
            coords = {x =  -5.6612, y =  -669.8186, z = 32.3381},
            description = "Union Depository is under robbery",
            }
        TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
        sendToDiscord( "ALARM" ,  " Union depository is being robbed.", FF0000)
        sendToDiscord( GetPlayerName(source) ,  "Started robbery.", FF0000)
                elseif Config.alert == 'CD' then
TriggerClientEvent('cd_dispatch:AddNotification', -1, {
    job_table = {'police'},
    coords = vector3(-5.6612, -669.8186, 32.3381),
    title = '211 - Union Depository',
    message = 'Union depository is being robbed',
    flash = 0,
    unique_id = tostring(math.random(0000000,9999999)),
    blip = {
        sprite = 137,
        scale = 1.2,
        colour = 3,
        flashes = false,
        text = '211 - Union Depository',
        time = (5*60*1000),
        sound = 1,
    }
})

end
end)
--PEDS
RegisterNetEvent('dv-union:server:peds', function()
    Wait(10000)
    if rob then
       local coords = Config.peds[1]
       local coords1 = Config.peds[2]
       local coords2 = Config.peds[3]
       local coords3 = Config.peds[4]
       local coords4 = Config.peds[5]
          local ped = CreatePed(4, Config.ped[1], coords.x, coords.y, coords.z, 180.0, true, true)
          SetPedArmour(ped, Config.pedarmour)
          GiveWeaponToPed(ped,Config.pedweapon,500)
          local ped1 = CreatePed(4, Config.ped[1], coords1.x, coords1.y, coords1.z, 180.0, true, true)
          SetPedArmour(ped1, Config.pedarmour)
          GiveWeaponToPed(ped1,Config.pedweapon,500)
          local  ped2 = CreatePed(4, Config.ped[1], coords2.x, coords2.y, coords2.z, 180.0, true, true)
          SetPedArmour(ped2, Config.pedarmour)
          GiveWeaponToPed(ped2,Config.pedweapon,500)
          local  ped3 = CreatePed(4, Config.ped[2], coords3.x, coords3.y, coords3.z, 180.0, true, true)
          SetPedArmour(ped3, Config.pedarmour)
          GiveWeaponToPed(ped3,Config.pedweapon,500)
          local ped4 = CreatePed(4, Config.ped[2], coords4.x, coords4.y, coords4.z, 180.0, true, true)
          SetPedArmour(ped4, Config.pedarmour)
          GiveWeaponToPed(ped4,Config.pedweapon,500)
       end
 end)
--hacking
RegisterNetEvent('dv:server:hacked', function()
    TriggerClientEvent('dv:client:hacked',-1)
end)
RegisterNetEvent('hacking', function(source)
    local src = source
    if exports['dv-lib']:RemoveItem(src,Config.hackingitem,1) then
    TriggerClientEvent('dv_union:client:hack',src)
   end
end)
--unfreezing vault
RegisterNetEvent('dv:vault:server:unfreeze', function()
    TriggerClientEvent('dv:vault:unfreeze',-1)
end)
--starting robbery
RegisterNetEvent('dv:server:start', function()
    if rob == false then
        TriggerClientEvent('dv-union:client:rob',-1)
    end
end)
--freezing vault
RegisterNetEvent('dv-unionrobbery:server:freeze', function()
    TriggerClientEvent('dv:vault:freeze',-1)
end)
--usable item
if Config.usable == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateUseableItem("cashroll", function(source, item)
    if exports['dv-lib']:RemoveItem(source,"cashroll",1) then
        exports['dv-lib']:AddMoney(source,'cash',Config.givecash)
    end
end)
end
if Config.usable == 'esx' then
    local ESX = exports["es_extended"]:getSharedObject()
    ESX.RegisterUsableItem("cashroll", function(source)
       if exports['dv-lib']:RemoveItem(source,"cashroll",1) then
        exports['dv-lib']:AddMoney(source,'cash',Config.givecash)
       end
    end)
end
--webhook
function sendToDiscord(name, message, color)
    local connect = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
              ["text"] = "Los Santos",
              },
          }
      }
    PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({username =  "dv_union", embeds = connect, avatar_url = "https://cdn.discordapp.com/icons/866965773623623691/d2013f3fb9135be5492dc98e45df0f4d.webp?size=128"}), { ['Content-Type'] = 'application/json' })
  end
