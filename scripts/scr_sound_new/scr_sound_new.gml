function sound_stop_all(argument0) //gml_Script_sound_stop_all
{
    if (argument0 == undefined)
        argument0 = 1
    audio_stop_all()
    stop_music()
}

function sound_create_instance(argument0) //gml_Script_sound_create_instance
{
    if is_string(argument0)
    {
        var inst = fmod_event_create_instance(argument0)
        if (!inst)
            log_source(string("Failed to create instance of {0}", argument0))
        return inst;
    }
    else if (is_handle(argument0) && audio_exists(argument0))
    {
        var snd = audio_play_sound(argument0, 0, false, 0)
        audio_stop_sound(snd)
        return snd;
    }
    else
        log_source(string("Event {0} doesn't exist", argument0))
}

function sound_destroy_instance(argument0) //gml_Script_sound_destroy_instance
{
    if (argument0 == -4)
        return;
    if (is_handle(argument0) && audio_exists(argument0))
        audio_stop_sound(argument0)
    else if (!fmod_event_instance_release(argument0))
        log_source(string("Failed to release instance {0}", argument0))
}

function sound_pause_all(argument0, argument1) //gml_Script_sound_pause_all
{
    if (argument1 == undefined)
        argument1 = -1
    if argument0
        audio_pause_all()
    else
        audio_resume_all()
    if (argument1 == -1)
        fmod_event_instance_set_paused_all(argument0)
    else
        fmod_event_instance_set_paused_all_exclude(argument0, argument1)
}

function sound_stop(argument0, argument1) //gml_Script_sound_stop
{
    if (argument1 == undefined)
        argument1 = 1
    if (argument0 == -4)
        return;
    if is_string(argument0)
    {
        var index = fmod_event_instance_get_index(argument0)
        return (index == -4 ? 0 : fmod_event_instance_stop(index, argument1));
    }
    else if (is_handle(argument0) && audio_exists(argument0))
        audio_stop_sound(argument0)
    else if (!(fmod_event_instance_stop(argument0, argument1)))
        log_source(string("Failed to stop instance {0}", argument0))
}

function sound_is_playing(argument0) //gml_Script_sound_is_playing
{
    if (argument0 == -4)
        return 0;
    if is_string(argument0)
    {
        index = fmod_event_instance_get_index(argument0)
        return (index == -4 ? 0 : fmod_event_instance_is_playing(index));
    }
    else if (is_handle(argument0) && audio_exists(argument0))
        return audio_is_playing(argument0);
    else
        return fmod_event_instance_is_playing(argument0);
}

function sound_play(argument0) //gml_Script_sound_play
{
    sound_play_3d(argument0)
}

function sound_play_3d(argument0, argument1, argument2) //gml_Script_sound_play_3d
{
    if (argument1 == undefined)
        argument1 = undefined
    if (argument2 == undefined)
        argument2 = undefined
    if (argument0 == -4 || argument0 == "")
        return;
    if (global.MOD.Mirror && argument1 != undefined)
        argument1 = (room_width - argument1)
    if is_string(argument0)
    {
        if (argument1 != undefined && argument2 != undefined)
        {
            if (!(fmod_event_one_shot_3d(argument0, argument1, argument2)))
                log_source(string("Failed to one shot {0}", argument0))
        }
        else if (!fmod_event_one_shot(argument0))
            log_source(string("Failed to one shot {0}", argument0))
    }
    else
    {
        if (is_handle(argument0) && audio_exists(argument0))
        {
            audio_play_sound(argument0, 0, false, (global.option_sfx_volume * global.option_master_volume))
            return;
        }
        fmod_event_instance_set_paused(argument0, 0)
        if (argument1 != undefined && argument2 != undefined)
            sound_instance_move(argument0, argument1, argument2)
        if (!fmod_event_instance_play(argument0))
            log_source(string("Failed to play instance {0}", argument0))
    }
}

function sound_play_centered(argument0) //gml_Script_sound_play_centered
{
    sound_play_3d(argument0, (camera_get_view_x(view_camera[0]) + (obj_screensizer.actual_width / 2)), (camera_get_view_y(view_camera[0]) + (obj_screensizer.actual_height / 2)))
}

function sound_instance_move(argument0, argument1, argument2) //gml_Script_sound_instance_move
{
    if is_string(argument0)
        argument0 = fmod_event_instance_get_index(argument0)
    else if (!is_real(argument0))
        return;
    if (argument0 == -4)
        return 0;
    if global.MOD.Mirror
        argument1 = (room_width - argument1)
    if (!(fmod_event_instance_set_3d_attributes(argument0, argument1, argument2)))
        log_source(string("Failed to set 3D attributes for instance {0}", argument0))
}

