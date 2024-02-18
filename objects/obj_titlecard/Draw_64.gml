gml_Script_toggle_alphafix(1)
draw_set_alpha(1)
if start
{
    var xscale = (obj_screensizer.actual_width / 960)
    var yscale = (obj_screensizer.actual_height / 540)
    if (!instance_exists(obj_cyop_loader))
    {
        if (global.gameplay && obj_player1.spr_palette == spr_peppalette)
            pal_swap_player_palette(titlecard_sprite, titlecard_index, 1, 1)
        else
        {
            shader_set_fix(shd_pal_swapper)
            pal_swap_set(spr_peppalette, 1)
        }
    }
    draw_sprite_ext(titlecard_sprite, titlecard_index, 0, 0, xscale, yscale, 0, c_white, 1)
    pal_swap_reset()
    draw_sprite_ext(title_sprite, title_index, ((32 * xscale) + irandom_range(-1, 1)), irandom_range(-1, 1), xscale, yscale, 0, c_white, 1)
}
if (!instance_exists(obj_fadeout))
    draw_set_alpha(fadealpha)
else
    draw_set_alpha(obj_fadeout.fadealpha)
draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
gml_Script_toggle_alphafix(0)
