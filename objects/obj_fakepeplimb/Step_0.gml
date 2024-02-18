if (room == rm_editor)
    return;
targetplayer = instance_nearest(x, y, obj_player)
if (ceiling && (state == states.crouch || state == states.punch))
    grav = 0
else if (ceiling && state != states.crouch && state != states.punch)
    grav = 0.5
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        ceiling = 0
        state = states.crouch
        grav = 0.5
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
        hidden = 0
        cooldown = 100
        if (sprite_index != spr_attack)
        {
            sprite_index = spr_attack
            image_index = 0
            with (gml_Script_instance_create(x, y, obj_forkhitbox))
            {
                visible = false
                sprite_index = other.sprite_index
                other.hitboxID = id
                ID = other.id
            }
        }
        else if (floor(image_index) == (image_number - 1))
        {
            image_speed = 0.35
            state = states.crouch
            instance_destroy(hitboxID)
            sprite_index = spr_hidden
        }
        break
    case (100 << 0):
        if hidden
        {
            sprite_index = spr_hidden
            if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 300) && targetplayer.y > (y - 300))
            {
                hidden = 0
                state = states.punch
            }
        }
        else
        {
            sprite_index = spr_hidden
            if (cooldown > 0)
                cooldown--
            else
                state = states.punch
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
if hidden
    invincible = 1
else
    invincible = 0
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
