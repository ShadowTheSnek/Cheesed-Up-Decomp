piledriver = 1
touched = 0
active = 0
function anon@62@gml_RoomCC_space_7_16_Create() //gml_Script_anon@62@gml_RoomCC_space_7_16_Create
{
    if (!touched)
    {
        with (obj_player)
        {
            if place_meeting(x, y, other)
                other.touched = 1
        }
    }
    if touched
    {
        with (obj_player)
        {
            if (place_meeting(x, y, other) && state != states.superslam && state != states.chainsaw)
                other.piledriver = 0
            else if (!(place_meeting(x, y, other)))
            {
                with (other)
                {
                    if (piledriver && (!active) && (!(place_meeting(x, y, obj_baddie))))
                    {
                        notification_push((15 << 0), [room])
                        active = 1
                    }
                }
            }
        }
    }
}

