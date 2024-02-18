if isgustavo
{
    pal_swap_player_palette(undefined, undefined, undefined, undefined, undefined, 1)
    draw_self()
    pal_swap_reset()
}
else if snotty
{
    shader_set_fix(shd_pal_swapper)
    pal_swap_set(palette_cheeseslime, 1, 0)
    draw_self()
    shader_reset()
}
else
    event_inherited()
