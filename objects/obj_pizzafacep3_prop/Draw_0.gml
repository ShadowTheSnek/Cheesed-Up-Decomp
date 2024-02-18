if (!usepalette)
    draw_self()
else
{
    pal_swap_player_palette(undefined, undefined, undefined, undefined, undefined, 1)
    draw_self()
    pal_swap_reset()
}
