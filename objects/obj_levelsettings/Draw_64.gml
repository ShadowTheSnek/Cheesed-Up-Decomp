anim_t = Approach(anim_t, 1, 0.035)
var curve = animcurve_channel_evaluate(outback, anim_t)
if keyboard_check_pressed(ord("R"))
    event_perform(ev_create, 0)
draw_set_alpha(1)
if (menu == 1)
{
    if (curve < 1)
    {
        shader_reset()
        draw_circle(((obj_screensizer.actual_width / 2) - 1), ((obj_screensizer.actual_height / 2) - 1), (((obj_screensizer.actual_width / 1.7142857142857142) * curve) + (5 * ((anim_t * pi) + 1))), 0)
        draw_set_spotlight((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height / 2), ((obj_screensizer.actual_width / 1.7142857142857142) * curve), 1)
    }
    draw_sprite_tiled((global.SUGARY ? bg_options_ss : spr_optionsBG), 5, ++x, x)
    event_inherited()
    draw_reset_clip()
}
draw_set_alpha(fadealpha)
draw_set_colour(c_black)
gml_Script_toggle_alphafix(1)
draw_rectangle(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, false)
draw_set_alpha(1)
gml_Script_toggle_alphafix(0)
