var t = id
with (other)
{
    if (state != states.gotoplayer && state != states.ghost && state != states.actor)
    {
        if (boxxed == 0 && isgustavo == 0 && other.buffer == 0)
        {
            if (state == states.trashjump || state == (209 << 0))
                create_debris(x, y, spr_player_trashlid)
            if (state == states.animatronic)
            {
                var i = 0
                repeat (3)
                {
                    with (create_debris(x, y, spr_animatronicdebris))
                        image_index = i
                    i++
                }
            }
            var changecoord = 1
            if place_meeting(x, y, obj_superspring)
                changecoord = 0
            if changecoord
            {
                if other.sugary
                {
                    i = 1
                    while (i < 200)
                    {
                        if scr_solid(x, (y + i))
                        {
                            y += (i - 1)
                            break
                        }
                        else
                        {
                            i++
                            continue
                        }
                    }
                }
                else
                    y = (other.y - 14)
            }
            vsp = 0
            create_particle(x, y, (5 << 0), 0)
            if (character != "V")
            {
                if (sprite_index != spr_dashpadmach)
                {
                    sprite_index = spr_dashpadmach
                    image_index = 0
                }
            }
            else if (sprite_index != spr_crazyrun)
            {
                sprite_index = spr_crazyrun
                image_index = 0
            }
            scr_fmod_soundeffect(snd_dashpad, x, y)
            machhitAnim = 0
            state = states.mach3
            xscale = sign(other.image_xscale)
            dir = xscale
            if (movespeed < 14)
            {
                movespeed = 14
                hsp = (xscale * movespeed)
            }
            else
            {
                movespeed += 0.5
                hsp = (xscale * movespeed)
            }
            other.buffer = 30
        }
        else
        {
            if (boxxed && other.buffer == 0)
            {
                changecoord = 1
                if place_meeting(x, y, obj_superspring)
                    changecoord = 0
                if changecoord
                    y = (other.y - 14)
                vsp = 0
                create_particle(x, y, (5 << 0), 0)
                scr_fmod_soundeffect(global.snd_ventilator, x, y)
                xscale = sign(other.image_xscale)
                dir = xscale
                boxxeddash = 1
                if (abs(movespeed) < 14)
                    movespeed = (xscale * 14)
                else
                    movespeed += (xscale * 0.5)
                sprite_index = spr_boxxedpepwalk
                boxxeddashbuffer = 40
                state = states.boxxedpep
                other.buffer = 30
            }
            if (isgustavo && other.buffer == 0 && gusdashpadbuffer == 0)
            {
                sound_play_3d("event:/sfx/misc/dashpad", x, y)
                changecoord = 1
                if place_meeting(x, y, obj_superspring)
                    changecoord = 0
                if changecoord
                    y = (other.y - 14)
                vsp = 0
                create_particle(x, y, (5 << 0), 0)
                xscale = sign(other.image_xscale)
                dir = xscale
                particle_set_scale((2 << 0), t.image_xscale, 1)
                create_particle(x, y, (2 << 0))
                with (gml_Script_instance_create(x, y, obj_superdashcloud))
                    image_xscale = t.image_xscale
                other.buffer = 30
                ratmount_movespeed = max((ratmount_movespeed + 0.5), 12)
                movespeed = (ratmount_movespeed * xscale)
                gustavodash = 51
                state = states.ratmount
                if (!check_char("G"))
                    gusdashpadbuffer = 25
            }
        }
    }
}
