if start
{
    var xscale = (obj_screensizer.actual_width / 960)
    var yscale = (obj_screensizer.actual_height / 540)
    draw_clear(c_black)
    draw_sprite_ext(info.bginfo[0], 0, (bgX * xscale), (bgY * yscale), xscale, yscale, 0, c_white, 1)
    draw_sprite_ext(info.titleinfo[0], 0, (titleX * xscale), (titleY * yscale), xscale, yscale, 0, c_white, 1)
}
gml_Script_toggle_alphafix(1)
draw_set_color(c_black)
draw_set_alpha((instance_exists(obj_fadeout) ? obj_fadeout.fadealpha : fadealpha))
draw_rectangle(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, false)
draw_set_alpha(1)
draw_set_color(c_white)
gml_Script_toggle_alphafix(0)
