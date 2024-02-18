/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_lang_get_value_newline

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_lang_get_value

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
if (staggerbuffer <= 0 && flickertime <= 0 && (other.state == states.handstandjump || other.instakillmove) && visible && (state == states.walk || (state == states.jump && sprite_index == spr_fakepeppino_bodyslamstart) || (state == states.freefall && sprite_index == spr_fakepeppino_bodyslamland) || (state == states.mach2 && attackspeed < 18) || state == states.Sjumpprep || (state == states.throwing && sprite_index != spr_fakepeppino_flailing)))
{
    if (subhp > 0)
    {
        if (state == states.walk)
        {
            state = states.staggered
            image_xscale = (-other.xscale)
            hsp = ((-image_xscale) * 20)
            vsp = 0
            sprite_index = spr_fakepeppino_stagger
            image_index = 0
        }
        else
            flashbuffer = 9
        staggerbuffer = 100
        flash = 1
        subhp--
        repeat (4)
            create_debris(x, y, spr_slapstar)
    }
    else
    {
        with (obj_fakepephead)
        {
            create_particle(x, y, (9 << 0))
            instance_destroy(id, false)
        }
        state = states.stun
        image_xscale = (-other.xscale)
        hsp = ((-image_xscale) * 8)
        vsp = -6
        thrown = 0
        linethrown = 0
        sprite_index = spr_fakepeppino_vulnerable
        stunned = 200
        flash = 1
        repeat (4)
            create_debris(x, y, spr_slapstar)
    }
    with (other)
    {
        sound_play_3d("event:/sfx/enemies/killingblow", x, y)
        state = states.tackle
        movespeed = 4
        sprite_index = choose(spr_lungehit, spr_kungfu1, spr_kungfu2, spr_kungfu3)
        image_index = 0
    }
}
else if (state == states.freefall || (state == states.mach2 && attackspeed >= 18) || state == states.Sjump || (state == states.throwing && attackspeed > 4))
{
    if other.flash
        flash = 0
    scr_hurtplayer(other)
}
