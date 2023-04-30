if Config.framework == 'qb' then
     QBCore = exports['qb-core']:GetCoreObject()
elseif Config.framework == 'esx' then
     ESX = exports['es_extended']:getSharedObject()
end

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
    local sourcePlayer = tonumber(source)
    local license = GetPlayerIdentifier(sourcePlayer, 0)
    local name = GetPlayerName(sourcePlayer)
    local ped = GetPlayerPed(sourcePlayer)
    local playerCoords = GetEntityCoords(ped)
    local distance = #(playerCoords - vector3(4.69, -675.87, 16.13))
    if distance < 100 and rob then
        if Config.framework == 'qb' then
            local Player = QBCore.Functions.GetPlayer(sourcePlayer)
            Player.Functions.AddItem(Config.item, rand)
        elseif Config.framework == 'esx' then
            local xPlayer = ESX.GetPlayerFromId(sourcePlayer)
            xPlayer.addInventoryItem(Config.item, rand)
        end 
        sendToDiscord(name, Config.item .. " added to inventory.", FF0000)
        if Config.Debug then
            sendToDiscord(name, license, FF0000)
        end
    else
        sendToDiscord("Danger collecting item", "**Player is probably using cheats because distance is: " .. distance .. "**\n**Steam name:** " .. name .. "\n**License:** " .. license, EE2F06)
    end
end)

--stoping robbery
RegisterNetEvent('dv-unionrobbery:server:stoprobbery', function()
    if rob == true then
        TriggerClientEvent('dv:client-events', -1, 'stoprobbery')
        rob = false
        sendToDiscord("ALARM", "Robbery ended.", FF0000)
    end
end)
--sending alert to police about robbery
RegisterNetEvent('dv-union:server:callpd', function()
    TriggerEvent('dv-union:server:peds')
    if Config.alert == 'linden' then
        local data = {
            displayCode = '211',
            description = 'Robbery',
            isImportant = 0,
            recipientList = { 'police' },
            length = '30000',
            infoM = 'fa-info-circle',
            info = 'Union Depository'
        }
        local dispatchData = { dispatchData = data, caller = 'Alarm', coords = vector3(-5.6612, -669.8186, 32.3381) }
        TriggerEvent('wf-alerts:svNotify', dispatchData)
        sendToDiscord("ALARM", " Union depository is being robbed.", FF0000)
        sendToDiscord(GetPlayerName(source), "Started robbery.", FF0000)
    elseif Config.alert == 'QB' then
        local alertData = {
            title = "Union Depository",
            coords = { x = -5.6612, y = -669.8186, z = 32.3381 },
            description = "Union Depository is under robbery",
        }
        TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
        sendToDiscord("ALARM", " Union depository is being robbed.", FF0000)
        sendToDiscord(GetPlayerName(source), "Started robbery.", FF0000)
    elseif Config.alert == 'CD' then
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = { 'police' },
            coords = vector3(-5.6612, -669.8186, 32.3381),
            title = '211 - Union Depository',
            message = 'Union depository is being robbed',
            flash = 0,
            unique_id = tostring(math.random(0000000, 9999999)),
            blip = {
                sprite = 137,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = '211 - Union Depository',
                time = (5 * 60 * 1000),
                sound = 1,
            }
        })
    end
end)
--PEDS
RegisterNetEvent('dv-union:server:peds', function()
    Wait(10000)
    if rob then
        for i=1, #Config.peds do
            local coords = Config.peds[i]
            local pedIndex = i <= 3 and 1 or 2
            local ped = CreatePed(4, Config.ped[pedIndex], coords.x, coords.y, coords.z, 180.0, true, true)
            SetPedArmour(ped, Config.pedarmour)
            GiveWeaponToPed(ped, Config.pedweapon, 500,false,true)
        end
    end
end)

--hacking
RegisterNetEvent('dv:server:hacked', function()
    TriggerClientEvent('dv:client-events', -1, 'hack')
end)
RegisterNetEvent('hacking', function(source)
    local src = source
    if Config.framework == 'qb' then
        local Player = QBCore.Functions.GetPlayer(source)
       if  Player.Functions.RemoveItem(Config.hackingitem,  1) then
        TriggerClientEvent('dv_union:client:hack', src)
       end
    elseif Config.framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(Config.hackingitem).count >= 1 then
        xPlayer.removeInventoryItem(Config.hackingitem,  1)
        TriggerClientEvent('dv_union:client:hack', src)
        end
    end 
end)
--unfreezing vault
RegisterNetEvent('dv:vault:server:unfreeze', function()
    TriggerClientEvent('dv:client-events', -1, 'unlock')
end)
--starting robbery
RegisterNetEvent('dv:server:start', function()
    if rob == false then
        rob = true
        TriggerClientEvent('dv:client-events', -1, 'rob')
    end
end)
--freezing vault
RegisterNetEvent('dv-unionrobbery:server:freeze', function()
    TriggerClientEvent('dv:client-events', -1, 'lock')
end)
--usable item
if Config.framework == 'qb' then
    QBCore.Functions.CreateUseableItem(Config.item, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if  Player.Functions.RemoveItem(Config.item,  1) then
         Player.Functions.AddMoney('cash', Config.givecash)
        end
    end)
end
if Config.framework == 'esx' then
    ESX.RegisterUsableItem(Config.item, function(playerId)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        xPlayer.removeInventoryItem(Config.item,  1)
        xPlayer.addMoney(Config.givecash)
      end)
      
      
end
--webhook
function sendToDiscord(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Los Santos",
            },
        }
    }
    PerformHttpRequest(Config.webhook, function(err, text, headers)
        end, 'POST',
        json.encode({
            username = "dv_union",
            embeds = connect,
            avatar_url =
            "https://cdn.discordapp.com/icons/866965773623623691/d2013f3fb9135be5492dc98e45df0f4d.webp?size=128"
        }),
        { ['Content-Type'] = 'application/json' })
end
