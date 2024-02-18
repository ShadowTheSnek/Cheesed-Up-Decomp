function scr_fmod_soundeffect(argument0, argument1, argument2, argument3) //gml_Script_scr_fmod_soundeffect
{
    if (argument3 == undefined)
        argument3 = id
    sound_instance_move(argument0, argument1, argument2, argument3)
    fmod_event_instance_play(argument0)
}

