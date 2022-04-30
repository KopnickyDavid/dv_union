----LOCALS----
local rob = false
local inheist = false
local QBCore = exports['qb-core']:GetCoreObject()
----RESOURCE NAME----
if GetCurrentResourceName() ~= 'dv_union' then
    print('[dv_union]: ^1You are not allowed to change the resource name ^0')
    return
end
print('[dv_union]: ^2Resource started successfuly^0')
----EVENTS----
--checking if player is in polyzone
RegisterNetEvent('dv:check', function(data)
    inheist = data
end)
--adding money
RegisterNetEvent('dv-unionrobbery:server:addmoney', function()
    local rand = math.random(Config.getMin, Config.getMax)
    local Player = QBCore.Functions.GetPlayer(source)
    if rob and inheist then
        Player.Functions.AddItem(Config.item, rand)
        sendToDiscord( GetPlayerName(source) ,  Config.item .." added to inventory." , FF0000)
    if Config.Debug then 
        sendToDiscord( GetPlayerName(source) ,  GetPlayerIdentifiers(source) , FF0000)
           end
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
end
end)
--hacking
RegisterNetEvent('dv:server:hacked', function()
    TriggerClientEvent('dv:client:hacked',-1)
end)
RegisterNetEvent('hacking', function()
        local Player = QBCore.Functions.GetPlayer(source)
    local item = Config.hackingitem
       if Player.Functions.RemoveItem(item, 1) then
          TriggerClientEvent('dv_union:client:hack',source)
end
end)
--unfreezing vault
RegisterNetEvent('dv:vault:server:unfreeze', function()
    TriggerClientEvent('dv:vault:unfreeze',-1)
end)
--starting robbery
RegisterNetEvent('dv:server:start', function()
    if rob == false then
        CreateVehicle(1747439474, 441.8710, -1926.2142, 24.6184, 20.4338, 1.0, true, true)
         TriggerClientEvent('dv-union:client:rob',-1)
         rob = true 
end  
end)
--freezing vault
RegisterNetEvent('dv-unionrobbery:server:freeze', function()
    TriggerClientEvent('dv:vault:freeze',-1)
end)
--usable item
QBCore.Functions.CreateUseableItem("cashroll", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1) then
        Player.Functions.AddMoney('cash', Config.givecash)
    end
end)
----Thread----
-- version check
CreateThread(function()
    Wait(Config.version)
    local version = GetResourceMetadata(GetCurrentResourceName(), 'version')
    PerformHttpRequest('https://zap730429-1.plesk12.zap-webspace.com/version.json', function(a, versions, c)
        versions = json.decode(versions)
        if version ~= versions.dv_union then
            print('^1[dv_union]:  I  recommend update to '..versions.dv_union..' version^0')
        else
            print('^2[dv_union]: Your are running current version!^0')
        end
    end)
end)
----FUNCTION---- 
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
