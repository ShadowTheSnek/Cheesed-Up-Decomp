if (room == rm_editor)
    return;
if (state != states.stun && state != states.tumble)
    stunstate = 0
else if (state == states.stun)
{
    if (stunstate == 0 && stunned > 50 && grounded)
    {
        stunstate = 1
        stunned = 0
        state = states.tumble
        stuntimer = stunmax
    }
}
invincible = state == states.tumble
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
    case (5 << 0):
        grav = 0.5
        sprite_index = spr_sausagemannocigar_rolling
        hsp = (image_xscale * 7)
        angle = 0
        if (scr_solid((x + sign(hsp)), y) && ((!(check_slope(x, (y + 1)))) || check_solid((x + sign(hsp)), (y - 5))))
            image_xscale *= -1
        if (stuntimer > 0)
            stuntimer--
        else
            state = states.stun
        if (!instance_exists(hitboxID))
        {
            hitboxID = gml_Script_instance_create(x, y, obj_weeniehitbox)
            hitboxID.baddieID = id
        }
        break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
scr_scareenemy()
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
if (boundbox == 0)
{
    with (gml_Script_instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
