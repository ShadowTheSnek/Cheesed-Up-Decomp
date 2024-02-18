if global.performance
    return;
var uvs = sprite_get_uvs(spr_skinmenupizza, bg_image)
var uv_info = 
{
    left: uvs[0],
    top: uvs[1],
    right: uvs[2],
    bottom: uvs[3],
    left_trim: uvs[4],
    top_trim: uvs[5]
}

var pizza_width = sprite_get_width(spr_skinmenupizza)
var pizza_height = sprite_get_height(spr_skinmenupizza)
vertex_begin(pizza_vbuffer, vertex_format)
for (var xx = (-pizza_width); xx < (obj_screensizer.actual_width + pizza_width); xx += pizza_width)
{
    for (var yy = (-pizza_height); yy < (obj_screensizer.actual_height + pizza_height); yy += pizza_height)
    {
        var pos_left = (xx + 5)
        var pos_top = (yy + 6)
        var pos_right = ((xx + pizza_width) - 4)
        var pos_bottom = ((yy + pizza_height) - 4)
        vertex_build_quad(pizza_vbuffer, pos_left, pos_top, (pos_right - pos_left), (pos_bottom - pos_top), 16777215, 0.25, uv_info.left, uv_info.top, (uv_info.right - uv_info.left), (uv_info.bottom - uv_info.top))
    }
}
vertex_end(pizza_vbuffer)
vertex_freeze(pizza_vbuffer)
