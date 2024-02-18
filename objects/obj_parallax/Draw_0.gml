if (room_width > 16384 || room_height > 16384)
    return;
if global.performance
    return;
if (safe_get(obj_shell, "WC_oobcam") != 1 && room != editor_entrance)
{
    var camx = camera_get_view_x(view_camera[0])
    var camy = camera_get_view_y(view_camera[0])
    draw_reset_clip()
    draw_set_bounds(1, 1, (room_width - 1), (room_height - 1), 0, 0, 1)
    draw_set_colour(c_black)
    draw_rectangle(camx, camy, (max(room_width, (camx + obj_screensizer.actual_width)) + 32), (max(room_height, (camy + obj_screensizer.actual_height)) + 32), false)
    draw_reset_clip()
}
