trigger = 3
function anon@25@gml_RoomCC_rm_testing_8_Create() //gml_Script_anon@25@gml_RoomCC_rm_testing_8_Create
{
    active = 0
    if place_meeting(x, y, obj_baddie)
        active = 1
    with (obj_player)
    {
        if (state == states.grabbing && place_meeting(x, y, other))
            other.active = 1
    }
}

