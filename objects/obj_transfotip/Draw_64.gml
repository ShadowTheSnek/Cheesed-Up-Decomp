if (!global.option_hud)
    return;
gml_Script_toggle_alphafix(1)
draw_set_font(gml_Script_lang_get_font("creditsfont"))
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(fade)
draw_set_color(c_white)
var xx = (obj_screensizer.actual_width / 2)
var yy = (obj_screensizer.actual_height - 50)
if (((global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld")) || global.MOD.DeathMode)
    yy -= 60
var s = text_size
xx -= (s[0] / 2)
yy -= s[1]
xx = floor(xx)
yy = floor(yy)
scr_draw_text_arr(xx, yy, text_arr, 16777215, fade)
draw_set_alpha(1)
gml_Script_toggle_alphafix(0)
