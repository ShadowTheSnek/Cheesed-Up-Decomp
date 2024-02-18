if (instance_exists(obj_option) && obj_option.menus[obj_option.menu].menu_id != (12 << 0))
    return;
gml_Script_toggle_alphafix(0)
if (global.inputdisplay && keyalpha > 0)
{
    scr_getinput(1)
    var _camx = camera_get_view_x(view_camera[0])
    var _camy = camera_get_view_y(view_camera[0])
    x = pos[0]
    y = pos[1]
    if (!surface_exists(surf))
        surf = surface_create_fix(maxx, maxy)
    surface_set_target(surf)
    draw_set_alpha(1)
    draw_clear_alpha(c_black, 0)
    var left = x
    var right = (x + maxx)
    var top = y
    var bottom = (y + maxy)
    image_alpha = keyalpha
    if instance_exists(obj_player1)
    {
        var px = (obj_player1.x - _camx)
        var py = (obj_player1.y - _camy)
        if (px >= (left - 25) && px <= (right + 25) && py >= (top - 50) && py <= (bottom + 25))
            image_alpha = min(keyalpha, 0.5)
    }
    self.draw_inputdisplay(0, 0)
    surface_reset_target()
    gml_Script_toggle_alphafix(1)
    draw_surface_ext(surf, x, y, 1, 1, 0, c_white, image_alpha)
    gml_Script_toggle_alphafix(0)
    var mx = gml_Script_device_mouse_x_to_gui_hook(0)
    var my = gml_Script_device_mouse_y_to_gui_hook(0)
    if (mx >= left && mx <= right && my >= top && my <= bottom)
    {
        if (mouse_check_button_pressed(mb_left) && (!drag))
        {
            drag = 1
            dragoffset = [(pos[0] - mx), (pos[1] - my)]
        }
        draw_set_alpha(1)
        draw_set_colour((drag ? c_red : merge_colour(c_blue, c_aqua, 0.75)))
        draw_rectangle(left, top, (right - 1), (bottom - 1), true)
    }
    if (!mouse_check_button(mb_left))
        drag = 0
    if drag
    {
        pos[0] = (mx + dragoffset[0])
        pos[1] = (my + dragoffset[1])
        with (obj_shell)
            WC_drag_inst = -4
    }
    pos[0] = clamp(pos[0], keysep, ((obj_screensizer.actual_width - maxx) - keysep))
    pos[1] = clamp(pos[1], keysep, ((obj_screensizer.actual_height - maxy) - keysep))
}
else if surface_exists(surf)
    surface_free(surf)
