targetplayer = obj_player1.id
image_speed = 0.35
wastedhits = (8 - elitehit)
switch state
{
    case states.fall:
        scr_pizzaface_p2_fall()
        break
    case (134 << 0):
        scr_pizzaface_p2_normal()
        break
    case (233 << 0):
        scr_pizzaface_p2_fishing()
        break
    case (232 << 0):
        scr_pizzaface_p2_look()
        break
    case (240 << 0):
        boss_pizzahead_pullinglevel()
        break
    case (74 << 0):
        boss_pizzahead_throwing()
        break
    case (237 << 0):
        boss_pizzahead_portraitthrow()
        break
    case (66 << 0):
        boss_pizzahead_shotgun()
        break
    case (293 << 0):
        boss_pizzahead_pinup()
        break
    case (273 << 0):
        boss_pizzahead_p2_phase1hurt()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
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
}

if (obj_player1.state != states.actor && obj_player1.y >= (y - 20) && obj_player1.state != states.animation && state != states.hit && state != states.stun && state != states.phase1hurt && hsp == 0 && state != states.fall)
{
    if ((x > (room_width / 2) && obj_player1.x >= (x - 60)) || (x <= (room_width / 2) && obj_player1.x <= (x + 60)))
    {
        with (obj_player)
        {
            if (state != states.tackle)
            {
                var ix = (x > (room_width / 2) ? 1 : -1)
                xscale = ix
                sprite_index = spr_bump
                hsp = ((-xscale) * 8)
                movespeed = abs(hsp)
                vsp = -7
                state = states.tackle
                grounded = 0
                sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                gml_Script_instance_create(x, y, obj_bumpeffect)
            }
        }
    }
}
if (prevhp != elitehit)
{
    if (elitehit < prevhp)
    {
        instance_destroy(obj_pizzaheadswordstone)
        if (lastattack != -1 && lastattack != (4 << 0))
            movecount[lastattack] += 1
        bullethit = 0
        if (elitehit <= 0)
            instance_destroy()
        global.playerhit++
        if (global.playerhit >= 3)
        {
            global.playerhit = 0
            gml_Script_instance_create(obj_player1.x, -15, obj_hppickup)
        }
        if (wastedhits >= 3 && elitehit > 0)
            instance_create_unique((room_width / 2), -200, obj_pizzahead_haywire)
    }
    prevhp = elitehit
}
if (state == states.stun)
{
    if thrown
        savedthrown = 1
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1
        idle_timer = 1
    }
}
else
    savedthrown = 0
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == states.stun && savedthrown == thrown && (!savedthrown))
    invincible = 0
else
    invincible = 1
if (state == states.ram && alarm[4] < 0)
    alarm[4] = 6
mask_index = spr_pizzahead_idle
if (state == states.stun && thrown)
{
    while check_solid(x, y)
        y--
}
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
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
scr_pizzaface_p2_update_sounds()
