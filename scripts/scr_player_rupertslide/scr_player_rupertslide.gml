function scr_player_rupertslide() //gml_Script_scr_player_rupertslide
{
    momemtum = 0
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (key_jump && grounded)
    {
        vsp = -10
        gml_Script_instance_create(x, y, obj_highjumpcloud2)
        sound_play_3d("event:/sfx/pep/jump", x, y)
        sprite_index = spr_player_skatedoublejumpstart
        image_index = 0
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
        state = states.rupertjump
        movespeed = hsp
    }
    if (grounded && movespeed < 14)
        scr_player_addslopemomentum(0.25, 0)
    if ((sprite_index != spr_player_skatedoublejumpstart && sprite_index != spr_player_skatedoublejump) || (grounded && vsp > 0))
        sprite_index = spr_player_skatewalk
    if (floor(image_index) >= (image_number - 1) && sprite_index == spr_player_skatedoublejumpstart)
    {
        image_index = 0
        sprite_index = spr_player_skatedoublejump
    }
    if ((!grounded) && vsp >= 10)
    {
        movespeed = hsp
        state = states.rupertjump
        flash = 1
        momemtum = 1
        sprite_index = spr_player_skatespin
    }
    if (check_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_ratblock))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
    {
        if (!grounded)
        {
            vsp = 0
            image_index = 0
            sprite_index = spr_player_skatewallrun
            state = states.rupertstick
            xscale = sign(hsp)
        }
        else
        {
            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
            sprite_index = spr_player_skatefall
            state = states.rupertjump
            vsp = -4
            xscale = (-sign(hsp))
            movespeed = (xscale * 5)
            gml_Script_instance_create((x + (10 * xscale)), (y + 10), obj_bumpeffect)
        }
    }
    image_speed = 0.5
}

