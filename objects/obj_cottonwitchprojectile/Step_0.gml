x += (image_xscale * 6)
depth = -1
if (check_solid(x, y) || check_slope(x, y))
{
    gml_Script_instance_create(x, y, obj_bumpeffect)
    instance_destroy()
}
