if (curr_state != noone && room == curr_state.room)
{
    if global.performance
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_purple, 1)
        return;
    }
    if (!surface_exists(surf))
        surf = surface_create_fix(200, 200)
    surface_set_target(surf)
    draw_clear_alpha(c_black, 0)
    shader_set_fix(shd_mach3effect)
    shader_set_uniform_f(color1, 1, 1, 1)
    shader_set_uniform_f(color2, 0, 0, 0)
    draw_sprite_ext(sprite_index, image_index, 100, 100, image_xscale, image_yscale, image_angle, c_white, 1)
    surface_reset_target()
    shader_reset()
    var scaled_size = 200
    var x_pos = (x - (scaled_size / 2))
    var y_pos = (y - (scaled_size / 2))
    draw_set_mask_texture(x_pos, y_pos, surface_get_texture(surf))
    var target_distance_x = (x - target_object.x)
    var target_distance_y = (y - target_object.y)
    draw_sprite_ext(spr_cosmicclone_layer1, 0, x_pos, y_pos, 3.125, 3.125, 0, c_white, 1)
    draw_sprite_stretched(spr_cosmicclone_layer2, 0, ((x_pos - ((layer_offsets[0] + (target_distance_x / 3)) % 64)) - 64), (y_pos + (target_distance_y % 64)), 328, 328)
    draw_sprite_stretched(spr_cosmicclone_layer3, 0, ((x_pos - ((layer_offsets[2] + (target_distance_x / 6)) % 64)) - 64), (y_pos + (target_distance_y % 64)), 328, 328)
    draw_sprite_stretched(spr_cosmicclone_layer4, layer_4_index, ((x_pos - ((layer_offsets[4] + (target_distance_x / 9)) % 64)) - 64), (y_pos + (target_distance_y % 64)), 328, 328)
    draw_reset_clip()
}
