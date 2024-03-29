function scr_player_boxxedpepspin() //gml_Script_scr_player_boxxedpepspin
{
    image_speed = 0.5
    hsp = (xscale * movespeed)
    doublejump = 1
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    move = (key_left + key_right)
    hsp = (movespeed + (railmovespeed * raildir))
    if (abs(movespeed) > 0)
        movespeed = Approach(movespeed, 0, 0.1)
    instance_destroy(instance_place((x + hsp), y, obj_destructibles))
    if (scr_solid((x + hsp), y) && (!(place_meeting((x + hsp), y, obj_ratblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && ((!(check_slope((x + hsp), y))) || scr_solid_slope((x + hsp), y)))
    {
        sound_play_3d("event:/sfx/boxxed/step", x, y)
        gml_Script_instance_create((x + hsp), y, obj_bangeffect)
        movespeed = (-((sign(hsp) * 6)))
        GamepadSetVibration(0, 0.4, 0.4, 0.65)
    }
    if (((!key_slap) || abs(movespeed) <= 3) && boxxedspinbuffer == 0)
    {
        state = states.boxxedpepjump
        sprite_index = spr_boxxedpepair
    }
}

