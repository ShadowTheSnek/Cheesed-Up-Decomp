if (!global.option_hud)
    return;
var xx = x
var yy = y
draw_set_color(c_white)
if bo
    draw_sprite(spr_comboendBN, 0, xx, yy)
else
    draw_sprite(spr_comboend, 0, xx, yy)
var title = floor((combo / 5))
scr_combotitledraw(sprite, xx, (yy + 30), title, title_index)
draw_set_font(gml_Script_lang_get_font("smallfont"))
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text(xx, (yy + 70), comboscoremax)
