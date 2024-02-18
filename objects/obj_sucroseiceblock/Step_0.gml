if (state != states.hit)
    invtime = Approach(invtime, 0, 1)
if (obj_player1.baddiegrabbedID != id && state == states.grabbed)
    state = states.idle
if (type == "Heavy" && (!grounded))
    vsp += 0.2
if (y > (room_height + 200))
{
    state = states.idle
    x = xstart
    y = ystart
    hsp = 0
    vsp = 0
}
if ((type == "Normal" || type == "Heavy") && ((state == states.idle && type == "Heavy") || state == states.stun))
{
    instance_destroy(instance_place((x + hsp), (y + vsp), obj_baddie))
    instance_destroy(instance_place((x + sign(hsp)), (y + sign(vsp)), obj_baddie))
    instance_destroy(instance_place((x + hsp), (y + vsp), obj_destructibles))
    instance_destroy(instance_place((x + sign(hsp)), (y + sign(vsp)), obj_destructibles))
    instance_destroy(instance_place((x + hsp), (y + vsp), obj_icewall))
    instance_destroy(instance_place((x + sign(hsp)), (y + sign(vsp)), obj_icewall))
}
switch state
{
    case states.idle:
        thrown = 0
        grav = 0.5
        if grounded
            hsp = Approach(hsp, 0, 0.3)
        scr_collide()
        break
    case (138 << 0):
        if (type == "Fragile" && scr_solid((x + hsp), (y + vsp)))
            instance_destroy()
        grav = 0.5
        if (grounded && vsp > 0)
            state = states.idle
        scr_collide()
        break
    case (137 << 0):
        hp = 999
        scr_enemy_hit()
        break
}

if (flash == 1 && alarm[1] <= 0)
    alarm[1] = (0.15 * room_speed)
if (!(place_meeting(x, y, obj_dashpad)))
    touching = 0
var _pad = instance_place(x, y, obj_dashpad)
if (state != states.hit && _pad && state != states.grabbed && (!touching))
{
    if (!dashpadbuffer)
        sound_play_3d("event:/sfx/misc/dashpad", x, y)
    dashpadbuffer = 1
    state = states.stun
    vsp = -7
    x = _pad.x
    y = _pad.y
    xscale = _pad.image_xscale
    movespeed = 15
    other.hsp = (other.movespeed * other.xscale)
    other.flash = 1
    touching = 1
}
else
    dashpadbuffer = 0
if (state != states.hit && invtime <= 0 && (place_meeting(x, y, obj_player1) || place_meeting(x, y, obj_brickball)) && state != states.grabbed)
{
    with (obj_player1)
    {
        if (state == states.mach3 || (state == states.mach2 && sprite_index != spr_mach1) || state == states.rocket || check_kungfu_state() || (state == states.handstandjump && instakillmove) || (state == states.ratmount && abs(hsp) >= 12) || state == states.ratmountpunch)
        {
            repeat (3)
                create_slapstar(other.x, other.y)
            gml_Script_instance_create(other.x, other.y, obj_bangeffect)
            gml_Script_instance_create(other.x, other.y, obj_parryeffect)
            machpunchAnim = 1
            other.state = states.stun
            other.vsp = -11
            if (state == states.mach2)
                other.vsp = -7
            other.movespeed = (movespeed + 2)
            if (state == states.rocket)
            {
                other.vsp -= 7
                other.movespeed += 2
            }
            other.xscale = xscale
            other.hsp = (other.movespeed * other.xscale)
            other.flash = 1
            other.invtime = 10
            sound_play_3d("event:/sfx/pep/punch", x, y)
            with (other)
                self.lag()
        }
        else if (state == states.Sjump || state == states.punch)
        {
            var pctg = (other.x - x)
            repeat (3)
                create_slapstar(other.x, other.y)
            gml_Script_instance_create(other.x, other.y, obj_bangeffect)
            gml_Script_instance_create(other.x, other.y, obj_parryeffect)
            machpunchAnim = 1
            other.state = states.stun
            other.vsp = vsp
            if (state == states.Sjump)
                other.vsp -= 8
            other.movespeed = (7 * (abs(pctg) / 32))
            if (sign(pctg) != 0)
                other.xscale = sign(pctg)
            else
                other.movespeed = 0
            other.hsp = (other.movespeed * other.xscale)
            if (state == states.Sjump)
                other.hsp = 0
            other.flash = 1
            other.invtime = 20
            sound_play_3d("event:/sfx/pep/punch", x, y)
            with (other)
                self.lag()
        }
        if (state == states.handstandjump)
        {
            grabbedby = 1
            baddiegrabbedID = other.id
            with (other)
            {
                state = states.grabbed
                gml_Script_instance_create((x + (other.xscale * 40)), y, obj_punchdust)
            }
            if (!key_up)
            {
                state = states.grab
                sprite_index = spr_haulingstart
                image_index = 0
            }
            else
            {
                state = states.superslam
                sprite_index = spr_piledriver
                if grounded
                    vsp = -12
                else
                    vsp = -6
                grounded = 0
                image_index = 0
                image_speed = 0.35
            }
        }
    }
}
