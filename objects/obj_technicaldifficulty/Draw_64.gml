if use_static
    draw_sprite_stretched(spr_tvstatic, static_index, 0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height)
else
{
    gml_Script_screen_clear(make_color_rgb(216, 104, 160))
    var cx = obj_screensizer.normal_size_fix_x
    var cy = obj_screensizer.normal_size_fix_y
    var bg = spr_technicaldifficulty_bg
    draw_sprite(bg, 0, cx, cy)
    pal_swap_player_palette(undefined, undefined, undefined, undefined, undefined, sprite == spr_technicaldifficulty4)
    if (chara == "BN" || chara == "N" || chara == "SP")
        draw_sprite(sprite, 0, 0, 0)
    else
        draw_sprite(sprite, 0, (cx + 300), (cy + 352))
    pal_swap_reset()
}
