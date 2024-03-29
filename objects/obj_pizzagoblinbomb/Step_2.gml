if (defused == 1)
    countdown -= 0.5
if (countdown < 50)
    sprite_index = bomblit_spr
var _destroyed = 0
if (countdown <= 0)
{
    _destroyed = 1
    instance_destroy()
}
if (kickbuffer > 0)
{
    if (!(place_meeting(x, y, obj_player)))
        kickbuffer = 0
}
switch state
{
    case states.normal:
        hsp = (movespeed * image_xscale)
        if (check_solid((x + hsp), y) && (!(place_meeting((x + hsp), y, obj_ratblock))))
            image_xscale *= -1
        if (place_meeting((x + hsp), y, obj_ratblock) || place_meeting(x, (y + vsp), obj_ratblock))
            instance_destroy()
        if (scr_solid((x + 1), y) || scr_solid((x - 1), y))
            drop = 1
        if grounded
        {
            if (movespeed > 0)
                movespeed -= 0.5
        }
        if place_meeting(x, (y + 1), obj_railparent)
        {
            var _railinst = instance_place(x, (y + 1), obj_railparent)
            hsp = (_railinst.movespeed * _railinst.dir)
        }
        if (vsp < 12)
            vsp += grav
        scr_collide()
        break
    case (4 << 0):
        grounded = 0
        scr_enemy_grabpos(playerid)
        image_xscale = playerid.xscale
        if (playerid.state != states.bombgrab && playerid.state != states.superslam)
            state = states.normal
        if (state == states.grabbed && _destroyed)
            scr_hurtplayer(playerid)
        if (playerid.state == states.superslam)
        {
            if playerid.grounded
                instance_destroy()
        }
        break
    default:
        state = states.normal
        break
}

if (sprite_index == bomblit_spr)
{
    if (!fmod_event_instance_is_playing(snd))
        fmod_event_instance_play(snd)
    sound_instance_move(snd, x, y)
}
if (sprite_index == spr_bomb)
{
    if (floor(image_index) == 5 && (!bouncesound))
    {
        bouncesound = 1
        sound_play_3d("event:/sfx/pep/bombbounce", x, y)
    }
    else if (floor(image_index) != 5)
        bouncesound = 0
}
