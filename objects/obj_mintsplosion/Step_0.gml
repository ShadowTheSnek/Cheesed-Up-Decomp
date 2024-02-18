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
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
}

scr_enemybird()
scr_scareenemy()
scr_boundbox()
if (bombreset > 0)
    bombreset--
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1.id)
if (x != targetplayer.x && state != states.throw && bombreset <= 0 && grounded && targetplayer.state != states.chainsaw)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 60) && y >= (targetplayer.y - 60))
    {
        if (state == states.walk || (state == states.idle && sprite_index != scaredspr))
        {
            sprite_index = spr_mintsplosion_throw
            image_index = 0
            image_xscale = (-(sign((x - targetplayer.x))))
            state = states.throw
        }
    }
}
