pal_swap_player_palette(undefined, undefined, undefined, undefined, undefined, 1)
draw_self()
if (sprite_exists(global.palettetexture) && clone)
{
    pattern_reset()
    cuspal_reset()
    pal_swap_set(spr_peppalette, 13, 0)
    draw_self()
}
pal_swap_reset()
