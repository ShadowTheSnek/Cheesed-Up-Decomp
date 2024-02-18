message = "don't steal my code shithead"
function cyop_music() //gml_Script_cyop_music
{
    music = -4
    if (current_custom != -4)
    {
        var song = custom_music[current_custom]
        if song.fmod
        {
            if (song.instance == -4)
            {
                song.instance = fmod_event_create_instance(song.event)
                fmod_event_instance_set_parameter(song.instance, "state", song.state, 0)
                fmod_event_instance_play(song.instance)
            }
            else
            {
                fmod_event_instance_set_paused(song.instance, 0)
                song.paused = 0
            }
        }
        else if (song.instance == -4)
            song.instance = audio_play_sound(song.event, 0, true, global.option_music_volume)
        else
        {
            var volume = 0.8
            volume /= (fmod_get_parameter("totem") * 2)
            volume *= (1 - fmod_get_parameter("pillarfade"))
            audio_sound_gain(song.instance, (global.option_music_volume * clamp(volume, 0, 1)), 0)
            if audio_is_paused(song.instance)
                audio_resume_sound(song.instance)
        }
    }
}

function cyop_freemusic() //gml_Script_cyop_freemusic
{
    with (obj_music)
    {
        current_custom = -4
        while (array_length(custom_music) > 0)
        {
            var i = array_pop(custom_music)
            if i.fmod
            {
                fmod_event_instance_stop(i.instance, 1)
                fmod_event_instance_release(i.instance)
            }
            else
                audio_stop_sound(i.instance)
            i = undefined
        }
    }
}

