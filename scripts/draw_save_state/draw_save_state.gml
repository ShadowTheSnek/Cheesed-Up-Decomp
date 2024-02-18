function draw_save_state() //gml_Script_draw_save_state
{
    gpu_push_state()
    return 
    {
        shader: shader_current(),
        color: draw_get_color(),
        alpha: draw_get_alpha(),
        font: draw_get_font(),
        valign: draw_get_valign(),
        halign: draw_get_halign(),
        world_matrix: matrix_get(2)
    };
}

