function fmod_event_instance_is_playing(argument0) //gml_Script_fmod_event_instance_is_playing
{
    return fmod_event_instance_get_playback_state(argument0) == (0 << 0);
}

