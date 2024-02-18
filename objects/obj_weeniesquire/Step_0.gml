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
    case (80 << 0):
        hsp = (image_xscale * chargespeed)
        if (chargespeed < 24)
            chargespeed += 0.3
        with (obj_destructibles)
        {
            if place_meeting((x - other.hsp), y, other)
                instance_destroy()
        }
        if (check_solid((x + hsp), y) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(check_slope((x + hsp), y))))
        {
            state = states.stun
            stunned = 80
            hsp = (-8 * image_xscale)
            vsp = -5
        }
        break
}

if (state == states.walk && grounded && vsp > 0)
    hsp = 0
scr_enemybird()
scr_boundbox()
var player = instance_nearest(x, y, obj_player)
var check = (player.x > (x - 300) && player.x < (x + 300))
if (state == states.walk && check && y <= (player.y + 60) && y >= (player.y - 60) && state != states.punch && chargebuffer <= 0)
{
    state = states.punch
    flash = 1
    sprite_index = spr_weeniesquire_charge
    chargebuffer = 80
    chargespeed = 6
    hitboxcreate = 1
    with (gml_Script_instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id
        sprite_index = spr_weeniesquire_hitbox
    }
    if (x != player.x)
        image_xscale = sign((player.x - x))
}
if (state != states.punch && chargebuffer > 0)
    chargebuffer--
