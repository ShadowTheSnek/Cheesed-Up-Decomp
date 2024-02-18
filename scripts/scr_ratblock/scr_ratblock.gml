function scr_ratblock_destroy() //gml_Script_scr_ratblock_destroy
{
    with (instance_place(x, y, obj_canonexplosion))
    {
        instance_destroy(other)
        if baddie
            notification_push((34 << 0), [room])
    }
    with (obj_player)
    {
        if ((other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big) && sprite_index == spr_tumble && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other)))
            instance_destroy(other)
        if (state != states.mort && state != states.bombgrab && ((!scr_transformationcheck()) || state == states.barrel || (character == "S" && abs(movespeed) > 12) || state == states.ratmountbounce) && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other) || place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other)))
        {
            switch state
            {
                case states.barrel:
                    if (!(place_meeting(x, (y - 12), other)))
                        instance_destroy(other)
                    break
                case (34 << 0):
                    vsp = -6
                    instance_destroy(other)
                    break
                case (51 << 0):
                    if (sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro)
                    {
                        gml_Script_instance_create(x, y, obj_bombexplosion)
                        instance_destroy(other)
                        GamepadSetVibration(0, 1, 1, 0.9)
                        hurted = 1
                        vsp = -4
                        image_index = 0
                        sprite_index = spr_bombpepend
                        state = states.bombpep
                        bombpeptimer = 0
                    }
                    break
                case (186 << 0):
                case (150 << 0):
                case (146 << 0):
                case (33 << 0):
                case (11 << 0):
                case (14 << 0):
                case (12 << 0):
                case (35 << 0):
                case (47 << 0):
                case (49 << 0):
                    break
                case (304 << 0):
                    if (sprite_index == spr_cotton_attack || movespeed > 8)
                        instance_destroy(other)
                    break
                case (306 << 0):
                    if (movespeed >= 8)
                        instance_destroy(other)
                    break
                case (198 << 0):
                    if place_meeting(x, ((y + vsp) + 1), other)
                        instance_destroy(other)
                    break
                case (5 << 0):
                    if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
                        instance_destroy(other)
                    break
                default:
                    if (other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big)
                        instance_destroy(other)
                    break
            }

        }
    }
}

