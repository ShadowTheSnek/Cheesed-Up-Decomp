sound_instance_move(snd, x, y)
switch state
{
    case states.normal:
        break
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
        {
            state = states.fall
            sprite_index = spr_grabbiehand_fall
        }
        break
    case (135 << 0):
        var spd = 12
        shootdir = angle_rotate(shootdir, point_direction(x, y, targetplayer.x, targetplayer.y), turnspeed)
        hsp = lengthdir_x(spd, shootdir)
        vsp = lengthdir_y(spd, shootdir)
        if (hsp != 0)
            image_xscale = sign(hsp)
        if grounded
        {
            state = states.stun
            stunned = 50
            hsp = 0
            vsp = 0
            sprite_index = spr_grabbiehand_catch
        }
        scr_collide()
        break
    case (138 << 0):
        if (stunned > 0)
            stunned--
        else if grounded
        {
            state = states.ejected
            sprite_index = spr_grabbiehand_idle
            grounded = 0
        }
        if grounded
            hsp = 0
        scr_collide()
        break
    case (7 << 0):
        var _dir = point_direction(x, y, xstart, ystart)
        x = Approach(x, xstart, abs(lengthdir_x(8, _dir)))
        y = Approach(y, ystart, abs(lengthdir_y(8, _dir)))
        if (x > (xstart - 8) && x < (xstart + 8) && y > (ystart - 8) && y < (ystart + 8))
        {
            state = states.normal
            x = xstart
            y = ystart
            fmod_event_instance_stop(snd, 1)
        }
        break
    case (55 << 0):
        sprite_index = spr_grabbiehand_catch
        if (!reverse)
            vsp = -14
        else
            vsp = 14
        hsp = 0
        with (playerid)
        {
            hsp = 0
            vsp = 0
            x = other.x
            y = other.y
            xscale = other.image_xscale
            if (object_index != obj_pizzagoblinbomb)
            {
                state = states.bump
                if (boxxed == 0)
                    sprite_index = spr_player_catched
                else
                    sprite_index = spr_boxxedpep_air
                if (tauntstoredstate == states.mach2)
                    sprite_index = spr_mach
                else if (tauntstoredstate == states.mach3)
                    sprite_index = spr_mach4
            }
        }
        if (scr_solid(x, (y - 1)) || (reverse && scr_solid(x, (y + 1))) || place_meeting(x, y, obj_verticalhallway) || place_meeting(x, y, obj_hallway))
        {
            sound_play_3d("event:/sfx/enemies/projectile", x, y)
            if (playerid == obj_player1.id)
            {
                with (playerid)
                {
                    movespeed = tauntstoredmovespeed
                    vsp = 0
                    sprite_index = tauntstoredsprite
                    state = tauntstoredstate
                    if (state == states.mach3)
                    {
                        sprite_index = spr_mach4
                        machhitAnim = 0
                    }
                }
            }
            sprite_index = spr_grabbiehand_idle
            state = states.ejected
            if fake
                instance_destroy()
        }
        scr_collide()
        break
    default:

}

