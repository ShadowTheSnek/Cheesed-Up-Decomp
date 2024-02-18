if start
{
    draw_sprite(bgsprite, bgindex, 0, 0)
    var cy = irandom_range((-shake_mag), shake_mag)
    var img = image_index
    if (sprite_index == spr_taxitransition_pep)
    {
        draw_sprite(sprite_index, 0, 0, cy)
        img = 1
    }
    pal_swap_player_palette(sprite_index, img)
    draw_sprite(sprite_index, img, 0, cy)
    pal_swap_reset()
}
gml_Script_toggle_alphafix(1)
draw_set_alpha(fade)
draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
gml_Script_toggle_alphafix(0)
