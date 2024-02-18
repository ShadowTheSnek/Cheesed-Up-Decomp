function scr_player_Sjump() //gml_Script_scr_player_Sjump
{
    move = (key_right + key_left)
    hsp = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    superjumped = 1
    var vigilante = (character == "V" && substate != states.Sjump && global.vigisuperjump != 2)
    if (sprite_index == spr_superjump)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), (1 << 0), 0)
            steppybuffer = 8
        }
        if (global.afterimage == 1)
        {
            if (punch_afterimage > 0 && global.gameplay)
                punch_afterimage--
            else
            {
                punch_afterimage = 5
                with (create_blue_afterimage(x, y, sprite_index, image_index, xscale))
                {
                    playerid = other.id
                    maxmovespeed = 6
                }
            }
        }
        if (piledrivereffect > 0)
            piledrivereffect--
        else
        {
            with (gml_Script_instance_create(x, y, obj_parryeffect))
            {
                sprite_index = spr_piledrivereffect
                image_yscale = -1
            }
            piledrivereffect = 15
        }
    }
    if ((sprite_index == spr_superjump && (!vigilante)) || sprite_index == spr_superspringplayer)
        vsp = sjumpvsp
    sjumpvsp -= 0.1
    if (vigilante && image_index > 3)
        vsp = -11
    if ((!vigilante) && image_index >= 8 && sprite_index == spr_playerV_superjump)
        image_index = 5
    if (sprite_index == spr_player_supersidejump)
    {
        if (a < 25)
            a++
        hsp = (xscale * a)
        vsp = 0
    }
    if (scr_solid_player(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
    {
        var mb = instance_place(x, (y - 1), obj_metalblock)
        if ((!mb) || (!global.SUGARY))
        {
            pizzapepper = 0
            a = 0
            if (sprite_index == spr_player_supersidejump)
                sprite_index = spr_player_supersidejumpland
            if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
                sprite_index = spr_superjumpland
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            with (obj_baddie)
            {
                if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
                {
                    image_index = 0
                    if grounded
                        vsp = -7
                }
            }
            sound_play_3d("event:/sfx/pep/groundpound", x, y)
            image_index = 0
            state = states.Sjumpland
            machhitAnim = 0
        }
    }
    else if ((key_attack2 || input_buffer_slap > 0 || input_buffer_grab > 0) && (!vigilante) && character != "S" && (sprite_index != spr_superspringplayer || global.SUGARY) && sprite_index != spr_Sjumpcancelstart)
    {
        image_index = 0
        sprite_index = spr_Sjumpcancelstart
        sound_instance_move(sjumpcancelsnd, x, y)
        if (character == "N")
        {
            sound_play_3d("event:/sfx/noise/woag", x, y)
            fmod_event_instance_play(sjumpcancelsnd)
        }
        else
            fmod_event_instance_play(sjumpcancelsnd)
        if (character == "SN")
            jetpackcancel = 1
        input_buffer_slap = 0
    }
    if (character == "S" && sprite_index == spr_superjump && (key_attack2 || input_buffer_slap > 0 || input_buffer_grab > 0))
    {
        if (move != 0)
            xscale = sign(move)
        state = states.jump
        movespeed = (12 * xscale)
        if (!key_jump2)
            vsp = -4
        jumpstop = 0
        sprite_index = spr_walljumpstart
        sound_play_3d("event:/modded/sfx/kungfu", x, y)
    }
    if (sprite_index == spr_Sjumpcancelstart)
    {
        vsp = 0
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            jumpstop = 1
            if (!jetpackcancel)
                vsp = -4
            flash = 1
            movespeed = 13
            image_index = 0
            sprite_index = spr_Sjumpcancel
            state = states.mach3
            with (gml_Script_instance_create(x, y, obj_crazyrunothereffect))
            {
                image_xscale = other.xscale
                image_yscale = other.yscale
            }
        }
    }
    if (character == "N" && noisetype == 1 && sprite_index == spr_superjump)
    {
        if key_jump2
        {
            jumpstop = 0
            vsp = -15
            state = states.jump
            sprite_index = spr_playerN_noisebombspinjump
            image_index = 0
            with (gml_Script_instance_create(x, y, obj_jumpdust))
            {
                image_xscale = other.xscale
                image_yscale = other.yscale
            }
        }
        else
        {
            if (move == 1)
                hsp = 3
            if (move == -1)
                hsp = -3
        }
    }
    if (character == "SN")
    {
        if (move != 0)
            xscale = move
        jetpackcancel = 1
    }
    if (vigilante && floor(image_index) == (image_number - 1) && sprite_index != spr_superspringplayer)
    {
        state = states.jump
        sprite_index = spr_fall
    }
    if (state != states.Sjump)
        substate = states.normal
    image_speed = 0.5
    scr_collide_player()
}

