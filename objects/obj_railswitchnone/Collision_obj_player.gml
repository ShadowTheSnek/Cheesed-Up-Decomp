if (!active)
{
    global.railspeed = 0
    with (obj_railparent)
        alarm[0] = 1
    active = 1
    add_saveroom()
}
