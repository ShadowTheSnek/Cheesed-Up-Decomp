function state_player_cottondrill() //gml_Script_state_player_cottondrill
{
    if 1
    {
    }
    else
        cotton_afterimagetimer = 6
    image_speed = 0.35
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    move = (key_left + key_right)
    if (move != 0)
        xscale = move
    if (drillspeed < 9)
    {
        drillspeed = Approach(drillspeed, 20, 2)
        hsp = (move * 5)
    }
    else
    {
        drillspeed = Approach(drillspeed, 20, 0.5)
        hsp = move
    }
    vsp = drillspeed
    sprite_index = spr_cotton_drill
    if (grounded && (!(place_meeting(x, (y + 1), obj_destructibles))) && (!(place_meeting(x, (y + 1), obj_ratblock))))
    {
        doublejump = 0
        if scr_slope()
        {
            movespeed = ((drillspeed / 20) * 12)
            vsp = 3
            state = (306 << 0)
            image_index = 0
            sprite_index = spr_cotton_roll
            with (check_slope(x, (y + 1)))
                other.xscale = (-sign(image_xscale))
        }
        else
        {
            state = (304 << 0)
            sprite_index = spr_cotton_land
            vsp = 0
            movespeed = 0
            image_index = 0
        }
    }
    if (key_slap2 && sprite_index != spr_cotton_attack && grounded)
    {
        state = (304 << 0)
        flash = 1
        image_index = 0
        sprite_index = spr_cotton_attack
        if (movespeed < 8)
            movespeed = 8
        if (!grounded)
            vsp = -5
        else
            vsp = 0
        grav = 0.2
        grounded = 0
        sound_play_3d("event:/modded/sfx/cottonattack", x, y)
    }
    if (key_jump && (!grounded) && doublejump == 0)
    {
        doublejump = 1
        movespeed = 0
        state = (304 << 0)
        vsp = -10
        grav = 0.1
        image_index = 0
        sprite_index = spr_cotton_doublejump
        gml_Script_instance_create(x, y, obj_highjumpcloud2)
        with (gml_Script_instance_create(x, y, obj_highjumpcloud2))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
            sprite_index = spr_cottonpoof
        }
        sound_play_3d("event:/modded/sfx/cottonjump", x, y)
    }
    if (movespeed >= 8 || sprite_index == spr_cotton_attack || sprite_index == spr_cotton_drill)
    {
        if (cotton_afterimagetimer > 0)
            cotton_afterimagetimer--
        if (cotton_afterimagetimer <= 0)
        {
            with (create_blur_afterimage(x, y, sprite_index, image_index, xscale))
                playerid = other.id
            cotton_afterimagetimer = 6
        }
    }
}

