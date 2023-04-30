----locals----
local rob = false
local freezed = false
local hacked = false
local collectingtime = true
local spawned = true
----IPL----
CreateThread(function()
    if Config.ipl == 'dv_union' then
        RequestIpl('FINBANK')
    end
end)

RegisterNetEvent(Config.loaded, function()
    if Config.blip then
        AllFunctions('blip', { x = -5.6612, y = -669.8186, z = 32.3381 })
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local player = GetEntityCoords(ped)
        local sleep = true

        if rob then
            for k, collect in pairs(Config.Locations.Collect) do
                if #(player - collect) < Config.textdistance and collectingtime then
                    sleep = false
                    Draw3DText(collect.x, collect.y, collect.z, Config.DrawTexts[6])
                    if IsControlJustReleased(0, 38) then
                        AllFunctions('progbar')
                    end
                end
            end
            if #(player - vector3(1.15, -702.66, 16.13)) < 5.0 and freezed == false then
                sleep = false
                TriggerServerEvent('dv-unionrobbery:server:freeze')
                freezed = true
            end

            if #(player - Config.Locations.Hack) < Config.textdistance and hacked == false then
                sleep = false
                Draw3DText(Config.Locations.Hack.x, Config.Locations.Hack.y, Config.Locations.Hack.z, Config.DrawTexts[5])
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('hacking', GetPlayerServerId(PlayerId()))
                end
            end

            if #(player - Config.Locations.Escape.TextCoords) < Config.textdistance then
                sleep = false
                Draw3DText(Config.Locations.Escape.TextCoords.x, Config.Locations.Escape.TextCoords.y, Config.Locations.Escape.TextCoords.z, Config.DrawTexts[1])
                if IsControlJustReleased(0, 38) then
                    SetEntityCoords(ped, Config.Locations.Escape.TeleportCoords.x, Config.Locations.Escape.TeleportCoords.y, Config.Locations.Escape.TeleportCoords.z, false, false, false, false)
                    TriggerServerEvent('dv-unionrobbery:server:stoprobbery')
                end
            end
        end

        if #(player - Config.Locations.Teleports.Up) < Config.textdistance then
            sleep = false
            Draw3DText(Config.Locations.Teleports.Up.x, Config.Locations.Teleports.Up.y, Config.Locations.Teleports.Up.z, Config.DrawTexts[3])
            if IsControlJustReleased(0, 38) then
                SetEntityCoords(ped, Config.Locations.Teleports.Down.x, Config.Locations.Teleports.Down.y, Config.Locations.Teleports.Down.z, false, false, false, false)
            end
        end

        if #(player - Config.Locations.Teleports.Down) < Config.textdistance then
            sleep = false
            Draw3DText(Config.Locations.Teleports.Down.x, Config.Locations.Teleports.Down.y, Config.Locations.Teleports.Down.z, Config.DrawTexts[2])
            if IsControlJustReleased(0, 38) then
                SetEntityCoords(ped, Config.Locations.Teleports.Up.x, Config.Locations.Teleports.Up.y, Config.Locations.Teleports.Up.z, false, false, false, false)
            end
        end

        if #(player - Config.Locations.Start) < Config.textdistance and rob == false then
            sleep = false
            Draw3DText(Config.Locations.Start.x, Config.Locations.Start.y, Config.Locations.Start.z,
                Config.DrawTexts[4])
            if IsControlJustReleased(0, 38) then
                TriggerServerEvent('dv:server:start')
                AllFunctions('veh')
            end
        end        
            if sleep then
                Wait(2500)
            else
                Wait(0)
            end
        end
    end)

--hacking
RegisterNetEvent('dv_union:client:hack', function()
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", 7, 35, mycb)
end)
--stoping robbery



--hacking success
RegisterNetEvent('dv-union:hacking:success', function()
    TriggerServerEvent('dv-union:server:callpd')
    TriggerServerEvent('dv:vault:server:unfreeze')
    TriggerEvent('mhacking:hide')
end)
--freezing
RegisterNetEvent('dv:client-events', function(type)
    local obj = GetClosestObjectOfType(-1.72947, -686.5417, 16.68913, 2.0, GetHashKey("v_ilev_fin_vaultdoor"), false,
        false, false)
    if type == 'lock' then
        FreezeEntityPosition(obj, true)
    elseif type == 'unlock' then
        FreezeEntityPosition(obj, false)
    elseif type == 'rob' then
        rob = true
    elseif type == 'stoprobbery' then
        Wait(180000)
        rob = false
    elseif type == 'hack' then
        hacked = true
    end
end)


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
function AllFunctions(type, data)
    if type == 'blip' then
      local dealer = AddBlipForCoord(data.x, data.y, data.z)
      SetBlipSprite(dealer, 475)
      SetBlipDisplay(dealer, 4)
      SetBlipScale(dealer, 0.7)
      SetBlipAsShortRange(dealer, true)
      SetBlipColour(dealer, 3)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentSubstringPlayerName("Union Depository")
      EndTextCommandSetBlipName(dealer)
    elseif type == 'veh' then
      if Config.vehicle == 'qb' and spawned then
        local qbCore = exports['qb-core']:GetCoreObject()
        qbCore.Functions.SpawnVehicle(Config.car, function(veh)
          exports['LegacyFuel']:SetFuel(veh, 100)
          TriggerEvent("vehiclekeys:client:SetOwner", qbCore.Functions.GetPlate(veh))
          spawned = false
        end, vector3(443.9419, -1922.5876, 24.6235), true)
      elseif Config.vehicle == 'esx' and spawned then
        local esx = exports["es_extended"]:getSharedObject()
        esx.Game.SpawnVehicle(Config.car, vector3(443.9419, -1922.5876, 24.6235), 360, function(vehicle)
          spawned = false
        end)
      end
    elseif type == 'progbar' then
      if Config.progressbar == 'qb' then
        local qbCore = exports['qb-core']:GetCoreObject()
        qbCore.Functions.Progressbar(Config.DrawTexts[7], Config.DrawTexts[7], math.random(3000, 5000), false, true,
          {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          }, {}, {}, {}, function()
            TriggerServerEvent('dv-unionrobbery:server:addmoney')
            Wait(120000)
            collectingtime = false
          end)
      end
  
      if Config.progressbar == 'esx' then
        exports["esx_progressbar"]:Progressbar(Config.DrawTexts[7], math.random(3000, 5000), {
          FreezePlayer = true,
          onFinish = function()
            TriggerServerEvent('dv-unionrobbery:server:addmoney')
            Wait(120000)
            collectingtime = false
          end
        })
      end
    end
  end
  

function Draw3DText(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
