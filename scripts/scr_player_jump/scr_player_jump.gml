function state_player_jump() //gml_Script_state_player_jump
{
    var maxmovespeed = 8
    var maxmovespeed2 = 6
    var turnmovespeed = 2
    var accel = 0.5
    var deccel = 0.1
    var jumpspeed = -11
    var machspeed = 6
    landAnim = 1
    if (!momemtum)
        hsp = (move * movespeed)
    else
        hsp = (xscale * movespeed)
    hsp += (railmovespeed * raildir)
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffer = 0
    }
    if (dir != xscale)
    {
        dir = xscale
        movespeed = turnmovespeed
        facehurt = 0
    }
    if (move != xscale)
        movespeed = turnmovespeed
    move = (key_left + key_right)
    if (movespeed == 0)
        momemtum = 0
    if scr_solid((x + hsp), y)
    {
        movespeed = 0
        mach2 = 0
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed < maxmovespeed)
            movespeed += accel
        else if (floor(movespeed) == maxmovespeed)
            movespeed = maxmovespeed2
        if (scr_solid((x + xscale), y) && move == xscale)
            movespeed = 0
    }
    else
        movespeed = 0
    if (movespeed > maxmovespeed)
        movespeed -= deccel
    if (ladderbuffer > 0)
        ladderbuffer--
    if (!jumpstop)
    {
        if ((!key_jump2) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 20
            jumpstop = 1
        }
        else if (scr_solid(x, (y - 1)) && (!jumpAnim))
        {
            vsp = grav
            jumpstop = 1
        }
    }
    if (key_jump && wallclingcooldown == 10)
    {
        if (check_solid((x + xscale), y) && character == "N")
        {
            sound_play_3d("event:/sfx/pep/step", x, y)
            sprite_index = spr_playerN_wallclingstart
            image_index = 0
            state = states.hang
            xscale *= -1
            vsp = 0
            doublejump = 0
        }
        else if ((!doublejump) && sprite_index != spr_freefall && sprite_index != spr_facestomp && (character == "N" || character == "SN"))
        {
            if (character == "SN")
            {
                sound_play_3d("event:/sfx/pep/jump", x, y)
                sprite_index = spr_pizzano_doublejump
                vsp = -10
            }
            else
            {
                sound_play_3d("event:/modded/sfx/woosh", x, y)
                sprite_index = spr_playerN_doublejump
                vsp = -9
                jumpAnim = 1
            }
            image_index = 0
            jumpstop = 0
            doublejump = 1
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
        }
    }
    if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
    {
        if (vsp > 6)
            vsp = 6
        if (!key_jump2)
        {
            grav = 0.5
            sprite_index = spr_fall
        }
    }
    if key_jump
    {
        if (global.mort && sprite_index != spr_mortdoublejump)
        {
            repeat (6)
                create_debris(x, y, spr_feather)
            sprite_index = spr_mortdoublejump
            image_index = 0
            jumpstop = 0
            grav = 0.25
            mort = 1
        }
    }
    if (can_jump && input_buffer_jump > 0 && (((!key_down) && (!key_attack)) || character == "S") && vsp > 0 && (!((sprite_index == spr_facestomp || sprite_index == spr_freefall))))
    {
        input_buffer_jump = 0
        scr_fmod_soundeffect(jumpsnd, x, y)
        stompAnim = 0
        vsp = jumpspeed
        state = states.jump
        jumpAnim = 1
        jumpstop = 0
        freefallstart = 0
        railmomentum = 0
        if place_meeting(x, (y + 1), obj_railparent)
            railmomentum = 1
        if (sprite_index != spr_shotgunshoot)
        {
            sprite_index = spr_jump
            if shotgunAnim
                sprite_index = spr_shotgunjump
            if global.pistol
                sprite_index = spr_player_pistoljump1
            image_index = 0
        }
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    if (grounded && vsp > 0)
    {
        if (vsp > 0 && ((!key_attack) || sprite_index == spr_suplexbump || character == "S"))
        {
            sound_play_3d("event:/sfx/pep/step", x, y)
            if (key_attack || sprite_index == spr_shotgunshoot)
                landAnim = 0
            if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
                sprite_index = spr_player_mortland
            if (sprite_index != spr_shotgunshoot)
                image_index = 0
            if global.pistol
                sprite_index = spr_player_pistolland
            input_buffer_secondjump = 0
            state = states.normal
            jumpAnim = 1
            jumpstop = 0
            freefallstart = 0
            create_particle(x, y, (12 << 0), 0)
        }
    }
    if (vsp > 5 && sprite_index != spr_mortdoublejump)
        fallinganimation++
    if (fallinganimation >= 40 && fallinganimation < 80)
        sprite_index = spr_facestomp
    else if (fallinganimation >= 80)
        sprite_index = spr_freefall
    if (!stompAnim)
    {
        if (!jumpAnim)
        {
            switch sprite_index
            {
                case spr_mortdoublejumpstart:
                    sprite_index = spr_mortdoublejump
                    break
                case spr_playerN_doublejump:
                    sprite_index = spr_playerN_doublejumpfall
                    break
                case spr_airdash1:
                    sprite_index = spr_airdash2
                    break
                case spr_player_pistolshot:
                    sprite_index = spr_player_pistoljump2
                    break
                case spr_shotgunjump:
                    sprite_index = spr_shotgunfall
                    break
                case spr_playerV_superjump:
                    sprite_index = spr_playerV_fall
                    break
                case spr_jump:
                    sprite_index = spr_fall
                    break
                case spr_player_pistoljump1:
                    sprite_index = spr_player_pistoljump2
                    break
                case spr_suplexcancel:
                    sprite_index = spr_fall
                    break
                case spr_player_backflip:
                case spr_playerN_suplexland:
                    sprite_index = spr_fall
                    break
                case spr_player_Sjumpstart:
                    sprite_index = spr_player_Sjump
                    break
                case spr_player_shotgunjump1:
                    sprite_index = spr_player_shotgunjump2
                    break
                case spr_shotgun_shootair:
                    sprite_index = spr_shotgunfall
                    break
                case spr_shotgunshoot:
                    sprite_index = spr_shotgunfall
                    break
                case spr_stompprep:
                    sprite_index = spr_stomp
                    break
                case spr_groundpoundjump:
                    sprite_index = spr_fall
                    break
                case spr_player_candytransitionup:
                    sprite_index = spr_player_candyup
                    break
            }

        }
    }
    else if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_stomp
    if (scr_check_groundpound() && (!global.kungfu))
    {
        input_buffer_slap = 0
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart
            image_index = 0
            state = states.freefall
            pistolanim = -4
            vsp = -6
        }
        else
        {
            sound_play_3d("event:/sfx/enemies/killingblow", x, y)
            sprite_index = spr_shotgunjump1
            image_index = 0
            state = states.freefall
            vsp = -11
            with (gml_Script_instance_create(x, y, obj_shotgunblast))
            {
                sprite_index = spr_shotgunblastdown
                with (bulletID)
                {
                    sprite_index = other.sprite_index
                    mask_index = other.mask_index
                }
            }
        }
    }
    if (sprite_index == spr_player_suplexcancel || (sprite_index == sprite_index) == spr_playerN_noisebombspinjump)
        image_speed = 0.4
    else
        image_speed = 0.35
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        sound_play_3d("event:/sfx/pep/groundpound", x, y)
        image_index = 0
        sprite_index = spr_bodyslamland
        if (character == "SP")
            sprite_index = spr_playerSP_freefallland
        state = states.freefallland
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
    }
    if (character != "V" && character != "S")
    {
        if (input_buffer_shoot > 0 && shotgunAnim)
            scr_shotgunshoot()
        else if ((input_buffer_pistol > 0 && global.pistol) || (global.shootstyle == 1 && key_shoot2))
            scr_pistolshoot(states.jump)
        else if key_shoot2
            scr_perform_move((2 << 0), (92 << 0))
        if (input_buffer_grab > 0 && (!key_up) && sprite_index != spr_suplexbump && ((shotgunAnim == 0 && (!global.pistol)) || global.shootbutton == 1 || (global.shootbutton == 2 && (!global.pistol))) && ((!suplexmove) || character != "SP"))
        {
            input_buffer_slap = 0
            input_buffer_grab = 0
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            image_index = 0
            sprite_index = spr_suplexdashjumpstart
            if (character == "SP")
                sprite_index = spr_suplexdash
            suplexmove = 1
            fmod_event_instance_play(suplexdashsnd)
            state = states.handstandjump
            movespeed = 5
        }
        else if ((input_buffer_slap > 0 || input_buffer_grab > 0) && key_up && ((shotgunAnim == 0 && (!global.pistol)) || global.shootbutton == 1 || (global.shootbutton == 2 && (!global.pistol))))
        {
            input_buffer_slap = 0
            input_buffer_grab = 0
            state = states.punch
            image_index = 0
            sprite_index = spr_breakdanceuppercut
            fmod_event_instance_play(snd_uppercut)
            vsp = -10
            movespeed = hsp
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
        }
        else if (input_buffer_slap > 0 && (!key_up) && (!suplexmove) && ((shotgunAnim == 0 && (!global.pistol)) || global.shootbutton == 1 || (global.shootbutton == 2 && (!global.pistol))))
        {
            input_buffer_slap = 0
            scr_perform_move((0 << 0), (92 << 0))
        }
    }
    switch character
    {
        case "V":
            if (key_attack && grounded && fallinganimation < 40)
            {
                sprite_index = spr_mach1
                image_index = 0
                state = states.mach2
                if (movespeed < machspeed)
                    movespeed = machspeed
            }
            if ((key_chainsaw2 || key_shoot2) && (!instance_exists(dynamite_inst)))
            {
                sprite_index = spr_playerV_dynamitethrow
                image_index = 0
                if (move == 0)
                    movespeed = 0
                state = states.dynamite
                with (gml_Script_instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale
                    other.dynamite_inst = id
                    playerid = other.id
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
                }
            }
            if (sprite_index == spr_playerV_superjump && floor(image_index) == (image_number - 1))
                create_particle(x, (y + 25), (7 << 0), 0)
            if key_slap2
            {
                sprite_index = spr_playerV_airrevolver
                image_index = 0
                vsp = -5
                state = states.revolver
                with (gml_Script_instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
                {
                    is_solid = 0
                    image_xscale = other.xscale
                }
                sound_play_3d("event:/sfx/pep/pistolshot", (x + (xscale * 20)), y)
            }
            break
        case "S":
            break
        default:
            if (character != "N" || noisetype == 0)
            {
                if (key_attack && grounded && fallinganimation < 40)
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    state = states.mach2
                    if (movespeed < machspeed)
                        movespeed = machspeed
                }
            }
            else
            {
                if (key_attack2 && (pogochargeactive || pizzapepper > 0))
                {
                    sprite_index = ((!key_up) ? spr_playerN_jetpackstart : spr_superjumpprep)
                    sound_play_3d("event:/sfx/noise/woag", x, y)
                    jetpackcancel = 1
                    if (sprite_index == spr_playerN_jetpackstart && global.gameplay)
                        sound_play_3d("event:/sfx/noise/jetpackstart", x, y)
                    image_index = 0
                    hsp = 0
                    vsp = 0
                    state = states.Sjumpprep
                }
                if (key_attack && (!pogochargeactive) && (!key_slap2) && pizzapepper == 0)
                {
                    sprite_index = spr_playerN_pogostart
                    image_index = 0
                    state = states.pogo
                }
            }
            break
    }

    if ((!key_attack) || move != xscale)
        mach2 = 0
    if (floor(image_index) == (image_number - 1))
        jumpAnim = 0
    scr_dotaunt()
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0
        machslideAnim = 0
        image_speed = 0.45
        if (image_index > (image_number - 1))
            sprite_index = spr_shotgunfall
    }
    if check_solid(x, y)
    {
        state = states.crouch
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
}

function state_pepperman_jump() //gml_Script_state_pepperman_jump
{
    pepperman_grab_reset()
    move = (key_left + key_right)
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel_air
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel_air
    else if (move == 0)
        movespeed -= pepperman_deccel_air
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3
    else if (movespeed < 0)
        movespeed = 0
    if (move != 0 && movespeed == 0)
        xscale = move
    hsp = (xscale * movespeed)
    if (sprite_index == spr_jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_fall
    if (sprite_index == spr_player_pistoljump1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_pistoljump2
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
    {
        state = states.normal
        gml_Script_instance_create(x, (y - 5), obj_landcloud)
    }
    if (scr_check_groundpound() && (!grounded))
    {
        state = states.freefall
        freefallsmash = 12
        vsp = 14
        sprite_index = spr_bodyslamfall
    }
    if (key_attack && ((!(check_solid((x + xscale), y))) || place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move
        state = states.shoulderbash
        sprite_index = spr_pepperman_shoulderstart
        image_index = 0
    }
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_fall
    if (ladderbuffer > 0)
        ladderbuffer--
    if key_taunt2
    {
        sound_play_3d("event:/sfx/pep/taunt", x, y)
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredvsp = vsp
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        state = states.backbreaker
        if (supercharged == 1)
        {
            image_index = 0
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
        }
        else
        {
            taunttimer = 20
            image_index = random_range(0, 11)
            sprite_index = spr_taunt
        }
        with (gml_Script_instance_create(x, y, obj_taunteffect))
            player = other.id
    }
}

function state_snick_jump() //gml_Script_state_snick_jump
{
    state_snick_normal()
}

function scr_player_jump() //gml_Script_scr_player_jump
{
    if (character == "S")
        state_snick_jump()
    else if (character != "M")
        state_player_jump()
    else
        state_pepperman_jump()
}
