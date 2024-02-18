var _magnet = 0
with (obj_magnet)
{
    if (ballID == other.id)
        _magnet = 1
}
if ((!_magnet) && state != states.golf && state != states.hit && state != states.grabbed && bigcheeseID == -4)
{
    x = obj_player1.x
    y = obj_player1.y
}
