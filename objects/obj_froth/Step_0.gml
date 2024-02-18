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
        state = (149 << 0)
        substate = states.normal
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
        if check_solid((x + sign(hsp)), y)
            image_xscale *= -1
        var _dir = (player.x - x)
        if (substate == states.normal)
        {
            vsp = 0
            if (abs(_dir) <= 250 && sprite_index != spr_snowcloudnotice)
            {
                image_index = 0
                sprite_index = spr_snowcloudnotice
            }
            if (abs(_dir) > 250 && sprite_index == spr_snowcloudnotice)
            {
                image_index = 0
                sprite_index = spr_snowcloudnotice_reverse
            }
            if (image_index >= (image_number - 1))
            {
                if (sprite_index == spr_snowcloudnotice)
                    image_index = (image_number - 2)
                if (sprite_index == spr_snowcloudnotice_reverse)
                    sprite_index = spr_snowcloudwalk
            }
            if (abs(_dir) < 90 && y == ystart && (!(collision_line(x, y, player.x, player.y, obj_solid, true, false))) && player.y >= y)
            {
                substate = states.revolver
                vsp = 0
                image_index = 0
                sprite_index = spr_snowclouddive
            }
            y = Approach(y, ystart, 2)
        }
        if (substate == states.revolver)
        {
            vsp += 0.5
            if (sprite_index == spr_snowclouddive && image_index >= (image_number - 1))
                sprite_index = spr_snowclouddiveboil
            if (sprite_index == spr_snowclouddiveboil && place_meeting(x, (y + 1), player))
            {
                with (player)
                {
                    hsp = 0
                    player_x = x
                    state = states.frothstuck
                    sprite_index = spr_player_frothstuck
                    breakout = 3
                }
                instance_destroy()
            }
            if grounded
            {
                substate = states.normal
                sprite_index = spr_snowcloudwalk
            }
        }
        break
}

if (state == (149 << 0))
    grav = 0
else
    grav = 0.5
scr_enemybird()
scr_scareenemy()
scr_boundbox()
