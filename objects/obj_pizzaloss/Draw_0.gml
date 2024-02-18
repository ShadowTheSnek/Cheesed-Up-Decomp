if (spr_palette != -4)
{
    shader_set_fix(shd_pal_swapper)
    pal_swap_set(spr_palette, paletteselect, 0)
    draw_self()
    pal_swap_reset()
}
else
    draw_self()
