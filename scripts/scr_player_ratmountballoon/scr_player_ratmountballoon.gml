function scr_player_ratmountballoon() //gml_Script_scr_player_ratmountballoon
{
    sprite_index = spr_ratmount_balloon
    hsp = movespeed
    move = (key_left + key_right)
    if (vsp < 2)
        vsp += 0.1
    else
        vsp = 2
    image_speed = 0.35
    if (move != 0)
        movespeed = Approach(movespeed, (move * 8), 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.5)
    var _jump = 0
    if (balloonbuffer > 0)
        balloonbuffer--
    else
        _jump = 1
    if key_jump
        _jump = 1
    if _jump
    {
        input_buffer_jump = 0
        input_buffer_jump_negative = 10
        sound_play_3d("event:/sfx/rat/deflateeat", x, y)
        create_particle(x, y, (13 << 0), 0)
        state = states.ratmountjump
        sprite_index = spr_ratmount_balloonend1
        image_index = 0
        jumpAnim = 1
        vsp = -20
        jumpstop = 1
    }
}

