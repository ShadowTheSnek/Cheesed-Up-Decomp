event_inherited()
function anon@27@gml_Object_obj_soundtest_pause_Create_0() //gml_Script_anon@27@gml_Object_obj_soundtest_pause_Create_0
{
    with (obj_soundtest)
    {
        play = (!play)
        if play
        {
            other.active = 0
            if (!fmod_event_instance_is_playing(music_event))
                fmod_event_instance_play(music_event)
            fmod_event_instance_set_paused(music_event, 0)
        }
        else
        {
            other.active = 1
            fmod_event_instance_set_paused(music_event, 1)
        }
    }
}

active = 1
