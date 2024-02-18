if (room == rm_editor)
    return;
targetplayer = obj_player1.id
wastedhits = (9 - elitehit)
if (pizzahead && elitehit <= 1)
    destroyable = 1
switch state
{
    case states.arenaintro:
        scr_vigilante_arenaintro()
        break
    case (134 << 0):
        scr_vigilante_walk()
        break
    case (1 << 0):
        scr_vigilante_revolver()
        break
    case (269 << 0):
        scr_vigilante_reloading()
        break
    case (104 << 0):
        scr_vigilante_mach2()
        break
    case (102 << 0):
        scr_vigilante_crouchslide()
        break
    case (2 << 0):
        scr_vigilante_dynamite()
        break
    case (74 << 0):
        scr_vigilante_throwing()
        break
    case (270 << 0):
        scr_vigilante_estampede()
        break
    case (273 << 0):
        scr_vigilante_phase1hurt()
        break
    case (274 << 0):
        scr_vigilante_duel()
        break
    case (80 << 0):
        scr_vigilante_punch()
        break
    case (92 << 0):
        scr_vigilante_jump()
        break
    case (278 << 0):
        scr_vigilante_wait()
        break
    case (279 << 0):
        scr_vigilante_flamethrower()
        break
    case (280 << 0):
        scr_vigilante_machinegun()
        break
    case (281 << 0):
        scr_vigilante_bazooka()
        break
    case (282 << 0):
        scr_vigilante_crate()
        break
    case (294 << 0):
        scr_boss_pizzaheadjump()
        break
    case (298 << 0):
        scr_boss_pizzaheadKO()
        break
    case (137 << 0):
        scr_vigilante_hit()
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
    case (262 << 0):
        if (elitehit <= 0)
            destroyable = 1
        break
}

boss_update_pizzaheadKO(spr_bossfight_vigiHP, spr_bossfight_vigipalette)
if (state != states.flamethrower && flameID != -4)
{
    instance_destroy(obj_flamethrowerhurtbox)
    flameID = -4
}
if (state == states.revolver || state == states.wait || state == states.dynamite || state == states.throwing || state == states.estampede)
{
    if (targetplayer.x != x)
        image_xscale = (-(sign((x - targetplayer.x))))
}
boss_hurt_gustavo()
if ((!pizzahead) && obj_player1.state != states.actor && obj_player1.state != states.chainsaw && obj_player1.state != states.supergrab && (!obj_player1.instakillmove) && obj_player1.y >= (y - 20) && obj_player1.state != states.animation && state != states.hit && state != states.stun && state != states.phase1hurt && state != states.supergrab && hsp == 0)
{
    if place_meeting(x, y, obj_player1)
    {
        with (obj_player)
        {
            if (state != states.tackle)
            {
                var ix = (x > (room_width / 2) ? 1 : -1)
                xscale = ix
                sprite_index = spr_bump
                hsp = ((-xscale) * 5)
                movespeed = abs(hsp)
                vsp = -3
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
    instance_destroy(bossvulnerableID)
    currentattack = 0
    if (elitehit < prevhp && (wastedhits != 10 || destroyable))
    {
        if (irandom(100) <= 25)
            sound_play_3d("event:/sfx/voice/vigiduel", x, y)
        pizzahead_subhp = pizzahead_maxsubhp
        reposition = 1
        oldspotID = -4
        if place_meeting(x, y, obj_vigilantespot)
            oldspotID = instance_place(x, y, obj_vigilantespot)
        bullethit = 0
        cooldown = 0
        touchedground = 0
        hsp += ((-image_xscale) * 5)
        flickertime = 11
        alarm[6] = 5
        global.playerhit++
        boss_do_pizzaheadKO()
        if (pizzahead && elitehit <= 2 && (!pizzaheadshot))
            pizzaheadshot = 1
        if ((!pizzahead) && elitehit < 5)
            instance_create_unique(0, 0, obj_johnecheese_spawner)
        if (global.playerhit >= 3)
        {
            global.playerhit = 0
            gml_Script_instance_create(obj_player1.x, -15, obj_hppickup)
        }
    }
    prevhp = elitehit
}
if (((phase == 1 && elitehit <= 0) || (phase == 2 && elitehit <= 0)) && (!pizzahead))
{
    if (phase == 1)
    {
        instance_destroy(obj_johnecheese)
        instance_destroy(obj_johnecheese_spawner)
        instance_destroy(obj_targetguy)
        instance_destroy(obj_vigilantecow)
        instance_destroy(obj_vigilantecrate)
        elitehit = 9
        wastedhits = 0
        phase = 2
        scr_sleep(25)
        sound_play_3d("event:/sfx/voice/vigiangry", x, y)
        var lay1 = layer_get_id("Backgrounds_Ring")
        var lay2 = layer_get_id("Backgrounds_2")
        var lay3 = layer_get_id("Backgrounds_1")
        var bg1 = layer_background_get_id_fix(lay1)
        var bg2 = layer_background_get_id_fix(lay2)
        alarm[7] = 5
        layer_set_visible(lay3, 1)
        layer_background_change(bg2, bg_vigiboss_dark)
        layer_background_change(bg1, bg_vigilantearena_dark)
        with (obj_drawcontroller)
        {
            use_dark = 1
            dark_alpha = 1
        }
    }
    else if (phase == 2 && state != states.duel && state != states.hit && (!thrown))
    {
        instance_destroy(obj_johnecheese)
        instance_destroy(obj_johnecheese_spawner)
        sound_play_3d("event:/sfx/voice/vigiduel", x, y)
        if (!destroyable)
        {
            state = states.duel
            hsp = 0
            vsp = 0
            sprite_index = spr_playerV_idle
            flickertime = 0
            playerhit--
            touchedground = 0
            alarm[6] = -1
            var dis = 264
            image_xscale = -1
            x = (room_width - dis)
            y = 402
            gml_Script_instance_create(0, 0, obj_vigilante_duelintro)
            duelphase = 0
            duelbuffer = 140
            duelplayer = 0
            signspr = spr_preparetodraw
            signy = (-sprite_get_height(signspr))
            sound_play("event:/sfx/voice/vigiduel")
            instance_destroy(obj_vigilantecrate)
            instance_destroy(obj_vigilantebazooka)
            instance_destroy(obj_vigilantebazookatrail)
            instance_destroy(obj_vigilantecow)
            instance_destroy(obj_cowspawner)
            instance_destroy(obj_cowstampede)
            instance_destroy(obj_cowfall)
            instance_destroy(obj_uziprojectile)
            instance_destroy(obj_vigilantedynamite)
            instance_destroy(obj_vigilanteshot)
            instance_destroy(obj_ladderhorizontal)
            with (obj_player1)
            {
                pistolanim = -4
                state = states.duel
                hsp = 0
                vsp = 0
                xscale = 1
                sprite_index = spr_idle
                x = dis
                y = 402
            }
        }
        else
            instance_destroy()
    }
}
if (state == states.stun)
{
    if (wastedhits >= 7 && sprite_index == spr_pepperman_shoulderhurt && grounded && vsp > 0 && (!thrown) && stunned > 10)
        stunned = 1
    if thrown
        savedthrown = 1
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1
        idle_timer = 1
        ammo = 6
    }
}
else
    savedthrown = 0
if (state != states.duel)
    signy = Approach(signy, (-sprite_get_height(signspr)), 20)
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == states.reloading || (state == states.stun && savedthrown == thrown && (!savedthrown)))
    invincible = 0
else
    invincible = 1
if (wastedhits == 4 && phase == 1)
    invincible = 1
if (state == states.pizzaheadKO)
    invincible = 1
if (pizzahead && state == states.stun && (!thrown) && alarm[5] == -1 && (!flash))
    alarm[5] = (0.15 * room_speed)
if (state == states.crouchslide && alarm[4] < 0)
{
    alarm[4] = 10
    if (state == states.freefall)
        alarm[4] = 5
}
mask_index = spr_player_mask
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
scr_vigilante_update_sounds()
