if (!active)
    return;
if (room == tower_soundtestlevel && (obj_player1.state == states.backtohub || obj_player1.state == states.comingoutdoor || obj_player1.targetDoor == "A"))
{
    instance_destroy()
    return;
}
image_speed = 0.35
switch sprite_index
{
    case spr_open:
        with (obj_heatafterimage)
            visible = false
        with (obj_player)
        {
            if (object_index != obj_player2 || global.coop)
            {
                x = other.x
                y = other.y
                roomstartx = x
                roomstarty = y
                hsp = 0
                vsp = 0
                movespeed = 0
                cutscene = 1
                visible = false
            }
        }
        with (obj_camera)
        {
            if (!(point_in_rectangle(other.x, other.y, limitcam[0], limitcam[1], limitcam[2], limitcam[3])))
                other.image_index = 0
        }
        waitbuffer = 80
        drop = 0
        if (floor(image_index) == (image_number - 1))
        {
            if (!sugary)
                sound_play_3d("event:/sfx/misc/secretexit", x, y)
            sprite_index = spr_idle
            with (obj_player)
            {
                if (object_index != obj_player2 || global.coop)
                {
                    if (other.override_state != -4)
                    {
                        state = other.override_state
                        sprite_index = other.override_sprite
                        image_index = 0
                        var vars = variable_struct_get_names(other.override_vars)
                        for (var i = 0; i < array_length(vars); i++)
                            variable_instance_set(id, vars[i], variable_struct_get(other.override_vars, array_get(vars, i)))
                    }
                    else if ((!isgustavo) && tauntstoredstate != states.knightpep && tauntstoredstate != states.knightpepslopes && tauntstoredstate != states.knightpepbump && tauntstoredstate != states.firemouth && tauntstoredstate != (304 << 0) && tauntstoredstate != (305 << 0) && tauntstoredstate != (306 << 0))
                    {
                        visible = true
                        cutscene = 0
                        sprite_index = spr_bodyslamstart
                        image_index = 0
                        state = states.freefallprep
                        vsp = (character != "N" ? -5 : -7)
                    }
                    else if isgustavo
                        state = states.ratmount
                    else
                    {
                        var cotton = (state == (304 << 0) || state == (306 << 0) || state == (305 << 0))
                        if cotton
                        {
                            hsp = 0
                            sprite_index = spr_cotton_drill
                        }
                        else
                        {
                            if (state == states.knightpep)
                                hsp = 0
                            sprite_index = tauntstoredsprite
                        }
                    }
                }
            }
        }
        break
    case spr_idle:
        if (!drop)
        {
            with (obj_heatafterimage)
                visible = false
            with (obj_player)
            {
                if check_player_coop()
                {
                    x = other.x
                    y = (other.y - 10)
                    visible = true
                    hsp = 0
                    movespeed = 0
                    vsp = 10
                    scale_xs = Approach(scale_xs, 1, 0.05)
                    scale_ys = Approach(scale_ys, 1, 0.05)
                    fallinganimation = 0
                    if (scale_xs == 1)
                        other.drop = 1
                    if other.drop
                    {
                        if (other.override_state != -4 && other.override_sprite != -4)
                            state = other.override_state
                        else if ((!isgustavo) && (tauntstoredstate == states.knightpep || tauntstoredstate == states.knightpepslopes || tauntstoredstate == states.knightpepbump || tauntstoredstate == states.firemouth || tauntstoredstate == (305 << 0) || tauntstoredstate == (304 << 0) || tauntstoredstate == (306 << 0)))
                        {
                            state = tauntstoredstate
                            movespeed = tauntstoredmovespeed
                            hsp = tauntstoredhsp
                            sprite_index = tauntstoredsprite
                            switch state
                            {
                                case states.knightpep:
                                    hsp = 0
                                    movespeed = 0
                                    break
                                case (38 << 0):
                                    movespeed = 0
                                    hsp = 0
                                    state = states.knightpep
                                    sprite_index = spr_knightpepfall
                                    break
                                case (10 << 0):
                                    if (sprite_index == spr_player_firemouthdash)
                                    {
                                        hsp = 0
                                        movespeed = 0
                                        sprite_index = spr_player_firemouthidle
                                    }
                                    break
                                case (304 << 0):
                                case (306 << 0):
                                case (305 << 0):
                                    hsp = 0
                                    movespeed = 0
                                    drillspeed = 0
                                    state = (305 << 0)
                                    sprite_index = spr_cotton_drill
                                    break
                            }

                        }
                    }
                }
            }
        }
        if drop
        {
            if (waitbuffer > 0)
                waitbuffer--
            else
            {
                sprite_index = spr_close
                image_index = 0
            }
        }
        break
    case spr_close:
        if (floor(image_index) == (image_number - 1))
        {
            image_index = (image_number - 1)
            instance_destroy()
        }
        break
}

