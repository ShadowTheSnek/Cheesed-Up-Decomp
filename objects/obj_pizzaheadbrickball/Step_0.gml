if (!instance_exists(obj_pizzafaceboss_p2))
{
    instance_destroy()
    return;
}
switch state
{
    case states.normal:
        hsp = (image_xscale * movespeed)
        if (scr_solid(x, (y + 1)) && vsp > 0)
        {
            sound_play_3d("event:/sfx/pep/groundpound", x, y)
            vsp = -14
            create_particle(x, (y + 3), (14 << 0), 0)
        }
        if scr_solid((x + image_xscale), y)
        {
            sound_play_3d("event:/sfx/pep/groundpound", x, y)
            gml_Script_instance_create(x, y, obj_bangeffect)
            sprite_index = spr_lonebrick_hurt
            cbspeed = 0
            state = states.transitioncutscene
            comeback = 0
            vsp = -5
            hsp = ((-image_xscale) * 4)
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            alarm[0] = 25
        }
        scr_collide()
        break
    case (8 << 0):
        if (!comeback)
        {
            x += hsp
            y += vsp
            if (vsp < 20)
                vsp += grav
        }
        else
        {
            depth = -99
            x = Approach(x, obj_pizzafaceboss_p2.x, cbspeed)
            y = Approach(y, obj_pizzafaceboss_p2.y, cbspeed)
            cbspeed = Approach(cbspeed, 20, 1)
        }
        break
}

