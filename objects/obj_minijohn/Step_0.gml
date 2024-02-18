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
    case (141 << 0):
        scr_enemy_chase()
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
    case (294 << 0):
        scr_enemy_pizzaheadjump()
        break
    case (80 << 0):
        if (sprite_index == spr_minijohn_punchstart)
        {
            image_speed = 0.35
            hsp = Approach(hsp, 0, 1)
            if (floor(image_index) == (image_number - 1))
            {
                sound_play_3d("event:/sfx/enemies/minijohnpunch", x, y)
                punchspd = 8
                hsp = (punchspd * image_xscale)
                sprite_index = spr_minijohn_punch
                image_index = 0
                image_speed = 0.25
                with (gml_Script_instance_create(x, y, obj_forkhitbox))
                {
                    sprite_index = spr_bighitbox
                    mask_index = spr_bighitbox
                    ID = other.id
                }
            }
        }
        else if (sprite_index == spr_minijohn_punch)
        {
            image_speed = 0.25
            punchspd = Approach(punchspd, 0, 0.25)
            hsp = (punchspd * image_xscale)
            with (instance_place((x + hsp), y, obj_destructibles))
                instance_destroy()
            if (floor(image_index) == (image_number - 1))
            {
                state = (141 << 0)
                ragecooldown = 100
                sprite_index = spr_minijohn_charge
            }
        }
        break
    case (189 << 0):
        hsp = 0
        if underground
        {
            if (vsp < 0)
                vsp = 0
            sprite_index = spr_minijohn_ground
            image_index = 0
            if (player.x > (x - 200) && player.x < (x + 200) && y <= (player.y + 60) && y >= (player.y - 60))
            {
                underground = 0
                if (player.x != x)
                    image_xscale = sign((x - player.x))
                sound_play_3d("event:/sfx/enemies/comingoutground", x, y)
            }
        }
        else if (sprite_index == spr_minijohn_ground)
        {
            if (vsp < 0)
                vsp = 0
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_minijohn_stun
                vsp = -4
                repeat (3)
                    create_debris(x, y, spr_graveyarddebris2)
            }
        }
        else if grounded
        {
            state = (141 << 0)
            sprite_index = spr_minijohn_charge
        }
        break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == (141 << 0) && ragecooldown <= 0)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        if (x != player.x)
            image_xscale = sign((player.x - x))
        if (elite || global.stylethreshold >= 3)
        {
            sprite_index = spr_minijohn_rage1
            image_index = 0
            vsp = -8
            flash = 1
            alarm[4] = 5
            ragecooldown = 100
            state = states.rage
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            with (gml_Script_instance_create(x, y, obj_forkhitbox))
            {
                sprite_index = spr_bighitbox
                mask_index = spr_bighitbox
                ID = other.id
            }
        }
        else
        {
            sprite_index = spr_minijohn_punchstart
            image_index = 0
            ragecooldown = 100
            state = states.punch
        }
    }
}
if (ragecooldown > 0)
    ragecooldown--
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (141 << 0))
    momentum = 0
if (state == states.walk || state == states.idle)
{
    var targetplayer = obj_player1
    if (obj_player1.spotlight == 0)
        targetplayer = obj_player2
    movespeed = 4
    if (targetplayer.x != x)
        image_xscale = (-(sign((x - targetplayer.x))))
    state = (141 << 0)
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
if (state == (189 << 0))
{
    invincible = 1
    if (sprite_index != spr_minijohn_underground && sprite_index != spr_minijohn_undergroundout)
        image_blend = c_gray
}
else
{
    invincible = 0
    image_blend = c_white
}
