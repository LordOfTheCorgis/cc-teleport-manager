Config = {}

Config.Teleports = {
    --[[
    markin = The marker to get inside
    markout = The marker to get out
    locin = The location to spawn inside
    locout = The location to spawn outside
    ]]--
    
    ["Doomsday Finale"] = {
        enter = {
            model = `xm_prop_x17_server_farm`,
            coords = vec3(-360.8825, 4826.5556, 143.1441)
        },
        exit = {
            model = `xm_prop_x17_server_farm`,
            coords = vec3(1256.2868, 4798.3833, -39.4710)
        },
        teleportIn = vec4(1259.5418, 4812.1196, -39.7744, 344.82),
        teleportOut = vec4(-353.6516, 4815.8237, 142.7413, 0.0),
    },

    ["Doomsday Silo"] = {
        enter = {
            model = `xm_prop_x17_control_panel`,
            coords = vec3(598.3062, 5556.9243, -716.7614)
        },
        exit = {
            model = `xm_prop_x17_control_panel`,
            coords = vec3(369.5532, 6319.6455, -159.9274)
        },
        teleportIn = vec4(369.4623, 6319.7627, -659.9273, 0.0),
        teleportOut = vec4(602.2703, 5546.9267, 716.3892, 0.0),
    },

    ["Doomsday Facility"] = {
        enter = {
            model = `xm_prop_x17_control_panel`,
            coords = vec3(1286.9239, 2845.8833, 49.3942)
        },
        exit = {
            model = `xm_prop_x17_control_panel`,
            coords = vec3(489.0622, 4785.3623, -58.9291)
        },
        teleportIn = vec4(483.2006, 4810.5405, -58.9192, 18.0470),
        teleportOut = vec4(1267.4091, 2830.9741, 48.4444, 128.1668),
    },
}
