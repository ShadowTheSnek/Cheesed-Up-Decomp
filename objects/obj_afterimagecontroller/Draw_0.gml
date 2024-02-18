for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        if visible
        {
            b = image_blend
            var a = other.alpha[identifier]
            var shd = 0
            gpu_set_blendmode(bm_normal)
            shader_reset()
            if (identifier == (3 << 0))
            {
                a = alpha
                shd = 1
                draw_set_flash(make_color_rgb(247.35, 109.64999999999999, 22.95))
            }
            else if (identifier == (4 << 0))
            {
                a = alpha
                shd = 1
                draw_set_flash(global.blueimg_color)
            }
            else if (identifier == (6 << 0) || (identifier == (2 << 0) && global.gameplay))
            {
                a = alpha
                shd = 1
                draw_set_flash(make_color_rgb(233, 47, 0))
            }
            else if (identifier == (7 << 0))
            {
                a = alpha
                shd = 1
                draw_set_flash(c_red)
            }
            else if (identifier == (5 << 0))
            {
                a = alpha
                b = get_dark(other.image_blend, obj_drawcontroller.use_dark, 1, x, y)
                if (obj_drawcontroller.use_dark && global.SUGARY)
                {
                    shd = 1
                    draw_set_flash(b)
                }
                else if (instance_exists(playerid) && playerid.usepalette)
                {
                    shd = 1
                    var pal = playerid.spr_palette
                    shader_set_fix(shd_pal_swapper)
                    pal_swap_set(pal, playerid.paletteselect, 0)
                    if (playerid.object_index == obj_player1)
                        pal_swap_player_palette()
                }
            }
            else if (identifier == (1 << 0) || identifier == (0 << 0))
            {
                var trans = check_char("SP")
                if ((global.gameplay || trans) && (!global.performance))
                {
                    shader_set_fix(shd_mach3effect)
                    shd = 1
                    shader_set_uniform_f(other.color1, (color_get_red(b) / 255), (color_get_green(b) / 255), (color_get_blue(b) / 255))
                    b = make_color_hsv(color_get_hue(b), (color_get_saturation(b) * 1.25), (trans ? 75 : 35))
                    shader_set_uniform_f(other.color2, (color_get_red(b) / 255), (color_get_green(b) / 255), (color_get_blue(b) / 255))
                    b = 16777215
                }
                else
                {
                    if (b == global.mach_color1)
                        b = other.mach_color1
                    if (b == global.mach_color2)
                        b = other.mach_color2
                }
            }
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, a)
            if shd
            {
                cuspal_reset()
                pattern_reset()
                pal_swap_reset()
                draw_reset_flash()
            }
        }
    }
}
