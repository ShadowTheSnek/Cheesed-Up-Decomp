if (!in_saveroom())
{
    with (gml_Script_instance_create(x, y, obj_debris))
    {
        sprite_index = other.sprite_index
        image_index = other.img
    }
    add_saveroom()
}
