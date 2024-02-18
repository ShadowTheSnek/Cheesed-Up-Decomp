for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        for (var l = 0; l < array_length(alarm); l++)
        {
            if (alarm[l] >= 0)
                alarm[l]--
        }
        switch identifier
        {
            case (1 << 0):
                if ((!((playerid.state == states.jump && playerid.sprite_index == spr_playerN_noisebombspinjump))) && playerid.pizzapepper == 0 && playerid.state != states.Sjump && playerid.state != states.ratmount && playerid.state != states.ratmountjump && (playerid.state != states.ghost || playerid.ghostpepper < 2) && playerid.sprite_index != playerid.spr_mach && playerid.sprite_index != playerid.spr_mach4 && playerid.sprite_index != spr_player_barrelroll && playerid.state != states.grabbing && playerid.state != states.parry && playerid.state != states.chainsawbump && playerid.state != states.punch && playerid.state != states.chainsawbump && playerid.state != states.rideweenie && playerid.state != states.crouchslide && playerid.state != states.grabbed && playerid.pogochargeactive == 0 && playerid.state != states.tacklecharge && playerid.state != states.mach3 && playerid.state != states.climbwall && playerid.state != (19 << 0) && playerid.state != (128 << 0) && playerid.state != states.mach2 && playerid.state != states.handstandjump && playerid.state != states.machslide && playerid.state != states.slam && playerid.state != (63 << 0) && playerid.state != states.machfreefall && playerid.state != states.superslam && playerid.state != states.machroll && playerid.state != states.chainsaw && playerid.state != states.Sjump && playerid.state != states.boxxedpep && playerid.gusdashpadbuffer <= 0 && (playerid.character != "S" || abs(playerid.movespeed) < 10))
                    alarm[0] = 0
                if (playerid.state == states.mach2 || playerid.state == states.mach1 || playerid.state == states.mach3 || playerid.character == "S")
                {
                    var p = 4
                    var m = (abs(playerid.movespeed) - p)
                    var t = (12 - p)
                    alpha = (m / t)
                    alpha = clamp(alpha, 0, 1)
                }
                visible = playerid.visible
                with (playerid)
                {
                    if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
                        other.visible = false
                }
                break
            case (2 << 0):
                x += hsp
                y += vsp
                if global.gameplay
                {
                    alpha -= 0.05
                    if (alpha <= 0 && alarm[0] != 0)
                        alarm[0] = 0
                }
                break
            case (3 << 0):
            case (4 << 0):
            case (7 << 0):
            case (6 << 0):
                alpha -= 0.05
                if (alpha <= 0 && alarm[0] != 0)
                    alarm[0] = 0
                break
            case (5 << 0):
                alpha -= spd
                x += hsp
                y += vsp
                if (alpha <= 0 && alarm[0] != 0)
                    alarm[0] = 0
                if (playerid != noone && instance_exists(playerid))
                    visible = playerid.visible
                else
                    visible = true
                break
        }

        if (alarm[1] == 0)
        {
            other.alpha[identifier] = 0
            alarm[2] = 3
        }
        if (alarm[2] == 0)
        {
            other.alpha[identifier] = 1
            if (identifier == (1 << 0))
                other.alpha[identifier] = alpha
            alarm[2] = 3
        }
        if (alarm[0] == 0)
        {
            b = undefined
            ds_list_delete(global.afterimage_list, i)
            i--
        }
    }
}
