if (!in_saveroom())
{
    gml_Script_instance_create(500, 154, obj_alienbyebye)
    add_saveroom()
    add_saveroom(id, global.escaperoom)
}
