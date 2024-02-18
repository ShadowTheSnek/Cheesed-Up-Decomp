draw_set_font(gml_Script_lang_get_font("bigfont"))
draw_set_align(0)
draw_reset_clip()
switch menu
{
    case 0:
        draw_set_font(gml_Script_lang_get_font("creditsfont"))
        var array = towers
        var i = 0
        while (i < array_length(array))
        {
            var xx = ((100 - cam.x) + random_range((-shake), shake))
            var yy = (((i * 36) - cam.y) + random_range((-shake), shake))
            if (fader <= 0 && sel.y != i)
            {
                i++
                continue
            }
            else if (yy < -32)
            {
                i++
                continue
            }
            else if (yy > obj_screensizer.actual_height)
                break
            else
            {
                draw_set_align(0)
                var this = array[i]
                var str = this.name
                var wd = 512
                var drawx = xx
                if (sel.y == i)
                {
                    draw_set_colour(c_white)
                    if (string_width(str) > wd)
                    {
                        textscroll += 1.5
                        drawx -= clamp((textscroll - 50), 0, (string_width(str) - wd))
                        if (textscroll >= ((string_width(str) - wd) + 200))
                            textscroll = -50
                    }
                }
                else
                {
                    draw_set_colour(c_gray)
                    draw_set_alpha(fader)
                }
                if (this.type == 0)
                    draw_sprite_ext(spr_towericon, 0, (xx - 42), yy, 1, 1, 0, (sel.y == i ? c_white : c_gray), draw_get_alpha())
                draw_set_bounds(xx, yy, (xx + wd), (yy + 32))
                draw_text(drawx, yy, str)
                draw_reset_clip()
                draw_set_alpha(1)
                if ((this.corrupt || this.fresh) && state == states.normal)
                {
                    draw_set_colour((this.corrupt ? c_red : c_yellow))
                    draw_set_align(1, 1)
                    draw_text((((xx - 72) + 8) + (this.type == 1 ? 40 : 0)), ((yy + min(((sin((current_time / 200)) * 15) + 5), 0)) + 20), "!")
                }
                i++
                continue
            }
        }
        if (controls.text == "")
            controls.compiled = -4
        else if (controls.text != controls.text_prev)
        {
            controls.text_prev = controls.text
            controls.compiled = scr_compile_icon_text(controls.text, 1, 1)
        }
        if (controls.compiled != -4)
        {
            draw_set_colour(c_black)
            draw_set_alpha(0.5)
            draw_rectangle(0, (((obj_screensizer.actual_height - 32) - 8) - 8), obj_screensizer.actual_width, obj_screensizer.actual_height, false)
            draw_set_alpha(1)
            scr_draw_text_arr(((obj_screensizer.actual_width - 8) - controls.compiled[2]), ((obj_screensizer.actual_height - 32) - 8), controls.compiled[0])
        }
        if (state == states.normal)
        {
            yy = 0
            draw_set_align(2)
            draw_set_color(c_white)
            if (text_button((obj_screensizer.actual_width - 16), 16, gml_Script_lang_get_value_newline("cyop_browse")) == 2)
            {
                page = 1
                self.fetch_remote_towers(page)
                sel.x = 0
                sel.y = 0
            }
            yy += 1.5
            draw_set_font(gml_Script_lang_get_font("font_small"))
            if (has_pizzatower && directory_exists(towers_folder))
            {
                draw_set_font(gml_Script_lang_get_font("font_small"))
                draw_set_align(2)
                draw_set_color(c_white)
                if (text_button((obj_screensizer.actual_width - 16), (16 + (yy++ * 26)), gml_Script_lang_get_value_newline("cyop_openfolder")) == 2)
                    launch_external(("explorer.exe " + towers_folder))
            }
            draw_set_font(gml_Script_lang_get_font("font_small"))
            draw_set_align(2)
            draw_set_color(c_white)
            if (text_button((obj_screensizer.actual_width - 16), (16 + (yy++ * 26)), gml_Script_lang_get_value_newline("cyop_pickfile")) == 2)
            {
                var load = get_open_filename_ext(string("{0} (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", gml_Script_lang_get_value_newline("cyop_filekind")), "", (environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\"), "Select a custom level")
                if (load != "")
                {
                    state = states.dynamite
                    with (gml_Script_instance_create(0, 0, obj_cyop_loader))
                    {
                        var result = cyop_load(load)
                        if is_string(result)
                        {
                            show_message(result)
                            instance_destroy()
                            other.state = states.normal
                        }
                        else
                            loaded = 1
                    }
                }
            }
            if (array_length(towers) > 0)
            {
                var level = towers[sel.y]
                draw_set_font(gml_Script_lang_get_font("font_small"))
                draw_set_align(2)
                draw_set_color(c_gray)
                draw_text((obj_screensizer.actual_width - 16), (16 + (yy++ * 26)), string("{0}", filename_name(level.file)))
                draw_set_align()
            }
            else
            {
                draw_set_font(gml_Script_lang_get_font("creditsfont"))
                draw_set_align(1, 1)
                draw_text((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height / 2), gml_Script_lang_get_value_newline("cyop_nolevels"))
            }
        }
        break
    case 1:
        if (state != states.dynamite)
        {
            draw_set_colour(c_black)
            draw_set_alpha(0.9)
            draw_roundrect(15, 15, ((obj_screensizer.actual_width - 16) - 1), ((obj_screensizer.actual_height - 16) - 1), 0)
            draw_set_alpha(1)
            draw_set_colour(c_white)
            draw_set_font(gml_Script_lang_get_font("font_small"))
            var center = 754.25
            var boundleft = 17
            var boundtop = 17
            var boundright = (obj_screensizer.actual_width - 16)
            var boundbottom = (obj_screensizer.actual_height - 16)
            draw_set_bounds(boundleft, boundtop, boundright, boundbottom)
        }
        if (state == states.normal)
        {
            image_angle += 5
            draw_sprite_ext(spr_loading, 0, (obj_screensizer.actual_width / 2), (obj_screensizer.actual_height / 2), 1, 1, image_angle, c_white, 1)
            draw_set_align(1)
            draw_text(center, ((obj_screensizer.actual_height - 20) - 50), embed_value_string(gml_Script_lang_get_value_newline("cyop_page"), [page]))
            return;
        }
        else if (state == states.dynamite)
        {
            this = remote_towers[sel.y]
            var scrw = obj_screensizer.actual_width
            var scrh = obj_screensizer.actual_height
            var width = sprite_get_width(this.image)
            var height = sprite_get_height(this.image)
            var scale = min((scrw / height), (scrh / width))
            xx = ((scrw / 2) - ((width / 2) * scale))
            yy = ((scrh / 2) - ((height / 2) * scale))
            gpu_set_tex_filter(1)
            draw_sprite_ext(this.image, 0, xx, yy, scale, scale, 0, c_white, 1)
            gpu_set_tex_filter(0)
            if mouse_check_button_pressed(mb_left)
                state = states.revolver
        }
        else
        {
            var xxstart = 36
            var yystart = 32
            xx = xxstart
            yy = yystart
            var col1 = merge_color(0xB80050, c_white, 0.5)
            var col2 = merge_color(0xD07010, c_white, 0.5)
            for (i = 0; i < array_length(remote_towers); i++)
            {
                this = remote_towers[i]
                scale = 0.3
                var sprw = (530 * scale)
                var sprh = (298 * scale)
                if (!((((yy - scroll) + 200) < boundtop || (yy - scroll) >= boundbottom)))
                {
                    var hovering = point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), xx, (yy - scroll), (xx + sprw), ((yy + 180) - scroll))
                    if hovering
                    {
                        draw_set_bounds(boundleft, boundtop, boundright, boundbottom)
                        draw_rectangle_color((xx - 4), ((yy - 4) - scroll), ((xx + sprw) + 4), (((yy + 180) + 4) - scroll), c_aqua, c_aqua, c_aqua, c_aqua, 1)
                        if mouse_check_button_pressed(mb_left)
                        {
                            if (sel.y == i)
                                sel.y = -1
                            else
                                sel.y = i
                        }
                    }
                    draw_set_bounds(xx, max((yy - scroll), boundtop), (xx + 160), min(((yy + 200) - scroll), boundbottom))
                    draw_set_colour(c_white)
                    if (sel.y > -1 && sel.y != i)
                        draw_set_colour(0x555555)
                    draw_rectangle_color(xx, (yy - scroll), ((xx + sprw) - 1), (((yy + sprh) - 1) - scroll), c_black, c_black, c_black, c_black, 0)
                    draw_sprite_ext(spr_loading, 0, (xx + (sprw / 2)), ((yy + (sprh / 2)) - scroll), 0.5, 0.5, current_time, c_white, 1)
                    gpu_set_tex_filter(1)
                    if sprite_exists(this.image)
                    {
                        var actual_w = (sprite_get_width(this.image) * scale)
                        var actual_h = (sprite_get_height(this.image) * scale)
                        scale = min((sprw / actual_w), (sprh / actual_h))
                        actual_w *= scale
                        actual_h *= scale
                        draw_sprite_stretched_ext(this.image, 0, ((xx + (sprw / 2)) - (actual_w / 2)), (((yy - scroll) + (sprh / 2)) - (actual_h / 2)), actual_w, actual_h, draw_get_colour(), 1)
                    }
                    gpu_set_tex_filter(0)
                    draw_set_font(gml_Script_lang_get_font("smallfont"))
                    draw_set_alpha(0.5)
                    draw_sprite_ext(spr_browsericons, 1, xx, (((yy + 100) - scroll) + 64), 1, 1, 0, draw_get_colour(), 0.5)
                    var viewsstr = this.views
                    if (this.views > 1000)
                        viewsstr = (string_replace(string_format((this.views / 1000), 1, 1), ".0", "") + gml_Script_lang_get_value_newline("cyop_thousand"))
                    draw_text((xx + 16), (((yy + 100) - scroll) + 64), viewsstr)
                    draw_sprite_ext(spr_browsericons, 2, ((xx + 32) + string_width(viewsstr)), (((yy + 100) - scroll) + 64), 1, 1, 0, draw_get_colour(), 0.5)
                    draw_text((((xx + 16) + 32) + string_width(viewsstr)), (((yy + 100) - scroll) + 64), this.posts)
                    draw_set_alpha(1)
                    draw_set_font(gml_Script_lang_get_font("font_small"))
                    str = this.name
                    if (string_length(str) > 50)
                        str = (string_copy(str, 1, 50) + "...")
                    if this.downloaded
                        draw_text_ext_color(xx, ((yy + 96) - scroll), str, 16, 170, col1, col2, col2, col1, ((sel.y != -1 && sel.y != i) ? 0.25 : 1))
                    else
                        draw_text_ext(xx, ((yy + 96) - scroll), str, 16, 170)
                }
                xx += 180
                if ((i % 3) == 2 && i != (array_length(remote_towers) - 1))
                {
                    xx = xxstart
                    yy += 200
                }
            }
            draw_reset_clip()
            if (yy > obj_screensizer.actual_height)
            {
                var maxscroll = (((yy + 200) - obj_screensizer.actual_height) + 16)
                if mouse_wheel_up()
                    scroll -= 42
                if mouse_wheel_down()
                    scroll += 42
                scroll = clamp(scroll, 0, maxscroll)
            }
            else
                scroll = 0
            draw_set_alpha(1)
            xx = 582
            yy = 32
            if (sel.y > -1)
            {
                this = remote_towers[sel.y]
                scale = 0.65
                sprw = (530 * scale)
                sprh = (298 * scale)
                draw_set_colour(c_white)
                draw_set_align(1)
                gpu_set_tex_filter(1)
                if sprite_exists(this.image)
                {
                    scale *= min((530 / sprite_get_width(this.image)), (298 / sprite_get_height(this.image)))
                    draw_sprite_ext(this.image, 0, ((xx + 172.25) - ((sprite_get_width(this.image) * scale) / 2)), yy, scale, scale, 0, c_white, 1)
                    if point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), xx, yy, (xx + sprw), (yy + sprh))
                    {
                        if mouse_check_button_pressed(mb_left)
                        {
                            state = states.dynamite
                            return;
                        }
                    }
                }
                gpu_set_tex_filter(0)
                yy += (sprite_get_height(this.image) * scale)
                yy += 16
                draw_text_ext(center, yy, this.name, 16, (xx * scale))
                yy += string_height_ext(this.name, 16, (xx * scale))
                yy += 16
                hovering = point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), (center - 100), yy, (center + 100), (yy + 42))
                col1 = ((hovering * 2236962) + 12058704)
                col2 = ((hovering * 2236962) + 13660176)
                var download = downloads[sel.y]
                if hovering
                {
                    if (mouse_check_button_pressed(mb_left) && download == noone && (!this.corrupt))
                    {
                        if this.downloaded
                        {
                            i = 0
                            while (i < array_length(towers))
                            {
                                var curr = towers[i]
                                if (filename_name(filename_dir(curr.file)) == this.modid)
                                {
                                    if (!file_exists(curr.file))
                                        curr.corrupt = 1
                                    if curr.corrupt
                                    {
                                    }
                                    else
                                    {
                                        sel.y = i
                                        stop_music()
                                        sound_play("event:/sfx/misc/collectpizza")
                                        menu = 0
                                        state = states.revolver
                                    }
                                    break
                                }
                                else
                                {
                                    i++
                                    continue
                                }
                            }
                        }
                        else
                            self.fetch_tower_download(sel.y)
                    }
                }
                if (download != noone && download.progress > 0)
                    draw_rectangle_color((center - 100), yy, ((center - 100) + (download.progress * 200)), (yy + 42), c_green, c_lime, c_lime, c_green, 0)
                draw_rectangle_color((center - 100), yy, (center + 100), (yy + 42), col1, col2, col2, col1, (download != noone || this.corrupt))
                if (state != states.revolver)
                    draw_sprite_ext(spr_loading, 0, center, (yy + 21), 1, 1, (current_time / 2), c_white, 1)
                str = gml_Script_lang_get_value_newline("cyop_download")
                if this.downloaded
                    str = gml_Script_lang_get_value_newline("cyop_downloaded")
                if this.corrupt
                    str = gml_Script_lang_get_value_newline("cyop_error")
                if (download != noone)
                {
                    if (download.state == states.normal)
                        str = gml_Script_lang_get_value_newline("cyop_finding")
                    if (download.state == states.revolver)
                        str = gml_Script_lang_get_value_newline("cyop_downloading")
                    if (download.state == states.dynamite)
                        str = gml_Script_lang_get_value_newline("cyop_extracting")
                }
                draw_text(center, (floor(yy) + 14), str)
                yy += 64
                draw_set_colour(c_gray)
                draw_text((xx + 172.25), yy, embed_value_string(gml_Script_lang_get_value_newline("cyop_levelstats"), [this.views, this.likes, this.posts]))
                if (text_button((xx + 172.25), (yy + 42), gml_Script_lang_get_value_newline("cyop_openbrowser")) == 2)
                    url_open(this.url)
            }
            draw_reset_clip()
            draw_set_align(1)
            if (state == states.revolver && download_count == 0)
            {
                if (text_button(center, ((obj_screensizer.actual_height - 20) - 30), gml_Script_lang_get_value_newline("cyop_close")) == 2)
                {
                    sel.y = 0
                    self.image_cleanup()
                    remote_towers = []
                    menu = 0
                    state = states.normal
                    filter = 0
                    return;
                }
            }
            draw_set_colour(c_white)
            yy = ((obj_screensizer.actual_height - 20) - 50)
            if (text_button(center, yy, embed_value_string(gml_Script_lang_get_value_newline("cyop_page"), [page])) == 2)
            {
                if (state == states.revolver && download_count == 0)
                {
                    var pag = get_integer(gml_Script_lang_get_value_newline("cyop_gotopage"), page)
                    if (pag != undefined && pag != page && pag >= 1)
                    {
                        page = pag
                        self.fetch_remote_towers(page)
                    }
                }
            }
            if (array_length(remote_towers) > 0 && download_count == 0)
            {
                if (page != 1)
                {
                    if (text_button((center - 60), yy, "<") == 2)
                    {
                        sel.y = -1
                        page--
                        self.fetch_remote_towers(page)
                    }
                }
                if (!last_page)
                {
                    if (text_button((center + 60), yy, ">") == 2)
                    {
                        sel.y = -1
                        page++
                        self.fetch_remote_towers(page)
                    }
                }
            }
            if (sel.y == -1)
            {
                if (download_count == 0)
                {
                    yy = 70
                    var selected = filter == (3 << 0)
                    if (text_button((center - 80), yy, gml_Script_lang_get_value_newline("cyop_sortviews"), (selected ? col1 : 16777215), (selected ? 255 : 16776960)) == 2)
                    {
                        if (filter == (3 << 0))
                            filter = 0
                        else
                            filter = (3 << 0)
                        page = 1
                        self.fetch_remote_towers(page)
                    }
                    selected = filter == (1 << 0)
                    if (text_button(center, yy, gml_Script_lang_get_value_newline("cyop_sortdownloads"), (selected ? col1 : 16777215), (selected ? 255 : 16776960)) == 2)
                    {
                        if (filter == (1 << 0))
                            filter = 0
                        else
                            filter = (1 << 0)
                        page = 1
                        self.fetch_remote_towers(page)
                    }
                    selected = filter == (2 << 0)
                    if (text_button((center + 80), yy, gml_Script_lang_get_value_newline("cyop_sortlikes"), (selected ? col1 : 16777215), (selected ? 255 : 16776960)) == 2)
                    {
                        if (filter == (2 << 0))
                            filter = 0
                        else
                            filter = (2 << 0)
                        page = 1
                        self.fetch_remote_towers(page)
                    }
                    draw_set_color(c_gray)
                    draw_text(center, (yy - 20), gml_Script_lang_get_value_newline("cyop_sortby"))
                }
                draw_set_color(c_white)
                draw_text(center, ((obj_screensizer.actual_height / 2) - 16), (download_count > 0 ? (download_count == 1 ? gml_Script_lang_get_value_newline("cyop_wait1") : embed_value_string(gml_Script_lang_get_value_newline("cyop_wait2"), [download_count])) : gml_Script_lang_get_value_newline("cyop_tip")))
            }
        }
        break
}

draw_set_align()
