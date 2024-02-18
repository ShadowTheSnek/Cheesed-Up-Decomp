var _temp_local_var_1, _temp_local_var_2, _temp_local_var_14, _temp_local_var_17, _temp_local_var_21;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell

System.Exception: Unable to find the var name for anonymous code object gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2606
*/
function WCscr_altname(argument0, argument1) //gml_Script_WCscr_altname
{
    variable_global_set(string("sh_{0}", argument1), variable_global_get(string("sh_{0}", argument0)))
    array_push(allFunctions, argument1)
    var metadata = variable_struct_get(functionData, argument0)
    metadata.hidden = 1
    variable_struct_set(functionData, argument1, metadata)
}

function scr_wc_create() //gml_Script_scr_wc_create
{
    WC_debug = 0
    WC_builtins = ds_map_create()
    ds_map_add(WC_builtins, "undefined", undefined)
    ds_map_add(WC_builtins, "NaN", NaN)
    ds_map_add(WC_builtins, "infinity", infinity)
    ds_map_add(WC_builtins, "true", 1)
    ds_map_add(WC_builtins, "false", 0)
    ds_map_add(WC_builtins, "noone", -4)
    ds_map_add(WC_builtins, "c_white", 16777215)
    ds_map_add(WC_builtins, "c_aqua", 16776960)
    ds_map_add(WC_builtins, "c_black", 0)
    ds_map_add(WC_builtins, "c_dkgray", 4210752)
    ds_map_add(WC_builtins, "c_fuchsia", 16711935)
    ds_map_add(WC_builtins, "c_gray", 8421504)
    ds_map_add(WC_builtins, "c_green", 32768)
    ds_map_add(WC_builtins, "c_lime", 65280)
    ds_map_add(WC_builtins, "c_ltgray", 12632256)
    ds_map_add(WC_builtins, "c_maroon", 128)
    ds_map_add(WC_builtins, "c_navy", 8388608)
    ds_map_add(WC_builtins, "c_olive", 32896)
    ds_map_add(WC_builtins, "c_orange", 4235519)
    ds_map_add(WC_builtins, "c_purple", 8388736)
    ds_map_add(WC_builtins, "c_red", 255)
    ds_map_add(WC_builtins, "c_silver", 12632256)
    ds_map_add(WC_builtins, "c_teal", 8421376)
    ds_map_add(WC_builtins, "c_yellow", 65535)
    WCscr_altname("clear", "cls")
    WCscr_altname("var", "variable")
    WCscr_altname("panic", "pizzatime")
    WCscr_altname("create", "object")
    WCscr_altname("showcollisions", "toggle_collisions")
    WCscr_altname("char", "character")
    WC_select_mode = -1
    WC_select_inst = noone
    WC_drag_toggle = 0
    WC_drag_alt = 0
    WC_drag_offset = [0, 0]
    WC_drag_grid = [1, 1]
    WC_drag_inst = noone
    WC_drag_deleting = 0
    WC_debugview = 0
    WC_debugview_target = noone
    WC_debugview_scroll = 0
    WC_showinvisible = 0
    WC_oobcam = 0
    WC_showcollisions = 0
    WC_debugoverlay = 0
    WC_bindsenabled = 1
    WC_binds = ds_map_create()
    function WCscr_addbind@scr_wc_create_scr_wcshell(argument0, argument1) //gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell
    {
        ds_map_add(WC_binds, string(argument0), argument1)
    }

    gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell(52, "oobcam")
    gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell(53, "panic")
    gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell(55, "showcollisions")
    gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell(57, "debughud")
    gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell(96, function() //gml_Script_anon@2781@scr_wc_create_scr_wcshell
    {
        global.option_resolution = 1
        gml_Script_screen_apply_size()
    }
)
    gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell(97, "resetsaveroom")
    WC_frozen = ds_list_create()
    function WCscr_freezevar@scr_wc_create_scr_wcshell(argument0, argument1) //gml_Script_WCscr_freezevar@scr_wc_create_scr_wcshell
    {
        for (var i = 0; i < ds_list_size(WC_frozen); i++)
        {
            var frozen = ds_list_find_value(WC_frozen, i)
            if (frozen[0] == argument0 && frozen[1] == argument1)
            {
                ds_list_delete(WC_frozen, i)
                return 0;
            }
        }
        ds_list_add(WC_frozen, [argument0, argument1, variable_instance_get(argument0, argument1)])
        return 1;
    }

    gml_Script_WCscr_addbind@scr_wc_create_scr_wcshell(220, function() //gml_Script_anon@3384@scr_wc_create_scr_wcshell
    {
        if (!isOpen)
            self.self.open()
        else
            self.self.close()
    }
)
    WC_win_list = ds_list_create()
    function WCwin@scr_wc_create_scr_wcshell(argument0, argument1) constructor //gml_Script_WCwin@scr_wc_create_scr_wcshell
    {
        if 1
        {
        }
        else
            function anon@3881@WCwin_scr_wc_create_scr_wcshell(argument0, argument1) //gml_Script_anon@3881@WCwin_scr_wc_create_scr_wcshell
            {
                if (argument0 == undefined)
                    argument0 = win_width
                if (argument1 == undefined)
                    argument1 = win_height
                win_width = argument0
                win_height = argument1
                win_x = clamp(win_x, 0, (obj_screensizer.actual_width - win_width))
                win_y = clamp(win_y, 0, (obj_screensizer.actual_height - win_height))
                return self;
            }

        if (!instance_exists(obj_shell))
            return;
        var winlist = obj_shell.WC_win_list
        win_title = argument0
        win_x = (ds_list_size(winlist) * 32)
        win_y = (64 + (ds_list_size(winlist) * 16))
        win_width = 160
        win_height = 90
        self.setSize()
        win_moving = 0
        win_resize = 0
        draw = method(self, argument1)
        ds_list_add(winlist, self)
    }

    WC_win_focus = -1
    WC_win_dragx = 0
    WC_win_dragy = 0
    function WCscr_overconsole@scr_wc_create_scr_wcshell() //gml_Script_WCscr_overconsole@scr_wc_create_scr_wcshell
    {
        var mx = gml_Script_device_mouse_x_to_gui_hook(0)
        var my = gml_Script_device_mouse_y_to_gui_hook(0)
        return ((isOpen && mx >= shellOriginX && my >= shellOriginY && mx < (shellOriginX + width) && my < (shellOriginY + height)) || global.gameframe_drag_flags != 0);
    }

    function WCscr_findobj@scr_wc_create_scr_wcshell(argument0) //gml_Script_WCscr_findobj@scr_wc_create_scr_wcshell
    {
        var target_one = 0
        var target = -4
        if (argument0 == "all")
            target = -3
        else if (asset_get_type(argument0) == 0)
        {
            var asset = asset_get_index(argument0)
            if instance_exists(asset)
                target = asset
        }
        else if (string_pos(":", argument0) > 0)
        {
            var parse_obj = ""
            var parse_ind = ""
            var parsing = 0
            for (i = 1; i <= string_length(argument0); i++)
            {
                var char = string_char_at(argument0, i)
                if (parsing == 0)
                {
                    if (char == ":")
                        parsing = 1
                    else
                        parse_obj += char
                }
                else
                    parse_ind += char
            }
            if (string_digits(parse_ind) != parse_ind || string_digits(parse_ind) == "")
                return "Instance index must be a number";
            parse_ind = real(parse_ind)
            asset = noone
            if (string_digits(parse_obj) == parse_obj)
                asset = real(parse_obj)
            else if (asset_get_type(parse_obj) == 0)
                asset = asset_get_index(parse_obj)
            if instance_exists(asset)
            {
                target_one = 1
                asset = instance_find(asset, parse_ind)
                if instance_exists(asset)
                    target = asset
            }
        }
        else if (string_digits(argument0) == argument0 && argument0 != "")
        {
            if instance_exists(real(argument0))
                target = real(argument0)
            if (real(argument0) >= 100000)
                target_one = 1
        }
        return [target, target_one];
    }

    function WCscr_allargs@scr_wc_create_scr_wcshell(argument0, argument1) //gml_Script_WCscr_allargs@scr_wc_create_scr_wcshell
    {
        if (argument1 == undefined)
            argument1 = 0
        var ret = ""
        for (i = argument1; i < array_length(argument0); i++)
            ret += (argument0[i] + (i == (array_length(argument0) - 1) ? "" : " "))
        return ret;
    }

    function WCscr_getvalue@scr_wc_create_scr_wcshell(argument0) //gml_Script_WCscr_getvalue@scr_wc_create_scr_wcshell
    {
        argument0 = string(argument0)
        if (asset_get_index(argument0) != -1)
            argument0 = asset_get_index(argument0)
        else if string_is_number(argument0)
            argument0 = real(argument0)
        else if ds_map_exists(WC_builtins, argument0)
            argument0 = ds_map_find_value(WC_builtins, argument0)
        else if (string_char_at(argument0, 1) == "\"" && string_char_at(argument0, string_length(argument0)) == "\"")
        {
            argument0 = string_delete(argument0, 1, 1)
            argument0 = string_delete(argument0, string_length(argument0), 1)
        }
        else
            argument0 = string_replace(argument0, "\\\"", "\"")
        return argument0;
    }

}

function scr_wc_step() //gml_Script_scr_wc_step
{
    depth = -16000
    WC_debug = (0 || (global.experimental && instance_exists(obj_persistent) && (!instance_exists(obj_disclaimer)) && (!obj_persistent.shell_force_off) && safe_get(obj_onlineclient, "state") != (2 << 0) && room != room_cancelled))
    if isOpen
    {
        if keyboard_check(vk_control)
        {
            if keyboard_check_pressed(ord("V"))
            {
                if clipboard_has_text()
                {
                    consoleString += clipboard_get_text()
                    cursorPos += string_length(clipboard_get_text())
                }
                else
                    trace("SHELL: Unable to copy text from clipboard, because clipboard has no text.")
            }
            if keyboard_check_pressed(ord("C"))
            {
                clipboard_set_text(consoleString)
                consoleString = ""
                cursorPos = 0
            }
        }
    }
    i = ds_map_find_first(WC_binds)
    while (!is_undefined(i))
    {
        if keyboard_check_pressed(real(i))
        {
            var val = ds_map_find_value(WC_binds, i)
            if is_method(val)
                self.val()
            else if ((!isOpen) && WC_bindsenabled)
            {
                var args = self._input_string_split(val)
                if (array_length(args) == 1)
                {
                    if (args[0] == "var" || args[0] == "variable")
                    {
                        if keyboard_check(vk_shift)
                        {
                            var variable = get_string("Input global variable name here", "")
                            if (variable != "")
                            {
                                if variable_global_exists(variable)
                                    var value = get_string(string("Overwriting existing value in global.{0} to...", variable), string(variable_global_get(variable)))
                                else
                                    value = get_string(string("Creating new variable global.{0} with value...", variable), "")
                                consoleString = string("var global {0} {1}", variable, value)
                                self._execute_script(self._input_string_split(consoleString), 1)
                                consoleString = ""
                            }
                        }
                        else
                            WC_select_mode = (2 << 0)
                    }
                    else
                    {
                        metadata = variable_struct_get(functionData, array_get(args, 0))
                        if ((!is_undefined(metadata)) && variable_struct_exists(metadata, "arguments"))
                        {
                            i = 0
                            while (i < array_length(metadata.arguments))
                            {
                                if (string_char_at(metadata.arguments[i], 1) != "<")
                                {
                                    var getstring = get_string(string("Write value for argument:\n{0}", metadata.arguments[i]), "")
                                    if (getstring == "")
                                        break
                                    else
                                    {
                                        val += string(" \"{0}\"", getstring)
                                        i++
                                        continue
                                    }
                                }
                                else
                                {
                                    i++
                                    continue
                                }
                            }
                        }
                        args = self._input_string_split(val)
                        consoleString = val
                        if (array_length(args) > 0)
                            self._execute_script(args, 1)
                    }
                }
                else
                {
                    consoleString = val
                    if (array_length(args) > 0)
                        self._execute_script(args, 1)
                }
                consoleString = ""
            }
        }
        i = ds_map_find_next(WC_binds, i)
    }
    for (i = 0; i < ds_list_size(WC_frozen); i++)
    {
        frozen = ds_list_find_value(WC_frozen, i)
        if (instance_exists(frozen[0]) || frozen[0] == @@Global@@())
            variable_instance_set(frozen[0], frozen[1], frozen[2])
    }
    var mousex = gml_Script_device_mouse_x_to_gui_hook(0)
    var mousey = gml_Script_device_mouse_y_to_gui_hook(0)
    if mouse_check_button_pressed(mb_left)
    {
        WC_win_focus = -1
        if (!self.WCscr_overconsole())
        {
            i = 0
            while (i < ds_list_size(WC_win_list))
            {
                var win = ds_list_find_value(WC_win_list, i)
                if (mousex >= win.win_x && mousex < ((win.win_x + win.win_width) + 4) && mousey >= (win.win_y - 32) && mousey < ((win.win_y + win.win_height) + 4))
                {
                    WC_win_focus = win
                    break
                }
                else
                {
                    i++
                    continue
                }
            }
        }
    }
    if (WC_drag_toggle && WC_debug && WC_select_mode <= -1)
    {
        if (!instance_exists(WC_drag_inst))
            WC_drag_inst = noone
        var mb = (mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_middle))
        if (mb != 0 && WC_win_focus == -1 && (!self.WCscr_overconsole()) && (!instance_exists(WC_drag_inst)))
        {
            if (mb == 1 && keyboard_check(vk_control) && instance_exists(obj_player1))
            {
                WC_drag_offset = [0, 0]
                WC_drag_alt = keyboard_check(vk_alt)
                WC_drag_inst = instance_find(obj_player1, 0)
            }
            else
            {
                WC_drag_inst = collision_point(gml_Script_mouse_x_hook(), gml_Script_mouse_y_hook(), all, 1, 0)
                if instance_exists(WC_drag_inst)
                {
                    if (WC_drag_inst.object_index == obj_baddiecollisionbox && instance_exists(WC_drag_inst.baddieID))
                        WC_drag_inst = WC_drag_inst.baddieID
                    WC_drag_offset = [(gml_Script_mouse_x_hook() - WC_drag_inst.x), (gml_Script_mouse_y_hook() - WC_drag_inst.y)]
                    WC_drag_alt = keyboard_check(vk_alt)
                    if (mb == -1)
                    {
                        with (WC_drag_inst)
                            other.WC_drag_inst = instance_copy(keyboard_check(vk_control))
                    }
                }
            }
        }
        if (WC_drag_inst == noone && keyboard_check(vk_control) && mouse_check_button_pressed(mb_right))
            WC_drag_deleting = 1
        if WC_drag_deleting
        {
            if (!mouse_check_button(mb_right))
                WC_drag_deleting = 0
            var delinst = collision_point(gml_Script_mouse_x_hook(), gml_Script_mouse_y_hook(), all, 1, 0)
            if instance_exists(delinst)
                instance_destroy(delinst, (!keyboard_check(vk_alt)))
        }
        if instance_exists(WC_drag_inst)
        {
            var rel = (((!mouse_check_button(mb_middle)) && mouse_check_button_released(mb_left)) || ((!mouse_check_button(mb_left)) && mouse_check_button_released(mb_middle)))
            if ((!WC_drag_alt) || rel)
            {
                with (WC_drag_inst)
                {
                    x = (floor(((gml_Script_mouse_x_hook() - other.WC_drag_offset[0]) / other.WC_drag_grid[0])) * other.WC_drag_grid[0])
                    y = (floor(((gml_Script_mouse_y_hook() - other.WC_drag_offset[1]) / other.WC_drag_grid[1])) * other.WC_drag_grid[1])
                }
                for (i = 0; i < ds_list_size(WC_frozen); i++)
                {
                    frozen = ds_list_find_value(WC_frozen, i)
                    if (frozen[0] != @@Global@@() && instance_exists(frozen[0]) && frozen[0].id == WC_drag_inst.id)
                    {
                        if (frozen[1] == "x")
                            array_set(ds_list_find_value(WC_frozen, i), 2, WC_drag_inst.x)
                        if (frozen[2] == "y")
                            array_set(ds_list_find_value(WC_frozen, i), 2, WC_drag_inst.y)
                    }
                }
            }
            if rel
                WC_drag_inst = noone
            else if (mouse_check_button_pressed(mb_right) && WC_drag_inst != noone)
            {
                if (!WC_drag_alt)
                    instance_destroy(WC_drag_inst, (!keyboard_check(vk_control)))
                WC_drag_inst = noone
            }
            else if ((mouse_check_button(mb_left) && mouse_check_button_pressed(mb_middle)) || (keyboard_check(vk_control) && mouse_check_button(mb_middle)))
            {
                var copy = noone
                with (WC_drag_inst)
                    copy = instance_copy(false)
                if WC_drag_alt
                {
                    with (copy)
                    {
                        x = (floor(((gml_Script_mouse_x_hook() - other.WC_drag_offset[0]) / other.WC_drag_grid[0])) * other.WC_drag_grid[0])
                        y = (floor(((gml_Script_mouse_y_hook() - other.WC_drag_offset[1]) / other.WC_drag_grid[1])) * other.WC_drag_grid[1])
                    }
                }
            }
        }
    }
    else
        WC_drag_inst = noone
    switch WC_select_mode
    {
        case -1:
            WC_select_inst = noone
            break
        case (0 << 0):
            if (mouse_check_button_pressed(mb_left) || (mouse_check_button(mb_left) && keyboard_check(vk_control)))
                gml_Script_instance_create((floor((gml_Script_mouse_x_hook() / WC_drag_grid[0])) * WC_drag_grid[0]), (floor((gml_Script_mouse_y_hook() / WC_drag_grid[1])) * WC_drag_grid[1]), WC_select_inst)
            break
        default:
            WC_select_inst = collision_point(gml_Script_mouse_x_hook(), gml_Script_mouse_y_hook(), all, 0, 0)
            if (WC_select_inst && WC_select_inst.object_index == obj_baddiecollisionbox && (!keyboard_check(vk_shift)))
            {
                if instance_exists(WC_select_inst.baddieID)
                    WC_select_inst = WC_select_inst.baddieID
            }
            if (WC_select_inst && mouse_check_button_pressed(mb_left))
            {
                switch WC_select_mode
                {
                    case (1 << 0):
                        WC_debugview = 1
                        WC_debugview_target = WC_select_inst
                        WC_debugview_scroll = 0
                        break
                    case (2 << 0):
                        variable = get_string(string("Selected {0}\nInput variable name here", object_get_name(WC_select_inst.object_index)), "")
                        if (variable == "")
                            WC_select_mode = -1
                        else
                        {
                            if variable_instance_exists(WC_select_inst, variable)
                                value = get_string(string("Overwriting existing value in {0} to...", variable), string(variable_instance_get(WC_select_inst, variable)))
                            else
                                value = get_string(string("Creating new variable {0} with value...", variable), "")
                            consoleString = string("var {0} {1} {2}", string_replace(WC_select_inst.id, "ref instance ", ""), variable, value)
                            self._execute_script(self._input_string_split(consoleString), 1)
                            consoleString = ""
                        }
                        break
                    default:
                        show_message("Boop")
                        break
                }

                WC_select_mode = -1
            }
            break
    }

    if mouse_check_button_pressed(mb_right)
        WC_select_mode = -1
}

function WCscr_drawmask(argument0, argument1) //gml_Script_WCscr_drawmask
{
    if (argument0 == undefined)
        argument0 = x
    if (argument1 == undefined)
        argument1 = y
    var _mask = (mask_index == -1 ? sprite_index : mask_index)
    var _b1 = (sprite_get_bbox_left(_mask) * image_xscale)
    var _b2 = (sprite_get_bbox_top(_mask) * image_yscale)
    var _b3 = ((sprite_get_bbox_right(_mask) + 1) * image_xscale)
    var _b4 = ((sprite_get_bbox_bottom(_mask) + 1) * image_yscale)
    var _xoff = (sprite_get_xoffset(_mask) * image_xscale)
    var _yoff = (sprite_get_yoffset(_mask) * image_yscale)
    var _dis1 = point_distance(_xoff, _yoff, _b1, _b2)
    var _dir1 = point_direction(_xoff, _yoff, _b1, _b2)
    var _dis2 = point_distance(_xoff, _yoff, _b3, _b2)
    var _dir2 = point_direction(_xoff, _yoff, _b3, _b2)
    var _dis3 = point_distance(_xoff, _yoff, _b3, _b4)
    var _dir3 = point_direction(_xoff, _yoff, _b3, _b4)
    var _dis4 = point_distance(_xoff, _yoff, _b1, _b4)
    var _dir4 = point_direction(_xoff, _yoff, _b1, _b4)
    var _x1 = lengthdir_x(_dis1, (image_angle + _dir1))
    var _y1 = lengthdir_y(_dis1, (image_angle + _dir1))
    var _x2 = lengthdir_x(_dis2, (image_angle + _dir2))
    var _y2 = lengthdir_y(_dis2, (image_angle + _dir2))
    var _x3 = lengthdir_x(_dis3, (image_angle + _dir3))
    var _y3 = lengthdir_y(_dis3, (image_angle + _dir3))
    var _x4 = lengthdir_x(_dis4, (image_angle + _dir4))
    var _y4 = lengthdir_y(_dis4, (image_angle + _dir4))
    draw_primitive_begin(6)
    draw_vertex((argument0 + _x1), (argument1 + _y1))
    draw_vertex((argument0 + _x2), (argument1 + _y2))
    draw_vertex((argument0 + _x3), (argument1 + _y3))
    draw_vertex((argument0 + _x4), (argument1 + _y4))
    draw_primitive_end()
}

function WCscr_drawobject(argument0, argument1) //gml_Script_WCscr_drawobject
{
    if (argument1 == undefined)
        argument1 = 0.75
    if sprite_exists(argument0.sprite_index)
    {
        var xscale = argument0.image_xscale
        var yscale = argument0.image_yscale
        if variable_instance_exists(argument0, "xscale")
            xscale = argument0.xscale
        if variable_instance_exists(argument0, "yscale")
            yscale = argument0.yscale
        draw_sprite_ext(argument0.sprite_index, argument0.image_index, argument0.x, argument0.y, xscale, yscale, argument0.image_angle, argument0.image_blend, argument1)
    }
}

function scr_wc_draw() //gml_Script_scr_wc_draw
{
    draw_set_font(consoleFont)
    if instance_exists(WC_drag_inst)
    {
        var drawmask = gml_Script_WCscr_drawmask
        with (WC_drag_inst)
        {
            var xp = x
            var yp = y
            x = (floor(((gml_Script_mouse_x_hook() - other.WC_drag_offset[0]) / other.WC_drag_grid[0])) * other.WC_drag_grid[0])
            y = (floor(((gml_Script_mouse_y_hook() - other.WC_drag_offset[1]) / other.WC_drag_grid[1])) * other.WC_drag_grid[1])
        }
        WCscr_drawobject(WC_drag_inst)
        draw_set_colour((WC_drag_alt ? c_aqua : c_red))
        draw_set_alpha(0.25)
        with (WC_drag_inst)
            self.drawmask()
        draw_set_alpha(1)
        with (WC_drag_inst)
        {
            x = xp
            y = yp
        }
    }
    if (WC_select_mode != -1)
    {
        var col = c_white
        switch WC_select_mode
        {
            case (1 << 0):
                col = merge_colour(c_white, c_orange, 0.35)
                break
        }

        draw_set_colour(col)
        var text = "Select object"
        var xx = gml_Script_mouse_x_hook()
        var yy = gml_Script_mouse_y_hook()
        if (WC_select_mode == (0 << 0))
        {
            xx = (floor((gml_Script_mouse_x_hook() / WC_drag_grid[0])) * WC_drag_grid[0])
            yy = (floor((gml_Script_mouse_y_hook() / WC_drag_grid[1])) * WC_drag_grid[1])
            text = "Spawn here"
            var objspr = object_get_sprite(WC_select_inst)
            if sprite_exists(objspr)
            {
                text = ""
                draw_sprite_ext(object_get_sprite(WC_select_inst), 0, xx, yy, 1, 1, 0, c_white, 0.5)
            }
        }
        else if instance_exists(WC_select_inst)
        {
            text = object_get_name(WC_select_inst.object_index)
            xx += choose(1, -1)
            draw_set_flash(col)
            WCscr_drawobject(WC_select_inst, (abs(sin((current_time / 500))) * 0.5))
            draw_reset_flash()
        }
        draw_set_align(1, 1)
        draw_text_outline(xx, yy, text)
        draw_set_align()
    }
    if (WC_showinvisible > 0)
    {
        var drawobject = gml_Script_WCscr_drawobject
        with (all)
        {
            if sprite_exists(sprite_index)
                self.drawobject(id)
            else if (other.WC_showinvisible == 2)
            {
                draw_set_alpha(1)
                draw_set_colour(c_white)
                draw_set_align(1, 1)
                draw_text_outline(x, y, object_get_name(object_index))
                draw_set_align()
            }
        }
    }
    if (WC_debugview && instance_exists(WC_debugview_target) && WC_debugview_target != @@Global@@())
    {
        if (!((instance_exists(WC_drag_inst) && WC_drag_inst.id == WC_debugview_target.id)))
        {
            drawmask = gml_Script_WCscr_drawmask
            draw_set_alpha(0.5)
            draw_set_colour(c_red)
            with (WC_debugview_target)
                self.drawmask()
            draw_set_alpha(1)
        }
        if ((!WC_debugview_target.visible) || WC_debugview_target.image_alpha <= 0)
            WCscr_drawobject(WC_debugview_target)
        draw_set_colour(c_red)
        draw_rectangle((WC_debugview_target.x - 1), (WC_debugview_target.y - 1), (WC_debugview_target.x + 1), (WC_debugview_target.y + 1), false)
    }
}

function scr_wc_drawgui() //gml_Script_scr_wc_drawgui
{
    draw_set_font(consoleFont)
    mousex = gml_Script_device_mouse_x_to_gui_hook(0)
    mousey = gml_Script_device_mouse_y_to_gui_hook(0)
    var wincol = c_black
    var txtcol = c_white
    var guiwidth = display_get_gui_width()
    var guiheight = display_get_gui_height()
    if WC_debugview
    {
        draw_set_align()
        draw_set_colour(c_white)
        draw_text_outline(4, 4, (string("room: {0} ({1})", room_get_name(room), room) + string("\ninstances: {0} fps: {1} ({2})", instance_count, fps, fps_real)))
        if (instance_exists(WC_debugview_target) || WC_debugview_target == @@Global@@())
        {
            if (WC_debugview_target != @@Global@@())
            {
                var str = string("\n\n\nSelected {0} (id: {1})", object_get_name(WC_debugview_target.object_index), WC_debugview_target.id)
                str += string("\nx: {0}", WC_debugview_target.x)
                str += string("\ny: {0}", WC_debugview_target.y)
                if (WC_debugview_target.sprite_index == -1)
                    str += "\nsprite_index: -1"
                else
                    str += string("\nsprite_index: {0} ({1})", sprite_get_name(WC_debugview_target.sprite_index), WC_debugview_target.sprite_index)
                str += string("\nimage_index: {0}", WC_debugview_target.image_index)
                str += string("\nimage_xscale: {0}", WC_debugview_target.image_xscale)
                str += string("\nimage_yscale: {0}", WC_debugview_target.image_yscale)
                if (WC_debugview_target.mask_index == -1)
                    str += "\nmask_index: -1"
                else
                    str += string("\nmask_index: {0} ({1})", sprite_get_name(WC_debugview_target.mask_index), WC_debugview_target.mask_index)
                for (var c = 0; c <= 11; c++)
                {
                    if (WC_debugview_target.alarm[c] > -1)
                        str += string("\nalarm[{0}]: {1}", c, WC_debugview_target.alarm[c])
                }
                draw_text_outline(4, 24, str)
            }
            draw_set_halign(fa_right)
            var objvars = variable_instance_get_names(WC_debugview_target)
            if (array_length(objvars) == 0)
                draw_text_outline(display_get_gui_width(), 4, "No variables")
            else
            {
                WC_debugview_scroll = clamp(WC_debugview_scroll, 0, max((array_length(objvars) - 32), 0))
                for (var b = WC_debugview_scroll; b < min((WC_debugview_scroll + 33), array_length(objvars)); b++)
                {
                    var getvar = variable_instance_get(WC_debugview_target, objvars[b])
                    draw_set_colour(c_silver)
                    if (string_char_at(string(getvar), 1) == "-")
                        draw_set_colour(merge_colour(c_white, c_red, 0.5))
                    var todraw = string_replace_all(string(getvar), "\n", "\\n")
                    if (b <= (32 + WC_debugview_scroll))
                        draw_text_outline(956, (((b - WC_debugview_scroll) * 16) + 4), concat(objvars[b], ": ", todraw))
                }
                if keyboard_check_pressed(vk_pageup)
                {
                    WC_debugview_scroll -= 32
                    if (WC_debugview_scroll < 0)
                        WC_debugview_scroll = 0
                }
                if keyboard_check_pressed(vk_pagedown)
                {
                    WC_debugview_scroll += 32
                    if (WC_debugview_scroll > (array_length(objvars) - 32))
                        WC_debugview_scroll = (array_length(objvars) - 32)
                }
            }
        }
        else
            WC_debugview_target = noone
    }
    else
        WC_debugview_target = noone
    global.gameframe_can_input = 1
    winlist = WC_win_list
    for (i = 0; i < ds_list_size(winlist); i++)
    {
        win = ds_list_find_value(WC_win_list, i)
        with (win)
        {
            var focused = other.WC_win_focus == self
            if (focused && (mousey < win_y || win_moving) && (!win_resize))
            {
                global.gameframe_can_input = 0
                if mouse_check_button(mb_left)
                {
                    if (!win_moving)
                    {
                        WC_win_dragx = (mousex - win_x)
                        WC_win_dragy = (mousey - win_y)
                        win_moving = 1
                    }
                    win_x = (mousex - WC_win_dragx)
                    win_y = (mousey - WC_win_dragy)
                    win_x = clamp(win_x, 0, (guiwidth - win_width))
                    win_y = clamp(win_y, 32, (guiheight - win_height))
                    if (mouse_check_button_pressed(mb_right) && win_moving)
                    {
                        trace(string("Deleting window {0}, size {1}", i, ds_list_size(winlist)))
                        other.WC_win_focus = -1
                        ds_list_delete(winlist, i--)
                    }
                    else
                    {
                        if ((mousex < ((win_x + win_width) + 4) && mousex >= ((win_x + win_width) - 4) && mousey < ((win_y + win_height) + 4) && mousey >= ((win_y + win_height) - 4) && (!win_moving)) || (win_resize && mouse_check_button(mb_left)))
                        {
                            if (win_resize || (!other.other.WCscr_overconsole()))
                                window_set_cursor(cr_size_nwse)
                            if (focused && mouse_check_button(mb_left))
                            {
                                if (!win_resize)
                                {
                                    WC_win_dragx = (mousex - win_width)
                                    WC_win_dragy = (mousey - win_height)
                                    win_resize = 1
                                }
                                win_width = clamp((mousex - WC_win_dragx), 16, (guiwidth - win_x))
                                win_height = clamp((mousey - WC_win_dragy), 16, (guiheight - win_y))
                            }
                            else
                                win_resize = 0
                        }
                        else
                        {
                            if (window_get_cursor() == -8)
                            {
                                if (display_mouse_get_x() > window_get_x() && display_mouse_get_x() < (window_get_x() + window_get_width()) && display_mouse_get_y() > window_get_y() && display_mouse_get_y() < (window_get_y() + window_get_height()))
                                    window_set_cursor(cr_default)
                            }
                            win_resize = 0
                        }
                        var win_surf = surface_create_fix(win_width, win_height)
                        if (surface_get_width(win_surf) != win_width || surface_get_height(win_surf) != win_height)
                            surface_resize(win_surf, win_width, win_height)
                        surface_set_target(win_surf)
                        draw_clear_alpha(wincol, 0.35)
                        draw_set_colour(txtcol)
                        self.draw()
                        surface_reset_target()
                        gml_Script_toggle_alphafix(1)
                        draw_surface(win_surf, win_x, win_y)
                        gml_Script_toggle_alphafix(0)
                        draw_set_colour(wincol)
                        draw_set_alpha((focused ? 0.6 : 0.45))
                        draw_rectangle(win_x, win_y, ((win_x + win_width) - 1), (win_y - 32), false)
                        draw_set_colour(txtcol)
                        draw_text((win_x + 6), ((win_y - 33) + floor((string_height("M") / 2))), win_title)
                        draw_set_alpha(1)
                        surface_free(win_surf)
                    }
                }
                else
                {
                    win_moving = 0
                    if ((mousex < ((win_x + win_width) + 4) && mousex >= ((win_x + win_width) - 4) && mousey < ((win_y + win_height) + 4) && mousey >= ((win_y + win_height) - 4) && (!win_moving)) || (win_resize && mouse_check_button(mb_left)))
                    {
                        if win_resize
                            var _temp_local_var_14 = 1
                        else
                        {
                            var _temp_local_var_21 = other
                            var _temp_local_var_14 = (!other.other.WCscr_overconsole())
                        }
                        if (!other.other.WCscr_overconsole())
                            window_set_cursor(cr_size_nwse)
                        if (focused && mouse_check_button(mb_left))
                        {
                            if (!win_resize)
                            {
                                WC_win_dragx = (mousex - win_width)
                                WC_win_dragy = (mousey - win_height)
                                win_resize = 1
                            }
                            win_width = clamp((mousex - WC_win_dragx), 16, (guiwidth - win_x))
                            win_height = clamp((mousey - WC_win_dragy), 16, (guiheight - win_y))
                        }
                        else
                            win_resize = 0
                    }
                    else
                    {
                        if (window_get_cursor() == -8)
                        {
                            if (display_mouse_get_x() > window_get_x() && display_mouse_get_x() < (window_get_x() + window_get_width()) && display_mouse_get_y() > window_get_y() && display_mouse_get_y() < (window_get_y() + window_get_height()))
                                window_set_cursor(cr_default)
                        }
                        win_resize = 0
                    }
                    var win_surf = surface_create_fix(win_width, win_height)
                    if (surface_get_width(win_surf) != win_width || surface_get_height(win_surf) != win_height)
                        surface_resize(win_surf, win_width, win_height)
                    surface_set_target(win_surf)
                    draw_clear_alpha(wincol, 0.35)
                    draw_set_colour(txtcol)
                    self.draw()
                    surface_reset_target()
                    gml_Script_toggle_alphafix(1)
                    draw_surface(win_surf, win_x, win_y)
                    gml_Script_toggle_alphafix(0)
                    draw_set_colour(wincol)
                    var _temp_local_var_17 = (focused ? 0.6 : 0.45)
                    draw_set_alpha((focused ? 0.6 : 0.45))
                    draw_rectangle(win_x, win_y, ((win_x + win_width) - 1), (win_y - 32), false)
                    draw_set_colour(txtcol)
                    draw_text((win_x + 6), ((win_y - 33) + floor((string_height("M") / 2))), win_title)
                    draw_set_alpha(1)
                    surface_free(win_surf)
                }
            }
            else
            {
                win_moving = 0
                if ((mousex < ((win_x + win_width) + 4) && mousex >= ((win_x + win_width) - 4) && mousey < ((win_y + win_height) + 4) && mousey >= ((win_y + win_height) - 4) && (!win_moving)) || (win_resize && mouse_check_button(mb_left)))
                {
                    if win_resize
                        var _temp_local_var_14 = 1
                    else
                    {
                        var _temp_local_var_21 = other
                        var _temp_local_var_14 = (!other.other.WCscr_overconsole())
                    }
                    if (!other.other.WCscr_overconsole())
                        window_set_cursor(cr_size_nwse)
                    if (focused && mouse_check_button(mb_left))
                    {
                        if (!win_resize)
                        {
                            WC_win_dragx = (mousex - win_width)
                            WC_win_dragy = (mousey - win_height)
                            win_resize = 1
                        }
                        win_width = clamp((mousex - WC_win_dragx), 16, (guiwidth - win_x))
                        win_height = clamp((mousey - WC_win_dragy), 16, (guiheight - win_y))
                    }
                    else
                        win_resize = 0
                }
                else
                {
                    if (window_get_cursor() == -8)
                    {
                        if (display_mouse_get_x() > window_get_x() && display_mouse_get_x() < (window_get_x() + window_get_width()) && display_mouse_get_y() > window_get_y() && display_mouse_get_y() < (window_get_y() + window_get_height()))
                            window_set_cursor(cr_default)
                    }
                    win_resize = 0
                }
                var win_surf = surface_create_fix(win_width, win_height)
                if (surface_get_width(win_surf) != win_width || surface_get_height(win_surf) != win_height)
                    surface_resize(win_surf, win_width, win_height)
                surface_set_target(win_surf)
                draw_clear_alpha(wincol, 0.35)
                draw_set_colour(txtcol)
                self.draw()
                surface_reset_target()
                gml_Script_toggle_alphafix(1)
                draw_surface(win_surf, win_x, win_y)
                gml_Script_toggle_alphafix(0)
                draw_set_colour(wincol)
                var _temp_local_var_17 = (focused ? 0.6 : 0.45)
                draw_set_alpha((focused ? 0.6 : 0.45))
                draw_rectangle(win_x, win_y, ((win_x + win_width) - 1), (win_y - 32), false)
                draw_set_colour(txtcol)
                draw_text((win_x + 6), ((win_y - 33) + floor((string_height("M") / 2))), win_title)
                draw_set_alpha(1)
                surface_free(win_surf)
            }
        }
    }
    if instance_exists(WC_drag_inst)
    {
        draw_set_color((WC_drag_alt ? merge_colour(c_aqua, c_white, 0.75) : c_white))
        draw_set_align(1, 0)
        var dragtext = "Dragging "
        if (mouse_check_button(mb_middle) && keyboard_check(vk_control))
            dragtext = "Duplicating "
        var postext = string("x{0} y{1}", WC_drag_inst.x, WC_drag_inst.y)
        if WC_drag_alt
            postext += string("  >  x{0} y{1}", (floor(((gml_Script_mouse_x_hook() - other.WC_drag_offset[0]) / other.WC_drag_grid[0])) * other.WC_drag_grid[0]), (floor(((gml_Script_mouse_y_hook() - other.WC_drag_offset[1]) / other.WC_drag_grid[1])) * other.WC_drag_grid[1]))
        draw_text_outline((guiwidth / 2), 0, concat(dragtext, object_get_name(WC_drag_inst.object_index), "\n", postext))
    }
    if (WC_select_mode != -1)
    {
        draw_set_color(c_white)
        draw_set_align(1, 0)
        draw_text_outline((guiwidth / 2), 0, "Right click to cancel")
    }
}

