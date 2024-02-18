if (gui && visible)
{
    if sprite_exists(spr_palette)
        pal_swap_set(spr_palette, paletteselect, 0)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha)
    pal_swap_reset()
}
