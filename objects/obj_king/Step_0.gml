if (safe_get(obj_soundtest, "play") || global.jukebox != -4)
{
    with (other)
    {
        sprite_index = spr_king2
        x = lerp(x, Wave((xstart - disx), (xstart + disx), max_time, 10, timer), 0.1)
        timer += 20
    }
}
else
{
    with (other)
    {
        x = lerp(x, xstart, 0.1)
        sprite_index = spr_king1
        timer = ((max_time * 0.5) * 20)
    }
}
if (room == tower_soundtest)
{
    xstart = (camera_get_view_x(view_camera[0]) + 480)
    if (--buffer > 0)
        x = xstart
}
