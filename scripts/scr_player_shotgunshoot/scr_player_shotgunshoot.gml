function scr_player_shotgunshoot() //gml_Script_scr_player_shotgunshoot
{
    image_speed = 0.4
    move = (key_left + key_right)
    hsp = (xscale * movespeed)
    if (check_solid((x + hsp), y) && (!(check_slope((x + hsp), y))))
        movespeed = 0
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, 4, 0.25)
        else
            movespeed = Approach(movespeed, -8, 0.2)
    }
    else
        movespeed = Approach(movespeed, 0, 0.1)
    if (floor(image_index) == (image_number - 1))
    {
        if grounded
            state = states.normal
        else
            state = states.jump
        if (move == (-xscale))
        {
            xscale = move
            dir = xscale
            movespeed = abs(movespeed)
            momemtum = 1
        }
    }
    if (input_buffer_shoot > 0 && image_index > (image_number - 3))
        scr_shotgunshoot()
}

