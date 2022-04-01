----LOCALS----
local rob = false

if GetCurrentResourceName() ~= 'dv_union' then
    print('[dv_union]: ^1You are not allowed to change the resource name ^0')
    return
end
print('[dv_union]: ^2Resource started successfuly^0')
----EVENTS----
RegisterServerEvent('startheist')
AddEventHandler('startheist', function(data)
       if rob == false then
       local vehicle = CreateVehicle(1747439474, 441.8710, -1926.2142, 24.6184, 20.4338, 1.0, true, true)
       if rob == false then
        TriggerClientEvent('dv-union:client:rob',-1)
        rob = true 
        end     
    end
end)
RegisterServerEvent('add')
AddEventHandler('add', function(data)
    local source = source
    local rand = math.random(Config.getMin, Config.getMax)
    if Config.framework == QB then
    local QBCore = exports['qb-core']:GetCoreObject()
    local Player = QBCore.Functions.GetPlayer(source)
    if rob == true then
        Player.Functions.AddItem(Config.item, rand)
        sendToDiscord( GetPlayerName(source) ,  Config.item .." added to inventory." , FF0000)
    if Config.Debug then 
        sendToDiscord( GetPlayerName(source) ,  GetPlayerIdentifiers(source) , FF0000)
    elseif Config.framework == ESX then
    local Player = QBCore.Functions.GetPlayer(source)
    if rob == true then
        Player.Functions.AddItem(Config.item, rand)
        sendToDiscord( GetPlayerName(source) ,  Config.item .." added to inventory." , FF0000)
    if Config.Debug then 
        sendToDiscord( GetPlayerName(source) ,  GetPlayerIdentifiers(source) , FF0000)
                 end
              end
           end
        end
    end
end)
RegisterServerEvent('add:gold')
AddEventHandler('add:gold', function(data)
    local source = source
    local rand = math.random(Config.getMin, Config.getMax)
    if Config.framework == QB then
    local QBCore = exports['qb-core']:GetCoreObject()
    local Player = QBCore.Functions.GetPlayer(source)
    --if rob == true then
        Player.Functions.AddItem("goldbar", rand)
        sendToDiscord( GetPlayerName(source) ,  "goldbar" .." added to inventory." , FF0000)
    if Config.Debug then 
        sendToDiscord( GetPlayerName(source) ,  GetPlayerIdentifiers(source) , FF0000)
          -- end
        end
    end
end)
RegisterServerEvent('dv-callpolice')
AddEventHandler('dv-callpolice', function(data)
    sendToDiscord( "ALARM" ,  " Union depository is being robbed.", FF0000)
    sendToDiscord( GetPlayerName(source) ,  "Started robbery.", FF0000)
end)
RegisterServerEvent('dv-unionrobbery:server:stoprobbery')
AddEventHandler('dv-unionrobbery:server:stoprobbery', function(data)
    if rob == true then
       rob = false
       sendToDiscord( "ALARM" , "Robbery ended.", FF0000)
    end
end)
RegisterServerEvent('alertpd')
AddEventHandler('alertpd', function(data)
        if Config.alert == 'linden' then
            local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '30000', infoM = 'fa-info-circle', info = 'Union Depository'}
            local dispatchData = {dispatchData = data, caller = 'Alarm', coords = vector3(-5.6612, -669.8186, 32.3381)}
            TriggerEvent('wf-alerts:svNotify', dispatchData)
        elseif Config.alert == 'QB' then
            local alertData = {
                title = "Union Depository",
                coords = {x =  -5.6612, y =  -669.8186, z = 32.3381},
                description = "Union Depository is under robbery",
                }
            TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
    end
end)  
   RegisterServerEvent('hacking')
AddEventHandler('hacking', function(data)
    local src = source
    if Config.framework == QB then
        local QBCore = exports['qb-core']:GetCoreObject()
        local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.hackingitem
       if Player.Functions.RemoveItem(item, 1) then
          TriggerClientEvent('dv_union:client:hack',src)
    end
end
end)
RegisterServerEvent('dv:vault:server:freeze')
AddEventHandler('dv:vault:server:freeze', function(source)
    TriggerClientEvent('dv:vault:freeze',-1)
end)
RegisterServerEvent('dv:vault:server:unfreeze')
AddEventHandler('dv:vault:server:unfreeze', function(data)
        TriggerClientEvent('dv:vault:unfreeze',-1)
end)
RegisterServerEvent('dv_union:server:props')
AddEventHandler('dv_union:server:props', function(data)
    local src = source
    TriggerClientEvent('dv_union:client:props',src)
end)
----Thread----
CreateThread(function()
    Wait(Config.version)
    local version = GetResourceMetadata(GetCurrentResourceName(), 'version')
    PerformHttpRequest('https://zap730429-1.plesk12.zap-webspace.com/version.json', function(a, versions, c)
        versions = json.decode(versions)
        if version ~= versions.dv_union then
            print('^1[dv_union]: is outdated, I  recommend update to '..versions.dv_union..' version^0')
        else
            print('^2[dv_union]: Your are running current version!^0')
        end
    end)
end)
----FUNCTION----
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