if (!global.MOD.CTOPLaps)
{
    instance_destroy(id, false)
    with (gml_Script_instance_create(x, y, obj_solid))
    {
        image_xscale = 2
        image_yscale = 2
    }
}
