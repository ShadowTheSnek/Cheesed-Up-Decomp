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
        if (totemID != noone)
            state = (188 << 0)
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
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
        break
}

scr_scareenemy()
if (state == (188 << 0) && totemID != noone)
{
    image_speed = 0.35
    if (sprite_index != spr_indiancheese_dance)
    {
        var tx = (totemID.x + (64 * totemdir))
        var on_place = (totemdir > 0 ? x > tx : x < tx)
        if check_solid((x + image_xscale), y)
            on_place = 1
        hsp = ((!on_place) ? (image_xscale * 3) : 0)
        if (sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
            image_index = (image_number - 1)
        if (sprite_index != spr_indiancheese_jump)
            sprite_index = spr_indiancheese_walk
        if (grounded && vsp > 0)
        {
            sprite_index = spr_indiancheese_walk
            if on_place
            {
                sprite_index = spr_indiancheese_dance
                image_index = 0
                hsp = 0
            }
        }
    }
    else
    {
        hsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            totemdir = (x > totemID.x ? -1 : 1)
            image_xscale = totemdir
            sprite_index = spr_indiancheese_jump
            vsp = -11
        }
    }
}
else if (state == (188 << 0) && totemID == -4)
    state = states.walk
if (state == states.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
var player = instance_nearest(x, y, obj_player)
if ((elite || global.stylethreshold >= 3) && ragecooldown > 0)
    ragecooldown--
if (state == states.walk && state != states.stun && sprite_index == walkspr && sprite_index != spr_indiancheese_scared && (elite || global.stylethreshold >= 3) && ragecooldown == 0)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        if (x != player.x)
            image_xscale = (-(sign((x - player.x))))
        state = states.rage
        sprite_index = spr_indiancheese_howl
        image_index = 0
        shot = 0
        ragedash = 100
        hsp = 0
    }
}
if ((!grounded) && sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
    image_speed = 0
else if (image_speed == 0)
    image_speed = 0.35
if (sprite_index == spr_indiancheese_land && floor(image_index) == (image_number - 1))
    sprite_index = spr_indiancheese_walk
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
