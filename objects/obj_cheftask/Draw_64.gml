if (sprite_index != spr_newclothes)
{
    draw_sprite_safe(sprite_index, image_index, x, y)
    draw_sprite(achievement_spr, achievement_index, x, (y - 80))
}
else
{
    shader_set_fix(shd_pal_swapper)
    if (texture != -4)
        pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, texture)
    pal_swap_set(spr_peppalette, paletteselect, 0)
    draw_sprite_safe(sprite_index, image_index, x, y)
    if (texture != -4)
        pattern_reset()
    gml_Script_reset_shader_fix()
}
