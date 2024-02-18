if ((!active) && global.MOD.DeathMode)
{
    active = 1
    time = ((room_speed * 11) - 1)
    show_time = (room_speed * 2)
    dead = 0
    time_fx = 0
    time_fx_y = 0
    ybump = 0
    surfy = 60
    surfscale = 0.5
    image_speed = 0.35
    if check_char("G")
        time += (room_speed * 5)
}
