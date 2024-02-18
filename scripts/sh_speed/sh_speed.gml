function sh_speed(argument0) //gml_Script_sh_speed
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return "Missing argument: speed";
    var spd = argument0[1]
    if string_is_number(spd)
    {
        game_set_speed(real(spd), gamespeed_fps)
        return string("Set room speed to {0}", game_get_speed(gamespeed_fps));
    }
    else
        return "Speed parameter must be a number";
}

function meta_speed() //gml_Script_meta_speed
{
    return 
    {
        description: "set the game's maximum FPS. depending on your setup it might not go over 60",
        var arguments: ["speed"],
        suggestions: [function() //gml_Script_anon@570@___struct___49_meta_speed_sh_speed
        {
            if (room_speed != 60)
                return [60, room_speed];
            return [60];
        }],
        argumentDescriptions: ["the number to set the maximum FPS to"]
    };
}

