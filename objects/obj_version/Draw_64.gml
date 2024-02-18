draw_set_font(gml_Script_lang_get_font("smallfont"))
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
var a = 0
with (obj_mainmenu)
    a = extrauialpha
draw_text_color((obj_screensizer.actual_width - 8), (obj_screensizer.actual_height - 8), concat(gml_Script_lang_get_value_newline("mod_version_prefix"), ver, "\n", gml_Script_lang_get_value_newline("base_version_prefix"), gml_Script_lang_get_value_newline("game_version")), c_white, c_white, c_white, c_white, a)
