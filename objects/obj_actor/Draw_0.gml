if use_palette
{
    shader_set_fix(shd_pal_swapper)
    pal_swap_set(spr_palette, paletteselect, 0)
    draw_self()
    shader_reset()
}
else
    draw_self()
