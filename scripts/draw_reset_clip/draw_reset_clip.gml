function draw_reset_clip() //gml_Script_draw_reset_clip
{
    if (shader_current() != shd_masterclip_basic)
        shader_set_fix(shd_masterclip)
    draw_remove_bounds()
    draw_remove_mask()
    draw_remove_spotlight()
    shader_reset()
}

