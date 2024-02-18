/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_window_to_gui_yscale

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_window_to_gui_xscale

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_window_to_gui_y

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_window_to_gui_x

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
with (obj_tv)
{
    if (jumpscare > -1)
    {
        jumpscare--
        if (irandom(2) == 0)
            jumpscareimage = irandom((sprite_get_number(spr_scares) - 1))
        if (jumpscare <= 5)
            draw_sprite(spr_scares_txt, jumpscaretext, 0, 0)
        else
            draw_sprite(spr_scares, jumpscareimage, 0, 0)
    }
}
global.Pattern_Texture_Indexed = -4
surface_reset_target()
shader_reset()
draw_set_alpha(1)
draw_set_colour(c_white)
if (!surface_exists(gui_surf))
{
    gpu_set_blendmode(bm_normal)
    return;
}
var shd = 0
if (frac(app_scale) > 0 && global.option_texfilter)
{
    var tex = surface_get_texture(gui_surf)
    var tw = texture_get_texel_width(tex)
    var th = texture_get_texel_height(tex)
    shader_set_fix(shd_aa)
    gpu_set_texfilter(true)
    shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vTexelSize"), tw, th)
    shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vScale"), (window_get_width() / surface_get_width(gui_surf)), (window_get_height() / surface_get_height(gui_surf)))
    shd = 1
}
gml_Script_reset_blendmode()
if (global.option_scale_mode != 2)
{
    var _w = (display_get_gui_width() * app_scale)
    var _h = (display_get_gui_height() * app_scale)
    draw_surface_ext(gui_surf, floor(gml_Script_window_to_gui_x(((window_get_width() / 2) - (_w / 2)))), floor(gml_Script_window_to_gui_y(((window_get_height() / 2) - (_h / 2)))), gml_Script_window_to_gui_xscale(app_scale), gml_Script_window_to_gui_yscale(app_scale), 0, c_white, 1)
}
else
    draw_surface(gui_surf, 0, 0)
gpu_set_blendmode(bm_normal)
gpu_set_texfilter(false)
shader_reset()
if lang_init
    global.gameframe_caption_font = gml_Script_lang_get_font("captionfont")
if (window_has_focus() && global.gameframe_enabled)
    gameframe_draw()
