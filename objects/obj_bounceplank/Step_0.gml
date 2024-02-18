with (obj_player)
{
    if (place_meeting(x, (y + 1), other) && vsp > 0)
    {
        jumpstop = 1
        vsp = -14
    }
}
