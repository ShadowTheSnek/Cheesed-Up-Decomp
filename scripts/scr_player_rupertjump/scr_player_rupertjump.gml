function scr_player_rupertjump() //gml_Script_scr_player_rupertjump
{
    if 1
    {
    }
    else
        blue_aft = 0
    if (sprite_index != spr_player_skatespin && floor(image_index) >= (image_number - 1))
    {
        image_index = 0
        switch sprite_index
        {
            case spr_player_skatejumpstart:
                sprite_index = spr_player_skatejump
                break
            case spr_player_skatedoublejumpstart:
                sprite_index = spr_player_skatedoublejump
                break
            case spr_player_skatewalljumpstart:
                sprite_index = spr_player_skatewalljump
                break
        }

    }
    if (key_jump && (!grounded) && doublejump == 0)
    {
        jumpstop = 1
        doublejump = 1
        vsp = -14
        image_index = 0
        sprite_index = spr_player_skatedoublejumpstart
        with (gml_Script_instance_create(x, y, obj_highjumpcloud2))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
        sound_play_3d("event:/sfx/pep/jump", x, y)
    }
    if (vsp >= 10 || sprite_index == spr_player_skatespin || ((doublejump || sprite_index == spr_player_skatewalljump || sprite_index == spr_player_skatewalljumpstart) && vsp >= 1))
    {
        jumpstop = 1
        if (sprite_index != spr_player_skatespin)
        {
            flash = 1
            sprite_index = spr_player_skatespin
        }
        vsp += 0.5
        vsp = min(vsp, 40)
        if (!instance_exists(superslameffectid))
        {
            with (gml_Script_instance_create(x, (y + vsp), obj_superslameffect))
            {
                playerid = other.object_index
                other.superslameffectid = id
            }
        }
        blue_aft++
        if (blue_aft >= 6)
        {
            create_afterimage(x, y, sprite_index, image_index)
            blue_aft = 0
        }
        image_speed = (clamp((floor((abs(vsp) / 20)) * 0.5), 0, 0.5) + 0.4)
    }
    else
        image_speed = 0.35
    hsp = movespeed
    move = (key_left + key_right)
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (move != 0)
        movespeed = Approach(movespeed, (move * 8), 0.65)
    else
        movespeed = Approach(movespeed, 0, 0.65)
    if (check_solid((x + sign(hsp)), y, 1) || check_slope((x + sign(hsp)), y, 1))
    {
        if (key_jump2 && move != 0 && move == sign(hsp))
        {
            vsp = 0
            image_index = 0
            sprite_index = spr_player_skatewallrun
            state = states.rupertstick
            xscale = sign(hsp)
        }
        else
            movespeed = 0
    }
    if (grounded && vsp > 0)
    {
        doublejump = 0
        if (sprite_index == spr_player_skatespin && (!(place_meeting(x, (y + 1), obj_destructibles))) && (!(place_meeting(x, (y + 1), obj_metalblock))) && (!(place_meeting(x, (y + 1), obj_ratblock))))
        {
            if check_slope(x, y)
            {
                movespeed = 11
                xscale = (-slope_direction())
                with (gml_Script_instance_create(x, y, obj_jumpdust))
                {
                    image_xscale = other.xscale
                    image_yscale = other.yscale
                }
                state = states.rupertslide
            }
            else
            {
                image_index = 0
                movespeed = 0
                state = states.rupertstick
                jumpAnim = 1
                jumpstop = 0
                with (obj_baddie)
                {
                    if (bbox_in_camera(view_camera[0]) && grounded)
                    {
                        vsp = -7
                        hsp = 0
                    }
                }
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
                combo = 0
                bounce = 0
                gml_Script_instance_create(x, y, obj_landcloud)
                freefallstart = 0
                image_index = 0
                sprite_index = spr_player_skatecrouch
                flash = 1
            }
        }
        else if (sprite_index != spr_player_skatespin)
        {
            if check_slope(x, (y + 1))
            {
                movespeed = 8
                xscale = (-slope_direction())
                with (gml_Script_instance_create(x, y, obj_jumpdust))
                {
                    image_xscale = other.xscale
                    image_yscale = other.yscale
                }
                state = states.rupertslide
            }
            else
            {
                state = states.rupertnormal
                if (sign(hsp) != 0)
                    xscale = sign(hsp)
                movespeed = abs(movespeed)
                hsp = (xscale * movespeed)
            }
        }
    }
}

