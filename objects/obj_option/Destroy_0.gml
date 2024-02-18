with (obj_player)
{
    if (state == states.actor)
        state = states.normal
}
gamesave_async_save_options()
fmod_event_instance_stop(global.snd_slidermaster, 1)
fmod_event_instance_stop(global.snd_slidermusic, 1)
fmod_event_instance_stop(global.snd_slidersfx, 1)
