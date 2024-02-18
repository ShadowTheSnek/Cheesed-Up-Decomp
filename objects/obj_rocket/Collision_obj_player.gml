with (other)
{
    if (other.playerid == -4 && state != states.rocket && state != states.actor && state != states.rocketslide && state != states.gotoplayer)
    {
        xscale = other.image_xscale
        state = states.rocket
        other.playerid = id
        create_transformation_tip(gml_Script_lang_get_value("rockettip"), "rocket")
        sprite_index = (global.SUGARY ? spr_rocketbottle_start : spr_rocketstart)
        image_index = 0
        if (movespeed < 8)
            movespeed = 8
        x = other.x
        y = (other.y + 4)
    }
}
