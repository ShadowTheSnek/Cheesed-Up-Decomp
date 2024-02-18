function cuspal_set(argument0) //gml_Script_cuspal_set
{
    if 1
    {
    }
    else
    {
        uniform_enable = shader_get_uniform(shd_pal_swapper, "custom_enable")
        uniform_array = shader_get_uniform(shd_pal_swapper, "custom_palette")
    }
    if (array_length(argument0) != 64)
        show_error("Array length of custom palette must be 64", 1)
    shader_set_fix(shd_pal_swapper)
    shader_set_uniform_i(uniform_enable, 1)
    shader_set_uniform_f_array(uniform_array, argument0)
}

function cuspal_reset() //gml_Script_cuspal_reset
{
    if 1
    {
    }
    else
        uniform_enable = shader_get_uniform(shd_pal_swapper, "custom_enable")
    var shd = shader_current()
    shader_set_fix(shd_pal_swapper)
    shader_set_uniform_i(uniform_enable, 0)
    shader_set_fix(shd)
}

