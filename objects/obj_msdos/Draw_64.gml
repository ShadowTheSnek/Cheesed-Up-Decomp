if (con != 0)
{
    var s = 72
    x = ((x + 0.25) % s)
    if (!surface_exists(bordersurf))
    {
        bordersurf = surface_create_fix((s * 2), (s * 2))
        surface_set_target(bordersurf)
        draw_clear(c_black)
        draw_set_colour(make_colour_hsv(182.04166666666666, 99.45, 58.650000000000006))
        draw_roundrect_ext(0, 0, (s - 1), (s - 1), 16, 16, 0)
        draw_roundrect_ext(s, s, ((s + s) - 1), ((s + s) - 1), 16, 16, 0)
        surface_reset_target()
    }
    draw_surface_tiled(bordersurf, x, x)
    var w = 720
    var h = 400
    if (!surface_exists(surf))
        surf = surface_create_fix(w, h)
    surface_set_target(surf)
    draw_clear(c_black)
    draw_set_font(fnt_dos)
    draw_set_colour(c_silver)
    draw_set_align()
    while (string_height((output + "_")) > h)
        output = string_delete(output, 1, string_pos("\n", output))
    var str = (string(output) + string(input))
    if (input_mode != 0 && blink <= 12)
        str += "_"
    draw_text(0, 0, str)
    if (input_mode != 0)
        blink = (++blink % 24)
    surface_reset_target()
    gpu_set_texfilter(true)
    var xx = ((obj_screensizer.actual_width - w) / 2)
    var yy = ((obj_screensizer.actual_height - h) / 2)
    draw_surface(surf, xx, yy)
    gpu_set_texfilter(false)
}
if (con == 0)
{
    fade += 0.1
    if (fade >= 1.5)
        con = 1
}
if (con == 1)
{
    fade -= 0.1
    if (fade <= 0)
        con = 2
}
gml_Script_toggle_alphafix(1)
if (con < 2)
{
    draw_set_colour(c_black)
    draw_set_alpha(fade)
    draw_rectangle(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, false)
    draw_set_alpha(1)
}
gml_Script_toggle_alphafix(0)
