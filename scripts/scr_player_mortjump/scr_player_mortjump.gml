function scr_player_mortjump() //gml_Script_scr_player_mortjump
{
    image_speed = 0.35
    move = (key_left + key_right)
    hsp = movespeed
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
    {
        jumpstop = 1
        vsp /= 20
    }
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, (xscale * 8), 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.5)
        if (movespeed <= 0)
            xscale = move
    }
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if (check_solid((x + sign(hsp)), y) && (!(check_slope((x + sign(hsp)), y))))
    {
        movespeed = 0
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_player_barrelidle
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_player_mortjumpstart)
            sprite_index = spr_player_mortjump
        else if (sprite_index == spr_player_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
            sprite_index = spr_mortdoublejump
    }
    var dj = 1
    if (input_buffer_jump > 0 && can_jump)
    {
        dj = 0
        input_buffer_jump = 0
        state = states.mortjump
        vsp = -11
        sprite_index = spr_player_mortjumpstart
        image_index = 0
        doublejump = 0
        jumpstop = 0
        scr_fmod_soundeffect(jumpsnd, x, y)
        create_particle(x, y, (5 << 0), 0)
    }
    if (grounded && vsp > 0)
    {
        state = states.mort
        landAnim = 1
        sprite_index = spr_player_mortland
        image_index = 0
    }
    else if ((!doublejump) && key_jump && dj)
    {
        scr_fmod_soundeffect(jumpsnd, x, y)
        sound_play_3d("event:/sfx/mort/doublejump", x, y)
        jumpstop = 0
        input_buffer_jump = 0
        doublejump = 1
        state = states.mortjump
        sprite_index = spr_player_mortdoublejump
        image_index = 0
        vsp = -11
        repeat (4)
            create_debris(x, y, spr_feather)
    }
    mort_attack()
}

