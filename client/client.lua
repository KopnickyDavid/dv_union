----locals----
local QBCore = exports['qb-core']:GetCoreObject()
local teleport = false --- teleport for base
local rob = false ---rob for base
local freezed = false
local hacked = false
local collectingtime = true
----IPL----
AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
     if Config.ipl == 'dv_union' then
        RequestIpl('FINBANK')
     end
   end
end)
CreateThread(
        function()
            while true do
                Wait(0)
                for k, collect in pairs(Config.Locations.Collect) do 
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local distance = #(player - collect)
                if distance < Config.textdistance and  collectingtime then
                    Draw3DText(collect.x, collect.y, collect.z, Config.DrawTexts[6])
                    if IsControlJustReleased(0, 38) then
                        QBCore.Functions.Progressbar(Config.DrawTexts[7], Config.DrawTexts[7], math.random(3000, 5000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {},function() 
                    TriggerServerEvent('add') 
                    Wait(120000)
                    collectingtime = false   
                    end)        
                end
            end
        end
    end
end)

CreateThread(
        function()
            while true do
                Wait(0)
                if rob == true  then
                    local ped = PlayerPedId()
                    local player = GetEntityCoords(ped)
                    local distance = #(player - Config.Locations.Hack)
                    local sleep = true
                    if distance < Config.textdistance and  hacked == false then
                    sleep = false
                    Draw3DText(Config.Locations.Hack.x, Config.Locations.Hack.y, Config.Locations.Hack.z,  Config.DrawTexts[5])
                    if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('hacking')
                    if sleep then
                        Wait(500)
                        end
                end
            end
        end
    end
end)  
CreateThread(
        function()
            while true do
                Wait(0)
                if rob == false then
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local distance = #(player - Config.Locations.Start)
                local sleep = true
                if distance < Config.textdistance then
                    sleep = false
                    Draw3DText(Config.Locations.Start.x, Config.Locations.Start.y, Config.Locations.Start.z,Config.DrawTexts[4])
                    if IsControlJustReleased(0, 38) then
                    TriggerEvent('dv-union:client:ipl:v6')
                    break
                    elseif sleep then
                    Wait(1000)
                    end          
        end          
    end      
    end
end)
CreateThread(
        function()
            while true do
                Wait(0)
                local sleep = true
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local distance = #(player - Config.Locations.Teleports.Up)
                if distance < Config.textdistance then
                    sleep = false
                    Draw3DText(Config.Locations.Teleports.Up.x, Config.Locations.Teleports.Up.y, Config.Locations.Teleports.Up.z,  Config.DrawTexts[3])
                    if IsControlJustReleased(0, 38) then
                    teleportToCoords(ped,Config.Locations.Teleports.Down)
                    if sleep then
                        Wait(500)
                    end
            end
        end
    end
end)
CreateThread(
        function()
            while true do
                Wait(0)
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local distance = #(player - Config.Locations.Teleports.Down)
                local sleep = true
                if distance < Config.textdistance then
                    sleep = false
                    Draw3DText(Config.Locations.Teleports.Down.x, Config.Locations.Teleports.Down.y, Config.Locations.Teleports.Down.z,  Config.DrawTexts[2])
                    if IsControlJustReleased(0, 38) then
                    teleportToCoords(ped,Config.Locations.Teleports.Up)
                    if sleep then
                        Wait(500)
                    end
            end
        end
    end
end)
CreateThread(
        function()
            while true do
                Wait(0)
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local sleep = true
                local distance = #(player - Config.Locations.Escape.TextCoords)
                if distance < Config.textdistance then
                sleep = false
                Draw3DText(Config.Locations.Escape.TextCoords.x, Config.Locations.Escape.TextCoords.y, Config.Locations.Escape.TextCoords.z,Config.DrawTexts[1])
                if IsControlJustReleased(0, 38) then
                teleportToCoords(ped,Config.Locations.Escape.TeleportCoords)
                TriggerEvent('dv-unionrobbery:client:stoprobbery')
                if sleep then
                                Wait(500)
                       
                end
            end
        end
    end
end)
CreateThread(function()
    if Config.blip then
    local Dealer = AddBlipForCoord( -5.6612, -669.8186, 32.3381)
    SetBlipSprite (Dealer, 475  )
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Union Depository")
    EndTextCommandSetBlipName(Dealer) 
    end
end)
CreateThread(function ()
    while true do
      Wait(0)
 local src = source
      local ped = PlayerPedId()
      local player = GetEntityCoords(ped)
      local pos = vector3(11.54, -663.25, 15.13)
      local distance = #(player - pos)
      local sleep = true
    if distance < 1.2 then
        sleep = false
          DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0001,1.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
    TriggerServerEvent('add:gold')
    break
      end
      end
    if sleep then
                Wait(1000)
              end
    end
    end)
    CreateThread(function ()
        while true do
          Wait(0)
          local ped = PlayerPedId()
          local player = GetEntityCoords(ped)
          local pos = vector3(10.26, -662.96, 15.13)
          local distance = #(player - pos)
          local sleep = true
        if distance < 1.2 then
            sleep = false
              DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0001,1.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
        if IsControlJustReleased(0, 38) then
        TriggerServerEvent('add:gold')
        break
          end
          end
        if sleep then
                    Wait(1000)
            end
        end
end)

CreateThread(function()
    while true do
        Wait(2500)
        local ped = PlayerPedId()
        local player = GetEntityCoords(ped)
        local pos = vector3(1.15, -702.66, 16.13)
        local distance = #(player - pos)
        if distance < 5.0 and freezed == false and hacked == false then
            TriggerServerEvent('testing')
            freezed = true
        end
    end
end)
----EVENTS----
RegisterNetEvent('dv_union:client:props', function()
    local trolly = CreateObject(`prop_gold_trolly_full`,11.7256, -662.7592, 15.01, true, false, false)
    SetEntityHeading(trolly, 180)
    FreezeEntityPosition(trolly, true)
    local trolly2 = CreateObject(`prop_gold_trolly_full`,10.4343, -662.4464, 15.01, true, false, false)
    SetEntityHeading(trolly2, 180)
    FreezeEntityPosition(trolly2, true)
end)
RegisterNetEvent('dv-union:client:ipl:v6')
AddEventHandler('dv-union:client:ipl:v6', function()
    TriggerServerEvent('dv:server:start') 
    TriggerServerEvent('testing')
    if teleport == false then
        teleport = true 
    end
end)
RegisterNetEvent('dv-union:client:rob')
AddEventHandler('dv-union:client:rob', function()
            rob = true 
end)
RegisterNetEvent("dv-unionrobbery:client:stoprobbery")
AddEventHandler("dv-unionrobbery:client:stoprobbery", function(method)
    if rob == true then 
        TriggerServerEvent('dv-unionrobbery:server:stoprobbery')
        rob = false
    if teleport == true then
        teleport = false
       end
    end
end)
RegisterNetEvent('dv_union:client:hack')
AddEventHandler('dv_union:client:hack', function()
TriggerEvent("mhacking:show")
TriggerEvent("mhacking:start",7,35,mycb)
end)

RegisterNetEvent('dv-union:hacking:success')
AddEventHandler('dv-union:hacking:success', function()
    TriggerServerEvent('alertpd')
    TriggerServerEvent('dv:vault:server:unfreeze')
    TriggerEvent('mhacking:hide')
end)
RegisterNetEvent('dv:vault:freeze')
AddEventHandler('dv:vault:freeze', function()
    FreezeEntityPosition(GetClosestObjectOfType(-1.72947, -686.5417, 16.68913, 2.0, GetHashKey("v_ilev_fin_vaultdoor"), false, false, false), true)
end)
RegisterNetEvent('dv:vault:unfreeze')
AddEventHandler('dv:vault:unfreeze', function()
    FreezeEntityPosition(GetClosestObjectOfType(-1.72947, -686.5417, 16.68913, 2.0, GetHashKey("v_ilev_fin_vaultdoor"), false, false, false), false)
end)
RegisterNetEvent('dv:client:hacked', function()
    hacked = true
end)
----FUNCTION----
function mycb(success, timeremaining)
	if success then
TriggerEvent('dv-union:hacking:success')
TriggerServerEvent('dv:server:hacked')
	else
		TriggerEvent('mhacking:hide')
	end
end
function teleportToCoords(ped, x, y, z, heading)
    CreateThread( -- Anything that requires a loop will require a thread, else the code will lock and crash
      function()
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
          Wait(0)
        end
        SetEntityCoords(ped, x, y, z)
        SetEntityHeading(ped, heading)
        DoScreenFadeIn(500)
      end)
  end
  function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
