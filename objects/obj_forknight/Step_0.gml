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
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
        break
    case (294 << 0):
        scr_enemy_pizzaheadjump()
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
scr_scareenemy()
if ((elite || global.stylethreshold >= 3) && ragecooldown == 0 && (!bo))
{
    var player = instance_nearest(x, y, obj_player)
    var check = (image_xscale > 0 ? (player.x > x && player.x < (x + 400)) : (player.x < x && player.x > (x - 400)))
    if (state == states.walk)
    {
        if (check && y <= (player.y + 60) && y >= (player.y - 60))
        {
            image_xscale = (-(sign((x - player.x))))
            sprite_index = spr_forknight_ragestart
            image_index = 0
            flash = 1
            alarm[4] = 5
            state = states.rage
            ragedash = 50
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        }
    }
}
if (ragedash > 0 && state == states.rage)
    ragedash--
if (ragedash == 0 && state == states.rage)
{
    state = states.walk
    sprite_index = walkspr
    ragecooldown = 100
}
if (ragecooldown > 0)
    ragecooldown--
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (hitboxcreate == 0 && state == states.walk)
{
    hitboxcreate = 1
    with (gml_Script_instance_create(x, y, obj_forkhitbox))
        ID = other.id
}
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
