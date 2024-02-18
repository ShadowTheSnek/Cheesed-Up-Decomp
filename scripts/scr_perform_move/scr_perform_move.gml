function scr_perform_move(argument0, argument1) //gml_Script_scr_perform_move
{
    if (argument1 == undefined)
        argument1 = state
    var attackstyle = global.attackstyle
    var doublegrab = global.doublegrab
    var shootstyle = global.shootstyle
    if (character == "SN")
    {
        attackstyle = 1
        doublegrab = 3
        global.fuel = 3
    }
    if (argument0 == (0 << 0))
    {
        switch attackstyle
        {
            case 1:
                if grounded
                {
                    with (gml_Script_instance_create(x, y, obj_superdashcloud))
                    {
                        image_xscale = other.xscale
                        image_yscale = other.yscale
                    }
                    sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3)
                }
                else
                    sprite_index = choose(spr_kungfuair1transition, spr_kungfuair2transition, spr_kungfuair3transition)
                suplexmove = 1
                particle_set_scale((2 << 0), xscale, 1)
                create_particle(x, y, (2 << 0))
                sound_play_3d("event:/modded/sfx/kungfu", x, y)
                state = states.punch
                movespeed = max(movespeed, 10)
                if (vsp > 0)
                    vsp = 0
                image_index = 0
                break
            case 2:
                if grounded
                {
                    with (gml_Script_instance_create(x, y, obj_superdashcloud))
                    {
                        image_xscale = other.xscale
                        image_yscale = other.yscale
                    }
                    sprite_index = spr_attackdash
                }
                else
                    sprite_index = spr_airattackstart
                suplexmove = 1
                particle_set_scale((2 << 0), xscale, 1)
                create_particle(x, y, (2 << 0))
                fmod_event_instance_play(snd_dive)
                state = states.handstandjump
                movespeed = max(movespeed, 10)
                image_index = 0
                break
            case 3:
                if (!suplexmove)
                {
                    if grounded
                    {
                        with (gml_Script_instance_create(x, y, obj_superdashcloud))
                        {
                            image_xscale = other.xscale
                            image_yscale = other.yscale
                        }
                    }
                    sprite_index = spr_lunge
                    suplexmove = 1
                    particle_set_scale((5 << 0), xscale, 1)
                    create_particle(x, y, (5 << 0), 0)
                    particle_set_scale((2 << 0), xscale, 1)
                    create_particle(x, y, (2 << 0))
                    fmod_event_instance_play(suplexdashsnd)
                    state = states.handstandjump
                    movespeed = max(movespeed, 10)
                    vsp = 0
                    image_index = 0
                }
                break
        }

    }
    if (argument0 == (1 << 0))
    {
        switch doublegrab
        {
            case 1:
                if (attackstyle != 2)
                {
                    if (sprite_index != spr_attackdash && sprite_index != spr_airattackstart && sprite_index != spr_airattack && (!suplexmove2))
                    {
                        fmod_event_instance_stop(suplexdashsnd, 0)
                        fmod_event_instance_play(snd_dive)
                        state = states.handstandjump
                        image_index = 0
                        movespeed = max(movespeed, 10)
                        particle_set_scale((2 << 0), xscale, 1)
                        create_particle(x, y, (2 << 0))
                        if grounded
                        {
                            sprite_index = spr_attackdash
                            with (gml_Script_instance_create((x + (xscale * -50)), y, obj_superdashcloud))
                            {
                                image_xscale = other.xscale
                                image_yscale = other.yscale
                            }
                        }
                        else
                        {
                            suplexmove2 = 1
                            if (vsp > -4)
                                vsp = -4
                            sprite_index = spr_airattackstart
                        }
                    }
                }
                else if (sprite_index != spr_suplexdash && sprite_index != spr_shotgunsuplexdash)
                {
                    sprite_index = (shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash)
                    suplexmove = 1
                    particle_set_scale((5 << 0), xscale, 1)
                    create_particle(x, y, (5 << 0), 0)
                    fmod_event_instance_play(suplexdashsnd)
                    state = states.handstandjump
                    image_index = 0
                }
                break
            case 2:
                var swapdir = (key_left + key_right)
                if (swapdir != 0)
                    xscale = swapdir
                movespeed = max(movespeed, (grounded ? 7 : 9))
                if (movespeed < 24)
                    movespeed += 1
                if (!grounded)
                    vsp = -5
                image_index = 0
                sprite_index = spr_faceplant
                state = states.faceplant
                image_speed = 0.5
                if (character == "N")
                    sound_play_3d("event:/sfx/noise/spin", x, y)
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0))
                particle_set_scale((2 << 0), xscale, 1)
                create_particle(x, y, (2 << 0))
                break
            case 3:
                if (floor(global.fuel) > 0)
                {
                    fmod_event_instance_play(suplexdashsnd)
                    swapdir = (key_left + key_right)
                    if (swapdir != 0)
                        xscale = swapdir
                    particle_set_scale((5 << 0), xscale, 1)
                    create_particle(x, y, (5 << 0), 0)
                    particle_set_scale((2 << 0), xscale, 1)
                    create_particle(x, y, (2 << 0))
                    with (gml_Script_instance_create(x, y, obj_superdashcloud))
                    {
                        image_xscale = other.xscale
                        image_yscale = other.yscale
                    }
                    global.fuel = floor((global.fuel - 1))
                    state = states.chainsawbump
                    movespeed = max(movespeed, 10)
                    sprite_index = spr_chainsawdash
                    image_index = 0
                    if (global.hud == 1)
                    {
                        with (obj_tv)
                        {
                            alarm[0] = 100
                            tvsprite = spr_tvchainsaw
                            image_index = 0
                            image_speed = 0.35
                        }
                    }
                }
                break
        }

    }
    if (argument0 == (2 << 0))
    {
        switch shootstyle
        {
            case 2:
                sound_play_3d("event:/sfx/misc/breakdance", x, y)
                if (!grounded)
                    vsp = -4
                else
                {
                    with (gml_Script_instance_create(x, y, obj_dashcloud2))
                    {
                        image_xscale = other.xscale
                        image_yscale = other.yscale
                    }
                }
                movespeed = max(movespeed, 9)
                state = states.punch
                sprite_index = spr_breakdancemove
                breakdance = 35
                image_index = 0
                break
        }

    }
}

