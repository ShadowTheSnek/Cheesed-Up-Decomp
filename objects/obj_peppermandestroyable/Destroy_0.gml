if (!in_saveroom())
{
    gml_Script_instance_create((x + 16), y, obj_debris)
    gml_Script_instance_create((x + 16), y, obj_debris)
    gml_Script_instance_create((x + 16), y, obj_debris)
    gml_Script_instance_create((x + 16), y, obj_debris)
    add_saveroom()
    var lay_id = layer_get_id("Tiles_1")
    var map_id = layer_tilemap_get_id_fix(lay_id)
    var data = tilemap_get_at_pixel(map_id, x, y)
    data = tile_set_empty(data)
    tilemap_set_at_pixel(map_id, data, x, y)
}
