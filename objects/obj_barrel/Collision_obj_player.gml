if active
{
    if (place_meeting(x, (y - 1), other) && other.vsp > 1 && other.state != states.barrel && other.state != states.barrelslide && other.state != states.barreljump && other.state != states.barrelclimbwall)
    {
        with (other)
        {
            create_particle(x, y, (9 << 0))
            movespeed = hsp
            state = states.barrel
            image_index = 0
            create_transformation_tip(gml_Script_lang_get_value("barreltip"), "barrel")
        }
        active = 0
        alarm[0] = 150
    }
}
