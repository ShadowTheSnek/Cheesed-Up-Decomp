function draw_remove_spotlight() //gml_Script_draw_remove_spotlight
{
    if (global.performance || (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic))
        return 0;
    shader_set_uniform_f(shader_get_uniform(shader_current(), "u_docircleclip"), 0)
    return 1;
}

