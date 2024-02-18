draw_set_alpha(1)
draw_set_font(gml_Script_lang_get_font("bigfont"))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var _revert = embed_value_string(gml_Script_lang_get_value("option_revert"), [timer])
var _midW = (obj_screensizer.actual_width / 2)
var _midH = (obj_screensizer.actual_height / 2)
if (!restart)
{
    draw_text(_midW, (_midH - 70), gml_Script_lang_get_value("option_confirm"))
    draw_text(_midW, (_midH - 30), _revert)
}
else
    draw_text(_midW, (_midH - 70), gml_Script_lang_get_value_newline("option_reboot"))
var c1 = (select == 0 ? c_white : c_gray)
var c2 = (select == 1 ? c_white : c_gray)
draw_text_color((_midW - 100), (_midH + 30), gml_Script_lang_get_value("option_yes"), c1, c1, c1, c1, 1)
draw_text_color((_midW + 100), (_midH + 30), gml_Script_lang_get_value("option_no"), c2, c2, c2, c2, 1)
