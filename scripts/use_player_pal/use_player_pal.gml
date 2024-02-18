function pal_swap_player_palette(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_pal_swap_player_palette
{
    if (argument0 == undefined)
        argument0 = sprite_index
    if (argument1 == undefined)
        argument1 = image_index
    if (argument2 == undefined)
        argument2 = image_xscale
    if (argument3 == undefined)
        argument3 = image_yscale
    if (argument4 == undefined)
        argument4 = obj_player1
    if (argument5 == undefined)
        argument5 = obj_player1.isgustavo
    shader_set_fix(shd_pal_swapper)
    with (obj_player1)
    {
        var spr = spr_palette
        var img = paletteselect
        if (argument5 && spr != spr_peppalette)
        {
            spr = spr_peppalette
            img = gustavo_palette(img)
        }
        else if custom_palette
            cuspal_set(custom_palette_array)
        pattern_set(global.Base_Pattern_Color, argument0, (argument1 == -1 ? other.image_index : argument1), argument2, argument3, global.palettetexture)
        pal_swap_set(spr, img)
    }
}

