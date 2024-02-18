switch state
{
    case states.idle:
        if (start && distance_to_object(obj_player) <= 150)
        {
            state = states.actor
            substate = states.idle
            cutscenebuffer = 120
            with (obj_player)
            {
                state = states.actor
                sprite_index = spr_idle
                movespeed = 0
                image_speed = 0.35
                hsp = 0
                vsp = 0
                if (!grounded)
                    create_particle(x, y, (9 << 0))
            }
        }
        break
    case (146 << 0):
        switch substate
        {
            case states.idle:
                if (cutscenebuffer > 0)
                    cutscenebuffer--
                else
                {
                    fmod_event_instance_set_parameter(snd, "state", 1, 1)
                    substate = states.normal
                    cutscenebuffer = 100
                    sprite_index = spr_pizzafaceshower3
                }
                break
            case (0 << 0):
                if (cutscenebuffer > 0)
                    cutscenebuffer--
                else
                {
                    fmod_event_instance_set_parameter(snd, "state", 2, 1)
                    substate = states.transitioncutscene
                    cutscenebuffer = 100
                    sprite_index = spr_pizzafaceshower2
                }
                break
            case (8 << 0):
                if (cutscenebuffer > 0)
                    cutscenebuffer--
                else if (sprite_index == spr_pizzafaceshower2)
                {
                    fmod_event_instance_set_parameter(snd, "state", 3, 1)
                    cutscenebuffer = 70
                    sprite_index = spr_pizzafaceshower3
                }
                else
                {
                    fmod_event_instance_set_parameter(snd, "state", 4, 1)
                    gml_Script_instance_create(x, y, obj_pizzaface_showerprop)
                    x += 13
                    y += 16
                    sprite_index = spr_pizzafaceshower4
                    substate = states.jump
                    movespeed = 15
                    vsp = -4
                    depth = 5
                }
                break
            case (92 << 0):
                movespeed = Approach(movespeed, 0, 0.2)
                vsp = Approach(vsp, -15, 0.1)
                x += movespeed
                y += vsp
                if (!(bbox_in_camera(view_camera[0], 50)))
                {
                    substate = states.gameover
                    with (obj_player)
                    {
                        state = states.normal
                        landAnim = 0
                    }
                }
                break
            case (89 << 0):
                y -= 20
                if (y < -200)
                {
                    ini_open_from_string(obj_savesystem.ini_str)
                    ini_write_real("Game", "shower", 1)
                    obj_savesystem.ini_str = ini_close()
                    instance_destroy()
                }
                break
        }

        break
}

sound_instance_move(snd, x, y)
