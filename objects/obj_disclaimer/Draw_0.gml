if instance_exists(obj_loadingscreen)
    return;
if (!surface_exists(surf))
    surf = surface_create_fix(960, 540)
surface_set_target(surf)
draw_clear_alpha(c_black, 0)
draw_set_colour(c_black)
var xx = (50 * size)
var yy = (32 * size)
var xsiz = (480 * (1 - size))
var ysiz = (270 * (1 - size))
var rectsize = 5
draw_set_alpha(0.85)
draw_roundrect_ext((xx + xsiz), (yy + ysiz), ((960 - xx) - xsiz), ((540 - yy) - ysiz), 12, 12, 0)
gpu_set_blendmode(bm_subtract)
draw_set_alpha(0.15)
draw_roundrect_ext(((xx + xsiz) + rectsize), ((yy + ysiz) + rectsize), (((960 - xx) - xsiz) - rectsize), (((540 - yy) - ysiz) - rectsize), 12, 12, 0)
gpu_set_blendmode(bm_normal)
draw_set_alpha(1)
surface_reset_target()
draw_surface(surf, 0, 0)
if (state == states.normal && menu == 0)
{
    draw_set_align(1, 1)
    draw_set_font(gml_Script_lang_get_font("font_small"))
    draw_set_colour(c_white)
    draw_text((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height / 2), "Checking availability...")
}
if (t >= 1 || menu == 3)
{
    switch menu
    {
        case 0:
            if (state == states.revolver)
            {
                draw_set_halign(fa_center)
                draw_set_valign(fa_middle)
                draw_set_colour(c_white)
                draw_set_font(font1)
                draw_text(480, 254, str)
            }
            break
        case 1:
            draw_set_align(1)
            draw_set_color(c_white)
            var str = "Select which savefiles you want to port from the base game.\nIf you already had saves for this mod, this will replace them!"
            draw_set_font(gml_Script_lang_get_font("font_small"))
            draw_text_color(483, 73, str, c_black, c_black, c_black, c_black, 0.25)
            draw_text(480, 70, str)
            function anon@2083@gml_Object_obj_disclaimer_Draw_0(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_anon@2083@gml_Object_obj_disclaimer_Draw_0
            {
                if (argument4 == undefined)
                    argument4 = ""
                if (argument5 == undefined)
                    argument5 = 600
                if (argument6 == undefined)
                    argument6 = 60
                draw_set_colour(merge_colour(c_black, c_green, (selected[argument0] * 0.35)))
                draw_set_alpha(0.75)
                draw_roundrect(argument1, argument2, (argument1 + argument5), (argument2 + argument6), 0)
                draw_set_font(font1)
                draw_set_colour(c_white)
                draw_set_alpha(1)
                draw_set_align(0, 1)
                draw_text((argument1 + 54), (argument2 + (argument6 / 2)), argument3)
                draw_set_align(2, 1)
                draw_text(((argument1 + argument5) - 32), (argument2 + (argument6 / 2)), argument4)
                draw_roundrect((argument1 + 16), (argument2 + 20), ((argument1 + 16) + 20), (argument2 + 40), 1)
                if selected[argument0]
                {
                    draw_set_font(gml_Script_lang_get_font("smallfont"))
                    draw_text((argument1 + 35), (argument2 + 31), "X")
                }
                if (sel == argument0)
                    draw_sprite(spr_cursor, -1, ((argument1 - 50) + pizzashift[0]), ((argument2 + (argument6 / 2)) + pizzashift[1]))
            }

            var full = 0
            xx = 180
            yy = 140
            if (options != noone && saves[0] != noone && saves[1] != noone && saves[2] != noone)
                full = 1
            if (options != noone)
            {
                str = ""
                if options.ptt
                    str += "(Has PTT mod config)\n"
                self.draw_option(0, xx, yy, "Configuration File", str)
                yy += (full ? 70 : 90)
            }
            for (var i = 0; i < 3; i++)
            {
                if (saves[i] != noone)
                {
                    var xdraw = xx
                    str = ""
                    str += concat(saves[i].percent, "%\n")
                    str += concat(saves[i].minutes, ":", string_replace(string_format(floor(saves[i].seconds), 2, 0), " ", "0"), "\n")
                    self.draw_option((i + 1), xx, yy, concat("Slot ", (i + 1)), str)
                    xdraw += 165
                    if saves[i].john
                    {
                        draw_sprite(spr_menu_approvedjohn, 0, xdraw, (yy + 30))
                        xdraw += 100
                    }
                    if saves[i].snotty
                    {
                        draw_sprite(spr_menu_approvedsnotty, 0, xdraw, (yy + 30))
                        xdraw += 100
                    }
                    var rank = -1
                    switch saves[i].finalrank
                    {
                        case "confused":
                            rank = 0
                            break
                        case "quick":
                            rank = 1
                            break
                        case "officer":
                            rank = 2
                            break
                        case "yousuck":
                            rank = 3
                            break
                        case "nojudgement":
                            rank = 4
                            break
                        case "notbad":
                            rank = 5
                            break
                        case "wow":
                            rank = 6
                            break
                        case "holyshit":
                            rank = 7
                            break
                    }

                    if (rank != -1)
                    {
                        draw_sprite(spr_menu_finaljudgement, rank, (xdraw + 32), ((yy + 30) - 10))
                        xdraw += 100
                    }
                    yy += 70
                }
            }
            draw_set_font(gml_Script_lang_get_font("bigfont"))
            draw_set_align(1)
            draw_text(480, (yy + 20), "OK")
            if (sel == 4)
                draw_sprite(spr_cursor, -1, 416, (yy + 33))
            draw_set_alpha(1)
            break
        case 2:
            message = "i know what you came here for you can suck my big balls"
            break
        case 3:
            draw_clear(c_black)
            draw_set_align()
            if sprite_exists(crash_image)
                draw_sprite_stretched_ext(crash_image, 0, 0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_white, 0.15)
            var crashtext = "The game crashed last time."
            var crashtext2 = "Screenshot this and report it on Discord!"
            draw_set_colour(c_white)
            draw_set_alpha(1)
            draw_set_font(gml_Script_lang_get_font("font_small"))
            yy = 16
            draw_text_transformed(16, yy, crashtext, 2, 2, 0)
            yy += (string_height(crashtext) * 2)
            yy += 16
            draw_set_font(font1)
            draw_set_colour(c_silver)
            draw_text_ext(16, yy, string_replace_all(crash_msg.longMessage, "	", ""), 16, obj_screensizer.actual_width)
            draw_set_font(gml_Script_lang_get_font("creditsfont"))
            scr_draw_text_arr(((obj_screensizer.actual_width / 2) - (array_get(scr_text_arr_size(text), 0) / 2)), (obj_screensizer.actual_height - 64), text)
            break
    }

}
draw_set_alpha(fade_alpha)
draw_set_colour(c_black)
draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), obj_screensizer.actual_width, obj_screensizer.actual_height, false)
draw_set_alpha(1)
