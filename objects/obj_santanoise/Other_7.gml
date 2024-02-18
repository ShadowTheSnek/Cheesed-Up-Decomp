if (!in_baddieroom())
{
    add_baddieroom()
    gml_Script_instance_create(x, y, obj_bombexplosion)
    instance_destroy()
}
