if (!active)
    return;
if ((!(string_pos("treasure", room_get_name(room)))) && room != rank_room && room != timesuproom)
{
    var xx = (scr_current_time() / 30)
    var yy = Wave(-25, 25, 5, 0)
    draw_sprite_tiled_ext(spr_intro_plotpizzafaceBG, -1, (xx + (camera_get_view_x(view_camera[0]) * 0.1)), (yy + (camera_get_view_y(view_camera[0]) * 0.1)), 1, 1, (obj_drawcontroller.use_dark ? c_black : c_white), Wave(0, 0.35, 2.5, 0))
}
