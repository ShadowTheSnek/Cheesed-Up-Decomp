function pal_swap_get_pal_color(argument0, argument1, argument2) //gml_Script_pal_swap_get_pal_color
{
    if global.performance
        return 16777215;
    var _palettes = ds_map_find_value(global.Pal_Map, argument0)
    var _current_pal = ds_list_find_value(_palettes, argument1)
    var _return = ds_list_find_value(_current_pal, argument2)
    if (_return == undefined)
    {
        trace(string("[pal_swap_get_pal_color] sprite: {0} pal_x: {1} pal_y: {2} _palettes: {3} _current_pal: {4} _return: {5}", argument0, argument1, argument2, _palettes, _current_pal, _return))
        return 16777215;
    }
    return _return;
}

