function room_is_secret(argument0) //gml_Script_room_is_secret
{
    if is_string(argument0)
    {
        var r = ds_map_find_value(global.room_map, argument0)
        if is_undefined(r)
            return 0;
        return (@@Global@@().custom_rooms[r][0] == room && instance_exists(obj_ghostcollectibles));
    }
    else
        return (string_last_pos("_secret", room_get_name(argument0)) > 0 || argument0 == tower_soundtest || argument0 == tower_soundtestlevel || (room == argument0 && instance_exists(obj_ghostcollectibles)));
}

