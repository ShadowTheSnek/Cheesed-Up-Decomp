if (!in_baddieroom())
{
    gml_Script_instance_create(x, y, obj_bombexplosion)
    repeat (6)
        gml_Script_instance_create(x, y, obj_wooddebris)
    add_baddieroom()
}
