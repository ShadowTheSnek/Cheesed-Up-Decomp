var _player = instance_nearest(x, y, obj_player)
if (grabbedPlayer <= noone)
{
    if (distance_to_object(_player) < 100)
    {
        var _player_dir = point_direction(xstart, ystart, _player.x, _player.y)
        targetX = lengthdir_x(90, _player_dir)
        targetY = lengthdir_y(90, _player_dir)
        hsp = 0
        vsp = 0
        if isReady
        {
            x = round((xstart + targetX))
            y = round(max((ystart + targetY), ystart))
        }
        else
        {
            x = round(lerp(x, (xstart + targetX), 0.2))
            y = round(lerp(y, (ystart + targetY), 0.2))
            if (x == round((xstart + targetX)) && y == round((ystart + targetY)))
                isReady = 1
        }
    }
    else
    {
        isReady = 0
        x = round(lerp(x, xstart, 0.2))
        y = round(lerp(y, (ystart + 70), 0.2))
    }
}
if (place_meeting(x, y, _player) && (!(scr_solid(x, y))) && _player.vsp >= -3 && _player.state != states.fling && grabbedPlayer <= noone && waitTimer <= 0)
{
    grabbedPlayer = _player
    old_hsp = (grabbedPlayer.hsp / 4)
    hsp = old_hsp
    vsp = clamp(((grabbedPlayer.vsp / 2) + 10), 5, 20)
    max_vsp = -15
    with (grabbedPlayer)
    {
        if (!instance_exists(obj_genericpoofeffect))
        {
            with (gml_Script_instance_create(x, y, obj_genericpoofeffect))
                sprite_index = spr_candyifiedeffect1
            sound_play_3d("event:/modded/sfx/bloop", x, y)
        }
        movespeed = abs(movespeed)
        sprite_index = spr_player_candybegin
        state = states.fling
        hsp = 0
        vsp = 0
        x = other.x
        y = other.y
    }
}
if (grabbedPlayer != noone)
{
    with (grabbedPlayer)
    {
        x = other.x
        y = other.y
        if (!instance_exists(obj_customeffect))
        {
            with (gml_Script_instance_create(x, y, obj_customeffect))
            {
                sprite_index = spr_candyifiedeffect2
                playerid = other.id
                loop = 1
                followplayer = 1
                function anon@1866@gml_Object_obj_flingfrog_Step_0() //gml_Script_anon@1866@gml_Object_obj_flingfrog_Step_0
                {
                    if (playerid.state != states.fling)
                        instance_destroy()
                }

            }
        }
        move = (key_left + key_right)
        hsp = (move * movespeed)
        if (move != 0 && (!(scr_solid((x + move), y))))
        {
            xscale = move
            if (movespeed < 6)
                movespeed += 0.25
        }
        else
            movespeed = 0
    }
    old_hsp = Approach(old_hsp, 0, 0.2)
    hsp = (old_hsp + grabbedPlayer.hsp)
    if scr_solid((x + sign(hsp)), y)
    {
        old_hsp = ((-sign(hsp)) * 3)
        grabbedPlayer.movespeed /= 2
    }
    if (scr_solid(x, (y + 1)) && vsp >= 0)
        vsp -= 5
    if (vsp >= 0)
        vsp -= 0.65
    else if (vsp < 15)
        vsp -= 1
    x = clamp(x, (xstart - 280), (xstart + 280))
    if (x >= (xstart + 200) || x <= (xstart - 200) || ((xprevious - x) == 0 && (yprevious - y) == 0))
        farBuffer++
    else
        farBuffer = 0
    if (grabbedPlayer.y <= ystart && vsp < 0)
    {
        with (grabbedPlayer)
        {
            sound_play_3d("event:/modded/sfx/bloop2", x, y)
            state = states.jump
            jumpstop = 1
            hsp = other.hsp
            movespeed = abs(hsp)
            vsp = other.max_vsp
            jumpAnim = 0
            sprite_index = spr_player_candytransitionup
            if (sign(hsp) != 0)
                xscale = sign(hsp)
            if global.gameplay
                gml_Script_instance_create(x, y, obj_speedlinesup)
        }
        grabbedPlayer = noone
        waitTimer = 25
    }
    else if (grabbedPlayer.key_jump || farBuffer >= 100)
    {
        with (grabbedPlayer)
        {
            sound_play_3d("event:/modded/sfx/bloop2", x, y)
            state = states.jump
            jumpstop = 1
            hsp = other.hsp
            movespeed = abs(hsp)
            vsp = -6
            jumpAnim = 0
            sprite_index = spr_player_candytransitionup
            if (sign(hsp) != 0)
                xscale = sign(hsp)
        }
        grabbedPlayer = -4
        waitTimer = 25
    }
}
if (waitTimer > 0)
    waitTimer--
candyindex += 0.35
