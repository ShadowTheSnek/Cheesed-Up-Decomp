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
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
}

scr_enemybird()
scr_scareenemy()
scr_boundbox()
if (bombreset > 0)
    bombreset--
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (x != targetplayer.x && state != states.throw && obj_player.state != states.tumble && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 100) && y >= (targetplayer.y - 100))
    {
        if (state == states.walk)
        {
            image_index = 0
            sprite_index = spr_crackerkicker_kick
            image_xscale = (-(sign((x - targetplayer.x))))
            state = states.throw
        }
    }
}
if (grounded && state == states.throw && floor(image_index) == 3)
    vsp = -5
if (kickbuffer > 0)
{
    kickbuffer--
    invincible = 1
}
else
    invincible = 0
