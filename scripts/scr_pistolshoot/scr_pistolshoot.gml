function scr_pistolshoot(argument0) //gml_Script_scr_pistolshoot
{
    if ((pistolcooldown <= 0 && state == argument0 && state != states.bump && instance_number(obj_pistolbullet) < 3) || pistolchargeshooting == 1)
    {
        if (!global.pistol)
        {
            if (floor(global.bullet) == 0 || instance_exists(obj_bosscontroller))
                return;
        }
        input_buffer_shoot = 0
        input_buffer_pistol = 0
        pistolanim = spr_pistolshot
        pistolindex = 0
        pistolcooldown = 10
        machslideAnim = 0
        landAnim = 0
        jumpAnim = 0
        crouchslideAnim = 0
        crouchAnim = 0
        stompAnim = 0
        if (argument0 == (121 << 0) || argument0 == (104 << 0))
            state = states.normal
        windingAnim = 0
        with (gml_Script_instance_create((x + (xscale * 35)), y, obj_parryeffect))
        {
            if other.pistolchargeshooting
                sprite_index = spr_giantpistoleffect
            else
                sprite_index = spr_player_pistoleffect
            image_xscale = other.xscale
            image_speed = 0.4
        }
        if (!pistolchargeshooting)
            sound_play_3d("event:/sfx/pep/pistolshot", (x + (xscale * 20)), y)
        else
            sound_play_3d("event:/sfx/pep/revolverBIGshot", (x + (xscale * 20)), y)
        var bullet = gml_Script_instance_create((x + (xscale * 20)), y, obj_pistolbullet)
        with (bullet)
        {
            image_xscale = other.xscale
            if other.pistolchargeshooting
            {
                GamepadSetVibration(0, 1, 1, 0.8)
                sprite_index = spr_peppinobulletGIANT
                x += 25
            }
            else
                GamepadSetVibration(0, 0.3, 0.3, 0.6)
        }
        if (!global.pistol)
        {
            pistolcooldown = 20
            pistol = 1
            global.bullet = floor((global.bullet - 1))
            bullet.april = 1
            sound_play_3d("event:/sfx/enemies/killingblow", x, y)
            if (global.hud == 1)
            {
                with (obj_tv)
                {
                    alarm[0] = 100
                    tvsprite = spr_tvrevolver
                    image_index = 0
                    image_speed = 0.35
                }
            }
        }
    }
}

