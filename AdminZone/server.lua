--- Admin Area, by Balde ---
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('setzone', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.permission_level > 1 then

        if xPlayer.get('aduty') then -- Or any command that admins activate with this device on your server (replace 'aduty')
            local radius = tonumber(args[1])
            TriggerClientEvent("Blade:AdminAreaSet", -1, source, radius)
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0You cant if you are ^1OffDuty ^0Use From this!")
        end

    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0You Are not an admin!")
    end
end)

RegisterCommand('clearzone', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.permission_level > 1 then

        if xPlayer.get('aduty') then -- Or any command that admins activate with this device on your server (replace 'aduty')
              TriggerClientEvent("Blade:AdminAreaClear", -1, source)
        else
              TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0You cant if you are ^1OffDuty ^0Use From this!")
        end

    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0You are not an admin!")
    end
end)
