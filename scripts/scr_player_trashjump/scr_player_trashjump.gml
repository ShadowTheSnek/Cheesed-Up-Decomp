function scr_player_trashjump() //gml_Script_scr_player_trashjump
{
    image_speed = 0.35
    hsp = movespeed
    move = (key_left + key_right)
    if (move != 0)
        movespeed = Approach(movespeed, (move * 6), 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.25)
    if (vsp > 0 && sprite_index == spr_player_trashjump)
    {
        sprite_index = spr_player_trashjump2
        image_index = 0
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_trashjump2)
        sprite_index = spr_player_trashfall
    if (vsp < 0 && sprite_index != spr_player_trashjump)
        sprite_index = spr_player_trashjump
    if (grounded && vsp > 0)
    {
        create_transformation_tip(gml_Script_lang_get_value("trashrolltip"), "trashroll")
        if check_slope(x, (y + 1))
        {
            var slope = check_slope(x, (y + 1))
            xscale = (-sign(slope.image_xscale))
            scale_xs = 1
        }
        movespeed = abs(movespeed)
        dir = xscale
        movespeed = 8
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0))
        state = states.trashroll
    }
}

