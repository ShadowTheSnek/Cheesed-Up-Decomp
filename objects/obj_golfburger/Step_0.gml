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
}

if (golfcooldown > 0)
    golfcooldown--
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
if (state == states.throwing)
{
    hsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = states.walk
        sprite_index = walkspr
        golfcooldown = 100
    }
    if (!shot)
    {
        golfcooldown = 100
        with (golfid)
        {
            invincible = 1
            hsp = 0
            vsp = 0
            sprite_index = stunfallspr
            image_xscale = other.image_xscale
            x = (other.x + (other.image_xscale * 24))
            y = ((other.y + 23) - 25)
        }
    }
    if (floor(image_index) >= 6 && (!shot))
    {
        shot = 1
        notification_push((16 << 0), [object_index])
        with (golfid)
        {
            invincible = 0
            x = other.x
            y = other.y
            sound_play_3d("event:/sfx/misc/golfpunch", x, y)
            scr_pizzaball_go_to_thrown((14 * other.image_xscale), -7, 0)
        }
        golfcooldown = 100
        golfid = -4
    }
}
if (state != states.throwing)
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
