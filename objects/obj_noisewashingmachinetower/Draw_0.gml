if (obj_player.character == "N" && obj_player1.paletteselect != 20)
{
    shader_set_fix(shd_pal_swapper)
    pal_swap_set(spr_noisepalette, 20, 0)
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
shader_reset()
