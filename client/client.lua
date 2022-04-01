----locals----
local distance_until_text_disappears = Config.textdistance
local teleport = false --- teleport for base
local rob = false ---rob for base
local marker5 = false
local v1 = Config.Locations.Collect[1]
local v2 = Config.Locations.Collect[2]
local v3 = Config.Locations.Collect[3]
local v4 = Config.Locations.Collect[4]
local v5 = Config.Locations.Hack
local v6 = Config.Locations.Start
local teleport2 = Config.Locations.Teleports.Down
local teleport1 = Config.Locations.Teleports.Up
----IPL----
AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
     if Config.ipl == 'dv_union' then
        RequestIpl('FINBANK')
     end
   end
end)
    ----Threads----
CreateThread(
        function()
            while true do
                Wait(0)
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local distance = #(player - Config.Locations.Collect[1])
                local sleep = true
                if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(v1.x, v1.y, v1.z, Config.DrawTexts[6])
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent('add')  
                        if sleep then
                            Wait(500)
                        end
                    break
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
                local distance = #(player - Config.Locations.Collect[2])
                local sleep = true
                if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(v2.x, v2.y, v2.z, Config.DrawTexts[6])
                    if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('add')                    
                    if sleep then
                            Wait(500)
                            end
                       break
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
                local distance = #(player - Config.Locations.Collect[3])
                local sleep = true
                if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(v3.x, v3.y, v3.z,  Config.DrawTexts[6])
                    if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('add')            
                    if sleep then
                               Wait(500)
                    end
                       break
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
                local distance = #(player - Config.Locations.Collect[4])
                local sleep = true
                if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(v4.x, v4.y, v4.z,  Config.DrawTexts[6])
                    if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('add')    
                    if sleep then
                               Wait(500)
                            end
                       break
                end
        end
    end
end)
CreateThread(
        function()
            while true do
                Wait(0)
                if marker5 == true then
                    local ped = PlayerPedId()
                    local player = GetEntityCoords(ped)
                    local distance = #(player - Config.Locations.Hack)
                    local sleep = true
                    if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(v5.x, v5.y, v5.z,  Config.DrawTexts[5])
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
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local distance = #(player - Config.Locations.Start)
                local sleep = true
                if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(v6.x, v6.y, v6.z,Config.DrawTexts[4])
                    if IsControlJustReleased(0, 38) then
                    TriggerEvent('dv-union:client:ipl:v6')
                    if sleep then
                           Wait(500)
                    end
                   break
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
                if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(teleport1.x, teleport1.y, teleport1.z,  Config.DrawTexts[3])
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
                if distance < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(teleport2.x, teleport2.y, teleport2.z,  Config.DrawTexts[2])
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
                if distance < distance_until_text_disappears then
                sleep = false
                Draw3DText(Config.Locations.Escape.TeleportCoords.x, Config.Locations.Escape.TeleportCoords.y, Config.Locations.Escape.TeleportCoords.z,Config.DrawTexts[1])
                if IsControlJustReleased(0, 38) then
                teleportToCoords(player,Config.escape)
                TriggerEvent('dv-unionrobbery:client:stoprobbery')
                if sleep then
                                Wait(500)
                       break
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
    TriggerServerEvent('add:gold',src)
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
          local src = source
          local ped = PlayerPedId()
          local player = GetEntityCoords(ped)
          local pos = vector3(10.26, -662.96, 15.13)
          local distance = #(player - pos)
          local sleep = true
        if distance < 1.2 then
            sleep = false
              DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0001,1.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
        if IsControlJustReleased(0, 38) then
        TriggerServerEvent('add:gold',src)
        break
          end
          end
        if sleep then
                    Wait(1000)
            end
        end
end)
----EVENTS----
RegisterNetEvent('dv_union:client:props', function(data)
    local trolly = CreateObject(Config.goldprop,11.7256, -662.7592, 15.01, true, false, false)
    SetEntityHeading(trolly, 180)
    FreezeEntityPosition(trolly, true)
    local trolly2 = CreateObject(Config.goldprop,10.4343, -662.4464, 15.01, true, false, false)
    SetEntityHeading(trolly2, 180)
    FreezeEntityPosition(trolly2, true)
  end)
RegisterNetEvent('dv-union:client:ipl:v6')
AddEventHandler('dv-union:client:ipl:v6', function(data)
    TriggerServerEvent('startheist') 
    TriggerServerEvent('dv_union:server:props')
    TriggerServerEvent('dv:vault:server:freeze',-1)
    marker5 = true
    if teleport == false then
        teleport = true 
    end
end)
RegisterNetEvent('dv-union:client:rob')
AddEventHandler('dv-union:client:rob', function(data)
        if rob == false then
            rob = true 
    end
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
AddEventHandler('dv_union:client:hack', function(data)
TriggerEvent("mhacking:show")
TriggerEvent("mhacking:start",7,35,mycb)
end)

RegisterNetEvent('dv-union:hacking:success')
AddEventHandler('dv-union:hacking:success', function(data)
    TriggerServerEvent('alertpd')
    TriggerServerEvent('dv:vault:server:unfreeze')
    TriggerEvent('mhacking:hide')
    marker5 = false
end)
RegisterNetEvent('dv:vault:freeze')
AddEventHandler('dv:vault:freeze', function(source)
        vault = {x = -1.72947, y = -686.5417, z = 16.68913, type = "v_ilev_fin_vaultdoor"}
    local obj = GetClosestObjectOfType(vault.x, vault.y, vault.z, 2.0, GetHashKey(vault.type), false, false, false)
    FreezeEntityPosition(obj, true)
end)
RegisterNetEvent('dv:vault:unfreeze')
AddEventHandler('dv:vault:unfreeze', function(source)
    DV = {
            vault = {x = -1.72947, y = -686.5417, z = 16.68913, type = "v_ilev_fin_vaultdoor"}
    } 
    local obj = GetClosestObjectOfType(DV.vault.x, DV.vault.y, DV.vault.z, 2.0, GetHashKey(DV.vault.type), false, false, false)
    FreezeEntityPosition(obj, false)
end)
----FUNCTION----
function mycb(success, timeremaining)
	if success then
TriggerEvent('dv-union:hacking:success')
	else
		TriggerEvent('mhacking:hide')
        marker5 = true
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