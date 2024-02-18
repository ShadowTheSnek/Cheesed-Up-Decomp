if (ds_map_find_value(async_load, "type") == "video_start")
{
    scene = 999
    with (gml_Script_instance_create(0, 0, obj_genericfade))
    {
        fade = 1.2
        deccel = 0.03
    }
}
if (ds_map_find_value(async_load, "type") == "video_end")
    room_goto(Mainmenu)
