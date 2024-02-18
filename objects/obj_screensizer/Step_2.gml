var ww = window_get_width()
var wh = window_get_height()
var cr = cr_beam
if ((gml_Script_device_mouse_x_to_gui_hook(0) != mouse_xprevious || gml_Script_device_mouse_y_to_gui_hook(0) != mouse_yprevious) && global.gameframe_enabled)
{
    if gml_Script_gameframe_mouse_in_window()
    {
        if (window_get_cursor() == -1)
            cr = cr_default
        disappearbuffer = 100
        mouse_xprevious = gml_Script_device_mouse_x_to_gui_hook(0)
        mouse_yprevious = gml_Script_device_mouse_y_to_gui_hook(0)
    }
}
if (disappearbuffer > 0)
{
    captionalpha = Approach(captionalpha, 1, 0.2)
    disappearbuffer--
}
else
{
    captionalpha = Approach(captionalpha, 0, 0.1)
    if (room == Mainmenu || room == editor_entrance || room == Initroom || safe_get(obj_shell, "WC_drag_toggle") || safe_get(obj_modconfig, "control_mouse") || safe_get(obj_skinchoice, "submenu") == 1 || instance_exists(obj_songchoice) || safe_get(obj_shell, "isOpen"))
        cr = cr_default
    else if (window_get_cursor() != -1 && window_has_focus())
        cr = cr_none
}
if (room != Mainmenu && (!(safe_get(obj_shell, "WC_drag_toggle"))))
{
    if (global.gameframe_enabled ? gameframe_get_fullscreen() > 0 : window_get_fullscreen())
        cr = cr_none
}
else if (window_get_cursor() == -1)
    cr = cr_default
if (instance_exists(obj_inputAssigner) && obj_inputAssigner.player_input_device[0] >= 0)
    cr = cr_none
if (room == characterselect)
    cr = cr_default
if (cr != cr_beam)
{
    window_set_cursor(cr)
    global.gameframe_current_cursor = cr
    if (cr == cr_none)
        global.gameframe_set_cursor = 0
    else
        global.gameframe_set_cursor = 1
}
global.gameframe_alpha = captionalpha
if window_has_focus()
{
    savedwidth = window_get_width()
    savedheight = window_get_height()
    saved_guiwidth = display_get_gui_width()
    saved_guiheight = display_get_gui_height()
}
else
{
    dirty = 1
    if (global.option_fullscreen > 0)
        alarm[2] = 5
}
if (startbuffer > 0)
    startbuffer--
if (window_has_focus() && (dirty || window_width_current != ww || window_height_current != wh || global.option_scale_mode != last_scale_mode || global.option_fullscreen != (global.gameframe_enabled ? gameframe_get_fullscreen() : window_get_fullscreen())))
{
    if dirty
        dirty = 0
    if (global.option_scale_mode == 0)
    {
        camera_set_view_size(view_camera[0], (obj_screensizer.ideal_width * camzoom), (obj_screensizer.ideal_height * camzoom))
        app_scale = min((ww / obj_screensizer.ideal_width), (wh / obj_screensizer.ideal_height))
        obj_screensizer.actual_width = obj_screensizer.ideal_width
        obj_screensizer.actual_height = obj_screensizer.ideal_height
        if (app_scale > 0)
        {
            surface_resize(application_surface, obj_screensizer.ideal_width, obj_screensizer.ideal_height)
            __display_set_gui_size_hook(obj_screensizer.ideal_width, obj_screensizer.ideal_height)
        }
    }
    else if (global.option_scale_mode == 1)
    {
        if ((ww < 960 || wh < 540) && (!((global.gameframe_enabled ? gameframe_get_fullscreen() : window_get_fullscreen()))))
        {
            ww = max(ww, 960)
            wh = max(wh, 540)
            window_set_size(ww, wh)
        }
        camera_set_view_size(view_camera[0], (obj_screensizer.ideal_width * camzoom), (obj_screensizer.ideal_height * camzoom))
        app_scale = min((ww div obj_screensizer.ideal_width), (wh div obj_screensizer.ideal_height))
        obj_screensizer.actual_width = obj_screensizer.ideal_width
        obj_screensizer.actual_height = obj_screensizer.ideal_height
        if (app_scale > 0)
        {
            surface_resize(application_surface, obj_screensizer.ideal_width, obj_screensizer.ideal_height)
            __display_set_gui_size_hook(obj_screensizer.ideal_width, obj_screensizer.ideal_height)
        }
    }
    else if (global.option_scale_mode == 2)
    {
        app_scale = 1
        camera_set_view_size(view_camera[0], (ww * camzoom), (wh * camzoom))
        obj_screensizer.actual_width = ww
        obj_screensizer.actual_height = wh
        if (ww > 0 && wh > 0)
        {
            surface_resize(application_surface, obj_screensizer.actual_width, obj_screensizer.actual_height)
            __display_set_gui_size_hook(obj_screensizer.actual_width, obj_screensizer.actual_height)
        }
    }
    last_scale_mode = global.option_scale_mode
    last_fullscreen = (global.gameframe_enabled ? gameframe_get_fullscreen() : window_get_fullscreen())
    window_width_current = window_get_width()
    window_height_current = window_get_height()
    normal_size_fix_x = ((obj_screensizer.actual_width - 960) / 2)
    normal_size_fix_y = ((obj_screensizer.actual_height - 540) / 2)
}
switch global.option_scale_mode
{
    case 2:
        mxgui = device_mouse_x_to_gui(0)
        mygui = device_mouse_y_to_gui(0)
        break
    default:
        var wd = (960 * app_scale)
        var drawx = ((savedwidth - wd) / 2)
        mxgui = ((device_mouse_x_to_gui(0) * (savedwidth / wd)) - (drawx / app_scale))
        var ht = (540 * app_scale)
        var drawy = ((savedheight - ht) / 2)
        mygui = ((device_mouse_y_to_gui(0) * (savedheight / ht)) - (drawy / app_scale))
        break
}

mx = (mxgui + camera_get_view_x(view_camera[0]))
my = (mygui + camera_get_view_y(view_camera[0]))
if global.MOD.Mirror
    mx = ((960 - mxgui) + camera_get_view_x(view_camera[0]))
