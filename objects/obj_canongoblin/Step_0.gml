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
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.stun)
    birdcreated = 0
idlespr = spr_canongoblin_walk
stunfallspr = spr_canongoblin_stun
walkspr = spr_canongoblin_walk
stunspr = spr_canongoblin_stun
grabbedspr = spr_canongoblin_stun
scr_scareenemy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
if (bombreset > 0)
    bombreset--
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (x != targetplayer.x && state != states.throw && bombreset == 0 && grounded)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
    {
        if (state == states.walk || (state == states.idle && sprite_index != scaredspr))
        {
            sprite_index = spr_canongoblin_throwbomb
            sound_play_3d("event:/sfx/enemies/cannongoblin", x, y)
            image_index = 0
            image_xscale = (-(sign((x - targetplayer.x))))
            state = states.throw
        }
    }
}
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
