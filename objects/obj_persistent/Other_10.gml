var layers = layer_get_all()
var i = 0
var n = array_length(layers)
while (i < n)
{
    var tilemap = layer_tilemap_get_id_fix(layers[i])
    if (tilemap != -1)
    {
        array_push(room_tiles, 
        {
            layer_id: layers[i],
            layer_name: layer_get_name_fix(layers[i]),
            tilemap: tilemap,
            tileset: tilemap_get_tileset(tilemap)
        }
)
    }
    else
    {
        var bg = layer_background_get_id_fix(layers[i])
        if (bg != -1)
        {
            array_push(room_bgs, 
            {
                layer_id: layers[i],
                layer_name: layer_get_name_fix(layers[i]),
                x: layer_get_x(layers[i]),
                y: layer_get_y(layers[i]),
                bg_id: bg,
                bg_sprite: layer_background_get_sprite(bg)
            }
)
        }
    }
    i++
}
array_sort(room_tiles, function(argument0, argument1) //gml_Script_anon@775@gml_Object_obj_persistent_Other_10
{
    return (layer_get_depth(argument1.layer_id) - layer_get_depth(argument0.layer_id));
}
)
array_sort(room_bgs, function(argument0, argument1) //gml_Script_anon@887@gml_Object_obj_persistent_Other_10
{
    return (layer_get_depth(argument1.layer_id) - layer_get_depth(argument0.layer_id));
}
)
