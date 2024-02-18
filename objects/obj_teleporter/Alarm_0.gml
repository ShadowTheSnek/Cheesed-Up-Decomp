var exists = 0
with (obj_teleporter)
{
    if (trigger == other.trigger && (!start))
    {
        exists = 1
        other.player.x = x
        other.player.y = (y - 20)
    }
}
if ((!exists) && (!instance_exists(obj_cyop_loader)))
{
    player.x = player.roomstartx
    player.y = player.roomstarty
}
alarm[1] = 10
