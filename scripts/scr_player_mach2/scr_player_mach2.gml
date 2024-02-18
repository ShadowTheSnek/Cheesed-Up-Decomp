function scr_player_mach2() //gml_Script_scr_player_mach2
{
    var maxmovespeed = 12
    var jumpspeed = -11
    var slopeaccel = 0.1
    var slopedeccel = 0.2
    var accel = 0.1
    var mach4accel = 0.4
    var machrollvsp = 10
    if (windingAnim < 2000)
        windingAnim++
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = ((xscale * movespeed) + (railmovespeed * raildir))
    move = (key_right + key_left)
    if (ceilingrun && move != 0)
        move = xscale
    crouchslideAnim = 1
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump > 0 && can_jump && sprite_index != spr_clownjump && (!(((move == 1 && xscale == -1) || (move == -1 && xscale == 1)))))
    {
        input_buffer_jump = 0
        image_index = 0
        sprite_index = spr_secondjump1
        scr_fmod_soundeffect(jumpsnd, x, y)
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        if skateboarding
            sprite_index = spr_clownjump
        vsp = jumpspeed
        if (character == "SN")
        {
            state = (308 << 0)
            sprite_index = spr_pizzano_twirl
            vsp = -12
        }
    }
    var mortjump = 0
    if (key_jump && global.mort == 1 && sprite_index != spr_mortdoublejump && (!grounded) && (!skateboarding))
    {
        state = states.jump
        repeat (6)
            create_debris(x, y, spr_feather)
        sprite_index = spr_mortdoublejump
        image_index = 0
        grav = 0.25
        with (gml_Script_instance_create(x, y, obj_highjumpcloud2))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
        mort = 1
        mortjump = 1
    }
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4 && sprite_index != spr_player_machhit)
        {
            if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup && sprite_index != spr_suplexdash && sprite_index != spr_taunt && sprite_index != spr_Sjumpcancelstart)
                sprite_index = spr_mach
        }
        if (machpunchAnim == 1)
        {
            if (punch == 0)
                sprite_index = spr_machpunch1
            if (punch == 1)
                sprite_index = spr_machpunch2
            if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
            {
                punch = 1
                machpunchAnim = 0
            }
            if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
            {
                punch = 0
                machpunchAnim = 0
            }
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
        sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_longjump)
        sprite_index = spr_longjumpend
    if (!grounded)
        machpunchAnim = 0
    if grounded
    {
        if (scr_slope() && hsp != 0 && movespeed > 8)
            scr_player_addslopemomentum(slopeaccel, slopedeccel)
        if (movespeed < maxmovespeed)
        {
            if (mach4mode == 0)
                movespeed += accel
            else
                movespeed += mach4accel
            if (character == "N")
                movespeed += 0.1
        }
        if (abs(hsp) >= maxmovespeed && skateboarding == 0 && sprite_index != spr_suplexdash)
        {
            machhitAnim = 0
            state = states.mach3
            flash = 1
            if (sprite_index != spr_rollgetup)
                sprite_index = spr_mach4
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
    }
    if (((!grounded) && (check_solid((x + hsp), y) || scr_solid_slope((x + hsp), y)) && (!(check_slope(x, (y - 1)))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (grounded && (check_solid((x + sign(hsp)), (y - 16)) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && check_slope(x, (y + 1))))
    {
        while (!(scr_solid((x + xscale), y)))
            x += xscale
        hsp = 0
        wallspeed = movespeed
        grabclimbbuffer = 0
        if (movespeed < 1)
            wallspeed = 1
        else
            movespeed = wallspeed
        state = states.climbwall
        if global.gameplay
            vsp = (-wallspeed)
    }
    if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        wallspeed = movespeed
        grabclimbbuffer = 0
        state = states.climbwall
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (gml_Script_instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
            other.dashcloudid = id
        }
    }
    if (grounded && floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_rampjump))
        sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexdash)
        sprite_index = spr_mach
    if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_Sjumpcancelstart && sprite_index != spr_walljumpend && sprite_index != spr_longjump && sprite_index != spr_longjumpend && sprite_index != spr_playerBN_grindJump)
    {
        sprite_index = spr_secondjump1
        if skateboarding
            sprite_index = spr_clownfall
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerBN_grindJump)
        sprite_index = spr_mach2jump
    if ((!grounded) && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_clownfall
    if (key_down && (!skateboarding) && (!(place_meeting(x, y, obj_dashpad))))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        flash = 0
        state = states.tumble
        vsp = machrollvsp
        image_index = 0
        if (!grounded)
            sprite_index = spr_mach2jump
        else if (character == "P")
            sprite_index = spr_player_machroll
        else
            sprite_index = spr_machroll
    }
    if ((!key_attack) && movespeed >= 8 && grounded && vsp > 0 && skateboarding == 0)
    {
        image_index = 0
        state = states.machslide
        sound_play_3d("event:/sfx/pep/break", x, y)
        sprite_index = spr_machslidestart
    }
    else if ((!key_attack) && movespeed < 8 && grounded && vsp > 0 && skateboarding == 0)
        state = states.normal
    if (move == (-xscale) && movespeed >= 8 && grounded && vsp > 0 && skateboarding == 0)
    {
        sound_play_3d("event:/sfx/pep/machslideboost", x, y)
        image_index = 0
        state = states.machslide
        sprite_index = spr_machslideboost
    }
    else if (move == (-xscale) && movespeed < 8 && grounded && vsp > 0 && skateboarding == 0)
    {
        xscale *= -1
        movespeed = 6
    }
    if (clowntimer > 0 && skateboarding == 1)
        clowntimer--
    if (clowntimer <= 0 && skateboarding == 1)
    {
        state = states.normal
        create_particle(x, y, (9 << 0))
    }
    if (key_slap2 && character == "V")
    {
        vsp = -5
        state = states.revolver
        image_index = 0
        sprite_index = spr_playerV_airrevolver
        image_index = 0
        with (gml_Script_instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            is_solid = 0
            image_xscale = other.xscale
        }
        sound_play_3d("event:/sfx/pep/pistolshot", (x + (xscale * 20)), y)
    }
    if ((key_shoot2 || key_chainsaw2) && character == "V" && (!instance_exists(dynamite_inst)))
    {
        vsp = -5
        state = states.dynamite
        image_index = 0
        sprite_index = spr_playerV_dynamitethrow
        with (gml_Script_instance_create(x, y, obj_dynamite))
        {
            image_xscale = other.xscale
            other.dynamite_inst = id
            playerid = other.id
            movespeed = (other.movespeed + 4)
            vsp = -6
        }
    }
    if (sprite_index == spr_rollgetup || sprite_index == spr_longjumpend || sprite_index == spr_longjump || sprite_index == spr_suplexdash)
        image_speed = 0.4
    else
        image_speed = (abs(movespeed) / 15)
    scr_dotaunt()
    if (skateboarding && sprite_index != spr_clownjump && grounded)
        sprite_index = spr_clown
    if mortjump
        sprite_index = spr_player_mortjumpstart
    if (state != states.machslide && scr_solid((x + xscale), y) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || check_solid((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))) && grounded)
    {
        if skateboarding
            xscale *= -1
        else
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                sound_play_3d("event:/sfx/pep/splat", x, y)
                state = states.bump
                image_index = 0
                sprite_index = spr_wallsplat
            }
        }
    }
    if (character != "V" && character != "S")
    {
        if (!skateboarding)
        {
            if (input_buffer_shoot > 0 && shotgunAnim)
                scr_shotgunshoot()
            else if ((input_buffer_pistol > 0 && global.pistol) || (global.shootstyle == 1 && key_shoot2))
                scr_pistolshoot(states.mach2)
            else if key_shoot2
                scr_perform_move((2 << 0), (104 << 0))
        }
        if (input_buffer_grab > 0 && (!key_up) && (!skateboarding) && ((shotgunAnim == 0 && (!global.pistol)) || global.shootbutton == 1 || (global.shootbutton == 2 && (!global.pistol))) && ((!suplexmove) || character != "SP"))
        {
            input_buffer_slap = 0
            input_buffer_grab = 0
            sprite_index = (shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash)
            suplexmove = 1
            fmod_event_instance_play(suplexdashsnd)
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            state = states.handstandjump
            if (movespeed < 5)
                movespeed = 5
            image_index = 0
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
            scr_perform_move((0 << 0), (104 << 0))
        }
    }
    if (state != states.mach2 && fmod_event_instance_is_playing(rollgetupsnd))
        fmod_event_instance_stop(rollgetupsnd, 1)
}

