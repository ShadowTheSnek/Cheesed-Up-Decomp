function draw_set_bounds(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_draw_set_bounds
{
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if global.performance
        return 0;
    if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
    {
        var shader = (argument5 ? shd_masterclip_basic : shd_masterclip)
        shader_set_fix(shader)
    }
    shader = shader_current()
    var clip_bounds_pos = shader_get_uniform(shader, "u_clip_bounds")
    var alphafix_pos = shader_get_uniform(shader, "u_rect_alphafix")
    var inverse_pos = shader_get_uniform(shader, "u_rect_inverse")
    shader_set_uniform_f(shader_get_uniform(shader, "u_dorectclip"), 1)
    shader_set_uniform_f(clip_bounds_pos, argument0, argument1, argument2, argument3)
    shader_set_uniform_f(alphafix_pos, argument4)
    shader_set_uniform_f(inverse_pos, argument6)
    return 1;
}

