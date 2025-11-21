if not lib.checkDependency('ox_lib', '3.32.0', true) then return end

local Config = require 'shared.config'

if Config.ShowBlips then
    CreateThread(function()
        for _, i in pairs(Config.MapLocations) do
            local coords = i.coords
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, i.blipSprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, i.blipScale)
            SetBlipColour(blip, i.blipColor)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(i.blipName)
            EndTextCommandSetBlipName(blip)
        end
    end)
else
    lib.print.warn(locale('error.blips_not_enabled_description'))
end
