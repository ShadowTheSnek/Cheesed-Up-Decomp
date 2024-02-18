switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
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
            state = states.walk
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        stunned = min(stunned, 10)
        scr_enemy_stun()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
}

scr_boundbox()
if linethrown
{
    linethrown = 0
    hsp /= 2
}
