if global.SUGARY
{
    var l = layer_get_all()
    for (var i = 0; i < array_length(l); i++)
    {
        var layers_e = layer_get_all_elements(l[i])
        var j = 0
        while (j < array_length(layers_e))
        {
            if (layer_get_element_type(layers_e[j]) == 1)
            {
                var bgspr = ds_map_find_value(global.SPRITES, (sprite_get_name(layer_background_get_sprite(layers_e[j])) + "escape"))
                if (bgspr != undefined)
                    layer_background_change(layers_e[j], bgspr)
            }
            break
        }
    }
}
