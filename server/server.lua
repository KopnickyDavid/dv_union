local rob = false
local DISCORD_WEBHOOK = Config.webhook
local DISCORD_NAME = "DV-Union"
if GetCurrentResourceName() ~= 'dv-union' then
    print('[dv-union]: ^1You are not allowed to change the resource name ^0')
    return
end

print('[dv-union]: ^2Resource started successfuly^0')



RegisterServerEvent('startheist')
AddEventHandler('startheist', function(data)
    if rob == false then
    local vehicle = CreateVehicle(1747439474, 441.8710, -1926.2142, 24.6184, 20.4338, 1.0, true, true)
    if rob == false then
        rob = true 

        print(rob)
            end     
    elseif rob == true then
        print("You can not rob now")
    end
end)

RegisterServerEvent("dv:openvault")
AddEventHandler("dv:openvault", function(method)
    TriggerClientEvent("dv:openvault_c", -1, method)
end)
RegisterServerEvent("dv:cl")
AddEventHandler("dv:cl", function(method)
    TriggerClientEvent("dv:closevault",-1, method )
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
            sendToDiscord( GetPlayerName(source) ,  GetPlayerIdentifiers(source) , FF0000)
    elseif Config.framework == ESX then
        local Player = QBCore.Functions.GetPlayer(source)

        if rob == true then
            Player.Functions.AddItem(Config.item, rand)
                sendToDiscord( GetPlayerName(source) ,  Config.item .." added to inventory." , FF0000)
                sendToDiscord( GetPlayerName(source) ,  GetPlayerIdentifiers(source) , FF0000)
    end
end
    end
end)

RegisterServerEvent('dv-callpolice')
AddEventHandler('dv-callpolice', function(data)
    sendToDiscord( "ALARM" ,  " Union depository is being robbed.", FF0000)
    sendToDiscord( GetPlayerName(source) ,  "Started robbery.", FF0000)
end)

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
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = "https://cdn.discordapp.com/icons/866965773623623691/d2013f3fb9135be5492dc98e45df0f4d.webp?size=128"}), { ['Content-Type'] = 'application/json' })
  end
  RegisterServerEvent('dv-unionrobbery:server:stoprobbery')
  AddEventHandler('dv-unionrobbery:server:stoprobbery', function(data)
    if rob == true then
rob = false
sendToDiscord( "ALARM" ,  " Robbery ended.", FF0000)

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
