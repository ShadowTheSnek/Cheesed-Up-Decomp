function scr_player_morthook() //gml_Script_scr_player_morthook
{
    jumpstop = 1
    doublejump = 0
    hsp = 0
    vsp = 0
    if (!instance_exists(morthookID))
    {
        state = states.mortjump
        sprite_index = spr_fall
        return;
    }
    image_speed = 0.35
    x = Approach(x, morthookID.x, movespeed)
    y = Approach(y, morthookID.y, movespeed)
    if (floor(x) == morthookID.x && floor(y) == morthookID.y)
    {
        sound_play_3d("event:/sfx/mort/doublejump", x, y)
        state = states.mortjump
        sprite_index = spr_mortdoublejumpstart
        image_index = 0
        vsp = -14
        repeat (4)
            create_debris(x, y, spr_feather)
        with (gml_Script_instance_create(x, y, obj_speedlinesup))
            playerid = other.id
        movespeed = (xscale * 12)
    }
}

