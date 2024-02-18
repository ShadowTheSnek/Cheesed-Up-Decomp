function scr_player_mach1() //gml_Script_scr_player_mach1
{
    image_speed = 0.5
    landAnim = 0
    machhitAnim = 0
    crouchslideAnim = 1
    dir = xscale
    move = (key_left + key_right)
    if (scr_solid((x + xscale), y) && ((!(check_slope((x + xscale), y))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        mach2 = 0
        state = states.normal
        movespeed = 0
    }
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    if (xscale != move && move != 0)
    {
        sprite_index = spr_mach1
        image_index = 0
        momemtum = 0
        mach2 = 0
        movespeed = 6
        xscale = move
    }
    if grounded
    {
        if (movespeed <= 8)
            movespeed += 0.075
        if (movespeed >= 8)
        {
            state = states.mach2
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
        if (vsp > 0)
            jumpstop = 0
        if (!instance_exists(dashcloudid))
        {
            with (gml_Script_instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale
                other.dashcloudid = id
            }
        }
        if (sprite_index != spr_mach1 && vsp > 0)
        {
            sprite_index = spr_mach1
            image_index = 0
        }
        if (input_buffer_jump > 0)
        {
            input_buffer_jump = 0
            sprite_index = spr_airdash1
            image_index = 0
            dir = xscale
            momemtum = 1
            vsp = -11
            jumpAnim = 1
        }
    }
    else if (sprite_index != spr_airdash1)
        sprite_index = spr_airdash2
    if (sprite_index == spr_airdash1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_airdash2
    if (!key_attack)
    {
        state = states.normal
        image_index = 0
    }
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (check_solid((x + xscale), y) && (!(check_slope((x + sign(hsp)), y))))
    {
        movespeed = 0
        state = states.normal
    }
    switch character
    {
        case "V":
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
            if ((key_shoot2 || key_chainsaw2) && (!instance_exists(dynamite_inst)))
            {
                image_index = 0
                sprite_index = spr_playerV_dynamitethrow
                vsp = -5
                state = states.dynamite
                with (gml_Script_instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale
                    movespeed = (other.movespeed + 4)
                    vsp = -6
                    other.dynamite_inst = id
                    playerid = other.id
                }
            }
            break
    }

    if (scr_check_groundpound() && (!grounded))
    {
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart
            image_index = 0
            state = states.freefallprep
            vsp = -5
        }
        else
        {
            sprite_index = spr_player_shotgunjump1
            image_index = 0
            state = states.freefallprep
            vsp = -5
            with (gml_Script_instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
            {
                sprite_index = spr_shotgunbulletdown
                spdh = -10
                spd = 0
            }
            with (gml_Script_instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
            {
                sprite_index = spr_shotgunbulletdown
                spdh = -10
                spd = 5
            }
            with (gml_Script_instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
            {
                sprite_index = spr_shotgunbulletdown
                spdh = -10
                spd = -5
            }
        }
    }
    scr_dotaunt()
}

