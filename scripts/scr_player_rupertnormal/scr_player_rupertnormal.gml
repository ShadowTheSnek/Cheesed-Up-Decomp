function scr_player_rupertnormal() //gml_Script_scr_player_rupertnormal
{
    doublejump = 0
    momemtum = 0
    move = (key_left + key_right)
    hsp = (xscale * movespeed)
    var a = xscale
    if (move != 0)
    {
        xscale = move
        if (a != xscale)
            movespeed = 2
        if (movespeed < 8)
            movespeed += 0.25
        else if (movespeed >= 8)
            movespeed -= 0.15
    }
    else
        movespeed = Approach(movespeed, 0, 0.6)
    if (grounded && scr_solid_slope(x, y))
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
    if (move == 0)
        sprite_index = spr_player_skateidle
    else
        sprite_index = spr_player_skateslowwalk
    if (key_jump && grounded)
    {
        jumpstop = 0
        image_index = 0
        sprite_index = spr_player_skatejumpstart
        sound_play_3d("event:/sfx/pep/jump", x, y)
        gml_Script_instance_create(x, y, obj_highjumpcloud2)
        vsp = -10
        movespeed = hsp
        state = states.rupertjump
    }
    if (!grounded)
    {
        sprite_index = spr_player_skatedive
        movespeed = hsp
        state = states.rupertjump
    }
    image_speed = 0.35
}

