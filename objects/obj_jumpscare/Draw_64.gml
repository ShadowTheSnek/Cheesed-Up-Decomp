/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_screen_clear

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
switch state
{
    case states.revolver:
        var p = 4
        var t = 0
        if (yy > p)
            yy -= 32
        else
        {
            yy = p
            t = p
        }
        gml_Script_screen_clear(make_color_rgb(248, 0, 0))
        draw_sprite(spr_monsterjumpscarebg, 0, obj_screensizer.normal_size_fix_x, obj_screensizer.normal_size_fix_y)
        var _y = ((obj_screensizer.normal_size_fix_x + yy) + irandom_range((-t), t))
        if (_y < 0)
            _y = 0
        draw_sprite(spr_monsterjumpscare, monsterid, (obj_screensizer.normal_size_fix_x + irandom_range((-t), t)), _y)
        if oktoberfest
        {
            gml_Script_screen_clear(make_color_rgb(88, 192, 0))
            draw_sprite(spr_oktoberfestbg, 0, obj_screensizer.normal_size_fix_x, obj_screensizer.normal_size_fix_y)
            draw_sprite(spr_oktoberfest, 0, obj_screensizer.normal_size_fix_x, obj_screensizer.normal_size_fix_y)
        }
        break
    case 2:
        draw_sprite(sprite_index, image_index, 0, 0)
        break
}

