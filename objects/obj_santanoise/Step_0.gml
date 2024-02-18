if (floor(image_index) == 53 && (!instance_exists(obj_noisebomb)))
{
    global.minutes = 1
    global.seconds = 40
    obj_camera.alarm[1] = 1
    global.miniboss = 1
    gml_Script_instance_create((x + 50), (y - 50), obj_noisebomb)
}
scr_collide()
if (grounded && dust == 0)
{
    dust = 1
    create_particle(x, y, (12 << 0))
}
