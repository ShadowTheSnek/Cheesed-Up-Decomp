function state_player_normal() //gml_Script_state_player_normal
{
    if isgustavo
    {
        brick = 1
        state = states.ratmount
    }
    mach2 = 0
    var move = (key_left + key_right)
    skateboarding = 0
    momemtum = 0
    jumpstop = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffer = 0
    }
    var idlespr = spr_idle
    var movespr = spr_move
    if (global.leveltosave == "freezer" && (!global.noisejetpack))
        idlespr = spr_freezeridle
    if global.pistol
    {
        idlespr = spr_player_pistolidle
        movespr = spr_player_pistolwalk
    }
    if (safe_get(obj_soundtest, "play") || global.jukebox != -4 || global.leveltosave == "dance")
    {
        idlespr = spr_pepdance
        movespr = spr_pepdance
        if (character == "SP")
        {
            idlespr = spr_playerSP_danceidle
            movespr = spr_playerSP_dancewalk
        }
        idle = 0
    }
    var breakdance_max = 10
    if (key_taunt && (!shotgunAnim) && (!global.pistol))
    {
        pistol = 0
        breakdance_pressed++
    }
    else
        breakdance_pressed = 0
    if (breakdance_pressed >= breakdance_max && (!shotgunAnim))
        breakdance_speed = Approach(breakdance_speed, 0.6, 0.005)
    else
        breakdance_speed = 0.25
    if (breakdance_speed >= 0.5)
    {
        if (!instance_exists(obj_beatbox))
        {
            create_particle(x, y, (9 << 0))
            with (gml_Script_instance_create(x, y, obj_beatbox))
                vsp = -11
        }
        notecreate--
    }
    if (notecreate <= 0 && (!shotgunAnim))
    {
        gml_Script_instance_create((x + random_range(-70, 70)), (y + random_range(-70, 70)), obj_notes)
        notecreate = 10
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
        railmomentum = 1
    }
    hsp = ((move * movespeed) + (railmovespeed * raildir))
    if (move != 0)
    {
        xscale = move
        if (movespeed < 8)
            movespeed += 0.5
        else if (floor(movespeed) == 8)
            movespeed = 6
        if (movespeed < 3 && move != 0)
            image_speed = 0.35
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
        if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
        {
            machslideAnim = 0
            idle = 0
            facehurt = 0
            if (shoot || pistol)
                sprite_index = spr_pistolwalk
            else if mort
                sprite_index = spr_player_mortwalk
            else if (breakdance_pressed >= breakdance_max)
                sprite_index = spr_breakdance
            else if (global.fill <= 0 && (!instance_exists(obj_ghostcollectibles)))
                sprite_index = spr_hurtwalk
            else if (global.heatmeter && global.stylethreshold == 2)
                sprite_index = spr_3hpwalk
            else if (global.heatmeter && global.stylethreshold >= 3)
                sprite_index = spr_ragemove
            else if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss) || global.noisejetpack)
                sprite_index = spr_3hpwalk
            else if (global.combo >= 50 || instance_exists(obj_pizzaface_thunderdark))
                sprite_index = spr_ragemove
            else
                sprite_index = movespr
        }
        if (scr_solid((x + sign(hsp)), y) && (!(check_slope((x + sign(hsp)), y))) && xscale == move && (!(check_slope(x, (y + 1)))))
            movespeed = 0
        if (move != 0 && grounded && vsp > 0)
        {
            if (steppybuffer > 0)
                steppybuffer--
            else if (sprite_index != spr_breakdance && sprite_index != spr_pepdance)
            {
                create_particle(x, (y + 43), (1 << 0), 0)
                steppybuffer = 12
                if place_meeting(x, y, obj_poodebris)
                    sound_play_3d("event:/sfx/pep/stepinshit", x, y)
                else
                    sound_play_3d("event:/sfx/pep/step", x, y)
            }
        }
    }
    else
    {
        steppybuffer = 12
        if (sprite_index == spr_breakdance)
            image_speed = breakdance_speed
        else
            image_speed = 0.35
        movespeed = 0
        if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
        {
            if (idle < 400 && breakdance_pressed < breakdance_max)
                idle++
            if (idle >= 150 && breakdance_pressed < breakdance_max)
            {
                if (sprite_index != idlespr && floor(image_index) == (image_number - 1))
                {
                    facehurt = 0
                    idle = 0
                }
                if ((!global.pistol) && (!shotgunAnim) && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6 && sprite_index != spr_player_keydoor)
                {
                    idleanim = random_range(0, 100)
                    if (irandom(100) <= 25)
                        sound_play_3d(snd_voicemyea, x, y)
                    image_index = 0
                    sprite_index = choose(spr_idle1, spr_idle2, spr_idle3, spr_idle4, spr_idle5, spr_idle6)
                }
            }
            else if (!facehurt)
            {
                if (windingAnim < 1800 || angry || global.playerhealth == 1 || shoot)
                {
                    start_running = 1
                    movespeed = 0
                    if (shoot || pistol)
                        sprite_index = spr_player_pistolidle
                    else if mort
                        sprite_index = spr_player_mortidle
                    else if (breakdance_pressed >= breakdance_max)
                        sprite_index = spr_breakdance
                    else if (global.fill <= 0 && (!instance_exists(obj_ghostcollectibles)))
                        sprite_index = spr_hurtidle
                    else if ((global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld") && global.fill <= global.maxwave)
                        sprite_index = spr_panic
                    else if (global.heatmeter && global.stylethreshold == 2)
                        sprite_index = spr_3hpidle
                    else if (global.heatmeter && global.stylethreshold >= 3)
                        sprite_index = spr_rageidle
                    else if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss) || global.noisejetpack)
                        sprite_index = spr_3hpidle
                    else if (global.combo >= 50 || instance_exists(obj_pizzaface_thunderdark))
                        sprite_index = spr_rageidle
                    else
                        sprite_index = idlespr
                }
                else
                {
                    idle = 0
                    windingAnim--
                    sprite_index = spr_winding
                    if (breakdance_pressed >= breakdance_max)
                        sprite_index = spr_breakdance
                }
            }
            else
            {
                windingAnim = 0
                sprite_index = spr_facehurt
                if (breakdance_pressed >= breakdance_max)
                    sprite_index = spr_breakdance
            }
        }
    }
    if (movespeed > 8)
        movespeed -= 0.1
    if landAnim
    {
        if (sprite_index == spr_player_mortland)
        {
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_player_mortidle
                image_index = 0
            }
        }
        else if (sprite_index == spr_player_pistolland)
        {
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = idlespr
                landAnim = 0
            }
        }
        else if (!shotgunAnim)
        {
            if (move == 0)
            {
                movespeed = 0
                sprite_index = spr_land
                if (floor(image_index) == (image_number - 1))
                    landAnim = 0
            }
            else
            {
                sprite_index = spr_land2
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = 0
                    sprite_index = movespr
                    image_index = 0
                }
            }
        }
        else
        {
            sprite_index = spr_shotgunland
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_shotgunidle
                if (move != 0)
                    sprite_index = spr_shotgunwalk
                image_index = 0
            }
        }
    }
    else if (shotgunAnim && sprite_index != spr_shotgunshoot && (!machslideAnim))
        sprite_index = (move == 0 ? spr_shotgunidle : spr_shotgunwalk)
    if machslideAnim
        sprite_index = spr_machslideend
    if (floor(image_index) == (image_number - 1))
    {
        switch sprite_index
        {
            case spr_machslideend:
                machslideAnim = 0
                sprite_index = idlespr
                if shotgunAnim
                    sprite_index = spr_shotgunidle
                break
            case spr_playerV_revolverend:
                sprite_index = idlespr
                break
            case spr_shotgunshoot:
                sprite_index = spr_shotgunidle
                break
            case spr_pistolshot:
                sprite_index = idlespr
                break
        }

    }
    if grounded
    {
        if ((key_jump || (input_buffer_jump > 0 && ((!key_attack) || character == "S") && vsp > 0)) && (!key_down))
        {
            input_buffer_jump = 0
            scr_fmod_soundeffect(jumpsnd, x, y)
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump
                if shotgunAnim
                    sprite_index = spr_shotgunjump
                else if global.pistol
                    sprite_index = spr_player_pistoljump1
                image_index = 0
            }
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
            vsp = -11
            state = states.jump
            jumpAnim = 1
            jumpstop = 0
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            freefallstart = 0
        }
        if ((key_down || (grounded && vsp > 0 && scr_solid(x, (y - 3)) && scr_solid(x, y)) || check_solid(x, y)) && character != "S")
        {
            state = states.crouch
            landAnim = 0
            crouchAnim = 1
            image_index = 0
            idle = 0
        }
    }
    else if (!key_jump)
    {
        if (sprite_index != spr_shotgunshoot)
        {
            if (!shotgunAnim)
                sprite_index = spr_fall
            else
                sprite_index = spr_shotgunfall
            if global.pistol
                sprite_index = spr_player_pistoljump2
            image_index = 0
            jumpAnim = 0
        }
        else
            jumpAnim = 1
        state = states.jump
    }
    if (character != "V" && character != "S")
    {
        if (input_buffer_shoot > 0 && shotgunAnim)
            scr_shotgunshoot()
        else if ((input_buffer_pistol > 0 && global.pistol) || (global.shootstyle == 1 && key_shoot2))
            scr_pistolshoot(states.normal)
        else if key_shoot2
            scr_perform_move((2 << 0), (0 << 0))
        if (input_buffer_grab > 0 && (!key_up) && ((shotgunAnim == 0 && (!global.pistol)) || global.shootbutton == 1 || (global.shootbutton == 2 && (!global.pistol))) && ((!suplexmove) || character != "SP"))
        {
            input_buffer_grab = 0
            input_buffer_slap = 0
            sprite_index = (shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash)
            suplexmove = 1
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            fmod_event_instance_play(suplexdashsnd)
            state = states.handstandjump
            movespeed = 8
            image_index = 0
        }
        else if ((input_buffer_slap > 0 || input_buffer_grab > 0) && key_up && ((shotgunAnim == 0 && (!global.pistol)) || global.shootbutton == 1 || (global.shootbutton == 2 && (!global.pistol))))
        {
            state = states.punch
            input_buffer_slap = 0
            input_buffer_grab = 0
            image_index = 0
            sprite_index = spr_breakdanceuppercut
            fmod_event_instance_play(snd_uppercut)
            vsp = -14
            movespeed = hsp
            if (character == "SP")
            {
                with (gml_Script_instance_create(x, (y + 3), obj_highjumpcloud2))
                    sprite_index = spr_player_firemouthjumpdust
            }
            else
            {
                particle_set_scale((4 << 0), xscale, 1)
                create_particle(x, y, (4 << 0), 0)
            }
        }
        else if (input_buffer_slap > 0 && (!key_up) && ((shotgunAnim == 0 && (!global.pistol)) || global.shootbutton == 1 || (global.shootbutton == 2 && (!global.pistol))))
        {
            input_buffer_slap = 0
            scr_perform_move((0 << 0), (0 << 0))
        }
    }
    switch character
    {
        case "V":
            if (key_attack && state != states.handstandjump && (!(check_solid((x + xscale), y))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(check_solid((x + (xscale * 5)), y)))) && (!global.kungfu))
            {
                sprite_index = spr_mach1
                image_index = 0
                state = states.mach2
                if (movespeed < 6)
                    movespeed = 6
            }
            if ((key_shoot2 || key_chainsaw2) && (!instance_exists(dynamite_inst)))
            {
                if (move == 0)
                    movespeed = 0
                state = states.dynamite
                sprite_index = spr_playerV_dynamitethrow
                image_index = 0
                with (gml_Script_instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale
                    if other.key_up
                    {
                        movespeed = 0
                        vsp = -16
                    }
                    else
                    {
                        movespeed = 6
                        vsp = -6
                    }
                    other.dynamite_inst = id
                    playerid = other.id
                }
            }
            if key_slap2
            {
                if (move == 0)
                    movespeed = 0
                sprite_index = spr_playerV_revolverstart
                image_index = 0
                state = states.revolver
            }
            break
        case "S":
            break
        default:
            if (character != "N" || noisetype == 0)
            {
                if (key_attack && state != states.handstandjump && (!(check_solid((x + xscale), y))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(check_solid((x + (xscale * 5)), y)))) && (!global.kungfu))
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    state = states.mach2
                    if global.gameplay
                        movespeed = abs(movespeed)
                    movespeed = max(movespeed, 6)
                }
                if (global.kungfu && key_attack && state != states.handstandjump)
                {
                    state = states.blockstance
                    sprite_index = spr_player_airattack
                    hsp = 0
                    movespeed = 0
                }
                if (sprite_index == spr_playerN_jetpackboost)
                    vsp = 0
            }
            else if (pogochargeactive || pizzapepper > 0)
            {
                if key_attack2
                {
                    sound_play_3d("event:/sfx/noise/woag", x, y)
                    state = states.Sjumpprep
                    image_index = 0
                    sprite_index = ((!key_up) ? spr_playerN_jetpackstart : spr_superjumpprep)
                    jetpackcancel = 1
                    if (sprite_index == spr_playerN_jetpackstart && global.gameplay)
                        sound_play_3d("event:/sfx/noise/jetpackstart", x, y)
                    hsp = 0
                    vsp = 0
                }
            }
            else if (key_attack && (!key_slap2))
            {
                sprite_index = spr_playerN_pogostart
                image_index = 0
                state = states.pogo
            }
            break
    }

    scr_dotaunt()
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0
        machslideAnim = 0
        image_speed = 0.45
    }
}

function state_pepperman_normal() //gml_Script_state_pepperman_normal
{
    pepperman_grab_reset()
    move = (key_left + key_right)
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel
    else if (move == 0)
        movespeed -= pepperman_deccel
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3
    else if (movespeed < 0)
        movespeed = 0
    if (move != 0 && movespeed == 0)
        xscale = move
    hsp = (xscale * movespeed)
    if (sprite_index != spr_pepperman_throw)
    {
        if (hsp != 0)
            sprite_index = spr_move
        else
            sprite_index = spr_idle
    }
    if ((input_buffer_jump > 0 || key_jump) && can_jump)
    {
        input_buffer_jump = 0
        scr_fmod_soundeffect(jumpsnd, x, y)
        sprite_index = spr_jump
        image_index = 0
        vsp = (-pepperman_jumpspeed)
        state = states.jump
        with (gml_Script_instance_create(x, (y - 5), obj_highjumpcloud2))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
    }
    if ((!grounded) && (!key_jump))
    {
        state = states.jump
        sprite_index = spr_fall
    }
    if (key_attack && ((!(check_solid((x + xscale), y))) || place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move
        state = states.shoulderbash
        sprite_index = spr_pepperman_shoulderstart
        image_index = 0
    }
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_idle
    if (move != 0 && (floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
    {
        create_particle(x, (y + 38), (1 << 0))
        steppy = 1
    }
    if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
        steppy = 0
}

function pepperman_grab_reset() //gml_Script_pepperman_grab_reset
{
    if (pepperman_grabID != noone)
    {
        if (!instance_exists(pepperman_grabID))
            pepperman_grabID = -4
    }
}

function state_snick_normal() //gml_Script_state_snick_normal
{
    if 1
    {
    }
    else
    {
        walljump_buffer = 0
        dropdash_time = -1
    }
    var acc = 0.28125
    var dec = 1
    var frc = 0.234375
    var top = 16
    var roll_frc = 0.09375
    var roll_dec = 0.5
    move = (key_left + key_right)
    hsp = movespeed
    if (walljump_buffer > 0)
        walljump_buffer--
    switch substate
    {
        case states.machslide:
            if (sprite_index == spr_machslide)
            {
                if (abs(movespeed) <= 2)
                {
                    sprite_index = spr_machslideend
                    image_index = 0
                }
            }
            else if (image_index >= (image_number - 1) || (sprite_index == spr_machslideboost3fall && grounded))
            {
                if (sprite_index == spr_machslidestart)
                    sprite_index = spr_machslide
                else if (sprite_index == spr_machslideend)
                    substate = states.normal
                else if (!grounded)
                    sprite_index = spr_machslideboost3fall
                else
                {
                    if (move == 0)
                    {
                        sound_play_3d("event:/sfx/pep/break", x, y)
                        image_index = 0
                        sprite_index = spr_machslidestart
                        image_speed = 0.5
                    }
                    else
                        substate = states.normal
                    xscale = (-xscale)
                    movespeed = (xscale * top)
                }
            }
            movespeed = Approach(movespeed, 0, 0.5)
            break
        case (0 << 0):
            if grounded
            {
                with (check_slope(x, (y + 1)))
                    other.movespeed += ((other.state == states.machroll ? 0.25 : 0.1) * (-sign(image_xscale)))
            }
            if (sprite_index != spr_walljumpstart)
            {
                if (state != states.machroll)
                {
                    if (move == -1)
                    {
                        if (movespeed > 0)
                        {
                            movespeed -= dec
                            if (movespeed <= 0)
                                movespeed = -0.5
                        }
                        else if (movespeed > (-top))
                        {
                            movespeed -= acc
                            if (movespeed <= (-top))
                                movespeed = (-top)
                        }
                    }
                    if (move == 1)
                    {
                        if (movespeed < 0)
                        {
                            movespeed += dec
                            if (movespeed >= 0)
                                movespeed = 0.5
                        }
                        else if (movespeed < top)
                        {
                            movespeed += acc
                            if (movespeed >= top)
                                movespeed = top
                        }
                    }
                    if (move == 0 && grounded)
                        movespeed -= (min(abs(movespeed), frc) * sign(movespeed))
                }
                else
                    movespeed -= (min(abs(movespeed), ((move == (-sign(movespeed)) && (!(check_slope(x, (y + 1))))) ? roll_dec : roll_frc)) * sign(movespeed))
            }
            else if (move == (-xscale))
                movespeed -= (min(abs(movespeed), acc) * sign(movespeed))
            if (state == states.jump)
            {
                if (sprite_index == spr_fall || sprite_index == spr_move || sprite_index == spr_idle || sprite_index == spr_mach)
                    sprite_index = spr_fall
                if (move != 0 && sprite_index != spr_walljumpstart)
                    xscale = sign(move)
                if (!jumpstop)
                {
                    if ((!key_jump2) && vsp < 0.5 && (!stompAnim))
                    {
                        vsp /= 3
                        jumpstop = 1
                    }
                    else if (scr_solid(x, (y - 1)) && (!jumpAnim))
                    {
                        vsp = grav
                        jumpstop = 1
                    }
                }
                if (key_jump && dropdash_time == -1)
                    dropdash_time = 0
                if (!key_jump2)
                    dropdash_time = -1
                else if (dropdash_time > -1 && dropdash_time < 24 && vsp >= 0)
                {
                    dropdash_time++
                    if (dropdash_time == 8)
                    {
                        sound_play_3d("event:/modded/sfx/snick/dropdash", x, y)
                        flash = 1
                    }
                }
                if (dropdash_time >= 8)
                {
                    sprite_index = spr_tumble
                    with (create_blur_afterimage(x, y, sprite_index, image_index, xscale))
                        playerid = other.id
                }
                else if (sprite_index == spr_tumble)
                    sprite_index = spr_snick_roll
                if (grounded && vsp >= 0)
                {
                    if (dropdash_time >= 8)
                    {
                        input_buffer_jump = 0
                        movespeed = (xscale * max(lerp(8, 24, ((dropdash_time - 8) / 16)), abs(movespeed)))
                        state = states.machroll
                        sprite_index = spr_tumble
                        with (obj_camera)
                            lag = 8
                        dropdash_time = -1
                        sound_play_3d("event:/modded/sfx/snick/release", x, y)
                        with (gml_Script_instance_create(x, y, obj_superdashcloud))
                        {
                            image_xscale = other.xscale
                            image_yscale = other.yscale
                        }
                    }
                    else
                    {
                        state = states.normal
                        sound_play_3d("event:/sfx/pep/step", x, y)
                        create_particle(x, y, (12 << 0), 0)
                    }
                }
                if ((key_slap2 || key_chainsaw2) && (!suplexmove))
                {
                    if (move == 0)
                        move = xscale
                    if (move != 0)
                    {
                        suplexmove = 1
                        input_buffer_jump = 0
                        sound_play_3d("event:/modded/sfx/kungfu", x, y)
                        vsp = min(vsp, -3)
                        movespeed = (max((abs(movespeed) + 2), 14) * move)
                        sprite_index = spr_walljumpstart
                        image_speed = 0.5
                    }
                }
                if (walljump_buffer <= 0 && (move == (-xscale) || abs(movespeed) < 8) && sprite_index == spr_walljumpstart)
                {
                    sound_play_3d("event:/sfx/pep/grabcancel", x, y)
                    sprite_index = spr_suplexcancel
                    image_index = 0
                    if (move == (-xscale))
                    {
                        movespeed /= 2
                        vsp = min(vsp, 0)
                    }
                }
            }
            else if (state == states.machroll)
            {
                sprite_index = spr_tumble
                if (abs(movespeed) <= 0 && (!scr_slope()))
                    state = states.normal
            }
            else
            {
                dropdash_time = -1
                if (!grounded)
                    state = states.jump
                if (abs(movespeed) > 0)
                {
                    if (move != xscale && move != 0 && (abs(movespeed) > 3 || sprite_index == spr_machslide))
                    {
                        if (sprite_index != spr_machslide)
                        {
                            sound_play_3d("event:/sfx/pep/break", x, y)
                            image_index = 0
                        }
                        sprite_index = spr_machslide
                        image_speed = 0.5
                    }
                    else if (abs(movespeed) >= top)
                    {
                        if (abs(movespeed) >= 20)
                            sprite_index = spr_crazyrun
                        else
                            sprite_index = spr_mach4
                        image_speed = 0.5
                        if (scr_check_superjump() && grounded)
                        {
                            sprite_index = spr_superjumpprep
                            state = states.Sjumpprep
                            image_index = 0
                            dir = move
                            movespeed = abs(movespeed)
                        }
                        if (!instance_exists(chargeeffectid))
                        {
                            with (gml_Script_instance_create(x, y, obj_chargeeffect))
                            {
                                playerid = other.object_index
                                other.chargeeffectid = id
                            }
                        }
                    }
                    else if (abs(movespeed) >= (top / 2) && move == xscale)
                    {
                        sprite_index = spr_mach
                        image_speed = max(0.2, (abs(movespeed) / 30))
                    }
                    else
                    {
                        sprite_index = spr_move
                        image_speed = max(0.2, (abs(movespeed) / 20))
                    }
                    if (move == sign(movespeed))
                        xscale = sign(movespeed)
                }
                else
                    sprite_index = spr_idle
            }
            if (abs(movespeed) > 8 && key_down && grounded && state != states.machroll && (!(place_meeting(x, (y + 1), obj_ladder))) && (!(place_meeting(x, (y + 1), obj_boxofpizza))))
            {
                substate = states.tumble
                sprite_index = spr_machroll
            }
            image_speed = max(image_speed, 0.35)
            if (key_attack && state == states.normal && abs(movespeed) < 8)
            {
                if (move != 0)
                    xscale = sign(move)
                if ((!(check_solid((x + xscale), y))) || place_meeting((x + xscale), y, obj_destructibles) || place_meeting((x + xscale), y, obj_metalblock) || place_meeting((x + xscale), y, obj_ratblock))
                {
                    sound_play_3d("event:/modded/sfx/snick/peelrev", x, y)
                    state = states.machroll
                    sprite_index = spr_move
                    image_speed = 0.35
                    movespeed = 0
                }
            }
            if (input_buffer_grab > 0 || input_buffer_slap > 0)
            {
                if (grounded && abs(movespeed) < 10)
                {
                    state = states.machroll
                    sprite_index = spr_snick_spindash
                    image_speed = 0.5
                    movespeed = 0
                    fmod_event_instance_set_parameter(spindashsnd, "state", 0, 1)
                    sound_instance_move(spindashsnd, x, y)
                    fmod_event_instance_play(spindashsnd)
                }
            }
            if (input_buffer_jump > 0 && can_jump)
            {
                input_buffer_jump = 0
                if (key_down && state != states.machroll)
                {
                    if (move != 0)
                        xscale = sign(move)
                    state = states.machroll
                    sprite_index = spr_snick_spindash
                    image_speed = 0.5
                    movespeed = 0
                    fmod_event_instance_set_parameter(spindashsnd, "state", 0, 1)
                    sound_instance_move(spindashsnd, x, y)
                    fmod_event_instance_play(spindashsnd)
                }
                else
                {
                    scr_fmod_soundeffect(jumpsnd, x, y)
                    particle_set_scale((4 << 0), xscale, 1)
                    create_particle(x, y, (4 << 0), 0)
                    sprite_index = spr_snick_roll
                    state = states.jump
                    vsp = -12
                    jumpstop = 0
                    with (check_slope(x, (y + 1)))
                    {
                        if (other.xscale == image_xscale)
                            other.vsp -= (abs(other.movespeed) / 2)
                    }
                }
            }
            if ((!grounded) && scr_check_groundpound())
            {
                if (abs(movespeed) > 12)
                {
                    sprite_index = spr_dive
                    substate = states.tumble
                    vsp = 10
                    xscale = sign(movespeed)
                    sound_play_3d("event:/sfx/pep/dive", x, y)
                }
                else
                {
                    sprite_index = spr_bodyslamstart
                    image_index = 0
                    state = states.freefall
                    pistolanim = -4
                    vsp = -6
                    dir = sign(movespeed)
                    movespeed = abs(movespeed)
                }
            }
            if (((abs(movespeed) > (12 / (scr_slope() + 1)) && sign(movespeed) == xscale) || sprite_index == spr_walljumpstart) && (!key_down) && (move == xscale || walljump_buffer > 0) && dropdash_time < 4 && (((!grounded) && (check_solid((x + movespeed), y) || scr_solid_slope((x + movespeed), y)) && (!(place_meeting((x + movespeed), y, obj_destructibles))) && ((!(place_meeting((x + movespeed), y, obj_metalblock))) || abs(movespeed) < 16)) || (grounded && (check_solid((x + movespeed), (y - 16)) || scr_solid_slope((x + movespeed), (y - 16))) && (!(place_meeting((x + movespeed), y, obj_destructibles))) && (!(place_meeting((x + movespeed), y, obj_metalblock))) && check_slope(x, (y + 1)))))
            {
                walljump_buffer = 8
                input_buffer_jump = 0
                wallspeed = abs(movespeed)
                grabclimbbuffer = 10
                state = states.climbwall
                if global.gameplay
                    vsp = (-wallspeed)
            }
            else if ((check_solid((x + movespeed), y) || scr_solid_slope((x + movespeed), y)) && ((!(place_meeting((x + movespeed), y, obj_destructibles))) || abs(movespeed) < 10) && ((!(place_meeting((x + movespeed), y, obj_ratblock))) || place_meeting((x + movespeed), y, obj_rattumble) || abs(movespeed) < 12) && ((!(place_meeting((x + movespeed), y, obj_metalblock))) || abs(movespeed) < 16))
            {
                var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
                if _bump
                {
                    if (sprite_index == spr_walljumpstart)
                    {
                        sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                        movespeed = 0
                        image_index = 0
                        state = states.bump
                        hsp = (xscale * -3)
                        vsp = -4
                        substate = states.normal
                    }
                    else
                    {
                        movespeed = 0
                        hsp = 0
                    }
                }
            }
            scr_dotaunt()
            break
        case (5 << 0):
            state = states.normal
            if (!grounded)
            {
                vsp = max(vsp, 10)
                sprite_index = spr_dive
                if (key_jump && key_down)
                {
                    sprite_index = spr_poundcancel1
                    image_index = 0
                    state = states.freefall
                    substate = states.normal
                    dir = sign(movespeed)
                    movespeed = abs(movespeed)
                    vsp = -6
                }
            }
            else
                sprite_index = spr_machroll
            if ((!key_down) && grounded)
                substate = states.normal
            if (check_solid((x + xscale), y) && (!(place_meeting((x + xscale), y, obj_unbumpablewall))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                movespeed = 0
                image_index = 0
                state = states.bump
                hsp = (xscale * -3)
                vsp = -4
                substate = states.normal
            }
            break
    }

}

function scr_player_normal() //gml_Script_scr_player_normal
{
    if (character == "S")
        state_snick_normal()
    else if (character != "M")
        state_player_normal()
    else
        state_pepperman_normal()
}

