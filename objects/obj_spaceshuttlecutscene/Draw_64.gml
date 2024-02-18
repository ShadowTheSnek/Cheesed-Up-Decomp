gml_Script_toggle_alphafix(1)
if start
{
    var bgx = bg_x
    var bgy = (bg_y - 200)
    draw_sprite_tiled(bg_space1, 0, bgx, bgy)
    shader_set_fix(shd_pal_swapper)
    var cx = irandom_range((-shake_mag), shake_mag)
    var cy = irandom_range((-shake_mag), shake_mag)
    pal_swap_player_palette(undefined, undefined, undefined, undefined, undefined, 1)
    draw_sprite(sprite_index, image_index, cx, cy)
    pal_swap_reset()
}
draw_set_alpha(fade)
draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
if instance_exists(obj_fadeout)
{
    draw_set_alpha(obj_fadeout.fadealpha)
    draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
    draw_set_alpha(1)
}
