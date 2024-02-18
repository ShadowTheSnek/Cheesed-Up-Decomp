if (!in_saveroom())
{
    instance_destroy()
    gml_Script_instance_create(x, y, content)
    add_saveroom()
}
