if (room == rm_editor)
    return;
var player = instance_nearest(x, y, obj_player)
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
    case (125 << 0):
        scr_enemy_rage()
        break
    case (149 << 0):
        hsp = 0
        image_speed = 0.35
        if (substate == states.normal)
        {
            vsp = 0
            if ((!(scr_solid(x, (y - 1)))) && y > ystart)
                y--
            if ((!(scr_solid(x, (y + 1)))) && y < ystart)
                y++
        }
        if check_solid((x + sign(hsp)), y)
            image_xscale *= -1
        if (sprite_index == spr_thundercloud_throw)
            sprite_index = walkspr
        break
}

scr_enemybird()
scr_scareenemy()
scr_boundbox()
