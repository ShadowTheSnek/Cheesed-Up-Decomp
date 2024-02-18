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
function anon@176@gml_RoomCC_sucrose_1_4_Create() //gml_Script_anon@176@gml_RoomCC_sucrose_1_4_Create
{
    instance_create_unique(0, 0, obj_hungrypillarflash)
    activate_panic(1)
}

function anon@287@gml_RoomCC_sucrose_1_4_Create() //gml_Script_anon@287@gml_RoomCC_sucrose_1_4_Create
{
    with (obj_music)
    {
        if (music != noone)
            return fmod_event_instance_get_timeline_pos(music.event) >= 9440;
        else
            return ++other.count >= 570;
    }
}

