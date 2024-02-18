/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_screen_option_apply_fullscreen

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_screen_apply_size_delayed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
depth = -99
scr_init_input()
slidecount = 0
slidebuffer = 0
bg_alpha = [1, 0, 0, 0, 0, 0]
bg_x = 0
bg_y = 0
menus = []
lastmenu = 0
menu = 0
optionselected = 0
backbuffer = 0
tooltip = ""
tooltip_alpha = 0
scroll = 0
pause_icons = array_create(0)
scr_pauseicon_add(spr_pauseicons, 4)
scr_pauseicon_add(spr_pauseicons, 5)
scr_pauseicon_add(spr_pauseicons, 6)
scr_pauseicon_add(spr_pauseicons, 7, 8, 8)
scr_pauseicon_add(spr_pauseicons, 9, 0, 16)
var categories = create_menu_fixed((0 << 0), (0 << 0), 0, 48, -4)
add_option_press(categories, 0, "option_audio", function() //gml_Script_anon@935@gml_Object_obj_option_Create_0
{
    menu_goto((1 << 0))
}
)
add_option_press(categories, 1, "option_video", function() //gml_Script_anon@1029@gml_Object_obj_option_Create_0
{
    menu_goto((2 << 0))
}
)
add_option_press(categories, 2, "option_game", function() //gml_Script_anon@1122@gml_Object_obj_option_Create_0
{
    menu_goto((6 << 0))
}
)
add_option_press(categories, 3, "option_controls", function() //gml_Script_anon@1218@gml_Object_obj_option_Create_0
{
    menu_goto((7 << 0))
}
)
if (!global.goodmode)
    add_option_press(categories, 4, "option_modded", function() //gml_Script_anon@1427@gml_Object_obj_option_Create_0
    {
        obj_option.key_jump = 0
        instance_create_unique(0, 0, obj_modconfig)
    }
)
array_push(menus, categories)
var audio_menu = create_menu_fixed((1 << 0), (1 << 0), 150, 40)
add_option_press(audio_menu, 0, "option_back", function() //gml_Script_anon@1712@gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
    fmod_event_instance_stop(global.snd_slidermaster, 1)
    fmod_event_instance_stop(global.snd_slidermusic, 1)
    fmod_event_instance_stop(global.snd_slidersfx, 1)
}
)
add_option_slide(audio_menu, 1, "option_master", function(argument0) //gml_Script_anon@1981@gml_Object_obj_option_Create_0
{
    global.option_master_volume = (argument0 / 100)
    set_audio_config(0)
}
, function(argument0) //gml_Script_anon@2072@gml_Object_obj_option_Create_0
{
    global.option_master_volume = (argument0 / 100)
    set_audio_config()
}
, "event:/sfx/ui/slidersfxmaster").value = (global.option_master_volume * 100)
add_option_slide(audio_menu, 2, "option_music", function(argument0) //gml_Script_anon@2285@gml_Object_obj_option_Create_0
{
    global.option_music_volume = (argument0 / 100)
    set_audio_config(0)
}
, function(argument0) //gml_Script_anon@2375@gml_Object_obj_option_Create_0
{
    global.option_music_volume = (argument0 / 100)
    set_audio_config()
}
, "event:/sfx/ui/slidermusic").value = (global.option_music_volume * 100)
add_option_slide(audio_menu, 3, "option_sfx", function(argument0) //gml_Script_anon@2580@gml_Object_obj_option_Create_0
{
    global.option_sfx_volume = (argument0 / 100)
    set_audio_config(0)
}
, function(argument0) //gml_Script_anon@2668@gml_Object_obj_option_Create_0
{
    global.option_sfx_volume = (argument0 / 100)
    set_audio_config()
}
, "event:/sfx/ui/slidersfx").value = (global.option_sfx_volume * 100)
add_option_toggle(audio_menu, 4, "option_unfocus", function(argument0) //gml_Script_anon@2872@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "unfocus_mute", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_unfocus_mute = argument0
}
).value = global.option_unfocus_mute
array_push(menus, audio_menu)
var video_menu = create_menu_fixed((2 << 0), (1 << 0), 150, 40)
add_option_press(video_menu, 0, "option_back", function() //gml_Script_anon@3308@gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
}
)
add_option_press(video_menu, 1, "option_window_mode", function() //gml_Script_anon@3407@gml_Object_obj_option_Create_0
{
    menu_goto((3 << 0))
}
)
var res = []
for (var i = 0; i < array_length(@@Global@@().resolutions[obj_screensizer.aspect_ratio]); i++)
{
    var b = @@Global@@().resolutions[obj_screensizer.aspect_ratio][i]
    array_push(res, create_option_value(concat(b[0], "X", b[1]), i, 0))
}
add_option_multiple(video_menu, 2, "option_resolution", res, function(argument0) //gml_Script_anon@3768@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "resolution", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_resolution = argument0
    gml_Script_screen_apply_size()
}
).value = global.option_resolution
add_option_toggle(video_menu, 3, "option_vsync", function(argument0) //gml_Script_anon@4083@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "vsync", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_vsync = argument0
    gml_Script_screen_apply_vsync()
}
).value = global.option_vsync
add_option_toggle(video_menu, 4, "option_texfilter", function(argument0) //gml_Script_anon@4403@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "texfilter", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_texfilter = argument0
}
).value = global.option_texfilter
add_option_toggle(video_menu, 5, "option_hud", function(argument0) //gml_Script_anon@4692@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "hud", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_hud = argument0
}
).value = global.option_hud
array_push(menus, video_menu)
var window_menu = create_menu_fixed((3 << 0), (1 << 0), 150, 40, (2 << 0))
add_option_press(window_menu, 0, "option_back", function() //gml_Script_anon@5118@gml_Object_obj_option_Create_0
{
    menu_goto((2 << 0))
}
)
add_option_press(window_menu, 1, "option_windowed", function() //gml_Script_anon@5218@gml_Object_obj_option_Create_0
{
    gml_Script_screen_option_apply_fullscreen(false)
    gml_Script_screen_apply_size_delayed()
}
)
add_option_press(window_menu, 2, "option_fullscreen", function() //gml_Script_anon@5362@gml_Object_obj_option_Create_0
{
    gml_Script_screen_option_apply_fullscreen(true)
    gml_Script_screen_apply_size_delayed()
}
)
if global.gameframe_enabled
    add_option_press(window_menu, 3, "option_borderless", function() //gml_Script_anon@5541@gml_Object_obj_option_Create_0
    {
        gml_Script_screen_option_apply_fullscreen(2)
        gml_Script_screen_apply_size_delayed()
    }
)
var sca = [create_option_value("option_scaling_fit", 0), create_option_value("option_scaling_pp", 1)]
if global.experimental
    array_push(sca, create_option_value("option_scaling_expand", 2))
add_option_multiple(window_menu, 4, "option_scaling", sca, function(argument0) //gml_Script_anon@5903@gml_Object_obj_option_Create_0
{
    if (argument0 == 2)
    {
        if (!global.experimental)
        {
            argument0 = 0
            tooltip = gml_Script_lang_get_value_newline("option_tooltip_expand2")
        }
        else
            tooltip = gml_Script_lang_get_value_newline("option_tooltip_expand")
    }
    else
        tooltip = ""
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "scale_mode", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_scale_mode = argument0
    gml_Script_screen_apply_size()
}
).value = min(global.option_scale_mode, (array_length(sca) - 1))
add_option_toggle(window_menu, 5, "option_gameframe", function(argument0) //gml_Script_anon@6521@gml_Object_obj_option_Create_0
{
    if (argument0 != global.gameframe_enabled || 0)
    {
        with (gml_Script_instance_create(0, 0, obj_screenconfirm))
        {
            savedoption = global.gameframe_enabled
            section = "Modded"
            var key = "gameframe"
            varname = "gameframe_enabled"
            depth = (obj_option.depth - 1)
            restart = 1
            saveto = argument0
        }
    }
    else
    {
        ini_open_from_string(obj_savesystem.ini_str_options)
        ini_write_real("Modded", "gameframe", argument0)
        obj_savesystem.ini_str_options = ini_close()
    }
}
).value = global.gameframe_enabled
array_push(menus, window_menu)
var resolution_menu = create_menu_fixed((4 << 0), (1 << 0), 150, 40, (2 << 0))
add_option_press(resolution_menu, 0, "option_back", function() //gml_Script_anon@7371@gml_Object_obj_option_Create_0
{
    menu_goto((2 << 0))
}
)
for (i = 0; i < array_length(@@Global@@().resolutions[obj_screensizer.aspect_ratio]); i++)
{
    b = @@Global@@().resolutions[obj_screensizer.aspect_ratio][i]
    add_option_press(resolution_menu, (i + 1), concat(b[0], "X", b[1]), function() //gml_Script_anon@7643@gml_Object_obj_option_Create_0
    {
        var opt = global.option_resolution
        global.option_resolution = (menus[menu].options[optionselected].option_id - 1)
        gml_Script_screen_apply_size()
        with (gml_Script_instance_create(0, 0, obj_screenconfirm))
        {
            savedoption = opt
            section = "Option"
            key = "resolution"
            varname = "option_resolution"
            depth = (obj_option.depth - 1)
        }
    }
).localization = 0
}
array_push(menus, resolution_menu)
var game_menu = create_menu_fixed((6 << 0), (1 << 0), 150, 40)
add_option_press(game_menu, 0, "option_back", function() //gml_Script_anon@8311@gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
}
)
add_option_toggle(game_menu, 1, "option_vibration", function(argument0) //gml_Script_anon@8410@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "vibration", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_vibration = argument0
}
).value = global.option_vibration
add_option_toggle(game_menu, 1, "option_screenshake", function(argument0) //gml_Script_anon@8704@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "screenshake", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_screenshake = argument0
}
).value = global.option_screenshake
var lang = []
key = ds_map_find_first(global.lang_map)
for (i = 0; i < ds_map_size(global.lang_map); i++)
{
    var l = ds_map_find_value(global.lang_map, key)
    array_push(lang, create_option_value(ds_map_find_value(l, "display_name"), key, 0))
    key = ds_map_find_next(global.lang_map, key)
}
var lang_option = add_option_multiple(game_menu, 2, "option_lang", lang, function(argument0) //gml_Script_anon@9336@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_string("Option", "lang", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_lang = argument0
    gml_Script_lang_switch(global.option_lang)
}
)
var r = 0
i = 0
while (i < array_length(lang))
{
    if (lang[i].value == global.option_lang)
    {
        r = i
        break
    }
    else
    {
        i++
        continue
    }
}
lang_option.value = r
add_option_toggle(game_menu, 3, "option_timer", function(argument0) //gml_Script_anon@9776@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "timer", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_timer = argument0
}
).value = global.option_timer
add_option_multiple(game_menu, 4, "option_timer_type", [create_option_value("option_timer_level", 0), create_option_value("option_timer_save", 1)], function(argument0) //gml_Script_anon@10152@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "timer_type", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_timer_type = argument0
}
).value = global.option_timer_type
add_option_toggle(game_menu, 5, "option_timer_speedrun", function(argument0) //gml_Script_anon@10452@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Option", "speedrun_timer", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.option_speedrun_timer = argument0
}
).value = global.option_speedrun_timer
add_option_toggle(game_menu, 6, "option_unfocus_pause", function(argument0) //gml_Script_anon@10763@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Modded", "unfocus_pause", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.unfocus_pause = argument0
}
).value = global.unfocus_pause
array_push(menus, game_menu)
var controls_menu = create_menu_fixed((7 << 0), (1 << 0), 150, 40)
add_option_press(controls_menu, 0, "option_back", function() //gml_Script_anon@11200@gml_Object_obj_option_Create_0
{
    menu_goto((0 << 0))
}
)
add_option_press(controls_menu, 1, "option_keyboard", function() //gml_Script_anon@11298@gml_Object_obj_option_Create_0
{
    menu_goto((9 << 0))
}
)
add_option_press(controls_menu, 2, "option_controller", function() //gml_Script_anon@11403@gml_Object_obj_option_Create_0
{
    menu_goto((8 << 0))
}
)
add_option_press(controls_menu, 3, "option_reset_config", function() //gml_Script_anon@11511@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_section_delete("Input")
    ini_section_delete("InputConfig")
    scr_initinput(0)
    obj_savesystem.ini_str_options = ini_close()
    with (obj_option)
    {
        for (i = 0; i < array_length(menus); i++)
        {
            b = menus[i]
            if (b.menu_id == (8 << 0) || b.menu_id == (10 << 0) || b.menu_id == (9 << 0))
            {
                for (var j = 0; j < array_length(b.options); j++)
                {
                    var q = b.options[j]
                    if (q.name == "option_deadzone")
                        q.value = (global.input_controller_deadzone * 100)
                    else if (q.name == "option_deadzone_h")
                        q.value = (global.input_controller_deadzone_horizontal * 100)
                    else if (q.name == "option_deadzone_v")
                        q.value = (global.input_controller_deadzone_vertical * 100)
                    else if (q.name == "option_deadzone_press")
                        q.value = (global.input_controller_deadzone_press * 100)
                    else if (q.name == "option_deadzone_superjump")
                        q.value = (global.gamepad_deadzone_superjump * 100)
                    else if (q.name == "option_deadzone_crouch")
                        q.value = (global.gamepad_deadzone_crouch * 100)
                    else if (q.name == "option_controller_superjump")
                        q.value = global.gamepad_superjump
                    else if (q.name == "option_controller_groundpound")
                        q.value = global.gamepad_groundpound
                    else if (q.name == "option_keyboard_superjump")
                        q.value = global.keyboard_superjump
                    else if (q.name == "option_keyboard_groundpound")
                        q.value = global.keyboard_groundpound
                }
            }
        }
    }
    with (create_transformation_tip(gml_Script_lang_get_value("option_controls_resetted")))
    {
        depth = -700
        alarm[1] = 100
    }
}
)
array_push(menus, controls_menu)
var keyboard_menu = create_menu_fixed((9 << 0), (1 << 0), 150, 40, (7 << 0))
add_option_press(keyboard_menu, 0, "option_back", function() //gml_Script_anon@13448@gml_Object_obj_option_Create_0
{
    menu_goto((7 << 0))
}
)
add_option_press(keyboard_menu, 1, "option_controller_binds", function() //gml_Script_anon@13561@gml_Object_obj_option_Create_0
{
    obj_option.key_jump = 0
    instance_create_unique(0, 0, obj_keyconfig)
}
)
add_option_toggle(keyboard_menu, 2, "option_keyboard_superjump", function(argument0) //gml_Script_anon@13726@gml_Object_obj_option_Create_0
{
    global.keyboard_superjump = argument0
    set_controller_config()
}
).value = global.keyboard_superjump
add_option_toggle(keyboard_menu, 3, "option_keyboard_groundpound", function(argument0) //gml_Script_anon@13914@gml_Object_obj_option_Create_0
{
    global.keyboard_groundpound = argument0
    set_controller_config()
}
).value = global.keyboard_groundpound
array_push(menus, keyboard_menu)
var controller_menu = create_menu_fixed((8 << 0), (1 << 0), 150, 40, (7 << 0))
add_option_press(controller_menu, 0, "option_back", function() //gml_Script_anon@14267@gml_Object_obj_option_Create_0
{
    menu_goto((7 << 0))
}
)
add_option_press(controller_menu, 1, "option_controller_binds", function(argument0) //gml_Script_anon@14381@gml_Object_obj_option_Create_0
{
    obj_option.key_jump = 0
    with (instance_create_unique(0, 0, obj_keyconfig))
        controller = 1
}
)
add_option_press(controller_menu, 2, "option_deadzone_title", function(argument0) //gml_Script_anon@14574@gml_Object_obj_option_Create_0
{
    menu_goto((10 << 0))
}
)
add_option_toggle(controller_menu, 3, "option_controller_superjump", function(argument0) //gml_Script_anon@14696@gml_Object_obj_option_Create_0
{
    global.gamepad_superjump = argument0
    set_controller_config()
}
).value = global.gamepad_superjump
add_option_toggle(controller_menu, 4, "option_controller_groundpound", function(argument0) //gml_Script_anon@14886@gml_Object_obj_option_Create_0
{
    global.gamepad_groundpound = argument0
    set_controller_config()
}
).value = global.gamepad_groundpound
array_push(menus, controller_menu)
var back = (8 << 0)
var deadzones_menu = create_menu_fixed((10 << 0), (1 << 0), 150, 40, back)
add_option_press(deadzones_menu, 0, "option_back", function() //gml_Script_anon@15254@gml_Object_obj_option_Create_0
{
    menu_goto((8 << 0))
}
)
add_option_slide(deadzones_menu, 1, "option_deadzone", function(argument0) //gml_Script_anon@15358@gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone = (argument0 / 100)
    trace((argument0 / 100))
    set_controller_config()
}
).value = (global.input_controller_deadzone * 100)
add_option_slide(deadzones_menu, 2, "option_deadzone_h", function(argument0) //gml_Script_anon@15613@gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone_horizontal = (argument0 / 100)
    trace((argument0 / 100))
    set_controller_config()
}
).value = (global.input_controller_deadzone_horizontal * 100)
add_option_slide(deadzones_menu, 3, "option_deadzone_v", function(argument0) //gml_Script_anon@15888@gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone_vertical = (argument0 / 100)
    trace((argument0 / 100))
    set_controller_config()
}
).value = (global.input_controller_deadzone_vertical * 100)
add_option_slide(deadzones_menu, 4, "option_deadzone_press", function(argument0) //gml_Script_anon@16165@gml_Object_obj_option_Create_0
{
    if (argument0 > 90)
        argument0 = 90
    global.input_controller_deadzone_press = (argument0 / 100)
    trace((argument0 / 100))
    set_controller_config()
}
).value = (global.input_controller_deadzone_press * 100)
add_option_slide(deadzones_menu, 5, "option_deadzone_superjump", function(argument0) //gml_Script_anon@16440@gml_Object_obj_option_Create_0
{
    global.gamepad_deadzone_superjump = (argument0 / 100)
    set_controller_config()
    trace((argument0 / 100))
}
).value = (global.gamepad_deadzone_superjump * 100)
add_option_slide(deadzones_menu, 5, "option_deadzone_crouch", function(argument0) //gml_Script_anon@16673@gml_Object_obj_option_Create_0
{
    global.gamepad_deadzone_crouch = (argument0 / 100)
    set_controller_config()
    trace((argument0 / 100))
}
).value = (global.gamepad_deadzone_crouch * 100)
array_push(menus, deadzones_menu)
var inputdisplay_menu = create_menu_fixed((12 << 0), (1 << 0), 150, 40, (0 << 0))
add_option_press(inputdisplay_menu, 0, "option_back", function() //gml_Script_anon@17075@gml_Object_obj_option_Create_0
{
    with (obj_inputdisplay)
        self.savekeys()
    with (obj_modconfig)
        visible = true
    menu_goto((0 << 0))
}
)
if instance_exists(obj_inputdisplay)
{
    add_option_toggle(inputdisplay_menu, 1, "option_active", function(argument0) //gml_Script_anon@17303@gml_Object_obj_option_Create_0
    {
        global.inputdisplay = argument0
    }
).value = global.inputdisplay
    add_option_slide(inputdisplay_menu, 2, "option_opacity", function(argument0) //gml_Script_anon@17446@gml_Object_obj_option_Create_0
    {
        obj_inputdisplay.keyalpha = (argument0 / 100)
    }
).value = (obj_inputdisplay.keyalpha * 100)
}
array_push(menus, inputdisplay_menu)
var lapping_menu = create_menu_fixed((13 << 0), (1 << 0), 120, 40, (0 << 0))
add_option_press(lapping_menu, 0, "option_back", function() //gml_Script_anon@17772@gml_Object_obj_option_Create_0
{
    with (obj_modconfig)
        visible = true
    menu_goto((0 << 0))
}
)
var o = add_option_multiple(lapping_menu, 1, "option_lap_lapmode", [create_option_value("option_lap_normal", 0), create_option_value("option_lap_infinite", 1), create_option_value("option_lap_laphell", 2)], function(argument0) //gml_Script_anon@18083@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Modded", "lapmode", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.lapmode = argument0
    self.set_tooltip(argument0)
}
)
o.value = global.lapmode
o.set_tooltip = method(o, function(argument0) //gml_Script_anon@18354@gml_Object_obj_option_Create_0
{
    tooltip = gml_Script_lang_get_value_newline(string("option_tooltip_lapmode{0}", (argument0 + 1)))
}
)
o.value.o.value.set_tooltip(o)
o = add_option_toggle(lapping_menu, 2, (global.SUGARY ? "option_lap_parry_sugary" : "option_lap_parry"), function(argument0) //gml_Script_anon@18577@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Modded", "parrypizzaface", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.parrypizzaface = argument0
}
)
o.value = global.parrypizzaface
o = add_option_multiple(lapping_menu, 3, "option_lap_checkpoints", [create_option_value("option_off", 0), create_option_value("option_lap_lap3", 1), create_option_value("option_lap_lap4", 2), create_option_value("option_lap_both", 3)], function(argument0) //gml_Script_anon@19081@gml_Object_obj_option_Create_0
{
    global.lap3checkpoint = (argument0 % 2)
    global.lap4checkpoint = argument0 > 1
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Modded", "lap3checkpoint", global.lap3checkpoint)
    ini_write_real("Modded", "lap4checkpoint", global.lap4checkpoint)
    obj_savesystem.ini_str_options = ini_close()
}
)
o.value = (global.lap3checkpoint + (global.lap4checkpoint * 2))
o.tooltip = gml_Script_lang_get_value_newline("option_tooltip_checkpoints")
o = add_option_multiple(lapping_menu, 4, "option_lap_changes", [create_option_value("option_off", 0), create_option_value("option_lap_blocks", 1), create_option_value("option_lap_slowdown", 2)], function(argument0) //gml_Script_anon@19748@gml_Object_obj_option_Create_0
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_write_real("Modded", "chasekind", argument0)
    obj_savesystem.ini_str_options = ini_close()
    global.chasekind = argument0
    self.set_tooltip(argument0)
}
)
o.value = global.chasekind
o.set_tooltip = live_method(o, function(argument0) //gml_Script_anon@20030@gml_Object_obj_option_Create_0
{
    tooltip = embed_value_string(gml_Script_lang_get_value_newline(string("option_tooltip_changes{0}", (argument0 + 1))), [gml_Script_lang_get_value_newline((global.SUGARY ? "option_coneball" : "option_pizzaface"))])
}
)
o.value.o.value.set_tooltip(o)
array_push(menus, lapping_menu)
