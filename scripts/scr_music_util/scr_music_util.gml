function add_music(argument0, argument1, argument2, argument3, argument4) //gml_Script_add_music
{
    if (argument4 == undefined)
        argument4 = -4
    var b = 
    {
        continuous: argument3,
        on_room_start: -4,
        value: 0,
        immediate: 0,
        event: -4,
        event_secret: -4
    }

    with (b)
    {
        if (argument4 != -4)
            on_room_start = method(self, argument4)
        if (argument1 != -4)
        {
            event_name = argument1
            event = fmod_event_create_instance(argument1)
        }
        if (argument2 != -4)
        {
            event_secret_name = argument2
            event_secret = fmod_event_create_instance(argument2)
        }
    }
    ds_map_set(music_map, argument0, b)
    return b;
}

function stop_music() //gml_Script_stop_music
{
    if (global.jukebox != -4)
        return;
    with (obj_music)
    {
        if (music != noone)
        {
            if obj_pause.pause
            {
                fmod_event_instance_stop(music.event, 1)
                fmod_event_instance_stop(music.event_secret, 1)
            }
            else
            {
                fmod_event_instance_stop(music.event, 0)
                fmod_event_instance_stop(music.event_secret, 0)
            }
        }
        fmod_event_instance_stop(pillarmusicID, 1)
        fmod_event_instance_stop(panicmusicID, 1)
        cyop_freemusic()
    }
}

function hub_state(argument0, argument1, argument2) //gml_Script_hub_state
{
    var s = 0
    switch argument0
    {
        case tower_1:
        case tower_1up:
        case tower_cheftask1:
        case tower_johngutterhall:
        case tower_ruinsecret:
            s = 0
            break
        case tower_2:
        case tower_2up:
        case tower_cheftask2:
        case tower_ravine:
            s = 1
            break
        case tower_3:
        case tower_3up:
        case tower_cheftask3:
        case tower_pizzaland:
            s = 2
            break
        case tower_4:
        case tower_4up:
        case tower_cheftask4:
        case tower_graffiti:
        case tower_noisettecafe:
            s = 3
            break
        case tower_5:
        case tower_cheftask5:
        case tower_laundryroom:
        case tower_mansion:
            s = 4
            break
        case tower_extra:
        case tower_sage:
        case tower_extra2:
            s = 5
            break
        case tower_freerun:
            s = 6
            break
        case tower_hubroomE:
            s = 7
            break
        case tower_sugary:
            s = 8
            break
    }

    fmod_event_instance_set_parameter(argument1, "hub", s, 0)
}

function music_get_pos_wrap(argument0, argument1) //gml_Script_music_get_pos_wrap
{
    while (argument0 > argument1)
        argument0 -= argument1
    if (argument0 < 1)
        argument0 = 1
    return argument0;
}

