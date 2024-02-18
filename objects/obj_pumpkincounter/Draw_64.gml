if (!global.option_hud)
    return;
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.moneyfont)
draw_sprite(spr_pumpkinsleft, 0, 64, (obj_screensizer.actual_height - 60))
draw_text_color(64, (obj_screensizer.actual_height - 60), string(counter), c_white, c_white, c_white, c_white, 1)
