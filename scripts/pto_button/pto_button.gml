function pto_button(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_pto_button
{
    if (argument3 == undefined)
        argument3 = 0x000048
    if (argument4 == undefined)
        argument4 = 0x000001
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = ""
    var state = states.normal
    var gui = (event_number == 64 || event_number == 74 || event_number == 75)
    if (argument4 && point_in_rectangle(((gui ? gml_Script_device_mouse_x_to_gui_hook(0) : gml_Script_mouse_x_hook()) + argument5), ((gui ? gml_Script_device_mouse_y_to_gui_hook(0) : gml_Script_mouse_y_hook()) + argument6), argument0, argument1, (argument0 + argument2), (argument1 + argument3)))
    {
        if mouse_check_button_released(mb_left)
            state = states.dynamite
        else
            state = states.revolver
    }
    draw_sprite_stretched(spr_button, state != states.normal, argument0, argument1, argument2, argument3)
    if (argument7 != "")
    {
        draw_set_font(gml_Script_lang_get_font("creditsfont"))
        draw_set_colour(c_white)
        draw_set_align(1)
        draw_text(lerp(argument0, (argument0 + argument2), 0.5), (argument1 + 20), argument7)
        draw_set_align()
    }
    return state;
}

function text_button(argument0, argument1, argument2, argument3, argument4) //gml_Script_text_button
{
    if (argument2 == undefined)
        argument2 = ""
    if (argument3 == undefined)
        argument3 = c_white
    if (argument4 == undefined)
        argument4 = c_aqua
    var xx = argument0
    var yy = argument1
    var ww = string_width(argument2)
    var hh = string_height(argument2)
    if (draw_get_halign() == 1)
        xx = (argument0 - (ww / 2))
    if (draw_get_halign() == 2)
        xx -= ww
    if (draw_get_valign() == 1)
        yy = (argument1 - (yy / 2))
    if (draw_get_valign() == 2)
        yy -= hh
    gui = (event_number == 64 || event_number == 74 || event_number == 75)
    state = states.normal
    if point_in_rectangle((gui ? gml_Script_device_mouse_x_to_gui_hook(0) : gml_Script_mouse_x_hook()), (gui ? gml_Script_device_mouse_y_to_gui_hook(0) : gml_Script_mouse_y_hook()), xx, yy, (xx + ww), (yy + hh))
    {
        if mouse_check_button_released(mb_left)
            state = states.dynamite
        else
            state = states.revolver
    }
    if (argument2 != "")
    {
        draw_set_colour((state == states.normal ? argument3 : argument4))
        draw_text(argument0, argument1, argument2)
    }
    return state;
}

function pto_textbox_init() //gml_Script_pto_textbox_init
{
    textboxes = ds_map_create()
}

function pto_textbox_destroy() //gml_Script_pto_textbox_destroy
{
    ds_map_destroy(textboxes)
    window_set_cursor(cr_default)
    with (obj_shell)
        WC_bindsenabled = 1
}

function pto_textbox(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_pto_textbox
{
    if (argument2 == undefined)
        argument2 = 254
    if (argument3 == undefined)
        argument3 = 30
    if (argument4 == undefined)
        argument4 = 32
    if (argument5 == undefined)
        argument5 = ""
    if (argument6 == undefined)
        argument6 = ""
    var x2 = (argument0 + argument2)
    var y2 = (argument1 + argument3)
    var varprefix = string((argument0 * argument1))
    var struct = ds_map_find_value(textboxes, varprefix)
    if (struct == undefined)
    {
        struct = 
        {
            str: argument6,
            sel: 0,
            textline: 0,
            scroll: 0,
            var hover: 0
        }

    }
    draw_set_font(gml_Script_lang_get_font("font_small"))
    draw_set_halign(fa_left)
    draw_rectangle(argument0, argument1, (argument0 + argument2), (argument1 + argument3), false)
    draw_set_colour(c_black)
    draw_rectangle((argument0 + 1), (argument1 + 1), ((argument0 + argument2) - 1), ((argument1 + argument3) - 1), true)
    draw_set_colour(c_white)
    draw_set_bounds((argument0 + 2), argument1, ((argument0 + argument2) - 2), (argument1 + argument3), 0)
    xx = argument0
    yy = argument1
    var scrollw = (argument3 < 60 ? struct.scroll : 0)
    var scrollh = (argument3 >= 60 ? struct.scroll : 0)
    draw_text(((xx + 6) + scrollw), ((yy + 6) + scrollh), struct.str)
    xx += string_width(struct.str)
    if (struct.str == "" && (!struct.sel))
        draw_text_color((xx + 6), (yy + 6), argument5, c_white, c_white, c_white, c_white, 0.25)
    if floor((struct.textline / 20))
        draw_rectangle_color(((xx + scrollw) + 8), ((yy + scrollh) + 6), ((xx + scrollw) + 8), (((yy + scrollh) + argument3) - 8), c_black, c_black, c_black, c_black, 0)
    draw_reset_clip()
    gui = (event_number == 64 || event_number == 74 || event_number == 75)
    hover = point_in_rectangle((gui ? gml_Script_device_mouse_x_to_gui_hook(0) : gml_Script_mouse_x_hook()), (gui ? gml_Script_device_mouse_y_to_gui_hook(0) : gml_Script_mouse_y_hook()), argument0, argument1, x2, y2)
    if hover
    {
        if mouse_wheel_down()
            struct.scroll -= 16
        if mouse_wheel_up()
            struct.scroll += 16
        struct.hover = 1
        window_set_cursor(cr_beam)
    }
    else if struct.hover
    {
        struct.hover = 0
        window_set_cursor(cr_default)
    }
    if (!struct.sel)
    {
        if (mouse_check_button_pressed(mb_left) && hover)
        {
            cooldown = 2
            struct.textline = 20
            struct.sel = 1
            keyboard_string = struct.str
            with (obj_shell)
                WC_bindsenabled = 0
        }
    }
    if struct.sel
    {
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && clipboard_has_text())
            keyboard_string += clipboard_get_text()
        if (keyboard_check(vk_control) && keyboard_check_pressed(vk_backspace))
            keyboard_string = ""
        if (cooldown <= 0)
        {
            if (struct.str != keyboard_string)
            {
                keyboard_string = string_copy(keyboard_string, 1, argument4)
                struct.scroll = ((argument2 + (-string_width(keyboard_string))) - string_width("W"))
                struct.str = keyboard_string
                struct.textline = 20
            }
        }
        else
            cooldown--
        struct.textline = ((struct.textline + 1) % 40)
        if (mouse_check_button_pressed(mb_left) && (!hover))
        {
            struct.textline = 0
            struct.sel = 0
            with (obj_shell)
                WC_bindsenabled = 1
        }
    }
    struct.scroll = clamp(struct.scroll, (-(max((argument3 >= 60 ? ((yy - argument3) + 32) : ((xx - argument2) + 16)), 0))), 0)
    ds_map_set(textboxes, varprefix, struct)
    return struct;
}

