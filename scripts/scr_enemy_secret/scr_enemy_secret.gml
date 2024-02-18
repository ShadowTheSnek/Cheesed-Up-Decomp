function scr_enemy_secret() //gml_Script_scr_enemy_secret
{
    visible = false
    invincible = 1
    hsp = 0
    if ((!secretjumped) && (!(place_meeting(x, y, obj_secretbigblock))))
    {
        if global.MIDWAY
            sound_play_3d("event:/modded/sfx/bottledestroy", x, y)
        secretjumped = 1
        vsp = -8
    }
    if secretjumped
    {
        visible = true
        if (grounded && vsp > 0)
        {
            invincible = savedsecretinvincible
            state = states.walk
            sprite_index = walkspr
        }
    }
}

