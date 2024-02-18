function seq_afterimages_uppersnd() //gml_Script_seq_afterimages_uppersnd
{
    sound_play_centered("event:/sfx/pep/uppercut")
}

function seq_afterimages_landsnd() //gml_Script_seq_afterimages_landsnd
{
    sound_play_centered("event:/sfx/pep/step")
}

function seq_secretwall_sound() //gml_Script_seq_secretwall_sound
{
}

function seq_kungfu_sound() //gml_Script_seq_kungfu_sound
{
    sound_play_centered("event:/modded/sfx/kungfu")
}

function seq_grab_sound() //gml_Script_seq_grab_sound
{
    sound_play_centered("event:/sfx/pep/suplexdash")
}

function seq_grab_stop() //gml_Script_seq_grab_stop
{
    sound_stop("event:/sfx/pep/suplexdash", 1)
}

function seq_punch_sound() //gml_Script_seq_punch_sound
{
    sound_play_centered("event:/sfx/pep/punch")
}

function seq_kill_sound() //gml_Script_seq_kill_sound
{
    sound_play_centered("event:/sfx/enemies/kill")
}

function seq_killingblow_sound() //gml_Script_seq_killingblow_sound
{
    sound_play_centered("event:/sfx/pep/punch")
    sound_play_centered("event:/sfx/enemies/killingblow")
}

function seq_dive_sound() //gml_Script_seq_dive_sound
{
    sound_play_centered("event:/sfx/pep/dive")
}

function seq_step_sound() //gml_Script_seq_step_sound
{
    sound_play_centered("event:/sfx/pep/step")
}

function seq_jump_sound() //gml_Script_seq_jump_sound
{
    sound_play_centered("event:/sfx/pep/jump")
}

function seq_groundpound_sound() //gml_Script_seq_groundpound_sound
{
    seq_stop_freefall_sound()
    sound_play_centered("event:/sfx/pep/groundpound")
}

function seq_freefall_sound() //gml_Script_seq_freefall_sound
{
    with (obj_modconfig)
    {
        freefallsnd = fmod_event_create_instance("event:/sfx/pep/freefall")
        sound_play_centered(freefallsnd)
    }
}

function seq_stop_freefall_sound() //gml_Script_seq_stop_freefall_sound
{
    with (obj_modconfig)
    {
        if (variable_struct_get(self, "freefallsnd") != undefined && freefallsnd != -4)
        {
            destroy_sounds([freefallsnd])
            freefallsnd = -4
        }
    }
}

