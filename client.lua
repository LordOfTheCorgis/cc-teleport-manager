local function teleportPlayer(coords)
    local ped = PlayerPedId()
    DoScreenFadeOut(500)
    Wait(500)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w or 0.0)
    Wait(500)
    DoScreenFadeIn(500)
end

local function registerTeleport(name, data)
    exports.ox_target:addModel(data.enter.model, {
        {
            name = name .. "_enter",
            label = "Enter " .. name,
            icon = "fa-solid fa-door-open",
            coords = data.enter.coords,
            distance = 2.5,
            onSelect = function()
                teleportPlayer(data.teleportIn)
            end
        }
    })

    exports.ox_target:addModel(data.exit.model, {
        {
            name = name .. "_exit",
            label = "Exit " .. name,
            icon = "fa-solid fa-door-closed",
            coords = data.exit.coords,
            distance = 2.5,
            onSelect = function()
                teleportPlayer(data.teleportOut)
            end
        }
    })
end

CreateThread(function()
    for name, data in pairs(Config.Teleports) do
        registerTeleport(name, data)
    end
end)

RegisterCommand('vector3', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    print(string.format("vector3(%.4f, %.4f, %.4f)", pos.x, pos.y, pos.z))
end)

RegisterCommand('vector4', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    print(string.format("vec4(%.4f, %.4f, %.4f, %.2f)", pos.x, pos.y, pos.z, heading))
end)
