function scr_player_ratmountskid() //gml_Script_scr_player_ratmountskid
{
    hsp = (xscale * (-movespeed))
    movespeed = Approach(movespeed, 0, 0.8)
    if brick
        sprite_index = spr_ratmountskid
    else
        sprite_index = spr_lonegustavoskid
    gustavodash = 0
    ratmount_movespeed = 8
    image_speed = 0.4
    if (abs(movespeed) <= 0 || abs(hsp) <= 0)
    {
        movespeed = 0
        state = states.ratmount
    }
    if (input_buffer_jump > 0 && can_jump && sprite_index != spr_ratmount_swallow)
    {
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        sound_play_3d("event:/sfx/pep/jump", x, y)
        if brick
            sprite_index = spr_ratmount_jump
        else if (ratmount_movespeed >= 12)
            sprite_index = spr_lonegustavodashjump
        else
            sprite_index = spr_ratmount_groundpound
        image_index = 0
        if (state != states.ratmount)
            xscale *= -1
        input_buffer_jump = 0
        movespeed = hsp
        jumpAnim = 1
        state = states.ratmountjump
        vsp = -11
        jumpstop = 0
    }
    if ((scr_slapbuffercheck() || key_shoot2) && brick)
    {
        scr_resetslapbuffer()
        ratmount_kickbrick()
        movespeed = (-movespeed)
        hsp = movespeed
        ratmount_movespeed = 8
    }
    if (scr_slapbuffercheck() && (!key_up))
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        scr_resetslapbuffer()
        if (brick == 1)
        {
            with (gml_Script_instance_create(x, y, obj_brickcomeback))
                wait = 1
        }
        brick = 0
        movespeed = (-movespeed)
        ratmountpunchtimer = 25
        gustavohitwall = 0
        state = states.ratmountpunch
        image_index = 0
        if (move != 0)
            xscale = move
        movespeed = (xscale * 12)
        sprite_index = spr_lonegustavopunch
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
}

