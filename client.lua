local MARKER_DISTANCE = 50.0
local MARKER_SIZE = 0.75
local MARKER_COLOR = {255, 255, 0, 100} -- RGBA
local KEY = 38 -- KEY "E"

local function DrawTeleportMarker(x, y, z)
    DrawMarker(
        1,
        x, y, z - 1.0,
        0.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        MARKER_SIZE, MARKER_SIZE, MARKER_SIZE,
        MARKER_COLOR[1], MARKER_COLOR[2], MARKER_COLOR[3], MARKER_COLOR[4],
        false, true, 2, false, nil, nil, false
    )
end

CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for name, tp in pairs(Config.Teleports) do
            
            local markIn  = vector3(tp.markin[1], tp.markin[2], tp.markin[3])
            local markOut = vector3(tp.markout[1], tp.markout[2], tp.markout[3])
            local locIn   = tp.locin
            local locOut  = tp.locout

            if #(coords - markIn) < MARKER_DISTANCE then
                sleep = 0
                DrawTeleportMarker(markIn.x, markIn.y, markIn.z)
            end

            if #(coords - markOut) < MARKER_DISTANCE then
                sleep = 0
                DrawTeleportMarker(markOut.x, markOut.y, markOut.z)
            end

            -- Teleport: Outside → Inside
            if #(coords - markIn) < 1.5 then
                sleep = 0
                BeginTextCommandDisplayHelp("STRING")
                AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to enter")
                EndTextCommandDisplayHelp(0, false, true, -1)

                if IsControlJustPressed(0, KEY) then
                    SetEntityCoords(ped, locIn[1], locIn[2], locIn[3])
                    if locIn[4] then SetEntityHeading(ped, locIn[4]) end
                end
            end

            -- Teleport: Inside → Outside
            if #(coords - markOut) < 1.5 then
                sleep = 0
                BeginTextCommandDisplayHelp("STRING")
                AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to exit")
                EndTextCommandDisplayHelp(0, false, true, -1)

                if IsControlJustPressed(0, KEY) then
                    SetEntityCoords(ped, locOut[1], locOut[2], locOut[3])
                    if locOut[4] then SetEntityHeading(ped, locOut[4]) end
                end
            end
        end

        Wait(sleep)
    end
end)
