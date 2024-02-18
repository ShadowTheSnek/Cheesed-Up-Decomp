/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_scr_get_texture_palette

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2587
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_scr_get_texture_palette

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2268
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2819
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 1783
*/
if (room == hub_loadingscreen && state != states.dynamite)
{
    with (obj_player)
    {
        state = states.comingoutdoor
        sprite_index = spr_walkfront
        image_index = 0
    }
    if (!fadeoutcreate)
    {
        fadeoutcreate = 1
        with (obj_player)
        {
            ini_open_from_string(obj_savesystem.ini_str)
            var _intro = ini_read_real("Tutorial", "finished", 0)
            character = ini_read_string("Game", "character", "P")
            scr_characterspr()
            if (character == "G")
            {
                ratmount_movespeed = 8
                gustavodash = 0
                isgustavo = 1
                state = states.ratmount
                sprite_index = spr_ratmount_idle
                brick = 1
            }
            hat = ini_read_real("Game", "hat", -1)
            pet = ini_read_real("Game", "pet", -1)
            paletteselect = ini_read_real("Game", "palette", character == "P")
            var _texture = ini_read_string("Game", "palettetexture", "none")
            global.palettetexture = gml_Script_scr_get_texture_palette(_texture)
            ini_close()
            if (_intro || global.sandbox)
            {
                targetRoom = tower_entrancehall
                targetDoor = "A"
                state = states.victory
            }
            else
            {
                targetRoom = Finalintro
                targetDoor = "A"
                state = states.titlescreen
            }
        }
        with (gml_Script_instance_create(x, y, obj_fadeout))
        {
            gamestart = 1
            restarttimer = 1
        }
        icon_alpha = 0
        with (obj_achievementtracker)
        {
            achievement_get_steam_achievements(achievements_update)
            achievement_get_steam_achievements(achievements_notify)
        }
        with (gml_Script_instance_create(0, 0, obj_loadingscreen))
        {
            dark = 1
            group_arr = ["hubgroup"]
            offload_arr = ["menugroup"]
        }
    }
}
if (state != states.normal)
{
    showicon = 1
    icon_alpha = 3
}
else if showicon
{
    icon_alpha = Approach(icon_alpha, 0, 0.05)
    if (icon_alpha <= 0)
        showicon = 0
}
if showicon
{
    if check_sugary()
        icon_index += 0.35
    else
        icon_index = ((icon_index + 0.35) % icon_max)
}
