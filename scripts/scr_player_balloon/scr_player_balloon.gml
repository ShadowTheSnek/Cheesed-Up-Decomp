function scr_player_balloon() //gml_Script_scr_player_balloon
{
    sprite_index = spr_player_ratballoon
    hsp = movespeed
    move = (key_left + key_right)
    vsp = -5
    image_speed = 0.35
    if (move != 0)
        movespeed = Approach(movespeed, (move * 6), 0.35)
    else
        movespeed = Approach(movespeed, 0, 0.35)
    if (check_solid((x + hsp), y) && (!(check_slope((x + hsp), y))))
        movespeed = 0
    if (balloonbuffer > 0)
        balloonbuffer--
    else
    {
        create_particle(x, (y - 20), (9 << 0), 0)
        gml_Script_instance_create(x, (y - 20), obj_balloongrabbableeffect)
        state = states.jump
        sprite_index = spr_fall
        jumpAnim = 0
    }
    if key_jump
    {
        create_particle(x, (y - 20), (9 << 0), 0)
        gml_Script_instance_create(x, (y - 20), obj_balloongrabbableeffect)
        state = states.jump
        sprite_index = spr_jump
        image_index = 0
        jumpAnim = 1
        movespeed = abs(movespeed)
        vsp = -11
        jumpstop = 0
    }
}

