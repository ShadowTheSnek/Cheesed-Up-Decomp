/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_screen_apply_vsync

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
var item = array_shift(tex_list)
if (item != undefined)
{
    var tex = item[0]
    text = string("Loading {0}", item[1])
    trace("Loading texture: ", tex)
    if (!texture_is_ready(tex))
        texture_prefetch(tex)
    alarm[0] = 1
}
else
{
    image_alpha -= 0.1
    if (image_alpha <= -0.1)
    {
        scr_indexpalettes()
        room_goto(Initroom)
        gml_Script_screen_apply_vsync()
    }
    alarm[0] = 1
}
