
local teleport = false --- teleport for base
local rob = false ---rob for base
local marker5 = false
----Vault type/coords----
DV = {
    vault = {x = -1.72947, y = -686.5417, z = 16.68913, type = "v_ilev_fin_vaultdoor"}
    }

----CONFIG locals----
local v1 = Config.collectpoint
local v2 = Config.collectpoint1
local v3 = Config.collectpoint2
local v4 = Config.collectpoint3
local v5 = Config.hack
local v6 = Config.startheist
local v7 = Config.escapetext
local teleport2 = Config.teleportdowntext
local teleport1 = Config.teleportuptext
----Draw text function -----
    function Draw3DText(x, y, z, scl_factor, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        local p = GetGameplayCamCoords()
        local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
        local scale = (1 / distance) * 2
        local fov = (1 / GetGameplayCamFov()) * 100
        local scale = scale * fov * scl_factor
        if onScreen then
            SetTextScale(0.0, scale)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x, _y)
        end
    end
    ----DISTANCE 3D text ----
    local distance_until_text_disappears = Config.TEXTdistance
    ----3D text ----
    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local v11 = #(coords-Config.collectpoint)
                local sleep = true
                if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance_until_text_disappears then
                    if rob == true then 
                        sleep = false
                    Draw3DText(v1.x, v1.y, v1.z, 0.5, Config.draw6)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent('add')  
                        
                        if sleep then
                            Wait(500)
                        end
                        break
                    end
                    end
                    end
                end
            end
        end
    )

    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local sleep = true
                local v11 = #(coords-Config.collectpoint1)

            

                if Vdist2(GetEntityCoords(PlayerPedId(), false), v2) < distance_until_text_disappears then
                    if rob == true then 
                        sleep = false
                    Draw3DText(v2.x, v2.y, v2.z, 0.5, Config.draw6)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then

                        TriggerServerEvent('add')
                        
                        
    if sleep then
        Wait(500)
      end
    break
                    end
                    end
                    end
                end
            end
        end
    )
    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local v11 = #(coords-Config.collectpoint2)
                local sleep = true

        
                if Vdist2(GetEntityCoords(PlayerPedId(), false), v3) < distance_until_text_disappears then
                    if rob == true then 
                        sleep = false
                    Draw3DText(v3.x, v3.y, v3.z, 0.5, Config.draw6)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then

                        TriggerServerEvent('add')
                        
    if sleep then
        Wait(500)
      end
    break
                    end
                    end
                    end
                end
            end
        end
    )
    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local sleep = true
                local v11 = #(coords-Config.collectpoint3)


                if Vdist2(GetEntityCoords(PlayerPedId(), false), v4) < distance_until_text_disappears then
                    if rob == true then 
                        sleep = false

                    Draw3DText(v4.x, v4.y, v4.z, 0.5, Config.draw6)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then

                        TriggerServerEvent('add')
                        
  if sleep then
      Wait(500)
    end
    break
                    end
                    end
                    end
                end
            end
        end
    )
    CreateThread(
        function()
            while true do
                Wait(0)
                if marker5 == true then
                local coords = GetEntityCoords(PlayerPedId())
                local sleep = true
                local v11 = #(coords-Config.hack)

 
                if Vdist2(GetEntityCoords(PlayerPedId(), false), v5) < distance_until_text_disappears then
                        sleep = false
                    Draw3DText(v5.x, v5.y, v5.z, 0.5, Config.draw5)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent('1')
                        if sleep then
                            Wait(500)
                          end
    
                    end
                    end
                    end
                end
            end
        end
    )
    
    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local sleep = true
                local v11 = #(coords-Config.startheist)

                if Vdist2(GetEntityCoords(PlayerPedId(), false), v6) < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(v6.x, v6.y, v6.z, 0.5, Config.draw4)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent('startheist') 
                        RequestIpl('FINBANK')
                        marker5 = true
                        if teleport == false then
                            teleport = true 
                            if rob == false then
                                rob = true 
                                if sleep then
                                    Wait(500)
                                  end
    break
                                end
                        end
                    end
                    
                    end
                end
            end
        end
    )
    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local sleep = true
                local v11 = #(coords-Config.teleportuptext)

            

                if Vdist2(GetEntityCoords(PlayerPedId(), false), teleport1) < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(teleport1.x, teleport1.y, teleport1.z, 0.5, Config.draw3)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then
TriggerEvent('dv:vault:freeze')
                        teleportToCoords(PlayerPedId(),Config.teleportup)
                        if sleep then
                            Wait(500)
                          end
                    end
                    end
                end
            end
        end
    )
    ----Freeze vault----
    RegisterNetEvent('dv:vault:freeze')
    AddEventHandler('dv:vault:freeze', function(data)
        local obj = GetClosestObjectOfType(DV.vault.x, DV.vault.y, DV.vault.z, 2.0, GetHashKey(DV.vault.type), false, false, false)
        FreezeEntityPosition(obj, true)

    end)
    ----Unfreeze vault----
    RegisterNetEvent('dv:vault:unfreeze')
    AddEventHandler('dv:vault:unfreeze', function(data)
        local obj = GetClosestObjectOfType(DV.vault.x, DV.vault.y, DV.vault.z, 2.0, GetHashKey(DV.vault.type), false, false, false)
        FreezeEntityPosition(obj, false)

    end)
    ----Teleport----
    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local v11 = #(coords-Config.teleportdowntext)
                local sleep = true

                

                if Vdist2(GetEntityCoords(PlayerPedId(), false), teleport2) < distance_until_text_disappears then
                    sleep = false
                    Draw3DText(teleport2.x, teleport2.y, teleport2.z, 0.5, Config.draw2)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then

                
                        teleportToCoords(PlayerPedId(),Config.teleportdown)


                        if sleep then
                            Wait(500)
                          end
                        end
                    
                    end
                end
            end
        end
    )
    CreateThread(
        function()
            while true do
                Wait(0)
                local coords = GetEntityCoords(PlayerPedId())
                local sleep = true
                local v11 = #(coords-Config.escapetext)

              
                if Vdist2(GetEntityCoords(PlayerPedId(), false), v7) < distance_until_text_disappears then
                        sleep = false
                    Draw3DText(v7.x, v7.y, v7.z, 0.5, Config.draw1)
                    if v11 <= 1 then
                    if IsControlJustReleased(0, 38) then
                        if teleport == true then
                        teleportToCoords(PlayerPedId(),Config.escape)

                TriggerEvent('dv-unionrobbery:client:stoprobbery')
                                                          if sleep then
                                                            Wait(500)
                                                          end
    break

                        
                        end
                    end
                    end
                end
            end
        end
    )
    ----HACKING----
RegisterNetEvent('1')
AddEventHandler('1', function(data)
TriggerEvent("mhacking:show")
TriggerEvent("mhacking:start",7,35,mycb)
end)
function mycb(success, timeremaining)
	if success then
        TriggerServerEvent('alertpd')
        TriggerEvent('dv:vault:unfreeze')
        TriggerEvent('mhacking:hide')
        marker5 = false
	else
		TriggerEvent('mhacking:hide')
        marker5 = true
	end
end
----TELEPORT function----
function teleportToCoords(ped, x, y, z, heading)
    CreateThread( -- Anything that requires a loop will require a thread, else the code will lock and crash
      function()
        DoScreenFadeOut(800)
        while not IsScreenFadedOut() do
          Wait(0)
        end
        SetEntityCoords(ped, x, y, z)
        SetEntityHeading(ped, heading)
        DoScreenFadeIn(800)
      end
    )
  end
  ----Robbery stop----
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
----BLIP----
CreateThread(function()
    if Config.blip == true then
    local Dealer = AddBlipForCoord( -5.6612, -669.8186, 32.3381)
    SetBlipSprite (Dealer, 475  )
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Union Depository")
    EndTextCommandSetBlipName(Dealer)
    else 
    end
end)