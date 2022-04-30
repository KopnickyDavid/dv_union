----locals----
local QBCore = exports['qb-core']:GetCoreObject()
local rob = false 
local freezed = false
local hacked = false
local collectingtime = true
local obj = GetClosestObjectOfType(-1.72947, -686.5417, 16.68913, 2.0, GetHashKey("v_ilev_fin_vaultdoor"), false, false, false)
----IPL----
AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
     if Config.ipl == 'dv_union' then
        RequestIpl('FINBANK')
     end
   end
end)
----POLYZONE----
local zone = CircleZone:Create(vector3(1.23, -675.12, 16.13), 100.0, {
    name="union",
    useZ=false,
    debugPoly=false,
})

zone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
        if isPointInside then
            local data = true
          TriggerServerEvent('dv:check',data)
        else
            local data = false
            TriggerServerEvent('dv:check',data)
        end
end)
----THREADS----
--collecting money
CreateThread(
        function()
            while true do
                Wait(0)
                if rob ==true then
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
                    TriggerServerEvent('dv-unionrobbery:server:addmoney') 
                    Wait(120000)
                    collectingtime = false   
                    end)        
                end
             end
         end
      end
    end
end)
--starting heist
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
                if sleep then
                  Wait(2500)
              end    
            end      
        end      
      end
   end
end)
--hacking  
CreateThread(function()
    while true do
        Wait(0)
    if rob == false then
        local ped = PlayerPedId()
        local player = GetEntityCoords(ped)
        local distance1 = #(player - Config.Locations.Hack)
        local sleep = true
    if  distance1 < Config.textdistance and  hacked == false then
        sleep = false
        Draw3DText(Config.Locations.Hack.x, Config.Locations.Hack.y, Config.Locations.Hack.z,  Config.DrawTexts[5])
        if IsControlJustReleased(0, 38) then
        TriggerServerEvent('hacking')
    elseif sleep then
        Wait(2500)
         end   
       end
     end
   end
end)
----TELEPORTS---- 
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local player = GetEntityCoords(ped)
        local distance2 = #(player - Config.Locations.Teleports.Up)
        local sleep = true
    if distance2 < Config.textdistance then
        sleep = false
        Draw3DText(Config.Locations.Teleports.Up.x, Config.Locations.Teleports.Up.y, Config.Locations.Teleports.Up.z,  Config.DrawTexts[3])
        if IsControlJustReleased(0, 38) then
        teleportToCoords(ped,Config.Locations.Teleports.Down)
    if sleep then
        Wait(2500)
         end
       end   
     end
   end
end)
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local player = GetEntityCoords(ped)
        local distance3 = #(player - Config.Locations.Teleports.Down)
        local sleep = true
    if distance3 < Config.textdistance then
        sleep = false
        Draw3DText(Config.Locations.Teleports.Down.x, Config.Locations.Teleports.Down.y, Config.Locations.Teleports.Down.z,  Config.DrawTexts[2])
        if IsControlJustReleased(0, 38) then
        teleportToCoords(ped,Config.Locations.Teleports.Up)
    if sleep then
        Wait(2500)
     end   
end
end
end
end)
--stop robbery
CreateThread(
        function()
            while true do
                Wait(0)
            if rob == true then
                local ped = PlayerPedId()
                local player = GetEntityCoords(ped)
                local sleep = true
                local distance = #(player - Config.Locations.Escape.TextCoords)
                if distance < Config.textdistance then
                sleep = false
                Draw3DText(Config.Locations.Escape.TextCoords.x, Config.Locations.Escape.TextCoords.y, Config.Locations.Escape.TextCoords.z,Config.DrawTexts[1])
                if IsControlJustReleased(0, 38) then
                teleportToCoords(ped,Config.Locations.Escape.TeleportCoords)
                TriggerServerEvent('dv-unionrobbery:server:stoprobbery')
            if sleep then
                Wait(5000)   
                  end
               end
            end
        end
    end
end)
-- blip
CreateThread(function()
    if Config.blip then
    blip( -5.6612, -669.8186, 32.3381)
    end
end)
--freezing vault
CreateThread(function()
    while true do
        Wait(0)
        if rob == true then
        local ped = PlayerPedId()
        local player = GetEntityCoords(ped)
        local pos = vector3(1.15, -702.66, 16.13)
        local distance = #(player - pos)
        if distance < 5.0 and freezed == false and hacked == false and rob == true then
            TriggerServerEvent('dv-unionrobbery:server:freeze')
            freezed = true
        end
    end
    end
end)
----EVENTS----
--hacking
RegisterNetEvent('dv_union:client:hack', function()
TriggerEvent("mhacking:show")
TriggerEvent("mhacking:start",7,35,mycb)
end)
--stoping robbery
RegisterNetEvent('dv-unionrobbery:client:stoprobbery', function()
    Wait(180000)
    if rob == true then 
        rob = false
    end
end)
--rob
RegisterNetEvent('dv-union:client:rob', function()
    rob = true 
end)
--starting
RegisterNetEvent('dv-union:client:ipl:v6', function()
    TriggerServerEvent('dv:server:start') 
end)
--hacking success
RegisterNetEvent('dv-union:hacking:success', function()
    TriggerServerEvent('dv-union:server:callpd')
    TriggerServerEvent('dv:vault:server:unfreeze')
    TriggerEvent('mhacking:hide')
end)
--freezing
RegisterNetEvent('dv:vault:freeze', function()
    FreezeEntityPosition(obj, true)
    freezed = true
end)
--unfreezing
RegisterNetEvent('dv:vault:unfreeze', function()
    FreezeEntityPosition(obj, false)
end)
--hacked
RegisterNetEvent('dv:client:hacked', function()
    hacked = true
end)
----FUNCTION----
--mhacking
function mycb(success, timeremaining)
	if success then
TriggerEvent('dv-union:hacking:success')
TriggerServerEvent('dv:server:hacked')
	else
		TriggerEvent('mhacking:hide')
	end
end
--teleporting
function teleportToCoords(ped, x, y, z, heading)
    CreateThread( 
      function()
        DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
          Wait(0)
        end
        SetEntityCoords(ped, x, y, z)
        SetEntityHeading(ped, heading)
        DoScreenFadeIn(250)
      end)
  end
--drawtext
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
--blip
function blip(x,y,z)
    local Dealer = AddBlipForCoord(x, y,z)
    SetBlipSprite (Dealer, 475  )
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Union Depository")
    EndTextCommandSetBlipName(Dealer) 
end