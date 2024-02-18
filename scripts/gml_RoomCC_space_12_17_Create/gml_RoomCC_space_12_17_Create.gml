piledriver = 1
active = 0
function anon@44@gml_RoomCC_space_12_17_Create() //gml_Script_anon@44@gml_RoomCC_space_12_17_Create
{
    with (obj_player)
    {
        if (place_meeting(x, y, other) && state != states.superslam && state != states.chainsaw)
            other.piledriver = 0
    }
    if (piledriver && (!active) && (!(place_meeting(x, y, obj_secretbigblock))))
    {
        notification_push((15 << 0), [room])
        active = 1
    }
}

