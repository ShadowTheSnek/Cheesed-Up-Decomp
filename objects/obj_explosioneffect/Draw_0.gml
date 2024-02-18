if (!sprite_exists(sprite_index))
    return;
draw_self()
if (sprite_index == spr_pepclone_death && global.stylethreshold >= 3)
{
    shader_set_fix(shd_pal_swapper)
    pal_swap_set(spr_peppalette, 2, 0)
    draw_self()
    pal_swap_reset()
}
