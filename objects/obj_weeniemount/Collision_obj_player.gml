with (other)
{
    if ((other.buffer <= 0 && state == states.handstandjump) || check_kungfu_state())
    {
        sound_play_3d("event:/sfx/weenie/start", x, y)
        state = states.rideweenie
        movespeed = hsp
        sprite_index = spr_rideweenie
        xscale = other.image_xscale
        dir = xscale
        jumpstop = 1
        if (vsp < 0)
            vsp = 0
        instance_destroy(other)
        create_transformation_tip(gml_Script_lang_get_value("weenietip"), "weenie")
    }
}
