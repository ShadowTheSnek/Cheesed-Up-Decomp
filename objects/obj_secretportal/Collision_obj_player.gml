if (active && (!instance_exists(obj_jumpscare)) && (!in_saveroom()))
{
    if (sprite_index != spr_close)
    {
        sprite_index = spr_close
        image_index = 0
        sound_play_3d((sugary ? "event:/modded/sfx/secretenterSP" : "event:/sfx/misc/secretenter"), x, y)
    }
    if death
    {
        sound_play("event:/modded/sfx/deathcollect")
        scr_sound_multiple(global.snd_collect, x, y)
        global.combotime = 60
        global.heattime = 60
        var val = heat_calculate(750)
        global.collect += val
        for (var yy = 0; yy < 4; yy++)
        {
            for (var xx = 0; xx < 4; xx++)
            {
                spr_palette = -4
                paletteselect = 0
                var spr = scr_collectspr(obj_collect, undefined, 0)
                create_collect(((x - 48) + (16 * xx)), ((y - 48) + (16 * yy)), spr, 0, spr_palette, paletteselect)
            }
        }
        gml_Script_instance_create(0, 0, obj_secretfound)
        add_saveroom()
        with (obj_deathmode)
            time_fx += 15
    }
    if ((!death) || instance_exists(obj_deathportalexit))
    {
        if (!touched)
        {
            with (obj_camera)
                lock = 1
            if secret
                notification_push((27 << 0), [room])
            else
                notification_push((26 << 0), [room, targetRoom])
            if (!secret)
            {
                obj_music.secret = 1
                obj_music.secretend = 0
            }
            else
            {
                obj_music.secretend = 1
                obj_music.secret = 0
            }
        }
        playerid = other.id
        other.ghostpepper = 0
        other.ghostdash = 0
        other.x = x
        other.y = (y - 30)
        other.vsp = 0
        other.hsp = 0
        other.cutscene = 1
        other.brick = 1
        with (obj_brickcomeback)
        {
            create_particle(x, y, (9 << 0))
            instance_destroy()
        }
        if (!touched)
        {
            other.superchargedeffectid = -4
            if (other.state != states.knightpep && other.state != states.knightpepslopes && other.state != states.knightpepbump && other.state != states.firemouth)
            {
                if (!other.isgustavo)
                    other.sprite_index = other.spr_hurt
                else
                    other.sprite_index = other.spr_ratmount_hurt
                other.image_speed = 0.35
            }
            if (other.state == states.knightpepslopes)
            {
                other.sprite_index = other.spr_knightpepfall
                other.state = states.knightpep
                other.hsp = 0
                other.vsp = 0
            }
            other.tauntstoredstate = other.state
            other.tauntstoredmovespeed = other.movespeed
            other.tauntstoredhsp = other.hsp
            other.tauntstoredvsp = other.vsp
            other.tauntstoredsprite = other.sprite_index
            other.state = (296 << 0)
        }
        with (obj_heatafterimage)
            visible = false
        instance_destroy(obj_superchargeeffect)
    }
    touched = 1
}
