/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_lang_get_font

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
if (global.showfps && global.option_hud && ((!instance_exists(obj_version)) || instance_exists(obj_option)) && (!instance_exists(obj_disclaimer)) && (!instance_exists(obj_loadingscreen)))
{
    draw_set_font((global.SUGARY ? gml_Script_lang_get_font("smallfont") : gml_Script_lang_get_font("font_small")))
    draw_set_colour(c_white)
    draw_set_align(2, 2)
    var xx = (obj_screensizer.actual_width - 20)
    var yy = (obj_screensizer.actual_height - 12)
    if (global.option_timer && (!((room == Realtitlescreen || room == Longintro || room == Finalintro || room == Mainmenu || room == hub_loadingscreen || room == Creditsroom || room == Johnresurrectionroom || room == rank_room || instance_exists(obj_titlecard) || (!global.option_hud) || room == characterselect || room == editor_entrance || room == room_cancelled))))
    {
        xx -= 4
        yy -= 18
    }
    draw_text_transformed(xx, yy, string(fps), 1, 1, 0)
}
draw_set_align()
if global.goodmode
{
    draw_set_colour(c_white)
    draw_set_align(1)
    draw_set_font(gml_Script_lang_get_font("font_small"))
    draw_text(((obj_screensizer.actual_width / 2) + random_range((-multiplier), multiplier)), (32 + random_range((-multiplier), multiplier)), concat("Good Mode ", multiplier, "x"))
}
if (keyboard_check_pressed(vk_f11) ? 0 : 0)
{
    gif_record = (!gif_record)
    if gif_record
        gif_image = gif_open(obj_screensizer.actual_width, obj_screensizer.actual_height)
    else
    {
        gif_save(gif_image, string("screenshots/{0}.gif", string("{0}-{1}-{2}__{3}-{4}-{5}", current_year, current_month, current_day, current_hour, current_minute, current_second)))
        if ((!window_get_fullscreen()) && os_type == os_windows)
            launch_external(string("\"{0}screenshots\\\"", game_save_id))
    }
}
if gif_record
{
    gif_add_surface(gif_image, application_surface, 2)
    draw_set_colour(c_red)
    draw_set_align(1)
    draw_set_font(global.font_small)
    draw_text((obj_screensizer.actual_width / 2), 32, "Recording GIF")
}
if (gotmessage.time != -1)
{
    draw_set_colour(c_black)
    draw_set_alpha(0.25)
    draw_rectangle(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, false)
    draw_set_alpha(1)
    draw_set_colour(c_white)
    draw_set_font(global.font_small)
    draw_set_align(1, 1)
    if is_string(gotmessage.author)
        draw_text((obj_screensizer.actual_width / 2), ((obj_screensizer.actual_height / 2) - 20), string("{0} says...\n", gotmessage.author))
    else
        draw_text((obj_screensizer.actual_width / 2), ((obj_screensizer.actual_height / 2) - 20), "Global Message\n")
    var msgstr = gotmessage.message
    if (!is_string(msgstr))
        msgstr = "(error)"
    draw_text_ext_transformed(((obj_screensizer.actual_width / 2) + random_range(-1, 1)), (obj_screensizer.actual_height / 2), ("\n" + msgstr), 16, (obj_screensizer.actual_width / 2), 2, 2, 0)
    draw_set_align()
    gotmessage.time--
}
