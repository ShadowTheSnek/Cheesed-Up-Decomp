function draw_restore_state(argument0) //gml_Script_draw_restore_state
{
    gpu_pop_state()
    shader_set_fix(argument0.shader)
    draw_set_color(argument0.color)
    draw_set_alpha(argument0.alpha)
    draw_set_font(argument0.font)
    draw_set_valign(argument0.valign)
    draw_set_halign(argument0.halign)
    matrix_set(2, argument0.world_matrix)
}

