if (room == rm_editor)
    return;
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (128 << 0):
        scr_enemy_charge()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
}

if (state == states.walk && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == states.walk && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == states.stun)
    grav = 0.5
else
    grav = 0
if (bombreset > 0 && state == states.walk)
    bombreset--
var player = instance_nearest(x, y, obj_player)
if (ragebuffer > 0)
    ragebuffer--
if (player.x > (x - 200) && player.x < (x + 200) && player.y <= (y + 400) && player.y >= (y - 60))
{
    if (x != player.x && state != states.throw && bombreset == 0)
    {
        if (state == states.walk)
        {
            sprite_index = spr_kentukybomber_attack
            image_index = 0
            state = states.throw
        }
    }
}
if (state == states.throw || state == states.rage)
{
    hsp = 0
    vsp = 0
}
scr_enemybird()
scr_scareenemy()
scr_boundbox()
