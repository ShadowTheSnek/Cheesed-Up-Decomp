function scr_player_faceplant() //gml_Script_scr_player_faceplant
{
    hsp = (xscale * movespeed)
    move = (key_right + key_left)
    if (movespeed < 12 && grounded)
        movespeed += 0.5
    if (input_buffer_jump > 0 && can_jump && (character != "N" || noisetype == 0))
    {
        scr_fmod_soundeffect(jumpsnd, x, y)
        input_buffer_jump = 0
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        jumpstop = 0
        image_index = 0
        vsp = -11
        state = states.mach2
        movespeed = max(movespeed, 6)
        sprite_index = spr_mach2jump
    }
    if (key_down && (character != "N" || noisetype == 0))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        state = states.tumble
        image_index = 0
        if (!grounded)
        {
            sprite_index = spr_mach2jump
            flash = 0
            vsp = 10
        }
    }
    if (check_solid((x + hsp), y) && (!(check_slope((x + hsp), y))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        if ledge_bump((vsp >= 0 ? 32 : 22))
        {
            if grounded
            {
                sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                vsp = -4
                sprite_index = spr_kungfujump
                image_index = 0
                state = states.punch
                movespeed = -6
            }
            else
            {
                sound_play_3d("event:/sfx/pep/splat", x, y)
                state = states.bump
                image_index = 0
                sprite_index = spr_wallsplat
            }
        }
    }
    if (floor(image_index) == (image_number - 1))
    {
        image_speed = 0.35
        grav = 0.35
        if ((!key_attack) || (character == "N" && noisetype == 1))
            state = states.normal
        else
            state = states.mach2
    }
    if (key_down && grounded && vsp > 0)
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0))
        movespeed = max(movespeed, 12)
        crouchslipbuffer = 25
        grav = 0.5
        sprite_index = spr_crouchslip
        image_index = 0
        machhitAnim = 0
        state = states.tumble
        fmod_event_instance_play(snd_crouchslide)
    }
    if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
    {
        with (gml_Script_instance_create(x, y, obj_dashcloud2))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
    }
    image_speed = 0.5
}

