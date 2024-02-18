function pal_swap_reset() //gml_Script_pal_swap_reset
{
    if global.performance
        return;
    shader_set_fix(shd_pal_swapper)
    shader_set_uniform_f(global.Pal_Index, 0)
    pattern_reset()
    cuspal_reset()
    shader_reset()
    if (event_number == 64)
        gml_Script_reset_shader_fix()
}

