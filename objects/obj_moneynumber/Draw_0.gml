draw_set_font(global.moneyfont)
draw_set_halign(fa_center)
var c = c_lime
draw_set_color(c)
if flash
    draw_set_flash()
draw_text(x, y, number)
if flash
    draw_reset_flash()
