if (image_xscale == 1)
{
    with (gml_Script_instance_create(x, y, obj_solid))
    {
        image_yscale = 2
        other.solid_inst = id
    }
}
if (image_xscale == -1)
{
    with (gml_Script_instance_create((x - 32), y, obj_solid))
    {
        image_yscale = 2
        other.solid_inst = id
    }
}
