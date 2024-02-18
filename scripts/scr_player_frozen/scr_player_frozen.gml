function scr_player_frozen() //gml_Script_scr_player_frozen
{
    image_speed = 0.35
    movespeed += 0.01
    if (room == dungeon_9 || room == dungeon_10 || room == snick_challengeend)
        movespeed += 0.02
    if (movespeed >= 1)
    {
        movespeed = 0
        state = states.normal
        scr_hurtplayer(id)
        sound_play_3d("event:/sfx/pep/hurt", x, y)
        sound_play_3d(global.snd_screamboss, x, y)
        repeat (3)
            sound_play_3d("event:/modded/sfx/enemyscream", x, y)
        with (obj_tv)
        {
            jumpscare = (room_speed / 2)
            jumpscaretext = irandom((sprite_get_number(spr_scares_txt) - 1))
        }
        image_blend = c_white
        with (obj_music)
            fmod_event_instance_set_pitch(panicmusicID, 1)
        return;
    }
    if ((-key_left2) || key_right2 || key_up2 || key_down2 || key_jump || key_slap)
    {
        shaketime = 8
        hitLag -= 5
        movespeed = max((movespeed - 0.04), 0)
        if (hitLag <= 0)
        {
            sound_play_3d("event:/sfx/pep/punch", x, y)
            sound_play_3d("event:/sfx/misc/breakblock", x, y)
            movespeed = tauntstoredmovespeed
            sprite_index = tauntstoredsprite
            state = states.jump
            jumpstop = 1
            vsp = -12
            sprite_index = spr_machfreefall
            image_blend = c_white
            with (obj_music)
                fmod_event_instance_set_pitch(panicmusicID, 1)
            return;
        }
    }
    shaketime = Approach(shaketime, 0, 1)
    with (obj_music)
        fmod_event_instance_set_pitch(panicmusicID, lerp(1, 0.25, obj_player1.movespeed))
    image_blend = merge_colour(c_white, c_purple, movespeed)
}

