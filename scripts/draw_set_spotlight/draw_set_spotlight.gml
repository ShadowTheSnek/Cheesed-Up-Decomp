function draw_set_spotlight(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_draw_set_spotlight
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if global.performance
        return 0;
    if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
    {
        var shader = (argument4 ? shd_masterclip_basic : shd_masterclip)
        shader_set_fix(shader)
    }
    shader = shader_current()
    var origin_pos = shader_get_uniform(shader, "u_origin")
    var radius_pos = shader_get_uniform(shader, "u_radius")
    var alphafix_pos = shader_get_uniform(shader, "u_circle_alphafix")
    var inverse = shader_get_uniform(shader, "u_circle_inverse")
    shader_set_uniform_f(shader_get_uniform(shader, "u_docircleclip"), 1)
    shader_set_uniform_f(origin_pos, argument0, argument1)
    shader_set_uniform_f(radius_pos, argument2)
    shader_set_uniform_f(alphafix_pos, argument3)
    shader_set_uniform_f(inverse, argument5)
    return 1;
}

