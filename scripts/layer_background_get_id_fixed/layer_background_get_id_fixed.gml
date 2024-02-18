function layer_background_get_id_fixed(argument0) //gml_Script_layer_background_get_id_fixed
{
    var bwah = layer_background_get_id_fix(argument0)
    if (bwah > -1)
        return bwah;
    if layer_exists(argument0)
    {
        var els = layer_get_all_elements(argument0)
        var i = 0
        var n = array_length(els)
        while (i < n)
        {
            if (layer_get_element_type(els[i]) == 1)
                return els[i];
            i++
        }
        return -1;
    }
    return -1;
}

