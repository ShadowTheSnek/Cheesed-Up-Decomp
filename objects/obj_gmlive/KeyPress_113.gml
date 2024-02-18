live_rooms = (!live_rooms)
if (!live_rooms)
{
    var i = 0
    while room_exists(i)
    {
        room_set_live(i, 0)
        i++
    }
}
else
    room_set_live(room, 1)
trace("live_rooms ", live_rooms)
