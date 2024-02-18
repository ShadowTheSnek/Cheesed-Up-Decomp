function scr_pausedraw_ss() //gml_Script_scr_pausedraw_ss
{
    if (fade > 0)
    {
        draw_set_color(c_white)
        if pause
        {
            draw_set_alpha(1)
            scr_draw_pause_image()
        }
        var xscale = (obj_screensizer.actual_width / 960)
        var yscale = (obj_screensizer.actual_height / 540)
        var xx = floor(((obj_screensizer.actual_width / 2) - 480))
        var yy = floor(((obj_screensizer.actual_height / 2) - 270))
        draw_set_alpha((pause ? (fade * 2) : fade))
        draw_sprite_tiled_ext(spr_pausebg_ss, 0, (((current_time / 60) % 250) * xscale), (((current_time / 60) % 100) * yscale), xscale, yscale, c_white, draw_get_alpha())
        gml_Script_toggle_alphafix(0)
        var bordercolor = 0x2A0005
        draw_reset_clip()
        draw_set_bounds((xx + 1), (yy + 1), ((xx + 960) - 1), ((yy + 540) - 1), 0, 0, 1)
        draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, bordercolor, bordercolor, bordercolor, bordercolor, 0)
        draw_reset_clip()
        draw_sprite(spr_pause_ss, 0, xx, yy)
        if (global.leveltosave != -4)
        {
            draw_sprite(spr_pauseconfecti1, global.shroomfollow, xx, yy)
            draw_sprite(spr_pauseconfecti2, global.cheesefollow, xx, yy)
            draw_sprite(spr_pauseconfecti3, global.tomatofollow, xx, yy)
            draw_sprite(spr_pauseconfecti4, global.sausagefollow, xx, yy)
            draw_sprite(spr_pauseconfecti5, global.pineapplefollow, xx, yy)
        }
        var char = 0
        switch character
        {
            case "SN":
                char = 1
                break
            case "P":
                char = 2
                break
            case "N":
                char = 3
                break
        }

        shader_set_fix(shd_pal_swapper)
        pattern_set(global.Base_Pattern_Color, spr_pause_char, ((char * 2) + global.panic), 1, 1, global.palettetexture)
        pal_swap_set(spr_palette, paletteselect, 0)
        draw_sprite(spr_pause_char, ((char * 2) + global.panic), (xx + 686), (yy + 285))
        pal_swap_reset()
        draw_set_font(gml_Script_lang_get_font("bigfont"))
        draw_set_align(1)
        draw_set_color(c_white)
        var _x = (xx + 86)
        var _y = (yy + 40)
        if (global.level_seconds > 10)
            draw_text(_x, _y, ((string(global.level_minutes) + ":") + string(floor(global.level_seconds))))
        if (global.level_seconds < 10)
            draw_text(_x, _y, ((string(global.level_minutes) + ":0") + string(floor(global.level_seconds))))
        var unselected_color = 0xAF9494
        var len = array_length(pause_menu)
        for (var i = 0; i < len; i++)
        {
            _x = (xx + lerp(191, 68, (i / (len - 1))))
            _y = (yy + lerp(20, 393, (i / (len - 1))))
            draw_sprite(spr_pausebutton_ss, selected != i, _x, _y)
            draw_set_align(0, 1)
            var str = pause_menu[i]
            switch str
            {
                case "pause_resume":
                    str = "RESUME"
                    break
                case "pause_options":
                    str = "OPTIONS"
                    break
                case "pause_restart":
                    str = "RETRY"
                    break
                case "pause_exit":
                    str = "EXIT\n  STAGE"
                    break
                case "pause_exit_title":
                    str = "EXIT\n  STAGE"
                    break
                case "pause_jukebox":
                    str = "CLEAR\n JUKEBOX"
                    break
                case "pause_achievements":
                    str = "CHEF\n TASKS"
                    break
                default:
                    str = string_upper(str)
                    break
            }

            draw_set_colour((selected == i ? c_white : unselected_color))
            draw_text_ext(floor(((_x + 155) - (string_width(str) / 2))), (floor(_y) + 70), str, 38, 960)
        }
    }
    draw_set_align()
    draw_set_alpha(1)
}

