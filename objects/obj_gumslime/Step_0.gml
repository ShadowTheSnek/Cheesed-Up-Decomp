if (room == rm_editor)
    return;
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
}

scr_enemybird()
scr_scareenemy()
scr_boundbox()
var player = instance_nearest(x, y, obj_player)
if elite
{
    var check = (image_xscale > 0 ? (player.x > x && player.x < (x + 200)) : (player.x < x && player.x > (x - 200)))
    if (state == states.walk)
    {
        if (check && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (state != states.rage && ragebuffer == 0)
            {
                hsp = 0
                ragecooldown = 0
                state = states.rage
                sprite_index = ragespr
                if (x != player.x)
                    image_xscale = (-(sign((x - player.x))))
                ragebuffer = 100
                image_index = 0
                image_speed = 0.5
                flash = 1
                alarm[4] = 5
                create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            }
        }
    }
    if (ragebuffer > 0)
        ragebuffer--
}
