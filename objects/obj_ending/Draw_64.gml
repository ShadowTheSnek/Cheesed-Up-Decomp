if (state == states.boots)
{
    draw_set_font(gml_Script_lang_get_font("creditsfont"))
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    scr_draw_text_arr(16, (obj_screensizer.actual_height - 48), skiptext)
}
