if (!in_saveroom())
{
    gml_Script_instance_create((x + 16), y, obj_debris)
    gml_Script_instance_create((x + 16), y, obj_debris)
    gml_Script_instance_create((x + 16), y, obj_debris)
    gml_Script_instance_create((x + 16), y, obj_debris)
    tile_layer_delete_at(1, x, y)
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    add_saveroom()
}
