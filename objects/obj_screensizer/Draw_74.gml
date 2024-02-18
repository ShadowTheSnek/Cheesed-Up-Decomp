global.Pattern_Texture_Indexed = -4
if (!surface_exists(gui_surf))
    gui_surf = surface_create_fix(display_get_gui_width(), display_get_gui_height())
else if (surface_get_width(gui_surf) != display_get_gui_width() || surface_get_height(gui_surf) != display_get_gui_height())
{
    with (obj_pause)
        window_buffer = 1
    surface_resize(gui_surf, display_get_gui_width(), display_get_gui_height())
}
surface_set_target(gui_surf)
draw_clear_alpha(c_black, 0)
