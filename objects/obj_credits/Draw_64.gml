/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_toggle_alphafix

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_reset_blendmode

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
draw_set_font(gml_Script_lang_get_font("creditsfont"))
draw_set_halign(fa_center)
draw_set_valign(fa_top)
gml_Script_toggle_alphafix(1)
for (var i = 0; i < array_length(credits_arr); i++)
{
    var q = credits_arr[i]
    var yy = scroll_y
    var xx = 0
    if (i == 0)
    {
        draw_set_halign(fa_left)
        xx = 16
    }
    else
    {
        draw_set_halign(fa_right)
        xx = (obj_screensizer.actual_width - 16)
    }
    var j = init_pos
    while (j < array_length(q))
    {
        var b = q[j]
        var title = 0
        trace(b)
        if (b == "CHIVALROUS CUSTOMERS" || b == "COOL CUSTOMERS" || b == "WEENIE CUSTOMERS" || b == "CHEESY CUSTOMERS")
        {
            title = 1
            trace("Found title")
            var old_x = xx
            var old_halign = draw_get_halign()
            draw_set_halign(fa_center)
            xx = (obj_screensizer.actual_width / 2)
        }
        if ((!title) || i == 0)
            draw_text_color(xx, yy, b, c_white, c_white, c_white, c_white, image_alpha)
        if title
        {
            draw_set_halign(old_halign)
            xx = old_x
        }
        var h = string_height(b)
        yy += h
        if (yy > (obj_screensizer.actual_height + 100))
            break
        else
        {
            j++
            continue
        }
    }
}
gml_Script_toggle_alphafix(0)
