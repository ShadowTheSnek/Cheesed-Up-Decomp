function scr_snick_roll() //gml_Script_scr_snick_roll
{
    if (sprite_index == spr_snick_spindash)
    {
        if (!instance_exists(obj_superdashcloud))
        {
            with (gml_Script_instance_create((x - (xscale * 85)), y, obj_superdashcloud))
            {
                image_xscale = other.xscale
                image_yscale = other.yscale
            }
        }
        image_speed = 0.5
        if (abs(hsp) > 0)
            hsp = Approach(hsp, 0, 1)
        if (movespeed > 0)
            movespeed -= 0.01
        if (key_jump || key_slap2 || key_chainsaw2)
        {
            image_index = 0
            movespeed = min((movespeed + 2), 8)
            fmod_event_instance_set_parameter(spindashsnd, "state", movespeed, 1)
            sound_instance_move(spindashsnd, x, y)
            fmod_event_instance_play(spindashsnd)
        }
        if ((key_slap || key_chainsaw) && input_buffer_grab <= 0 && input_buffer_slap <= 0)
            movespeed = min((movespeed + 0.25), 6)
        if ((!key_down) && input_buffer_grab <= 0 && input_buffer_slap <= 0 && (!key_slap) && (!key_chainsaw))
        {
            movespeed = (xscale * (8 + (movespeed * 2)))
            state = states.machroll
            sprite_index = spr_tumble
            with (obj_camera)
                lag = 12
            sound_play_3d("event:/modded/sfx/snick/release", x, y)
        }
    }
    else if (sprite_index == spr_move || sprite_index == spr_mach || sprite_index == spr_mach4 || sprite_index == spr_crazyrun)
    {
        hsp = 0
        if (!instance_exists(obj_dashcloud))
        {
            with (gml_Script_instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale
                image_yscale = other.yscale
            }
        }
        movespeed = min((movespeed + 1), 24)
        if (movespeed >= 24)
        {
            sprite_index = spr_crazyrun
            if (!instance_exists(obj_superdashcloud))
            {
                with (gml_Script_instance_create((x - (xscale * 85)), y, obj_superdashcloud))
                {
                    image_xscale = other.xscale
                    image_yscale = other.yscale
                }
            }
        }
        else if (movespeed >= 16)
            sprite_index = spr_mach4
        else if (movespeed >= 12)
            sprite_index = spr_mach
        else
            sprite_index = spr_move
        if (!key_attack)
        {
            movespeed = (xscale * movespeed)
            state = states.normal
            flash = 1
            sound_stop("event:/modded/sfx/snick/peelrev")
            if (abs(movespeed) >= 16)
                sound_play_3d("event:/modded/sfx/snick/peelrelease", x, y)
        }
        else if (key_jump && grounded)
        {
            scr_fmod_soundeffect(jumpsnd, x, y)
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
            sprite_index = spr_jump
            state = states.jump
            vsp = -11
            jumpstop = 0
            movespeed = (xscale * movespeed)
            flash = 1
            sound_stop("event:/modded/sfx/snick/peelrev")
            if (abs(movespeed) >= 16)
                sound_play_3d("event:/modded/sfx/snick/peelrelease", x, y)
        }
    }
    else
        state_snick_normal()
    input_buffer_jump = 0
}

