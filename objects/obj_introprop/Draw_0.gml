/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_reset_shader_fix

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
if (!sprite_exists(sprite_index))
    return;
if (sprite_index != spr_towerending_gustavo && sprite_index != spr_towerending_peppino && sprite_index != spr_towerending_bosses)
    draw_self()
else
{
    shader_set_fix(shd_pal_swapper)
    pal_swap_player_palette(undefined, undefined, undefined, undefined, undefined, 1)
    draw_self()
    pal_swap_reset()
}
