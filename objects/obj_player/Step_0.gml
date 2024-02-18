prevhsp = hsp
prevvsp = vsp
prevmove = move
prevmovespeed = movespeed
previcemovespeed = icemovespeed
prevxscale = xscale
if (global.shootbutton ? key_shoot2 : key_slap2)
    input_buffer_shoot = 10
if (global.shootbutton == 1 ? key_shoot2 : key_slap2)
    input_buffer_pistol = 10
if (character == "SN" || isgustavo)
{
    if (key_chainsaw2 || key_slap2)
        input_buffer_slap = 12
}
else if (global.swapgrab && global.attackstyle != 0)
{
    if key_chainsaw2
        input_buffer_slap = 12
    if key_slap2
        input_buffer_grab = 12
}
else
{
    if key_slap2
        input_buffer_slap = 12
    if (global.attackstyle != 0 ? key_chainsaw2 : key_slap2)
        input_buffer_grab = 12
}
if key_jump
    input_buffer_jump = 15
if key_down2
    input_buffer_down = 15
if key_attack2
    input_buffer_mach = 15
if (grounded && vsp > 0)
    coyote_time = 8
if (vsp < 0)
    coyote_time = 0
can_jump = ((grounded && vsp > 0) || (coyote_time && vsp > 0))
if (state != states.grab)
    swingdingthrow = 0
collision_flags = 0
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    collision_flags |= (1 << 0)
if scr_solid(x, (y + 1))
    collision_flags |= (4 << 0)
if check_slope(x, (y + 1))
    collision_flags |= (2 << 0)
if global.MOD.GravityJump
{
    if (state != states.balloon && state != states.ladder && (!((state == states.tumble && key_down))) && state != states.climbwall && state != states.Sjump && state != states.trashroll && state != states.antigrav && state != states.cheesepepstick && state != states.freefallland && state != states.debugstate)
    {
        if ((gravityangle % 180) != 0)
            vsp = Approach(vsp, 0, 2)
        else if (key_jump && (!cutscene) && (grounded || abs(vsp) > 8))
        {
            with (gml_Script_instance_create(x, y, obj_gravityflipbg))
                side = (-other.flip)
            gravityjump = (!gravityjump)
            grounded = 0
            vsp = 12
            yscale = 1
        }
        input_buffer_jump = 0
        key_jump = 0
        can_jump = 0
    }
}
gravityangle = Approach(gravityangle, (gravityjump ? 180 : 0), 15)
if ((state == states.bump || state == states.Sjump || state == states.Sjumpprep || state == states.tumble) && gravityangle != 180)
    gravityangle = 0
flip = ((ceilingrun ^ gravityjump) ? -1 : 1)
if (character == "S" && (!isgustavo))
    mask_index = spr_crouchmask
switch state
{
    case states.normal:
        scr_player_normal()
        break
    case (1 << 0):
        scr_player_revolver()
        break
    case (2 << 0):
        scr_player_dynamite()
        break
    case (3 << 0):
        scr_player_boots()
        break
    case (4 << 0):
        scr_player_grabbed()
        break
    case (6 << 0):
        scr_player_finishingblow()
        break
    case (5 << 0):
        scr_player_tumble()
        break
    case (18 << 0):
        scr_player_titlescreen()
        break
    case (7 << 0):
        scr_player_ejected()
        break
    case (10 << 0):
        scr_player_firemouth()
        break
    case (9 << 0):
        scr_player_fireass()
        break
    case (8 << 0):
        scr_player_transitioncutscene()
        break
    case (19 << 0):
        scr_playerN_hookshot()
        break
    case (23 << 0):
        scr_player_slap()
        break
    case (20 << 0):
        scr_player_tacklecharge()
        break
    case (24 << 0):
        scr_player_cheesepep()
        break
    case (26 << 0):
        scr_player_cheesepepjump()
        break
    case (27 << 0):
        scr_player_cheesepepfling()
        break
    case (21 << 0):
        scr_player_cheeseball()
        break
    case (22 << 0):
        scr_player_cheeseballclimbwall()
        break
    case (29 << 0):
        scr_player_cheesepepstickside()
        break
    case (30 << 0):
        scr_player_cheesepepstickup()
        break
    case (25 << 0):
        scr_player_cheesepepstick()
        break
    case (28 << 0):
        scr_player_cheesepeplaunch()
        break
    case (33 << 0):
        scr_player_boxxedpep()
        break
    case (35 << 0):
        scr_player_boxxedpepjump()
        break
    case (34 << 0):
        scr_player_boxxedpepspin()
        break
    case (36 << 0):
        scr_player_pistolaim()
        break
    case (37 << 0):
        scr_player_climbwall()
        break
    case (38 << 0):
        scr_player_knightpepslopes()
        break
    case (39 << 0):
        scr_player_portal()
        break
    case (40 << 0):
        scr_player_secondjump()
        break
    case (41 << 0):
        scr_player_chainsawbump()
        break
    case (42 << 0):
        scr_player_handstandjump()
        break
    case (43 << 0):
        scr_player_lungeattack()
        break
    case (44 << 0):
        scr_player_lungegrab()
        break
    case (45 << 0):
        scr_player_dashtumble()
        break
    case (153 << 0):
        scr_player_shoulderbash()
        break
    case (46 << 0):
        scr_player_gottreasure()
        break
    case (47 << 0):
        scr_player_knightpep()
        break
    case (48 << 0):
        scr_player_knightpepattack()
        break
    case (49 << 0):
        scr_player_knightpepbump()
        break
    case (50 << 0):
        scr_player_meteorpep()
        break
    case (51 << 0):
        scr_player_bombpep()
        break
    case (54 << 0):
        scr_player_bombpepup()
        break
    case (53 << 0):
        scr_player_bombpepside()
        break
    case (52 << 0):
        scr_player_bombgrab()
        break
    case (55 << 0):
        scr_player_grabbing()
        break
    case (56 << 0):
        scr_player_chainsawpogo()
        break
    case (57 << 0):
        scr_player_shotgunjump()
        break
    case (59 << 0):
        scr_player_stunned()
        break
    case (60 << 0):
        scr_player_highjump()
        break
    case (61 << 0):
        scr_player_chainsaw()
        break
    case (137 << 0):
        scr_player_hit()
        break
    case (156 << 0):
        scr_player_thrown()
        break
    case (62 << 0):
        scr_player_facestomp()
        break
    case (64 << 0):
        scr_player_timesup()
        break
    case (65 << 0):
        scr_player_machroll()
        break
    case (72 << 0):
        scr_player_pistol()
        break
    case (66 << 0):
        scr_player_shotgun()
        break
    case (67 << 0):
        scr_player_shotguncrouch()
        break
    case (68 << 0):
        scr_player_shotguncrouchjump()
        break
    case (69 << 0):
        scr_player_shotgunshoot()
        break
    case (71 << 0):
        scr_player_shotgunfreefall()
        break
    case (70 << 0):
        scr_player_shotgundash()
        break
    case (73 << 0):
        scr_player_machfreefall()
        break
    case (74 << 0):
        scr_player_throwing()
        break
    case (76 << 0):
        scr_player_superslam()
        break
    case (75 << 0):
        scr_player_slam()
        break
    case (77 << 0):
        scr_player_skateboard()
        break
    case (78 << 0):
        scr_player_grind()
        break
    case (79 << 0):
        scr_player_grab()
        break
    case (80 << 0):
        scr_player_punch()
        break
    case (81 << 0):
        scr_player_backkick()
        break
    case (82 << 0):
        scr_player_uppunch()
        break
    case (83 << 0):
        scr_player_shoulder()
        break
    case (84 << 0):
        scr_player_backbreaker()
        break
    case (85 << 0):
        scr_player_graffiti()
        break
    case (86 << 0):
        scr_player_bossdefeat()
        break
    case (88 << 0):
        scr_player_bossintro()
        break
    case (96 << 0):
        scr_player_smirk()
        break
    case (87 << 0):
        scr_player_pizzathrow()
        break
    case (89 << 0):
        scr_player_gameover()
        break
    case (123 << 0):
        scr_player_Sjumpland()
        break
    case (122 << 0):
        scr_player_freefallprep()
        break
    case (120 << 0):
        scr_player_runonball()
        break
    case (118 << 0):
        scr_player_boulder()
        break
    case (90 << 0):
        scr_player_keyget()
        break
    case (91 << 0):
        scr_player_tackle()
        break
    case (94 << 0):
        scr_player_slipnslide()
        break
    case (93 << 0):
        scr_player_ladder()
        break
    case (92 << 0):
        scr_player_jump()
        break
    case (98 << 0):
        scr_player_victory()
        break
    case (95 << 0):
        scr_player_comingoutdoor()
        break
    case (97 << 0):
        scr_player_Sjump()
        break
    case (99 << 0):
        scr_player_Sjumpprep()
        break
    case (100 << 0):
        scr_player_crouch()
        break
    case (101 << 0):
        scr_player_crouchjump()
        break
    case (102 << 0):
        scr_player_crouchslide()
        break
    case (103 << 0):
        scr_player_mach1()
        break
    case (104 << 0):
        scr_player_mach2()
        break
    case (121 << 0):
        scr_player_mach3()
        break
    case (105 << 0):
        scr_player_machslide()
        break
    case (106 << 0):
        scr_player_bump()
        break
    case (107 << 0):
        scr_player_hurt()
        break
    case (108 << 0):
        scr_player_freefall()
        break
    case (111 << 0):
        scr_player_freefallland()
        break
    case (109 << 0):
        scr_player_hang()
        break
    case (112 << 0):
        scr_player_door()
        break
    case (113 << 0):
        scr_player_barrel()
        break
    case (114 << 0):
        scr_player_barreljump()
        break
    case (116 << 0):
        scr_player_barrelslide()
        break
    case (115 << 0):
        scr_player_barrelclimbwall()
        break
    case (117 << 0):
        scr_player_current()
        break
    case (119 << 0):
        scr_player_taxi()
        break
    case (152 << 0):
        scr_player_taxi()
        break
    case (58 << 0):
        scr_player_pogo()
        break
    case (31 << 0):
        scr_player_rideweenie()
        break
    case (32 << 0):
        scr_player_motorcycle()
        break
    case (124 << 0):
        scr_player_faceplant()
        break
    case (16 << 0):
        scr_player_ghost()
        break
    case (17 << 0):
        scr_player_ghostpossess()
        break
    case (11 << 0):
        scr_player_mort()
        break
    case (12 << 0):
        scr_player_mortjump()
        break
    case (13 << 0):
        scr_player_mortattack()
        break
    case (14 << 0):
        scr_player_morthook()
        break
    case (15 << 0):
        scr_player_hook()
        break
    case (144 << 0):
        scr_player_arenaintro()
        break
    case (146 << 0):
        scr_player_actor()
        break
    case (147 << 0):
        scr_player_parry()
        break
    case (148 << 0):
        scr_player_golf()
        break
    case (150 << 0):
        scr_player_tube()
        break
    case (154 << 0):
        scr_player_pummel()
        break
    case (165 << 0):
        scr_player_slipbanan()
        break
    case (183 << 0):
        scr_player_bombdelete()
        break
    case (184 << 0):
        scr_player_rocket()
        break
    case (185 << 0):
        scr_player_rocketslide()
        break
    case (186 << 0):
        scr_player_gotoplayer()
        break
    case (187 << 0):
        scr_player_trickjump()
        break
    case (190 << 0):
        scr_player_ridecow()
        break
    case (191 << 0):
        scr_player_ratmount()
        break
    case (196 << 0):
        scr_player_ratmounthurt()
        break
    case (192 << 0):
        scr_player_ratmountjump()
        break
    case (193 << 0):
        scr_player_ratmountattack()
        break
    case (194 << 0):
        scr_player_ratmountspit()
        break
    case (195 << 0):
        scr_player_ratmountclimbwall()
        break
    case (197 << 0):
        scr_player_ratmountgroundpound()
        break
    case (198 << 0):
        scr_player_ratmountbounce()
        break
    case (200 << 0):
        scr_player_ratmountballoon()
        break
    case (202 << 0):
        scr_player_ratmountgrind()
        break
    case (201 << 0):
        scr_player_ratmounttumble()
        break
    case (259 << 0):
        scr_player_ratmountpunch()
        break
    case (203 << 0):
        scr_player_ratmounttrickjump()
        break
    case (204 << 0):
        scr_player_ratmountskid()
        break
    case (206 << 0):
        scr_player_blockstance()
        break
    case (207 << 0):
        scr_player_balloon()
        break
    case (208 << 0):
        scr_player_debugstate()
        break
    case (210 << 0):
        scr_player_trashjump()
        break
    case (211 << 0):
        scr_player_trashroll()
        break
    case (212 << 0):
        scr_player_stringfling()
        break
    case (213 << 0):
        scr_player_stringjump()
        break
    case (214 << 0):
        scr_player_stringfall()
        break
    case (215 << 0):
        scr_player_noisejetpack()
        break
    case (216 << 0):
        scr_player_spiderweb()
        break
    case (225 << 0):
        scr_player_animatronic()
        break
    case (252 << 0):
        scr_player_playersuperattack()
        break
    case (254 << 0):
        scr_player_jetpackjump()
        break
    case (257 << 0):
        scr_player_bee()
        break
    case (260 << 0):
        scr_player_ratmountcrouch()
        break
    case (261 << 0):
        scr_player_ratmountladder()
        break
    case (265 << 0):
        scr_player_antigrav()
        break
    case (270 << 0):
        scr_player_estampede()
        break
    case (290 << 0):
        scr_player_backtohub()
        break
    case (293 << 0):
        scr_player_animation()
        break
    case (262 << 0):
        scr_player_supergrab()
        break
    case (304 << 0):
        state_player_cotton()
        break
    case (305 << 0):
        state_player_cottondrill()
        break
    case (306 << 0):
        state_player_cottonroll()
        break
    case (307 << 0):
        scr_player_fling()
        break
    case (308 << 0):
        scr_pizzano_twirl()
        break
    case (309 << 0):
        scr_player_frothstuck()
        break
    case (310 << 0):
        scr_player_rupertnormal()
        break
    case (311 << 0):
        scr_player_rupertslide()
        break
    case (312 << 0):
        scr_player_rupertjump()
        break
    case (313 << 0):
        scr_player_rupertstick()
        break
    case (314 << 0):
        scr_player_debugstate()
        break
    case (315 << 0):
        scr_player_frozen()
        break
}

if (ceilingrun && ((state != states.mach2 && state != states.mach3) || (!grounded)) && state != states.climbwall && state != states.chainsaw && state != states.backbreaker && state != states.debugstate)
{
    ceilingrun = 0
    flip = (gravityjump ? -1 : 1)
    vsp *= -1
    yscale *= -1
    if (!global.MOD.GravityJump)
        gravityangle += 170
}
if (state != states.chainsaw)
{
    if (!bodyslam_notif)
    {
        if (state == states.freefall)
        {
            bodyslam_notif = 1
            notification_push((0 << 0), [room])
        }
    }
    else if (state != states.freefall)
    {
        bodyslam_notif = 0
        notification_push((1 << 0), [room])
    }
}
if (state != states.crouchjump && state != states.crouch)
    uncrouch = 0
else if (state == states.crouch && uncrouch > 0)
    uncrouch--
if (state == states.Sjump || (state == states.chainsaw && tauntstoredstate == states.Sjump))
    sjumptimer++
else if (sjumptimer > 0)
{
    notification_push((42 << 0), [sjumptimer, room])
    sjumptimer = 0
}
if (invtime > 0)
    invtime--
if (sprite_index == spr_noise_phasetrans1P && image_index > 24)
{
    if (!noisebossscream)
    {
        sound_play_3d(global.snd_screamboss, x, y)
        sound_play_3d("event:/sfx/voice/noisescream", obj_noiseboss.x, obj_noiseboss.y)
        noisebossscream = 1
    }
}
else if (sprite_index != spr_noise_phasetrans1P)
    noisebossscream = 0
if (global.pistol && state != states.animation && state != states.actor && state != states.hurt && state != states.bump && (!instance_exists(obj_vigilante_duelintro)))
{
    if ((global.shootbutton == 1 ? key_shoot : key_slap) || pistolchargeshooting)
        pistolcharge += 0.5
    else
    {
        pistolcharge = 0
        pistolchargeshot = 1
    }
    if (pistolcharge > 0)
    {
        var ixa = [6, 14, 22, 30, 38]
        var _sound = 0
        for (var i = 0; i < array_length(ixa); i++)
        {
            if (floor(pistolcharge) == ixa[i])
                _sound = 1
        }
        if (_sound && (!pistolchargesound))
        {
            pistolchargesound = 1
            sound_play_3d("event:/sfx/pep/revolvercharge", x, y)
        }
        else if (!_sound)
            pistolchargesound = 0
    }
    if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 1))
        pistolcharge = (sprite_get_number(spr_revolvercharge) - 1)
    if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 16) && (!pistolchargeshooting))
    {
        pistolchargeshooting = 1
        pistolchargeshot = 1
    }
    if (pistolchargeshot > 0 && pistolchargeshooting)
    {
        if (state != states.backbreaker && state != states.chainsaw)
        {
            scr_pistolshoot(states.normal)
            pistolchargedelay = 5
            pistolchargeshot--
        }
    }
    else if (pistolchargeshot <= 0 && pistolchargeshooting)
    {
        pistolcharge = 0
        pistolchargedelay = 5
        pistolchargeshooting = 0
        pistolchargeshot = 1
        if (global.shootbutton == 1 ? key_shoot : key_slap)
            pistolcharge = 4
    }
}
else if (state == states.hurt || state == states.bump || instance_exists(obj_vigilante_duelintro))
{
    pistolcharge = 0
    pistolcharged = 0
    pistolchargeshooting = 0
    pistolchargeshot = 1
}
if (state != states.pistol && state != states.normal && sprite_index != spr_player_pistoljump2)
    pistol = 0
if (pistolanim != -4)
{
    pistolindex += 0.35
    if ((!machslideAnim) && state != states.machslide && state != states.fireass && state != states.handstandjump && (!cutscene) && state != states.door)
    {
        idle = 0
        sprite_index = pistolanim
        image_index = pistolindex
    }
    if (floor(pistolindex) == (sprite_get_number(pistolanim) - 1))
    {
        pistolanim = -4
        pistolindex = 0
    }
}
if (pistolcooldown > 0)
    pistolcooldown--
if (prevstate != state)
{
    if (prevstate == states.trashroll && state != states.chainsaw && prevsprite != spr_player_corpsestart && prevsprite != spr_player_corpsesurf)
        create_debris(x, y, spr_player_trashlid)
    if (prevstate == states.ghost && state != states.chainsaw)
        gml_Script_instance_create(x, y, obj_ghostdrapes)
}
if (!(place_meeting(x, (y + 1), obj_railparent)))
{
    if (state == states.mach3 || state == states.mach2 || state == states.tumble)
        railmovespeed = Approach(railmovespeed, 0, 0.1)
    else
        railmovespeed = Approach(railmovespeed, 0, 0.5)
}
if (state != states.handstandjump && state != states.tumble)
    crouchslipbuffer = 0
if (state != states.mach3 && (state != states.chainsaw || tauntstoredstate != states.mach3))
    mach4mode = 0
if (ratshootbuffer > 0)
    ratshootbuffer--
if (state != states.animatronic)
{
    animatronic_buffer = 180
    animatronic_collect_buffer = 0
}
if (state == states.boxxedpep && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax
if (verticalbuffer > 0)
    verticalbuffer--
if (superchargecombo_buffer > 0)
    superchargecombo_buffer--
else if (superchargecombo_buffer == 0)
{
    superchargecombo_buffer = -1
    global.combotime = 4
}
if (state != states.normal)
    breakdance_speed = 0.25
if (holycross > 0)
    holycross--
if global.noisejetpack
{
    if (jetpackeffect > 0)
        jetpackeffect--
    else
    {
        jetpackeffect = 100
        repeat (10)
            gml_Script_instance_create(x, y, obj_firemouthflame)
    }
}
if ((state == states.jump || state == states.normal || state == states.mach2 || state == states.mach3 || state == states.trickjump) && global.noisejetpack == 1)
{
    if (((!can_jump) && key_jump) || (grounded && key_jump && key_up))
    {
        fmod_event_instance_play(pizzapeppersnd)
        scr_fmod_soundeffect(jumpsnd, x, y)
        fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, 1)
        if key_down
            vsp = 0
        else
            vsp = -11
        if (move != 0)
        {
            if (movespeed < 10)
                movespeed = 10
        }
        with (gml_Script_instance_create(x, y, obj_highjumpcloud2))
            sprite_index = spr_player_firemouthjumpdust
        scr_do_pepperpizzajump()
    }
}
if (walljumpbuffer > 0)
    walljumpbuffer--
if (grounded && vsp > 0 && state != states.noisejetpack)
    jetpackfuel = jetpackmax
if tauntstoredisgustavo
{
    isgustavo = 1
    if (state != states.backbreaker && state != states.parry && state != states.graffiti)
        tauntstoredisgustavo = 0
}
if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost))
{
    launch = 0
    launched = 0
    launch_buffer = 0
}
if (launch_buffer > 0)
    launch_buffer--
else
    launched = 0
if (state != states.finishingblow)
    finishingblow = 0
if (dash_doubletap > 0)
    dash_doubletap--
if (cow_buffer > 0)
    cow_buffer--
if (state == states.lungeattack)
    lunge_buffer = 14
if (blur_effect > 0)
    blur_effect--
else if (breakdance_speed >= 0.6 || (state == states.slipbanan && sprite_index == spr_rockethitwall) || mach4mode == 1 || boxxeddash == 1 || state == states.ghost || state == states.tumble || state == states.ratmountbounce || state == states.ratmountattack || state == states.handstandjump || state == states.barrelslide || (state == states.grab && sprite_index == spr_swingding && swingdingdash <= 0) || state == states.freefall || state == states.lungeattack || state == states.ratmounttrickjump || state == states.trickjump)
{
    if (visible && (collision_flags & (1 << 0)) == 0)
    {
        blur_effect = 2
        with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), xscale))
            playerid = other.id
    }
}
if (state != states.chainsaw && state != states.bump && state != states.boxxedpep && state != states.boxxedpepspin && state != states.boxxedpepjump)
{
    boxxed = 0
    boxxeddash = 0
}
if (state != states.grab)
    grabbingenemy = 0
if (state != states.mach2 && state != states.mach3 && state != states.trickjump && state != states.ratmounttumble && state != states.ratmounttrickjump)
{
    ramp = 0
    ramp_points = 0
}
if (state != states.door && state != states.chainsaw && state != states.hit && place_meeting(x, y, obj_boxofpizza))
{
    state = states.crouch
    if isgustavo
        state = states.ratmountcrouch
    if (character == "S")
        state = states.normal
}
if (shoot_buffer > 0)
    shoot_buffer--
if (cheesepep_buffer > 0)
    cheesepep_buffer--
if (invhurt_buffer > 0)
    invhurt_buffer--
if (state == states.hurt)
{
    if (hurt_buffer > 0)
        hurt_buffer--
    else
    {
        invhurt_buffer = invhurt_max
        hurt_buffer = -1
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max
    hurt_buffer = -1
}
if ((room == Realtitlescreen && instance_exists(obj_mainmenuselect)) || room == Mainmenu || room == Longintro || room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
    state = states.titlescreen
if (wallclingcooldown < 10)
    wallclingcooldown++
if (boxxedspinbuffer > 0)
    boxxedspinbuffer--
if (supercharged && (collision_flags & (1 << 0)) == 0)
{
    if (superchargebuffer > 0)
        superchargebuffer--
    else if (state == states.normal || state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.ratmount || state == states.ratmountjump || state == states.ratmountbounce || state == states.ratmountskid)
    {
        superchargebuffer = 4
        with (gml_Script_instance_create((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), obj_superchargeeffect))
            playerid = other.id
    }
}
if (state != states.Sjump)
    sjumpvsp = -12
if (state != states.freefall)
    freefallvsp = 20
if (supercharge > 9 && state != states.backbreaker)
{
    if (!supercharged)
    {
        ini_open_from_string(obj_savesystem.ini_str)
        if (ini_read_real("Game", "supertaunt", 0) == 0)
            create_transformation_tip(gml_Script_lang_get_value("supertaunttip"))
        ini_close()
        sound_play("event:/sfx/pep/gotsupertaunt")
    }
    supercharged = 1
}
if ((!instance_exists(pizzashieldid)) && pizzashield == 1)
{
    with (gml_Script_instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index
        other.pizzashieldid = id
    }
}
if (visible == false && state == states.comingoutdoor)
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
if (global.coop == 1)
{
    if ((state == states.punch || state == states.handstandjump) && (!((obj_player2.state == states.punch || obj_player2.state == states.handstandjump))))
        fightballadvantage = 1
    else if (!((obj_player2.state == states.punch || obj_player2.state == states.handstandjump)))
        fightballadvantage = 0
}
if (state != states.pogo && state != states.backbreaker)
{
    pogospeed = 6
    pogospeedprev = 0
}
scr_playersounds()
if grounded
    doublejump = 0
if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
            sprite_index = spr_playerN_pogofallmach
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
            sprite_index = spr_playerN_pogobouncemach
    }
    flashflicker = 1
    pogocharge--
}
else
    flashflicker = 0
if (state != states.throwing)
    kickbomb = 0
if (pogocharge == 0)
{
    pogochargeactive = 0
    pogocharge = 100
}
if (flashflicker == 1)
{
    flashflickertime++
    if (flashflickertime == 20)
    {
        flash = 1
        flashflickertime = 0
    }
}
if (state != states.mach3 && state != states.grabbed)
    fightball = 0
if (state != states.grabbed && state != states.hurt)
{
    if (grounded && state != states.grabbing)
    {
        suplexmove = 0
        suplexmove2 = 0
    }
}
if (state != states.freefall && state != states.superslam && (state != states.chainsaw || (tauntstoredstate != states.freefall && tauntstoredstate != states.superslam)) && (state != states.backbreaker || (tauntstoredstate != states.freefall && tauntstoredstate != states.superslam)))
    freefallsmash = -14
if (global.playerhealth <= 0 && state != states.gameover)
{
    image_index = 0
    sprite_index = spr_playerV_dead
    state = states.gameover
}
if ((!variable_global_exists("collect2")) ? 0 : 0)
{
    gml_Script_instance_create(0, 0, obj_softlockcrash)
    instance_destroy()
}
if ((state == states.gameover && y > (room_height * 2) && (!instance_exists(obj_backtohub_fadeout))) || (instance_exists(obj_timesup) && obj_timesup.alarm[1] == 0))
{
    targetDoor = "HUB"
    scr_playerreset()
    with (obj_player1)
    {
        image_index = 0
        image_blend = c_white
        visible = true
    }
    with (obj_player)
    {
        x = -1000
        y = -1000
    }
    if instance_exists(obj_cyop_loader)
    {
        if (global.is_hubworld || global.custom_hub_level == "")
        {
            instance_destroy(obj_cyop_loader)
            scr_room_goto(editor_entrance)
            return;
        }
        else
            cyop_load_level_internal(global.custom_hub_level, 1)
    }
    gml_Script_instance_create(0, 0, obj_backtohub_fadeout)
    global.leveltorestart = -4
    global.leveltosave = -4
    global.startgate = 0
}
if (baddiegrabbedID == obj_null && (state == states.grab || state == states.superslam || state == states.tacklecharge))
    state = states.normal
if (cutscene == 1 && state != states.gotoplayer)
    global.heattime = 60
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if (sprite_index == spr_winding && state != states.normal)
    windingAnim = 0
if (state != states.grab)
    swingdingbuffer = 0
if (state == states.antigrav || state == states.rocket || state == states.rocketslide)
    grav = 0
else if (state == states.barrel)
    grav = 0.6
else if (state == states.ghost || state == states.ghostpossess)
    grav = 0
else if boxxed
    grav = 0.3
else if (sprite_index == spr_player_jetpackstart2)
    grav = 0.4
else if (state == states.boxxedpepspin)
    grav = 0.6
else
    grav = 0.5
if (state == states.barrel && key_jump2 && (!jumpstop))
    grav = 0.4
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    gml_Script_instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (gml_Script_instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (global.combo >= 25 && (!instance_exists(angryeffectid)) && state == states.normal && character != "V")
{
    with (gml_Script_instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (object_index == obj_player1)
{
    if (global.combotimepause > 0)
        global.combotimepause--
    if (global.combo != global.previouscombo && (!is_bossroom()))
    {
        if (global.combo > global.highest_combo)
            global.highest_combo = global.combo
        global.previouscombo = global.combo
        if ((global.combo % 5) == 0 && global.combo != 0)
        {
            instance_destroy(obj_combotitle)
            with (gml_Script_instance_create(x, (y - 80), obj_combotitle))
            {
                title = floor((global.combo / 5))
                event_perform(ev_step, ev_step_normal)
            }
        }
    }
    if (!((state == states.door || state == (297 << 0) || state == states.shotgun || state == states.tube || state == (292 << 0) || state == states.taxi || state == states.gottreasure || state == states.victory || state == states.gottreasure || state == states.actor || state == states.comingoutdoor || (state == states.knightpep && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || (collision_flags & (1 << 0)) > 0)))
    {
        if (room != forest_G1b && global.combotimepause <= 0)
        {
            if (global.heattime > 0)
                global.heattime -= 0.5
            if (global.combotime > 0)
                global.combotime -= 0.15
        }
    }
    if (global.combotime <= 0 && global.combo >= 1)
    {
        if (global.combo >= 1)
            sound_play("event:/sfx/misc/kashingcombo")
        global.savedcombo = global.combo
        global.combotime = 0
        global.combo = 0
        supercharge = 0
    }
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
        global.style -= 0.1
    global.bullet = Approach(global.bullet, 3, 0.003)
    global.fuel = Approach(global.fuel, 3, 0.004)
    if (string_copy(room_get_name(room), 1, 5) == "tower" && (!global.panic))
    {
        global.bullet = 3
        global.fuel = 3
    }
}
if (key_jump && (!grounded) && (state == states.mach2 || state == states.mach3) && (state != (states.climbwall & walljumpbuffer)) <= 0)
    input_buffer_walljump = 24
if (boxxeddashbuffer > 0)
    boxxeddashbuffer--
if (coyote_time > 0)
    coyote_time--
if (input_buffer_jump > 0)
    input_buffer_jump--
if (input_buffer_down > 0)
    input_buffer_down--
if (input_buffer_mach > 0)
    input_buffer_mach--
if (input_buffer_jump_negative > 0)
    input_buffer_jump_negative--
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (input_attack_buffer > 0)
    input_attack_buffer--
if (input_buffer_shoot > 0)
    input_buffer_shoot--
if (input_finisher_buffer > 0)
    input_finisher_buffer--
if (input_up_buffer > 0)
    input_up_buffer--
if (input_down_buffer > 0)
    input_down_buffer--
if (input_buffer_walljump > 0)
    input_buffer_walljump--
if (input_buffer_slap > 0)
    input_buffer_slap--
if (input_buffer_grab > 0)
    input_buffer_grab--
if (key_particles == 1)
    create_particle((x + random_range(-25, 25)), (y + random_range(-35, 25)), (10 << 0), 0)
if (state != states.ratmount && state != states.ratmountjump && state != states.chainsaw)
{
    gustavodash = 0
    ratmount_movespeed = 8
}
if (inv_frames == 0 && hurted == 0 && state != states.ghost)
    image_alpha = 1
if ((state == states.rupertjump && sprite_index == spr_player_skatespin) || state == states.punch || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = 1
else
    attacking = 0
if (state == states.throwing || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = 1
else
    grabbing = 0
if ((state == states.ratmountbounce && vsp >= 0) || sprite_index == spr_Sjumpcancel || sprite_index == spr_swingding || sprite_index == spr_tumble || state == states.boxxedpepspin || state == states.trashroll || state == states.trashjump || state == states.shotgundash || (state == states.shotgunfreefall && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == states.Sjump || state == states.rocket || state == states.rocketslide || state == states.chainsawbump || (state == states.punch && ((sprite_index != spr_breakdanceuppercut && sprite_index != spr_breakdanceuppercutend) || vsp < 0)) || state == states.faceplant || state == states.rideweenie || state == states.mach3 || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.freefall || state == states.fireass || state == states.jetpackjump || (state == states.firemouth && sprite_index != spr_firemouthintro) || state == (19 << 0) || state == states.jetpackjump || state == states.skateboard || state == (63 << 0) || state == states.Sjump || state == states.machfreefall || state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.trickjump || state == states.cheesepep || state == states.cheeseball || state == states.ratmounttumble || state == states.ratmountgroundpound || global.noisejetpack == 1 || state == states.ratmountpunch || state == states.antigrav || holycross > 0 || state == states.barrelslide || state == states.barrelclimbwall || ratmount_movespeed >= 12 || ghostdash == 1 || state == states.slipbanan || state == states.shoulderbash || (state == states.machslide && (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost3fall)) || (state == states.handstandjump && (sprite_index == spr_attackdash || sprite_index == spr_airattack || sprite_index == spr_airattackstart)) || ((sprite_index == spr_jump || sprite_index == spr_tumble || sprite_index == spr_snick_spindash || abs(hsp) >= 16 || sprite_index == spr_snick_roll || sprite_index == spr_walljumpstart) && character == "S") || ((state == (304 << 0) || state == (306 << 0)) && movespeed >= 8) || state == (305 << 0) || sprite_index == spr_cotton_attack || (state == (308 << 0) && sprite_index == spr_pizzano_machtwirl))
    instakillmove = 1
else
    instakillmove = 0
if ((global.noisejetpack || holycross > 0) && (state == states.actor || state == states.chainsaw || state == states.backbreaker || state == states.gotoplayer || state == states.animation || state == states.arenaintro || state == (297 << 0) || state == states.Sjumpland))
    instakillmove = 0
if (state == states.ratmountbounce && vsp < 0)
    stunmove = 1
else
    stunmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)
if (state != states.ladder && state != states.ratmountladder)
    hooked = 0
if (state != states.mach3 && state != states.machslide)
    autodash = 0
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = 0
if (state != states.freefallland && state != states.normal && state != states.machslide && state != states.jump)
    facehurt = 0
if (state != states.normal && state != states.machslide)
    machslideAnim = 0
if (state != states.normal && state != states.ratmount)
{
    idle = 0
    dashdust = 0
}
if (state != states.mach1 && state != states.cheesepepjump && state != states.jump && state != (19 << 0) && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
    momemtum = 0
if (state != states.Sjump && state != states.Sjumpprep)
    a = 0
if (state != states.facestomp)
    facestompAnim = 0
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0
if (state != states.mach2)
    machpunchAnim = 0
if (ladderbuffer > 0)
    ladderbuffer--
if (state != states.jump)
    stompAnim = 0
var do_macheffect = (state == states.mach3 || (state == states.ghost && ghostdash && ghostpepper >= 3) || state == states.mach2 || (state == states.Sjump && global.afterimage == 0) || ratmount_movespeed >= 12 || gusdashpadbuffer > 0 || ((abs(movespeed) >= 10 || sprite_index == spr_crazyrun) && character == "S") || (character == "N" && noisetype == 1 && pogochargeactive))
if do_macheffect
{
    if (macheffect == 0)
    {
        macheffect = 1
        toomuchalarm1 = 6
        with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
        {
            playerid = other.object_index
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
    }
}
if (!do_macheffect)
    macheffect = 0
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && do_macheffect)
    {
        with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
        {
            playerid = other.object_index
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
        toomuchalarm1 = 6
    }
}
if (!isgustavo)
    gusdashpadbuffer = 0
else if (gusdashpadbuffer > 0)
    gusdashpadbuffer--
if (restartbuffer > 0)
    restartbuffer--
if ((y > (room_height + 300) || y < -800) && roomstarty < (room_height + 200) && roomstarty > -700 && (!(place_meeting(x, y, obj_verticalhallway))) && restartbuffer <= 0 && (!verticalhallway) && room != custom_lvl_room && state != states.gameover && state != states.gotoplayer && (!global.levelreset) && room != boss_pizzaface && room != tower_outside && room != boss_pizzafacefinale && (!instance_exists(obj_backtohub_fadeout)) && state != states.backtohub)
    respawn_player()
if (character == "S")
{
    if (state == states.crouchjump || state == states.crouch)
        state = states.normal
}
if (character != "M")
{
    if (!(scr_solid_player(x, y)))
    {
        if (state != states.ratmountcrouch && state != states.boxxedpepjump && state != states.boxxedpepspin && (!((state == states.bump && sprite_index == spr_tumbleend))) && state != states.barrelslide && state != states.barrelclimbwall && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.stunned && state != states.crouch && state != states.shotguncrouch && state != states.shotguncrouchjump && state != states.boxxedpep && state != states.pistol && sprite_index != spr_player_crouchshoot && state != states.Sjumpprep && state != states.crouchslide && state != states.chainsaw && (state != states.machroll || character == "S") && state != states.hurt && state != states.crouchjump && state != states.cheesepepstickup && state != states.cheesepepstickside && state != states.tumble && sprite_index != spr_playerN_jetpackslide && state != (306 << 0) && sprite_index != spr_pizzano_crouchslide)
            mask_index = spr_player_mask
        else
            mask_index = spr_crouchmask
    }
    else
        mask_index = spr_crouchmask
}
else
    mask_index = spr_pepperman_mask
if (state == states.gottreasure || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == states.keyget || state == states.chainsaw || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.gameover || state == states.gotoplayer || state == states.taxi || state == states.actor || (collision_flags & (1 << 0)) > 0 || (sprite_index == spr_firemouthintro && global.gameplay))
    cutscene = 1
else
    cutscene = 0
if ((state == states.normal || state == states.ratmount) && obj_player1.spotlight == 1 && (!instance_exists(obj_uparrow)) && (collision_flags & (4 << 0)) > 0)
{
    if place_meeting(x, y, obj_uparrowhitbox)
    {
        with (gml_Script_instance_create(x, y, obj_uparrow))
            playerid = other.object_index
    }
}
if (abs(hsp) > 12 && ((movespeed > 12 && state == states.mach3) || (character == "S" && state == states.normal)) && (!instance_exists(speedlineseffectid)) && (!cutscene) && (collision_flags & (1 << 0)) <= 0)
{
    with (gml_Script_instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
var mask = mask_index
if (character == "S" && (!isgustavo))
    mask_index = spr_crouchmask
scr_collide_destructibles()
if (state != -1 && state != states.backtohub && state != states.ghostpossess && state != states.gotoplayer && state != states.debugstate && state != states.titlescreen && state != states.tube && state != states.grabbed && state != states.door && state != states.Sjump && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover)
    scr_collide_player()
mask_index = mask
if (state == states.tube || state == states.gotoplayer || state == states.debugstate)
{
    x += hsp
    y += vsp
}
if (state == states.boulder)
    scr_collide_player()
scr_collide_destructibles()
with (obj_ratblock)
    scr_ratblock_destroy()
if (state != states.comingoutdoor && state != states.frozen)
    image_blend = c_white
prevstate = state
prevsprite = sprite_index
if (distance_to_object(obj_spike) < 500)
{
    var dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    for (i = 0; i < array_length(dirs); i++)
    {
        var b = dirs[i]
        with (instance_place((x + b[0]), (y + b[1]), obj_spike))
        {
            if (other.state != states.barrel)
            {
                var h = other.hurted
                scr_hurtplayer(other)
                if fake
                    instance_destroy()
                if (h != other.hurted && other.hurted)
                    fmod_event_one_shot_3d("event:/sfx/enemies/pizzardelectricity", x, y)
            }
            else
            {
                with (other)
                {
                    state = states.bump
                    sprite_index = spr_bump
                    image_index = 0
                    hsp = (-6 * xscale)
                    vsp = -4
                    fmod_event_one_shot_3d("event:/sfx/knight/lose", x, y)
                    repeat (3)
                        create_debris(x, y, spr_wooddebris)
                }
            }
        }
    }
}
if (smoothx != 0)
    xscale = (-sign(smoothx))
smoothx = Approach(smoothx, 0, 4)
if (finisher_hits == 5 && (!finisher))
{
    with (gml_Script_instance_create(x, y, obj_finishereffect))
        playerid = other.id
    finisher = 1
    gml_Script_instance_create(x, y, obj_tauntaftereffectspawner)
}
if (state != states.lungeattack && state != states.chainsaw)
{
    finisher_hits = 0
    finisher = 0
    lunge_hits = 0
    hit_connected = 0
}
if (state != states.mach3 && state != states.Sjump && state != states.Sjumpprep && state != states.chainsaw && state != states.backbreaker)
    jetpackcancel = 0
if (character == "N" && noisetype == 1)
    jetpackcancel = 1
if (room != rank_room && room != timesuproom)
{
    if (hat != -1 && (!instance_exists(obj_cowboyhat)))
    {
        with (gml_Script_instance_create(x, y, obj_cowboyhat, 
        {
            hat: hat
        }
))
            playerid = other.id
    }
    if (pet != pet_prev || (pet != -1 && (!instance_exists(petID))))
    {
        instance_destroy(petID)
        if (pet != -1)
        {
            petID = instance_create_depth(x, y, (depth + 1), obj_petfollow, 
            {
                pet: pet
            }
)
        }
        pet_prev = pet
    }
}
if (grounded && state != states.Sjump && state != states.Sjumpprep)
    superjumped = 0
