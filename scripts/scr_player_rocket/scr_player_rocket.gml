function scr_player_rocket() //gml_Script_scr_player_rocket
{
    var rocketstart = spr_rocketstart
    var rocket = spr_rocket
    var rocketslide = spr_rocketslide
    var rocketrun = spr_rocketrun
    if global.SUGARY
    {
        rocketstart = spr_rocketbottle_start
        rocket = spr_rocketbottle
        rocketslide = spr_rocketbottle_turn
        rocketrun = spr_rocketbottle_ground
    }
    hsp = (xscale * movespeed)
    move = (key_right + key_left)
    with (instance_place((x + hsp), y, obj_asteroid))
        instance_destroy()
    alarm[5] = -1
    alarm[8] = 60
    alarm[7] = 120
    hurted = 1
    if (sprite_index != rocketstart)
    {
        var _spd = 6
        var _accel = 1
        if (key_up && (!key_down))
            rocketvsp = Approach(rocketvsp, (-_spd), _accel)
        else if (key_down && (!key_up))
            rocketvsp = Approach(rocketvsp, _spd, _accel)
        else
            rocketvsp = Approach(rocketvsp, 0, _accel)
        vsp = rocketvsp
        if (move == xscale)
            movespeed = Approach(movespeed, 16, 0.15)
        else if (movespeed > 12)
            movespeed = Approach(movespeed, 12, 0.15)
    }
    else
    {
        rocketvsp = 0
        vsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = rocket
            image_index = 0
            movespeed = 12
        }
    }
    if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        dir = xscale
        state = states.mach2
        sprite_index = spr_mach2jump
        if isgustavo
        {
            state = states.ratmount
            ratmount_movespeed = abs(movespeed)
            movespeed = (ratmount_movespeed * xscale)
        }
        jumpstop = 0
        vsp = -11
        particle_set_scale((5 << 0), (global.gameplay ? xscale : 1), 1)
        create_particle(x, y, (5 << 0))
        with (gml_Script_instance_create(x, (y + 12), obj_rocketdead))
        {
            hsp = (other.xscale * 6)
            vsp = 5
            image_xscale = sign(hsp)
        }
    }
    if (fightball == 0)
    {
        if (sprite_index != rocketstart)
        {
            sprite_index = rocket
            if (grounded && vsp >= 0)
                sprite_index = rocketrun
        }
    }
    if grounded
    {
        move = (key_left + key_right)
        if (move != 0 && move != xscale && sprite_index != rocketstart && state != states.mach2)
        {
            state = states.rocketslide
            sound_play_3d("event:/sfx/pep/machslideboost", x, y)
            sprite_index = rocketslide
            image_index = 0
        }
    }
    if (scr_solid((x + sign(hsp)), y) && ((!(check_slope((x + sign(hsp)), y))) || check_solid((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && ((!(place_meeting((x + sign(hsp)), y, obj_ratblock))) || place_meeting((x + sign(hsp)), y, obj_rattumble)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_hungrypillar))))
    {
        pizzapepper = 0
        sprite_index = spr_rockethitwall
        sound_play_3d("event:/sfx/pep/groundpound", x, y)
        sound_play_3d("event:/sfx/pep/bumpwall", x, y)
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = (40 / room_speed)
        }
        hsp = 0
        image_speed = 0.35
        with (obj_baddie)
        {
            if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
            {
                stun = 1
                alarm[0] = 200
                ministun = 0
                vsp = -5
                hsp = 0
            }
        }
        flash = 0
        state = states.bump
        hsp = (-3.5 * xscale)
        vsp = -6
        mach2 = 0
        image_index = 0
        gml_Script_instance_create((x - 10), (y + 10), obj_bumpeffect)
        gml_Script_instance_create(x, y, obj_playerexplosion)
    }
    if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
    {
        with (gml_Script_instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                gml_Script_instance_create(obj_player.x, obj_player.y, obj_slapstar)
            image_xscale = other.xscale
            image_yscale = other.yscale
            other.dashcloudid = id
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
    {
        with (gml_Script_instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                gml_Script_instance_create(obj_player.x, obj_player.y, obj_slapstar)
            image_xscale = other.xscale
            image_yscale = other.yscale
            sprite_index = spr_watereffect
            other.dashcloudid = id
        }
    }
    if (sprite_index != rocketstart && (!instance_exists(chargeeffectid)))
    {
        with (gml_Script_instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
    }
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4
    if (sprite_index == spr_crazyrun)
        image_speed = 0.75
    if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4
    else
        image_speed = 0.4
    if (steppybuffer > 0)
        steppybuffer--
    else if ((collision_flags & (1 << 0)) <= 0)
    {
        create_particle(x, (y + random_range(10, 20)), (1 << 0), 0)
        steppybuffer = 8
    }
}

