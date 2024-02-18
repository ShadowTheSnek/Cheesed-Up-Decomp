if global.performance
    return;
if (!ds_list_empty(global.debris_list))
{
    if (obj_drawcontroller.use_dark && global.SUGARY)
        draw_set_flash(get_dark(16777215, 1))
    for (var i = 0; i < ds_list_size(global.debris_list); i++)
    {
        var q = ds_list_find_value(global.debris_list, i)
        if (!is_struct(q))
        {
        }
        else if (!(point_in_rectangle(q.x, q.y, (camera_get_view_x(view_camera[0]) - 100), (camera_get_view_y(view_camera[0]) - 100), ((camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) + 100), ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) + 100))))
        {
        }
        else
        {
            var b = get_dark(16777215, obj_drawcontroller.use_dark)
            draw_sprite_ext(q.sprite_index, q.image_index, q.x, q.y, 1, 1, q.image_angle, b, q.alpha)
        }
    }
    draw_reset_flash()
}
if (!global.option_hud)
    return;
if (!ds_list_empty(global.collect_list))
{
    for (i = 0; i < ds_list_size(global.collect_list); i++)
    {
        b = ds_list_find_value(global.collect_list, i)
        if is_struct(b)
        {
            var cx = camera_get_view_x(view_camera[0])
            var cy = camera_get_view_y(view_camera[0])
            if (b.spr_palette != -4)
            {
                shader_set_fix(shd_pal_swapper)
                pal_swap_set(b.spr_palette, b.paletteselect, 0)
            }
            draw_sprite_ext(b.sprite_index, b.image_index, (b.x + cx), (b.y + cy), 1, 1, 0, c_white, 1)
            pal_swap_reset()
        }
    }
}
