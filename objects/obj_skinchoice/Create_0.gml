event_inherited()
init = 0
charshift = [0, 0, 0]
player_surface = surface_create_fix(256, 256)
shown_tip = 0
custom_enable = 0
custom_palette = array_create(64, 1)
noisetype = 0
sel = 
{
    var pal: 1,
    var char: 0,
    mix: 0,
    side: 0
}

flashpal = [-1, 0]
characters = [["P", spr_player_idle, spr_peppalette, [1, 3], 6], ["N", spr_playerN_idle, spr_noisepalette, [1, 3]], ["V", spr_playerV_idle, spr_vigipalette, [1, 5]], ["G", spr_player_ratmountidle, spr_peppalette, [1, 3]], ["S", spr_snick_idle, spr_snickpalette, [1, 4]], ["SP", spr_playerSP_idle, spr_pizzypalette, [1, 3]], ["SN", spr_pizzano_idle, spr_pizzanopalette, [1, 5]], ["BN", spr_playerBN_idle, spr_bopalette, [1, 5]]]
palettes = []
mixables = []
unlockables = []
custom_palettes = global.custom_palettes
if (!global.sandbox)
    array_push(unlockables, "unfunny", "money", "sage", "blood", "tv", "dark", "shitty", "golden", "garish", "mooney", "funny", "itchy", "pizza", "stripes", "goldemanne", "bones", "pp", "war", "john", "candy", "bloodstained", "bat", "pumpkin", "fur", "flesh")
array_push(unlockables, "mario", "grinch")
function add_palette@gml_Object_obj_skinchoice_Create_0(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_add_palette@gml_Object_obj_skinchoice_Create_0
{
    if (argument2 == undefined)
        argument2 = -4
    if (argument3 == undefined)
        argument3 = "PALETTE"
    if (argument4 == undefined)
        argument4 = "(No Description)"
    if (array_get_index(unlockables, argument1, 0, infinity) != -1)
    {
        ini_open_from_string(obj_savesystem.ini_str_options)
        if (!(ini_read_real("Palettes", argument1, 0)))
        {
            ini_close()
            return;
        }
        ini_close()
    }
    var st = 
    {
        entry: argument1,
        palette: argument0,
        texture: argument2,
        var name: argument3,
        description: argument4,
        color: pal_swap_get_pal_color(characters[sel.char][2], argument0, characters[sel.char][3][0])
    }

    array_push(palettes, st)
    if (!is_undefined(argument5))
    {
        if (argument5 != "")
            argument5 += " "
        array_push(mixables, 
        {
            palette: argument0,
            prefix: argument5,
            name: argument3,
            color: pal_swap_get_pal_color(characters[sel.char][2], argument0, characters[sel.char][3][1])
        }
)
    }
}

add_palette = gml_Script_add_palette@gml_Object_obj_skinchoice_Create_0
function add_custom_palette@gml_Object_obj_skinchoice_Create_0(argument0, argument1, argument2) //gml_Script_add_custom_palette@gml_Object_obj_skinchoice_Create_0
{
    if (argument0 == undefined)
        argument0 = "CUSTOM PALETTE"
    if (argument1 == undefined)
        argument1 = ""
    if (argument2 == undefined)
        argument2 = array_create(64, 1)
    st = 
    {
        name: argument0,
        description: argument1,
        color_array: argument2
    }

    array_push(custom_palettes, st)
    array_push(global.custom_palettes, st)
}

add_custom_palette = gml_Script_add_custom_palette@gml_Object_obj_skinchoice_Create_0
if instance_exists(obj_player1)
{
    var pchar = obj_player1.character
    if (pchar == "P")
    {
        if obj_player1.isgustavo
            pchar = "G"
    }
    var i = 0
    var n = array_length(characters)
    while (i < n)
    {
        if (pchar == characters[i][0])
            sel.char = i
        i++
    }
    noisetype = obj_player1.noisetype
}
event_user(0)
function anon@3126@gml_Object_obj_skinchoice_Create_0() //gml_Script_anon@3126@gml_Object_obj_skinchoice_Create_0
{
    var custom = sel.side == 2
    if (custom && sel.pal >= array_length(custom_palettes))
        pal = noone
    else
        pal = (custom ? custom_palettes[sel.pal] : palettes[sel.pal])
    if (pal == noone && submenu != 1)
        return;
    with (obj_player1)
    {
        var same = 0
        var prevchar = character
        var prevpal = paletteselect
        var prevtex = global.palettetexture
        var prevnoise = noisetype
        character = other.characters[other.sel.char][0]
        noisetype = other.noisetype
        if (state == states.ratmount)
            state = states.normal
        isgustavo = 0
        if check_char("G")
        {
            ratmount_movespeed = 8
            gustavodash = 0
            isgustavo = 1
            state = states.ratmount
            sprite_index = spr_ratmount_idle
            brick = 1
        }
        scr_characterspr()
        custom_palette = custom
        if (!custom)
        {
            if (other.sel.mix > 0)
                paletteselect = other.mixables[other.sel.mix].palette
            else
                paletteselect = other.palettes[other.sel.pal].palette
            global.palettetexture = other.palettes[other.sel.pal].texture
        }
        else
        {
            global.palettetexture = -4
            custom_palette_array = (other.submenu == 1 ? other.custom_palette : pal.color_array)
        }
        if (character != prevchar)
        {
            with (obj_tutorialbook)
            {
                if is_callable(refresh_func)
                {
                    self.refresh_func()
                    event_perform(ev_other, ev_room_start)
                }
            }
        }
        if (!(((!custom) && character == prevchar && paletteselect == prevpal && global.palettetexture == prevtex && noisetype == prevnoise)))
        {
            xscale = 1
            create_particle(x, y, (9 << 0))
            visible = false
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_string("Game", "character", character)
            ini_write_real("Game", "palette", paletteselect)
            ini_write_string("Game", "palettetexture", sprite_get_name(global.palettetexture))
            obj_savesystem.ini_str = ini_close()
            gamesave_async_save()
        }
        sound_play_3d("event:/sfx/misc/collecttoppin", x, y)
    }
    anim_con = 2
}

function anon@5244@gml_Object_obj_skinchoice_Create_0(argument0) //gml_Script_anon@5244@gml_Object_obj_skinchoice_Create_0
{
    if (anim_con == 2 && (!obj_player1.visible))
    {
        handx = lerp(handx, (obj_screensizer.actual_width / 2), 0.15)
        handy = lerp(handy, -50, 0.15)
        var curve2 = animcurve_channel_evaluate(jumpcurve, (1 - anim_t))
        custom = sel.side == 2
        if (submenu == 1)
            pal = noone
        else
            pal = (custom ? custom_palettes[sel.pal] : palettes[sel.pal])
        var charx = (((obj_screensizer.actual_width / 2) + sideoffset) + (charshift[0] * 75))
        var chary = (((obj_screensizer.actual_height / 2) - 32) + (charshift[1] * 75))
        var scale = clamp(lerp(1, 2, argument0), 1, 2)
        charx = lerp(charx, (obj_player1.x - camera_get_view_x(view_camera[0])), (1 - anim_t))
        chary = lerp(chary, (obj_player1.y - camera_get_view_y(view_camera[0])), curve2)
        shader_set_fix(shd_pal_swapper)
        if custom
        {
            pal_swap_set(characters[sel.char][2], 0, 0)
            cuspal_set((pal == noone ? custom_palette : pal.color_array))
        }
        else
        {
            if (pal.texture != -4)
                pattern_set(global.Base_Pattern_Color, characters[sel.char][1], -1, scale, scale, pal.texture)
            pal_swap_set(characters[sel.char][2], (sel.mix > 0 ? mixables[sel.mix].palette : pal.palette), 0)
        }
        draw_sprite_ext(characters[sel.char][1], -1, charx, chary, scale, scale, 0, c_white, 1)
        cuspal_reset()
        pattern_reset()
        pal_swap_reset()
    }
}

function anon@6567@gml_Object_obj_skinchoice_Create_0(argument0, argument1, argument2, argument3) //gml_Script_anon@6567@gml_Object_obj_skinchoice_Create_0
{
    if (argument2 == undefined)
        argument2 = 16777215
    vertex_build_quad(vertex_buffer, argument0, argument1, sprite_get_width(spr_skinchoicepalette), sprite_get_height(spr_skinchoicepalette), argument2, argument3, uv_info.left, uv_info.top, (uv_info.right - uv_info.left), (uv_info.bottom - uv_info.top))
}

function anon@7004@gml_Object_obj_skinchoice_Create_0(argument0) //gml_Script_anon@7004@gml_Object_obj_skinchoice_Create_0
{
    if 1
    {
    }
    else
    {
        h = 0
        s = 0
        v = 0
        prev = -1
    }
    curve2 = anim_t
    var curv_prev = argument0
    if (anim_con != 0)
    {
        argument0 = 1
        curve2 = 1
    }
    switch sel.side
    {
        case 0:
            sideoffset = lerp(sideoffset, 0, 0.25)
            break
        case 1:
            sideoffset = lerp(sideoffset, -280, 0.25)
            break
        case 2:
            sideoffset = lerp(sideoffset, 280, 0.25)
            break
    }

    if (!surface_exists(player_surface))
        player_surface = surface_create_fix(256, 256)
    surface_set_target(player_surface)
    draw_clear_alpha(c_white, 0)
    custom = sel.side == 2
    if (custom && sel.pal >= array_length(custom_palettes))
        pal = noone
    else
        pal = (custom ? custom_palettes[sel.pal] : palettes[sel.pal])
    charx = (((obj_screensizer.actual_width / 2) + sideoffset) + (charshift[0] * 75))
    chary = (((obj_screensizer.actual_height / 2) - 32) + (charshift[1] * 75))
    if (anim_con != 2 || obj_player1.visible)
    {
        if (!custom)
        {
            if (characters[sel.char][0] == "N")
            {
                characters[sel.char][1] = (noisetype ? spr_playerN_pogofall : spr_playerN_idle)
                if check_skin((1 << 0), "N", pal.palette)
                {
                    characters[sel.char][1] = spr_playerN_chungus
                    if (noisetype == 1)
                    {
                        draw_set_font(gml_Script_lang_get_font("font_small"))
                        draw_set_align(1)
                        draw_set_colour(c_white)
                        draw_text(charx, (chary - 68), "Pogo")
                    }
                }
            }
            if (characters[sel.char][0] == "P")
            {
                characters[sel.char][1] = spr_player_idle
                if check_skin((0 << 0), "P", pal.palette)
                    characters[sel.char][1] = spr_player_petah
            }
        }
        if (pal != noone || submenu == 1)
        {
            shader_set_fix(shd_pal_swapper)
            if custom
            {
                pal_swap_set(characters[sel.char][2], 0, 0)
                cuspal_set((submenu == 1 ? custom_palette : pal.color_array))
            }
            else
            {
                if (pal.texture != -4)
                    pattern_set(global.Base_Pattern_Color, characters[sel.char][1], image_index, 1, 1, pal.texture)
                pal_swap_set(characters[sel.char][2], (sel.mix > 0 ? mixables[sel.mix].palette : pal.palette), 0)
            }
            draw_sprite(characters[sel.char][1], image_index, 128, 128)
            cuspal_reset()
            pattern_reset()
            pal_swap_reset()
        }
        else
            draw_sprite_ext(characters[sel.char][1], 0, 128, 128, 1, 1, 0, c_black, 1)
    }
    surface_reset_target()
    if (curv_prev < 1)
        draw_set_spotlight((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height / 2), ((obj_screensizer.actual_width / 1.7142857142857142) * curv_prev))
    draw_remove_bounds()
    draw_surface_ext(player_surface, (charx - 256), (chary - 256), 2, 2, 0, c_white, (argument0 * charshift[2]))
    if (submenu == 0)
    {
        if (pal == noone)
        {
            name = ""
            var desc = ""
            if custom
            {
                name = gml_Script_lang_get_value_newline("dresser_new_title")
                desc = gml_Script_lang_get_value_newline("dresser_new_desc")
            }
        }
        else
        {
            name = string_upper(pal.name)
            desc = pal.description
            if (sel.mix > 0)
            {
                name = string_upper((mixables[sel.mix].prefix + pal.name))
                desc = concat(mixables[sel.mix].name, " + ", pal.name)
                if (name == "BURNT TRANS FLAG")
                {
                    name = "DUE TO"
                    desc = "Legal reasons we cannot show this combo name."
                }
                if (name == "PUMPKIN TRANS FLAG")
                {
                    name = "YOU'RE NASTY"
                    desc = "YOU'RE NASTY."
                }
            }
        }
        draw_set_font(gml_Script_lang_get_font("bigfont"))
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        var xx = ((obj_screensizer.actual_width / 2) - (string_width(name) / 2))
        for (i = 1; i <= string_length(name); i++)
        {
            char = string_char_at(name, i)
            var yy = 400
            if (curve2 != 1)
                yy = lerp(obj_screensizer.actual_height, yy, min(animcurve_channel_evaluate(outback, (curve2 + ((i % 3) * 0.075)))))
            var d = ((i % 2) == 0 ? -1 : 1)
            var _dir = floor(Wave(-1, 1, 0.1, 0))
            yy += (_dir * d)
            draw_text(floor(xx), floor(yy), char)
            xx += string_width(char)
        }
        draw_set_halign(fa_center)
        draw_set_alpha(argument0)
        draw_set_font(gml_Script_lang_get_font("font_small"))
        draw_text_ext((obj_screensizer.actual_width / 2), 440, desc, 16, 600)
        draw_set_alpha(1)
        var palettecurve = (sideoffset / -280)
        switch sel.side
        {
            case 0:
                if (skin_tip > 0)
                {
                    skin_tip -= 0.025
                    draw_sprite_ext(spr_palettearrow, 0, ((obj_screensizer.actual_width / 2) + Wave(180, 190, 1, 0)), (obj_screensizer.actual_height / 2), 1, 1, -90, c_white, skin_tip)
                    if global.experimental
                        draw_sprite_ext(spr_palettearrow, 0, ((obj_screensizer.actual_width / 2) - Wave(180, 190, 1, 0)), (obj_screensizer.actual_height / 2), 1, 1, 90, c_white, skin_tip)
                    draw_set_font(gml_Script_lang_get_font("smallfont"))
                    draw_set_align(1)
                    draw_set_alpha(skin_tip)
                    draw_text(((obj_screensizer.actual_width / 2) + Wave(180, 190, 1, 0)), ((obj_screensizer.actual_height / 2) + 20), gml_Script_lang_get_value_newline("dresser_palettes"))
                    if global.experimental
                        draw_text(((obj_screensizer.actual_width / 2) - Wave(180, 190, 1, 0)), ((obj_screensizer.actual_height / 2) + 20), (gml_Script_lang_get_value_newline("dresser_customize") + "\n(WIP)"))
                    draw_set_align()
                }
                break
            case 1:
                skin_tip = 0
                xx = lerp(93.33333333333333, 0, palettecurve)
                yy = 0
                var array = ((!mixing) ? palettes : mixables)
                vertex_begin(vertex_buffer, vertex_format)
                draw_set_alpha(palettecurve)
                i = 0
                n = array_length(array)
                while (i < n)
                {
                    var xdraw = (xx + ((i % 13) * 36))
                    var ydraw = (yy + (floor((i / 13)) * 36))
                    if ((((!mixing) && sel.pal == i) || (mixing && sel.mix == i)) && anim_con != 2)
                    {
                        handx = lerp(handx, (416 + xdraw), 0.35)
                        handy = lerp(handy, (70 + ydraw), 0.35)
                        xdraw += random_range(-0.7, 0.7)
                        ydraw += random_range(-0.7, 0.7)
                    }
                    var fuck = -1
                    var j = 0
                    while (j < (2 << 0))
                    {
                        if check_skin(j, characters[sel.char][0], array[i].palette)
                        {
                            fuck = j
                            break
                        }
                        else
                        {
                            j++
                            continue
                        }
                    }
                    if (flashpal[0] != i)
                        draw_sprite_ext(spr_skinchoicepalette, 0, (410 + xdraw), (72 + ydraw), 1, 1, 0, c_black, 0.25)
                    if (flashpal[0] == i)
                    {
                        draw_set_flash()
                        draw_sprite_ext(spr_skinchoicepalette, 0, (408 + xdraw), (70 + ydraw), 1, 1, 0, c_white, 1)
                        draw_reset_flash()
                    }
                    else if (fuck >= 0)
                        draw_sprite_ext(spr_skinchoicecustom, fuck, (408 + xdraw), (70 + ydraw), 1, 1, 0, c_white, 1)
                    else if (mixing || array[i].texture == -4)
                        self.draw_skin_palette((408 + xdraw), (70 + ydraw), array[i].color, draw_get_alpha())
                    else
                    {
                        draw_sprite_stretched(array[i].texture, (current_time / 120), ((408 + xdraw) + 1), ((70 + ydraw) + 1), 30, 30)
                        draw_sprite(spr_skinchoicepalette, 1, (408 + xdraw), (70 + ydraw))
                    }
                    i++
                }
                vertex_end(vertex_buffer)
                vertex_submit(vertex_buffer, 4, tex)
                break
            case 2:
                skin_tip = 0
                xx = lerp(-93.33333333333333, 0, (-palettecurve))
                yy = 0
                vertex_begin(vertex_buffer, vertex_format)
                draw_set_alpha(palettecurve)
                i = 0
                n = array_length(custom_palettes)
                while (i < (n + 1))
                {
                    xdraw = (xx + ((i % 13) * 36))
                    ydraw = (yy + (floor((i / 13)) * 36))
                    if (sel.pal == i && anim_con != 2)
                    {
                        handx = lerp(handx, (88 + xdraw), 0.35)
                        handy = lerp(handy, (70 + ydraw), 0.35)
                        xdraw += random_range(-0.7, 0.7)
                        ydraw += random_range(-0.7, 0.7)
                    }
                    if (flashpal[0] == i)
                    {
                        draw_set_flash()
                        draw_sprite_ext(spr_skinchoicepalette, 0, (80 + xdraw), (70 + ydraw), 1, 1, 0, c_white, 1)
                        draw_reset_flash()
                    }
                    else if (i == array_length(custom_palettes))
                    {
                        draw_sprite_ext(spr_skinchoicepalette, 0, (82 + xdraw), (72 + ydraw), 1, 1, 0, c_black, 0.25)
                        draw_sprite_ext(spr_skinchoicepalette, 1, (80 + xdraw), (70 + ydraw), 1, 1, 0, c_white, 1)
                        draw_set_font(gml_Script_lang_get_font("captionfont"))
                        draw_set_align(1, 1)
                        draw_set_colour(c_white)
                        draw_set_alpha(1)
                        draw_text_outline(((80 + xdraw) + 15), ((70 + ydraw) + 15), "+", c_black, 2)
                    }
                    else
                    {
                        var this = custom_palettes[i]
                        var col = make_colour_rgb((this.color_array[(characters[sel.char][3][0] * 4)] * 255), (this.color_array[((characters[sel.char][3][0] * 4) + 1)] * 255), (this.color_array[((characters[sel.char][3][0] * 4) + 2)] * 255))
                        var alpha = this.color_array[((characters[sel.char][3][0] * 4) + 3)]
                        draw_sprite_ext(spr_skinchoicepalette, 0, (82 + xdraw), (72 + ydraw), 1, 1, 0, c_black, 0.25)
                        draw_sprite_ext(spr_skinchoicepalette, 0, (80 + xdraw), (70 + ydraw), 1, 1, 0, col, alpha)
                    }
                    i++
                }
                break
        }

    }
    else if (submenu == 1)
    {
        var color_count = 0
        if (array_length(characters[sel.char]) >= 5)
            color_count = characters[sel.char][4]
        if (color_count == 0)
            color_count = sprite_get_height(characters[sel.char][2])
        xx = 132
        yy = 64
        for (i = 0; i < color_count; i++)
        {
            xdraw = xx
            ydraw = yy
            if (point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), xx, yy, (xx + 32), (yy + 32)) && mouse_check_button_pressed(mb_left))
                sel.pal = i
            if (sel.pal == i)
            {
                handx = lerp(handx, (xdraw - 8), 0.35)
                handy = lerp(handy, (ydraw + 16), 0.35)
                xdraw += random_range(-0.7, 0.7)
                ydraw += random_range(-0.7, 0.7)
            }
            var r = (custom_palette[(i * 4)] * 255)
            var g = (custom_palette[((i * 4) + 1)] * 255)
            var b = (custom_palette[((i * 4) + 2)] * 255)
            var a = (custom_palette[((i * 4) + 3)] * 255)
            col = make_colour_rgb(r, g, b)
            draw_sprite_ext(spr_skinchoicepalette, 0, xdraw, ydraw, 1, 1, 0, col, a)
            yy += 36
            if (sel.pal == i)
            {
                function anon@17045@anon@7004_gml_Object_obj_skinchoice_Create_0(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_anon@17045@anon@7004_gml_Object_obj_skinchoice_Create_0
                {
                    if (argument6 == undefined)
                        argument6 = 0
                    if (argument7 == undefined)
                        argument7 = c_black
                    draw_rectangle_color((argument1 - 1), (argument2 - 1), ((argument1 + argument3) + 1), ((argument2 + argument4) + 1), c_black, c_black, c_black, c_black, 0)
                    if (argument0 == 3)
                        draw_sprite_stretched(spr_rainbow, 0, argument1, argument2, (argument3 + 1), argument4)
                    else
                        draw_rectangle_color(argument1, argument2, (argument1 + argument3), ((argument2 + argument4) - 1), argument7, argument5, argument5, argument7, 0)
                    var click = (sel.mix == argument0 && anim_con != 2)
                    if (point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), argument1, argument2, (argument1 + argument3), (argument2 + argument4)) || click)
                    {
                        draw_sprite_ext(spr_creditsfont, 8, (((argument1 + (argument6 * argument3)) - 16) - (click * 2)), ((argument2 - 6) - (click * 2)), (click ? 1.1 : 1), (click ? 1.1 : 1), 0, c_aqua, 1)
                        if mouse_check_button_pressed(mb_left)
                            sel.mix = argument0
                        if click
                            argument6 = clamp(((gml_Script_device_mouse_x_to_gui_hook(0) - argument1) / argument3), 0, 1)
                    }
                    else
                        draw_sprite(spr_creditsfont, 8, ((argument1 + (argument6 * argument3)) - 16), (argument2 - 6))
                    return argument6;
                }

                if (!mouse_check_button(mb_left))
                    sel.mix = -1
                var wd = 300
                var ht = 20
                var sliderx = 250
                var slidery = 90
                draw_text(250, slidery, "RGB")
                slidery += 50
                r = self.draw_slider(0, sliderx, slidery, wd, ht, 255, custom_palette[(i * 4)])
                slidery += (ht + 16)
                g = self.draw_slider(1, sliderx, slidery, wd, ht, 65280, custom_palette[((i * 4) + 1)])
                slidery += (ht + 16)
                b = self.draw_slider(2, sliderx, slidery, wd, ht, 16711680, custom_palette[((i * 4) + 2)])
                slidery += 90
                draw_text(250, slidery, "HSV")
                slidery += 50
                h = self.draw_slider(3, sliderx, slidery, wd, ht, 16777215, h)
                slidery += (ht + 16)
                s = self.draw_slider(4, sliderx, slidery, wd, ht, make_colour_hsv((h * 255), 255, (v * 255)), s, make_colour_hsv(0, 0, (v * 255)))
                slidery += (ht + 16)
                v = self.draw_slider(5, sliderx, slidery, wd, ht, make_colour_hsv((h * 255), (s * 255), 255), v)
                if (sel.mix == 0 || sel.mix == 1 || sel.mix == 2 || prev != sel.pal)
                {
                    if (colour_get_hue(col) != 0 || h != 1)
                        h = (colour_get_hue(col) / 255)
                    if (colour_get_saturation(col) != 0 || s != 1)
                        s = (colour_get_saturation(col) / 255)
                    if (colour_get_value(col) != 0 || v != 1)
                        v = (colour_get_value(col) / 255)
                }
                if (sel.mix == 3 || sel.mix == 4 || sel.mix == 5)
                {
                    col = make_colour_hsv((h * 255), (s * 255), (v * 255))
                    r = (colour_get_red(col) / 255)
                    g = (colour_get_green(col) / 255)
                    b = (colour_get_blue(col) / 255)
                }
                custom_palette[(i * 4)] = r
                custom_palette[((i * 4) + 1)] = g
                custom_palette[((i * 4) + 2)] = b
            }
        }
        if (prev != sel.pal)
        {
            prev = sel.pal
            sound_play("event:/sfx/ui/step")
        }
        if (point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), 650, 120, 900, 320) && mouse_check_button_pressed(mb_left) && anim_con != 2)
            self.select()
        draw_set_font(gml_Script_lang_get_font("font_small"))
        draw_set_align(1)
        var str = embed_value_string(gml_Script_lang_get_value_newline("dresser_new_help"), [chr(tdp_input_get("menu_back").actions[0].value)])
        draw_text_ext_color(762, 382, str, 16, 350, c_black, c_black, c_black, c_black, 0.25)
        draw_text_ext(760, 380, str, 16, 350)
    }
    if (handy > 0)
        draw_sprite_ext(spr_skinchoicehand, 0, handx, (handy + (sin((current_time / 1000)) * 4)), 2, 2, 0, c_white, 1)
    draw_set_align()
    shader_reset()
}

handx = (obj_screensizer.actual_width / 2)
handy = -50
sideoffset = 0
skin_tip = 5
