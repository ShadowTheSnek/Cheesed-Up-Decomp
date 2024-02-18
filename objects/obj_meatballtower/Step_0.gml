switch state
{
    case states.normal:
        sprite_index = spr_meatball_roll
        hsp = (image_xscale * 5)
        if check_solid((x + sign(hsp)), y)
            image_xscale *= -1
        if (obj_player1.state == states.freefallland)
        {
            state = states.jump
            hsp = 0
            vsp = -12
            sprite_index = spr_meatball_dead
            if (x != obj_player1.x)
                image_xscale = sign((obj_player1.x - x))
        }
        break
    case (92 << 0):
        if (grounded && vsp > 0)
            state = states.normal
        break
}

mask_index = spr_meatball_roll
scr_collide()
