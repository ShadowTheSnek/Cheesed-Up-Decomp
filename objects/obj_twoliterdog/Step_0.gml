if (room == rm_editor)
    return;
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
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
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
        break
    case (141 << 0):
        if (sprite_index == spr_twoliter_tipover && image_index >= 6)
        {
            image_index = (image_number - 1)
            if grounded
            {
                vsp = -8
                image_index = 0
                sprite_index = spr_twoliter_fall
                if ((-(sign((x - targetplayer.x)))) != 0)
                    image_xscale = (-(sign((x - targetplayer.x))))
                var _dist = point_distance(x, 0, targetplayer.x, 0)
                hsp = (image_xscale * clamp((_dist / 32), 3, 10))
            }
        }
        if (grounded && vsp >= 0 && sprite_index == spr_twoliter_fall)
        {
            explodeInstant = 1
            instance_destroy()
        }
        movespeed = 0
        image_speed = 0.35
        break
}

if (state != (141 << 0))
    scr_scareenemy()
if thrown
    explodeInstant = 1
scr_enemybird()
scr_boundbox()
if (targetplayer.x > (x - 950) && targetplayer.x < (x + 950) && y <= (targetplayer.y + 490) && y >= (targetplayer.y - 490))
{
    if (state == states.idle && sprite_index == spr_twoliter_sleep && (!activated))
    {
        activated = 1
        image_index = 0
        sprite_index = spr_twoliter_wakingup
        if (x != targetplayer.x)
            image_xscale = (-(sign((x - targetplayer.x))))
    }
}
if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 150) && y >= (targetplayer.y - 60))
{
    if (bombreset <= 0)
    {
        if (x != targetplayer.x)
            image_xscale = (-(sign((x - targetplayer.x))))
        if (state == states.walk)
        {
            hsp = 0
            vsp = -2
            image_index = 0
            sprite_index = spr_twoliter_tipover
            state = (141 << 0)
        }
    }
}
if ((!activated) && state == states.walk)
{
    sprite_index = spr_twoliter_sleep
    state = states.idle
}
if (floor(image_index) >= (image_number - 1) && sprite_index == spr_twoliter_wakingup)
{
    state = states.walk
    movespeed = 3
    image_index = 0
    sprite_index = spr_twoliter_idle
}
