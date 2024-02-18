if (!in_saveroom())
{
    with (gml_Script_instance_create(x, y, obj_car_dead))
    {
        vsp = -5
        hsp = (other.hsp * 34)
    }
    if instance_exists(inst)
        instance_destroy(inst)
    add_saveroom()
}
