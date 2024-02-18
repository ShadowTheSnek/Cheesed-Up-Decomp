function scr_player_ratmounthurt() //gml_Script_scr_player_ratmounthurt
{
    hsp = ((-xscale) * movespeed)
    landAnim = 0
    jumpAnim = 0
    hurted = 1
    gusdashpadbuffer = 0
    if (check_solid((x + sign(hsp)), y) && (!(check_slope(x, (y + sign(hsp))))))
        movespeed = 0
    alarm[5] = 2
    alarm[7] = 80
    if (grounded && vsp > 0)
    {
        state = states.ratmount
        movespeed = 0
    }
    if brick
        sprite_index = spr_ratmount_hurt
    else
        sprite_index = spr_lonegustavohurt
    image_speed = 0.35
}

