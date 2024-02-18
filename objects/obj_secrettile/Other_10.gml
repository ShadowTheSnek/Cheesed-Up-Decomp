array_foreach(room_get_tile_layers(), function(argument0) //gml_Script_anon@112@gml_Object_obj_secrettile_Other_10
{
    if string_starts_with(argument0.layer_name, "Tiles_Secret")
    {
        var wd = tilemap_get_tile_width(argument0.tilemap)
        var ht = tilemap_get_tile_height(argument0.tilemap)
        for (var yy = bbox_top; yy < bbox_bottom; yy += ht)
        {
            for (var xx = bbox_left; xx < bbox_right; xx += wd)
            {
                var data = tilemap_get_at_pixel(argument0.tilemap, xx, yy)
                if (data != -1)
                {
                    array_push(tiles, 
                    {
                        x: xx,
                        y: yy,
                        tile_data: data,
                        tileset: argument0.tileset
                    }
)
                    tilemap_set_at_pixel(argument0.tilemap, tile_set_empty(data), xx, yy)
                }
            }
        }
    }
}
)
if (array_length(tiles) == 0)
{
    trace("obj_secrettile at ", room_get_name(room), " without any tiles")
    instance_destroy()
    return;
}
