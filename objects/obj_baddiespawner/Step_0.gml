if (!object_exists(content))
    return;
if (!instance_exists(baddieid))
    refresh--
if (refresh <= 0)
{
    image_speed = 0.35
    if (floor(image_index) == 5)
    {
        with (gml_Script_instance_create(x, (y - 20), content))
        {
            if (other.platformid != -4)
                platformid = other.platformid
            image_xscale = other.image_xscale
            state = states.stun
            stunned = 50
            vsp = -5
            other.baddieid = id
            important = 1
            if (object_index == obj_pizzagoblinbomb)
                countdown = other.countdown
            if object_is_ancestor(object_index, obj_baddie)
            {
                if (check_heat() && global.stylethreshold >= 3)
                    paletteselect = elitepal
            }
        }
        refresh = 100
    }
}
scr_collide()
