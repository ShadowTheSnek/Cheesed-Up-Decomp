if (global.timeattack == 1)
{
    draw_set_font(gml_Script_lang_get_font("bigfont"))
    draw_set_halign(fa_center)
    draw_set_color(c_yellow)
    if (global.taseconds < 10)
        draw_text((random_range(1, -1) + 480), (random_range(1, -1) + 450), string_hash_to_newline(((string(global.taminutes) + ":0") + string(global.taseconds))))
    else if (global.taseconds >= 10)
        draw_text((random_range(1, -1) + 480), (random_range(1, -1) + 450), string_hash_to_newline(((string(global.taminutes) + ":") + string(global.taseconds))))
}
