if in_saveroom()
    instance_destroy()
else
{
    inst = gml_Script_instance_create(x, y, obj_mach3solid)
    with (inst)
    {
        sprite_index = spr_car_solid
        mask_index = spr_car_solid
    }
}
