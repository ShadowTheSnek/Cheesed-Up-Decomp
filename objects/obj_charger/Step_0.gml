if (room == rm_editor)
    return;
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (128 << 0):
        hsp = (image_xscale * movespeed)
        if (substate == states.normal)
        {
            if (sprite_index != spr_banana_chargestart)
            {
                movespeed = 8
                if (!hitboxcreate)
                {
                    hitboxcreate = 1
                    with (gml_Script_instance_create(x, y, obj_forkhitbox))
                    {
                        ID = other.id
                        image_xscale = other.image_xscale
                        image_index = other.image_index
                        depth = -1
                        sprite_index = spr_chargershitbox
                        mask_index = spr_chargershitbox
                    }
                }
            }
            else
                movespeed = 0
            if (check_solid((x + sign(hsp)), y) && (!(check_slope((x + sign(hsp)), y))))
                image_xscale *= -1
            var dir = sign((obj_player1.x - x))
            if ((elite || global.stylethreshold >= 3) && image_xscale == (-dir) && point_distance(x, 0, obj_player1.x, 0) >= 50)
            {
                substate = states.revolver
                sprite_index = spr_banana_chargestart
                image_index = 0
                sound_play_3d("event:/sfx/pep/machslideboost", x, y)
            }
        }
        if (substate == states.revolver)
        {
            movespeed = ((1 - (image_index / image_number)) * 8)
            if (floor(image_index) == (image_number - 1) || movespeed == 0)
            {
                image_xscale *= -1
                movespeed = 8
                substate = states.normal
                sprite_index = spr_banana_charge
            }
        }
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
scr_boundbox(1)
var player = instance_nearest(x, y, obj_player)
if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 20) && y >= (player.y - 20))
{
    if (x != player.x && grounded)
    {
        if (state == states.walk)
        {
            fmod_event_instance_play(chargesnd)
            sound_instance_move(chargesnd, x, y)
            state = (128 << 0)
            movespeed = 0
            sprite_index = spr_banana_chargestart
            image_index = 0
        }
    }
}
if (sprite_index == spr_banana_chargestart && floor(image_index) == (image_number - 1))
    sprite_index = spr_banana_charge
if (state == states.stun || state == states.walk)
    movespeed = 0
