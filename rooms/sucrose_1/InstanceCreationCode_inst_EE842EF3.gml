if (global.jukebox == -4)
{
    instance_destroy()
    return;
}
if global.panic
{
    instance_destroy()
    return;
}
count = 0
flags.do_once_per_save = 1
function anon@176@gml_RoomCC_sucrose_1_5_Create() //gml_Script_anon@176@gml_RoomCC_sucrose_1_5_Create
{
    var _bg = layer_background_get_id_fix("Backgrounds_still1")
    layer_background_sprite(_bg, bg_sucrose_skyWakingUp)
    layer_background_index(_bg, 0)
}

function anon@366@gml_RoomCC_sucrose_1_5_Create() //gml_Script_anon@366@gml_RoomCC_sucrose_1_5_Create
{
    with (obj_music)
    {
        if (music != noone)
            return fmod_event_instance_get_timeline_pos(music.event) >= 8110;
        else
            return ++other.count >= 490.2;
    }
}

