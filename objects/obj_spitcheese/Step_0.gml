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
    case (125 << 0):
        scr_enemy_rage()
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
if (bombreset > 0)
    bombreset--
var player = instance_nearest(x, y, obj_player)
if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
{
    if (bombreset <= 0 && state == states.walk)
    {
        if (x != player.x)
            image_xscale = (-(sign((x - player.x))))
        if (global.stylethreshold >= 3)
        {
            bombreset = 130
            ragedash = 5
            state = states.rage
            sprite_index = spr_spitcheese_rage
            ragebuffer = 100
            image_index = 0
            image_speed = 0.4
            flash = 1
            alarm[4] = 5
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        }
        else
        {
            image_index = 0
            state = states.throw
        }
    }
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (floor(image_index) == (image_number - 1) && sprite_index == spr_spitcheese_spit)
    sprite_index = spr_spitcheese_idle
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
