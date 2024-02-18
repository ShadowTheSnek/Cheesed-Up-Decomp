if (!in_baddieroom())
{
    var player = instance_nearest(x, y, obj_player)
    if thrown
    {
        trace("bigcherry instadeath")
        with (gml_Script_instance_create(x, y, obj_canonexplosion))
            rat = 1
    }
    else if (distance_to_object(player) < 32)
    {
        trace("bigcherry touching player")
        with (gml_Script_instance_create(x, y, obj_gigacherrydead))
        {
            movespeed = (abs(player.tauntstoredmovespeed) + 4)
            if (player.state != states.chainsaw)
                movespeed = (abs(player.hsp) + 4)
            image_xscale = player.xscale
        }
    }
    else if place_meeting(x, y, obj_gigacherrydead)
    {
        trace("bigcherry touching bigcherry")
        var iceblock = instance_place(x, y, obj_gigacherrydead)
        with (gml_Script_instance_create(x, y, obj_gigacherrydead))
        {
            movespeed = (abs(iceblock.hsp) + 4)
            image_xscale = iceblock.image_xscale
        }
    }
    else
    {
        trace("bigcherry default death")
        with (gml_Script_instance_create(x, y, obj_gigacherrydead))
        {
            movespeed = 8
            image_xscale = (-other.image_xscale)
        }
    }
}
event_inherited()
