targetplayer = obj_player1.id
wastedhits = (8 - elitehit)
destroyable = 0
switch state
{
    case states.arenaintro:
        scr_pizzaface_arenaintro()
        break
    case (134 << 0):
        scr_pizzaface_normal()
        break
    case (230 << 0):
        scr_pizzaface_ram()
        break
    case (8 << 0):
        scr_pizzaface_transitioncutscene()
        break
    case (273 << 0):
        scr_boss_phase1hurt()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (4 << 0):
        scr_boss_grabbed()
        break
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
}

if (superslambuffer > 0)
    superslambuffer--
if (state != states.walk)
    on_y = 1
if (prevhp != elitehit)
{
    if (elitehit < prevhp)
    {
        baddie_range++
        cooldown = 0
        attackbuffer = 0
        touchedground = 0
        hsp += ((-image_xscale) * 5)
        flickertime = 11
        attackbuffer += 40
        on_y = 0
        alarm[6] = 5
        global.playerhit++
        if (global.playerhit >= 3)
        {
            global.playerhit = 0
            gml_Script_instance_create(obj_player1.x, -15, obj_hppickup)
        }
        if (elitehit <= 0)
        {
            with (obj_music)
            {
                if (music != noone)
                    fmod_event_instance_set_parameter(music.event, "state", 1, 1)
            }
            instance_destroy(obj_forkhitbox)
            instance_destroy(obj_spitcheesespike)
            instance_destroy(obj_banditochicken_dynamite)
            instance_destroy(obj_banditochicken_projectile)
            state = states.transitioncutscene
            substate = states.animation
            introbuffer = 100
            flickertime = 0
            elitehit = 0
            on_y = 1
            image_alpha = 1
            with (gml_Script_instance_create(0, 0, obj_pizzahead_whitefade))
                deccel = 0.1
            with (obj_player1)
            {
                hsp = 0
                vsp = 0
                xscale = 1
                movespeed = 0
                sprite_index = spr_gnomecutscene1
                image_speed = 0.35
                state = states.actor
                x = roomstartx
                y = roomstarty
            }
            x = (room_width / 2)
            y = (obj_player1.y - 100)
            sprite_index = spr_pizzahead_intro1
            with (obj_baddie)
            {
                if (object_index != obj_pizzafaceboss && object_index != obj_pizzafaceboss_p2)
                    instance_destroy()
            }
        }
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
if (state == states.stun && savedthrown == thrown && (!savedthrown) && elitehit > 1)
    invincible = 0
else
    invincible = 1
if (((!invincible) || (state == states.stun && savedthrown == thrown && (!savedthrown) && elitehit == 1)) && (!flash) && alarm[5] < 0)
    alarm[5] = (0.15 * room_speed)
else if (invincible && (state != states.stun || (savedthrown != thrown && savedthrown) || elitehit > 1))
    flash = 0
if (state == states.ram && substate != states.transitioncutscene && alarm[4] < 0)
    alarm[4] = 6
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
depth = 0
if (state != states.stun)
    thrown = 0
if (boundbox == 0)
{
    with (gml_Script_instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = spr_pizzaface_og
        mask_index = spr_pizzaface_og
        baddieID = other.id
        other.boundbox = 1
    }
}
mask_index = spr_pizzaface
scr_pizzaface_update_sounds()
