/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_instance_create

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2531
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_instance_create

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2531
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 1783
*/
var slope_points = object_get_slope_line(id)
var obj = collision_line(slope_points[0], (slope_points[1] - 1), slope_points[2], (slope_points[3] - 1), obj_player, false, false)
with (obj)
{
    if ((!(((state != states.tumble || (sprite_index != spr_tumble && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend)) && state != states.backbreaker && state != states.chainsaw && state != states.bump))) || (!scr_transformationcheck()) || (sign(hsp) != sign(other.image_xscale) && grounded))
    {
    }
    else if (global.MIDWAY && (state == states.backbreaker || vsp < 0))
    {
    }
    else
    {
        var bbox_height = ((bbox_bottom - bbox_top) + 2)
        while inside_slope(other)
            y--
        if (!isgustavo)
        {
            if (state == states.punch)
                movespeed = abs(hsp)
            state = states.grind
        }
        else
        {
            if (state == states.ratmounttrickjump || state == states.tumble)
                movespeed *= sign(hsp)
            if (state != states.ratmountgrind)
            {
                if (brick == 1)
                {
                    with (gml_Script_instance_create(x, y, obj_brickcomeback))
                        wait = 1
                }
                with (gml_Script_instance_create(x, (y - 5), obj_parryeffect))
                {
                    sound_play_3d("event:/sfx/pep/step", x, y)
                    sprite_index = spr_grabhangeffect
                    image_speed = 0.35
                }
                brick = 0
            }
            y += bbox_height
            state = states.ratmountgrind
        }
    }
}
