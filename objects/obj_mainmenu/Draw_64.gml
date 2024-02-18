if (state == states.titlescreen || (state == states.transitioncutscene && dark))
    draw_sprite(spr_menudark, 0, 0, 0)
if (state == states.bombdelete)
{
    draw_set_alpha(0.5)
    draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, 0)
    draw_set_alpha(1)
    draw_set_font(gml_Script_lang_get_font("bigfont"))
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    var _str = embed_value_string(gml_Script_lang_get_value("menu_delete"), [string((currentselect + 1))])
    draw_text_color((obj_screensizer.actual_width / 2), ((obj_screensizer.actual_height / 2) - 30), _str, c_red, c_red, c_red, c_red, 1)
    var w = (string_width(_str) / 2)
    var spr = spr_menu_filedelete
    var ix = index
    if (deletebuffer > 0)
    {
        spr = spr_menu_filedelete_lit
        ix = (index * 2.5)
    }
    draw_sprite(spr, ix, (((obj_screensizer.actual_width / 2) + w) + 70), (obj_screensizer.actual_height / 2))
    draw_sprite(spr, ix, (((obj_screensizer.actual_width / 2) - w) - 70), (obj_screensizer.actual_height / 2))
    var c1 = (deleteselect == 0 ? c_white : c_gray)
    var c2 = (deleteselect == 1 ? c_white : c_gray)
    draw_text_color(((obj_screensizer.actual_width / 2) - 100), ((obj_screensizer.actual_height / 2) + 30), gml_Script_lang_get_value("option_yes"), c1, c1, c1, c1, 1)
    draw_text_color(((obj_screensizer.actual_width / 2) + 100), ((obj_screensizer.actual_height / 2) + 30), gml_Script_lang_get_value("option_no"), c2, c2, c2, c2, 1)
}
else if (state == states.finale)
{
    draw_set_alpha(0.5)
    draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, 0)
    draw_set_alpha(1)
    draw_set_font(gml_Script_lang_get_font("bigfont"))
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_sprite(spr_menu_byebye, index, ((obj_screensizer.actual_width / 2) + 210), (obj_screensizer.actual_height / 2))
    draw_sprite(spr_menu_byebye, index, ((obj_screensizer.actual_width / 2) - 210), (obj_screensizer.actual_height / 2))
    draw_text_color((obj_screensizer.actual_width / 2), ((obj_screensizer.actual_height / 2) - 30), gml_Script_lang_get_value("menu_exit"), c_white, c_white, c_white, c_white, 1)
    c1 = (exitselect == 0 ? c_white : c_gray)
    c2 = (exitselect == 1 ? c_white : c_gray)
    draw_text_color(((obj_screensizer.actual_width / 2) - 100), ((obj_screensizer.actual_height / 2) + 30), gml_Script_lang_get_value("option_yes"), c1, c1, c1, c1, 1)
    draw_text_color(((obj_screensizer.actual_width / 2) + 100), ((obj_screensizer.actual_height / 2) + 30), gml_Script_lang_get_value("option_no"), c2, c2, c2, c2, 1)
}
draw_set_colour(c_white)
