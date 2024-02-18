if (room == rm_editor)
    return;
if (bombreset > 0)
    bombreset--
switch state
{
    case states.walk:
        if (state == states.throw)
            break
        else
        {
            if (substate_buffer > 0)
                substate_buffer--
            else
            {
                substate_buffer = substate_max
                var old_substate = substate
                while (substate == old_substate)
                    substate = choose((134 << 0), (126 << 0), (130 << 0))
                if (substate == states.turn && state == states.throw)
                    substate = states.walk
                if (substate == states.walk)
                    image_xscale = choose(-1, 1)
                else if (substate == states.turn)
                {
                    sprite_index = spr_pizzaslug_turn
                    image_index = 0
                    hsp = 0
                }
            }
            switch substate
            {
                case states.walk:
                    image_speed = 0.35
                    if (sprite_index != spr_pizzaslug_walk)
                    {
                        image_index = 0
                        sprite_index = spr_pizzaslug_walk
                    }
                    if check_solid(x, y)
                        y--
                    scr_enemy_walk()
                    break
                case (126 << 0):
                    image_speed = 0.35
                    hsp = 0
                    sprite_index = spr_pizzaslug_idle
                    break
                case (130 << 0):
                    image_speed = 0.35
                    substate_buffer = 5
                    if (sprite_index != spr_pizzaslug_turn)
                    {
                        image_index = 0
                        sprite_index = spr_pizzaslug_turn
                    }
                    if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
                    {
                        image_xscale *= -1
                        substate_buffer = substate_max
                        substate = states.idle
                        sprite_index = spr_pizzaslug_idle
                    }
                    break
                case (129 << 0):
                    state = states.throw
                    substate_buffer = 0
                    image_index = 0
                    sprite_index = spr_pizzaslug_cough
                    break
            }

            break
        }
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
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
var player = instance_nearest(x, y, obj_player)
if (state == states.walk && substate != states.turn)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ragecooldown == 0)
    {
        if (global.stylethreshold >= 3 || elite)
        {
            if (x != player.x)
                image_xscale = (-(sign((x - player.x))))
            image_speed = 0.6
            hsp = 0
            shot = 0
            sprite_index = spr_pizzaslug_rage
            image_index = 0
            state = states.rage
        }
        else
        {
            if (x != player.x)
                image_xscale = (-(sign((x - player.x))))
            ragecooldown = 160
            state = states.throw
            substate_buffer = 0
            image_index = 0
            sprite_index = spr_pizzaslug_cough
        }
    }
}
if (ragecooldown > 0)
    ragecooldown--
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
