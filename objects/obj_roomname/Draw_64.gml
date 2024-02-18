var r = string_letters(room_get_name(room))
if (string_pos("midway", r) || string_pos("treasure", r))
    return;
var sugary = check_sugary()
if (yi <= -36)
    return;
var msg = global.roommessage
var yy = yi
var xi = (global.gameplay ? (obj_screensizer.actual_width / 2) : 500)
if (msg == "")
    return;
if ((level && global.sugaryoverride) || room == tower_baby)
{
    xi = 192
    yy = ((obj_screensizer.actual_height - yy) - 6)
}
draw_set_font(gml_Script_lang_get_font("smallfont"))
draw_set_align(1, 1)
draw_set_color(c_white)
draw_sprite((sugary ? spr_roomnamebg_ss : spr_roomnamebg), 0, xi, yy)
draw_text_ext(xi, (yy + 8), msg, 12, 280)
