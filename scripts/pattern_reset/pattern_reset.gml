function pattern_reset() //gml_Script_pattern_reset
{
    var g = shader_current()
    shader_set_fix(shd_pal_swapper)
    pattern_enable(0)
    shader_set_fix(g)
}

