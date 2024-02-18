function scr_player_climbwall() //gml_Script_scr_player_climbwall
{
    switch character
    {
        case "S":
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            jumpstop = 0
            if (instance_exists(obj_fadeout) && y < -50)
                vsp = 0
            if place_meeting((x + xscale), y, obj_unclimbablewall)
            {
                wallspeed -= (grav / 2)
                if (wallspeed > 6)
                    wallspeed = 6
                if grounded
                {
                    state = states.normal
                    movespeed = 0
                }
                var mv = (wallspeed / 16)
                image_speed = lerp(0.35, 0.75, clamp(mv, 0, 1))
            }
            else
            {
                if (wallspeed < 20)
                    wallspeed += 0.15
                image_speed = 0.6
                if (wallspeed < 0)
                {
                    if (!(scr_solid((x + xscale), (y + 50))))
                        vsp = 0
                }
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (grabclimbbuffer > 0)
                grabclimbbuffer--
            if (move == 0 && (!(((-key_left) && key_right))) && grabclimbbuffer == 0)
            {
                state = states.normal
                movespeed = 0
                return;
            }
            if (verticalbuffer <= 0 && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0))
                ledge_bump(32)
                movespeed = (xscale * max(wallspeed, 6))
                state = states.normal
                if global.gameplay
                {
                    if (vsp < 0)
                    {
                        var i = 0
                        while (i < 32)
                        {
                            if scr_solid((x + xscale), (y + i))
                            {
                                y += ((i - 1) * flip)
                                break
                            }
                            else
                            {
                                i++
                                continue
                            }
                        }
                    }
                    hsp = movespeed
                }
                vsp = 0
            }
            if (wallspeed < 0 && check_solid(x, (y + 12)))
                wallspeed = 0
            if (input_buffer_jump > 8)
            {
                sound_play_3d("event:/sfx/pep/jump", x, y)
                input_buffer_jump = 0
                key_jump = 0
                railmovespeed = 0
                movespeed = ((-xscale) * 10)
                state = states.jump
                image_index = 0
                sprite_index = spr_walljumpstart
                vsp = -11
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (state != states.normal && verticalbuffer <= 0 && check_solid(x, (y - 1)) && scr_solid((x + xscale), y) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(check_slope((x + sign(hsp)), y))) || scr_solid_slope((x + sign(hsp)), y)) && (!(check_slope((x - sign(hsp)), y))))
            {
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    sound_play_3d("event:/sfx/pep/groundpound", x, y)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                    movespeed = 0
                    if global.gameplay
                    {
                        with (obj_camera)
                        {
                            shake_mag = 3
                            shake_mag_acc = (4 / room_speed)
                        }
                    }
                }
            }
            if (global.gameplay && state == states.climbwall && place_meeting((x + xscale), y, obj_destructibles))
            {
                if (input_buffer_grab > 0 || input_buffer_slap > 0)
                {
                    input_buffer_jump = 0
                    input_buffer_grab = 0
                    input_buffer_slap = 0
                    sound_play_3d("event:/modded/sfx/kungfu", x, y)
                    vsp = min(vsp, -3)
                    movespeed = (max((abs(movespeed) + 2), 14) * move)
                    sprite_index = spr_walljumpstart
                    image_speed = 0.5
                }
            }
            image_speed = 0.6
            if (steppybuffer > 0)
                steppybuffer--
            else
            {
                create_particle((x + (xscale * 10)), (y + 43), (1 << 0), 0)
                steppybuffer = 10
            }
            break
        default:
            if (windingAnim < 200)
                windingAnim++
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if (instance_exists(obj_fadeout) && y < -50)
                vsp = 0
            var unclimbable = 0
            if place_meeting((x + xscale), y, obj_unclimbablewall)
                unclimbable = 1
            if place_meeting((x + xscale), y, obj_molassesWall)
                unclimbable = 2
            if unclimbable
            {
                if (unclimbable == 2)
                {
                    wallspeed -= grav
                    if (wallspeed > 8)
                        wallspeed = 8
                }
                else
                {
                    wallspeed -= (grav / 2)
                    if (wallspeed > 8)
                        wallspeed = 8
                }
                if grounded
                {
                    state = states.normal
                    movespeed = 0
                }
                mv = (wallspeed / 16)
                image_speed = lerp(0.35, 0.75, clamp(mv, 0, 1))
            }
            else
            {
                if (wallspeed < 20)
                    wallspeed += 0.15
                if (wallspeed < 0)
                {
                    if (mach4mode == 0)
                        movespeed += 0.2
                    else
                        movespeed += 0.4
                }
                image_speed = 0.6
                if (wallspeed < 0)
                {
                    if (!(scr_solid((x + xscale), (y + 50))))
                        vsp = 0
                }
                if (wallspeed < 0 && check_solid(x, (y + 12)))
                    wallspeed = 0
            }
            crouchslideAnim = 1
            if (vsp < -5)
                sprite_index = spr_machclimbwall
            else
                sprite_index = spr_player_clingwall
            if skateboarding
            {
                if (wallspeed < 0)
                    wallspeed = 6
                sprite_index = spr_player_clownwallclimb
            }
            if (grabclimbbuffer > 0)
                grabclimbbuffer--
            if ((!key_attack) && (!skateboarding) && grabclimbbuffer == 0)
            {
                state = states.normal
                movespeed = 0
                railmovespeed = 6
                raildir = (-xscale)
            }
            if (verticalbuffer <= 0 && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0))
                ledge_bump(32)
                if (wallspeed >= 12)
                {
                    state = states.mach3
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
                else
                {
                    state = states.mach2
                    movespeed = wallspeed
                }
                movespeed = max(wallspeed, 6)
                if global.gameplay
                {
                    if (vsp < 0)
                    {
                        i = 0
                        while (i < 32)
                        {
                            if scr_solid((x + xscale), (y + i))
                            {
                                y += ((i - 1) * flip)
                                break
                            }
                            else
                            {
                                i++
                                continue
                            }
                        }
                    }
                    hsp = (movespeed * xscale)
                }
                vsp = 0
            }
            if (input_buffer_jump > 8)
            {
                sound_play_3d("event:/sfx/pep/jump", x, y)
                input_buffer_jump = 0
                key_jump = 0
                railmovespeed = 0
                if (check_sugarychar() && (!skateboarding))
                {
                    movespeed = max(abs(wallspeed), 6)
                    if key_down
                    {
                        state = states.machroll
                        vsp = 10
                    }
                    else
                    {
                        particle_set_scale((5 << 0), xscale, 1)
                        create_particle(x, y, (5 << 0))
                        vsp = -9
                        image_index = 0
                        if (movespeed >= 12)
                        {
                            sprite_index = spr_mach3jump
                            state = states.mach3
                        }
                        else
                        {
                            sprite_index = spr_secondjump1
                            state = states.mach2
                        }
                    }
                }
                else
                {
                    movespeed = 10
                    state = states.mach2
                    image_index = 0
                    sprite_index = spr_walljumpstart
                    if skateboarding
                        sprite_index = spr_clownjump
                    vsp = -11
                }
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            var slope_prev = instance_place(x, (y - flip), obj_slope)
            image_yscale *= -1
            var slope = instance_place(x, (y - flip), obj_slope)
            if slope
            {
                var yy = y
                while (place_meeting(x, y, slope) || place_meeting(x, y, slope_prev))
                    y -= image_yscale
                if (check_solid((x + xscale), y) && key_attack && walljumpbuffer <= 0 && state == states.climbwall)
                {
                    walljumpbuffer = 16
                    ceilingrun = (!ceilingrun)
                    flip = (-flip)
                    xscale = (-sign(slope.image_xscale))
                    grounded = 1
                    vsp = 8
                    movespeed = max(round((wallspeed * 0.8)), 6)
                    if (movespeed < 12)
                    {
                        state = states.mach2
                        sprite_index = spr_mach
                    }
                    else
                    {
                        state = states.mach3
                        sprite_index = spr_mach4
                    }
                    return;
                }
                y = yy
            }
            image_yscale *= -1
            if (state != states.mach2 && verticalbuffer <= 0 && scr_solid(x, (y - 1)) && scr_solid((x + xscale), y) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(check_slope((x + sign(hsp)), y))) || scr_solid_slope((x + sign(hsp)), y)) && (!(check_slope((x - sign(hsp)), y))))
            {
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    if (character == "SP")
                        sprite_index = spr_playerSP_ceilingcrash
                    sound_play_3d("event:/sfx/pep/groundpound", x, y)
                    image_index = 0
                    state = states.Sjumpland
                    machhitAnim = 0
                    if global.gameplay
                    {
                        with (obj_camera)
                        {
                            shake_mag = 3
                            shake_mag_acc = (4 / room_speed)
                        }
                    }
                }
                else if (!key_jump)
                {
                    state = states.bump
                    hsp = (-2.5 * xscale)
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            if (global.gameplay && state == states.climbwall && place_meeting((x + xscale), y, obj_destructibles) && character != "V")
            {
                if (input_buffer_grab > 0 && shotgunAnim == 0 && (!global.pistol))
                {
                    input_buffer_grab = 0
                    input_buffer_slap = 0
                    sprite_index = (shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash)
                    suplexmove = 1
                    fmod_event_instance_play(suplexdashsnd)
                    state = states.handstandjump
                    movespeed = max(wallspeed, 5)
                    image_index = 0
                }
                else if (input_buffer_slap > 0)
                {
                    input_buffer_slap = 0
                    scr_perform_move((0 << 0), (37 << 0))
                }
            }
            image_speed = 0.6
            if (steppybuffer > 0)
                steppybuffer--
            else
            {
                create_particle((x + (xscale * 10)), (y + 43), (1 << 0), 0)
                steppybuffer = 10
            }
            break
    }

}

