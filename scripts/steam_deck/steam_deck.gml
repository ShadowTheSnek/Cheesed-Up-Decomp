function steam_deck() //gml_Script_steam_deck
{
    var info = os_get_info()
    if (is_undefined(ds_map_find_value(info, "gl_vendor_string")) || is_undefined(ds_map_find_value(info, "gl_version_string")))
    {
        return 
        {
            var is_steamdeck: 0,
            var gamepad_index: -1
        };
    }
    var vendor = ((string(ds_map_find_value(info, "gl_vendor_string")) + " ") + string(ds_map_find_value(info, "gl_version_string")))
    var renderer = ds_map_find_value(info, "gl_renderer_string")
    gamepad_index = -1
    is_steamdeck = 0
    var devices = gamepad_get_device_count()
    for (var i = 0; i < devices; i++)
    {
        if gamepad_is_connected(i)
        {
            var desc = gamepad_get_description(i)
            if (desc != "" && string_pos("Valve", desc) != 0)
                gamepad_index = i
        }
    }
    if (string_pos("AMD", vendor) != 0 && string_pos("Mesa", vendor) != 0 && string_pos("AMD", renderer) != 0 && string_pos("valve", renderer) != 0 && gamepad_index >= 0)
        is_steamdeck = 1
    return 
    {
        is_steamdeck: is_steamdeck,
        gamepad_index: gamepad_index
    };
}

