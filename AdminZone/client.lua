--- Admin Area, Made by Blade ---

--- Config ---
local misTxtDis = "~r~~h~RP Stopped in an area of ​​the map. Please do not enter this area at all." -- Use colors from: https://gist.github.com/leonardosnt/061e691a1c6c0597d633
local blipRadius = 60.0 -- default radius, if none is specified.
local blipCol = 8 -- Default: 2 (Green) Use colors from https://wiki.gt-mp.net/index.php?title=Blips (At Bottom)
local blipName = "Admin Pause"
local alredypause = false

--- Client Code ---
local blip = nil
local radiusBlip = nil

function missionTextDisplay(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end

RegisterNetEvent('Blade:AdminAreaSet')
AddEventHandler("Blade:AdminAreaSet", function(s, adaRadius)
    RemoveBlip(blip)
    RemoveBlip(radiusBlip)
	alredypause = false
	
    if adaRadius == nil then
        adaRadius = blipRadius
	else
		adaRadius = (adaRadius * 10) / 10
    end
	
    local src = s
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    radiusBlip = AddBlipForRadius(coords.x, coords.y, coords.z, adaRadius)
    SetBlipSprite(blip, 464)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, blipCol)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipName)
    EndTextCommandSetBlipName(blip)

    
    SetBlipAlpha(radiusBlip, 80)
    SetBlipColour(radiusBlip, blipCol)

    missionTextDisplay(misTxtDis, 8000)
	alredypause = true
	while alredypause do
	Wait(0)
	DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, adaRadius, adaRadius, adaRadius, 255,0,255, 100, false, true, 2, false, false, false, false)
	end
end)

RegisterNetEvent('Blade:AdminAreaClear')
AddEventHandler("Blade:AdminAreaClear", function()
    RemoveBlip(blip)
    RemoveBlip(radiusBlip)
	alredypause = false
    missionTextDisplay("RP in the previous area ~r~~h~unpaused~s~ ~w~GL!", 5000)
end)

