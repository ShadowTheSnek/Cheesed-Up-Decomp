function calculate_parallax_still_x(argument0, argument1) //gml_Script_calculate_parallax_still_x
{
    var _cam_x = camera_get_view_x(view_camera[0])
    var lay = layer_get_id(argument0)
    var w = (room_width - obj_screensizer.actual_width)
    if (room_width <= obj_screensizer.actual_width)
        var per_x = 0
    else
        per_x = (_cam_x / w)
    var si = layer_background_get_sprite(layer_background_get_id_fix(lay))
    if (si == -1)
        return 0;
    var sw = (sprite_get_width(si) - obj_screensizer.actual_width)
    var r = ((sw * per_x) * argument1)
    r = max(r, 0)
    return r;
}

function calculate_parallax_still_y(argument0, argument1) //gml_Script_calculate_parallax_still_y
{
    var _cam_y = camera_get_view_y(view_camera[0])
    lay = argument0
    var h = (room_height - obj_screensizer.actual_height)
    if (room_height <= obj_screensizer.actual_height)
        var per_y = 0
    else
        per_y = (_cam_y / h)
    si = layer_background_get_sprite(layer_background_get_id_fix(lay))
    if (si == -1)
        return 0;
    var sh = (sprite_get_height(si) - obj_screensizer.actual_height)
    r = ((sh * per_y) * argument1)
    r = max(r, 0)
    return r;
}

