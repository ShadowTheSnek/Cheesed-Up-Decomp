if (paletteselect != 0)
{
    shader_set_fix(shd_pal_swapper)
    pal_swap_set(spr_noisepalette, paletteselect, 0)
}
draw_self()
shader_reset()
