if (!in_saveroom())
{
    add_saveroom()
    scr_sound_multiple(global.snd_collect, x, y)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    with (obj_camera)
        healthshaketime = 30
    global.collect += 50
    with (gml_Script_instance_create(x, y, obj_smallnumber))
        number = string(50)
    create_particle(x, y, (9 << 0), 0)
}
