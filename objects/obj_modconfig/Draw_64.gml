draw_set_colour(c_white)
draw_set_align()
if (object_index != obj_levelsettings)
    gml_Script_toggle_alphafix(1)
gml_Script_reset_blendmode()
var yy = (70 - scroll)
var temp_sel = -1
var i = 0
var n = array_length(options_array)
while (i < n)
{
    var opt = options_array[i]
    var locked = 0
    if (opt.type != (1 << 0) && is_callable(opt.condition))
        locked = (!(array_get(opt.opt.condition(), 0)))
    switch opt.type
    {
        case (1 << 0):
            draw_set_align()
            draw_set_colour(c_white)
            draw_set_font(gml_Script_lang_get_font("creditsfont"))
            if (i != 0)
                yy += 30
            draw_text_color(62, (2 + yy), options_array[i].name, c_black, c_black, c_black, c_black, 0.25)
            draw_text(60, yy, options_array[i].name)
            yy += 40
            break
        default:
            draw_set_align()
            draw_set_font(gml_Script_lang_get_font("font_small"))
            if (point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), 80, yy, 460, (yy + 18)) && control_mouse)
            {
                if (sel != i)
                    self.select(i)
                temp_sel = i
            }
            if (sel == i)
            {
                draw_set_colour((locked ? c_gray : c_white))
                draw_sprite_ext(spr_cursor, -1, (42 + xo), (((2 + yy) + 8) + yo), 1, 1, 0, c_black, 0.25)
                draw_sprite(spr_cursor, -1, (40 + xo), ((yy + 8) + yo))
            }
            else
                draw_set_colour((locked ? c_gray : c_silver))
            draw_text_color(82, (2 + yy), opt.name, c_black, c_black, c_black, c_black, 0.25)
            draw_text(80, yy, opt.name)
            var str = ""
            if (opt.type == (4 << 0))
                str = (string(floor((opt.value * 100))) + "%")
            if (opt.type == (0 << 0) || opt.type == (3 << 0))
                str = gml_Script_lang_get_value_newline(("mod_" + opt.opts[opt.value][0]))
            if (str != "")
            {
                var scale = (min(string_width(str), 100) / string_width(str))
                draw_set_align(1)
                draw_text_transformed_color(352, (2 + yy), str, scale, 1, 0, c_black, c_black, c_black, c_black, 0.25)
                draw_text_transformed(350, yy, str, scale, 1, 0)
                if (sel == i && opt.type != (4 << 0) && (!locked))
                {
                    if (opt.value > 0)
                        draw_text(((350 - ((string_width(str) * scale) / 2)) - Wave(16, 24, 2, 0)), yy, "<")
                    if (opt.value < (array_length(opt.opts) - 1))
                        draw_text(((350 + ((string_width(str) * scale) / 2)) + Wave(16, 24, 2, 0)), yy, ">")
                }
            }
            yy += 20
            break
    }

    i++
}
draw_set_colour(c_white)
if (temp_sel == -1 && control_mouse && sel != -1)
    self.select(-1)
if (sel == -1)
{
    gml_Script_toggle_alphafix(0)
    return;
}
opt = options_array[sel]
var right_x = (obj_screensizer.actual_width - 260)
draw_set_font(gml_Script_lang_get_font("bigfont"))
draw_set_align(1)
draw_set_alpha(alpha)
draw_text_color((2 + right_x), 82, string_upper(opt.name), c_black, c_black, c_black, c_black, 0.25)
draw_text(right_x, 80, string_upper(opt.name))
var drawer = 0
if is_callable(opt.drawfunc)
    drawer = 1
else if (is_array(opt.drawfunc) || sequence_exists(opt.drawfunc))
    drawer = 2
draw_set_font(gml_Script_lang_get_font("font_small"))
draw_text_ext_color((2 + right_x), 422, opt.desc, 18, 440, c_black, c_black, c_black, c_black, 0.25)
draw_text_ext(right_x, 420, opt.desc, 18, 440)
if (opt.type == (0 << 0) || opt.type == (3 << 0))
{
    draw_set_font(gml_Script_lang_get_font("smallfont"))
    if (opt.value < array_length(opt.opts))
    {
        str = gml_Script_lang_get_value_newline(("mod_" + opt.opts[opt.value][0]))
        draw_text_color((2 + right_x), 118, str, c_black, c_black, c_black, c_black, 0.25)
        draw_text(right_x, 116, str)
    }
}
if (opt.type == (4 << 0))
{
    draw_sprite_ext(spr_slider, 0, (right_x - 100), 116, 1, 1, 0, c_white, 1)
    draw_sprite(spr_slidericon2, 0, ((right_x - 100) + (200 * opt.value)), 116)
}
if drawer
{
    var xx = right_x
    var wd = 384
    yy = 260
    var ht = 216
    draw_set_alpha(1)
    var condition = [1]
    if (opt.type != (1 << 0) && is_callable(opt.condition))
        condition = opt.opt.condition()
    if (!condition[0])
    {
        if (!surface_exists(global.modsurf))
            global.modsurf = surface_create_fix(wd, ht)
        surface_set_target(global.modsurf)
        draw_clear_alpha(c_black, 0.5)
        draw_set_font(gml_Script_lang_get_font("font_small"))
        draw_set_align(1, 1)
        draw_text(192, 108, condition[1])
        draw_set_colour(c_white)
        draw_roundrect(0, 0, (wd - 2), (ht - 2), 1)
        surface_reset_target()
    }
    else if is_callable(opt.drawfunc)
    {
        if (!surface_exists(global.modsurf))
            global.modsurf = surface_create_fix(wd, ht)
        surface_set_target(global.modsurf)
        draw_clear_alpha(c_black, 0)
        if (opt.type == (0 << 0) || opt.type == (3 << 0))
            opt.opts[opt.value][1].opt.opts[opt.value][1].drawfunc(opt)
        else if (opt.type == (4 << 0))
        {
            var value = (opt.range[0] + ((opt.range[1] - opt.range[0]) * opt.value))
            value.value.drawfunc(opt)
        }
        else
            opt.opt.drawfunc()
        draw_set_colour(c_white)
        draw_roundrect(0, 0, (wd - 2), (ht - 2), 1)
        surface_reset_target()
    }
    if (object_index != obj_levelsettings)
        gml_Script_toggle_alphafix(1)
    if surface_exists(global.modsurf)
    {
        draw_surface_ext(global.modsurf, ((3 + xx) - (wd / 2)), ((3 + yy) - (ht / 2)), 1, 1, 0, c_black, 0.25)
        if (object_index != obj_levelsettings)
        {
            shader_set_fix(shd_pal_swapper)
            pal_swap_set(spr_peppalette, 1, 0)
        }
        draw_surface(global.modsurf, (xx - (wd / 2)), (yy - (ht / 2)))
    }
}
draw_set_alpha(1)
