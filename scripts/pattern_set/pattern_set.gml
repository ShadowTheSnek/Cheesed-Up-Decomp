function pattern_set(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_pattern_set
{
    if (argument6 == undefined)
        argument6 = global.Pattern_Index
    if (argument7 == undefined)
        argument7 = 0
    if (argument8 == undefined)
        argument8 = 0
    if 1
    {
    }
    else
        shade_multiplier = shader_get_uniform(shd_pal_swapper, "shade_multiplier")
    if (argument5 == -4)
        return;
    shader_set_fix(shd_pal_swapper)
    pattern_enable(1)
    pattern_set_pattern(argument5, argument6)
    pattern_set_sprite(argument1, argument2, argument3, argument4, (sprite_get_xoffset(argument5) + argument7), (sprite_get_yoffset(argument5) + argument8))
    pattern_set_color_array(argument0)
    shader_set_uniform_f(shade_multiplier, 1)
}

function pattern_set_temp(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_pattern_set_temp
{
    if (argument6 == undefined)
        argument6 = global.Pattern_Index
    if (argument7 == undefined)
        argument7 = 0
    if (argument8 == undefined)
        argument8 = 0
    if 1
    {
    }
    else
        shade_multiplier = shader_get_uniform(shd_pal_swapper, "shade_multiplier")
    if (argument5 == -4)
        return;
    shader_set_fix(shd_pal_swapper)
    pattern_enable(1)
    var _texT = sprite_get_texture(argument5, argument6)
    var _uvsT = sprite_get_uvs(argument5, argument6)
    texture_set_stage(global.Pattern_Texture, _texT)
    texture_set_interpolation_ext(global.Pattern_Texture, 0)
    shader_set_uniform_f(global.Pattern_UVs, _uvsT[0], _uvsT[1], _uvsT[2], _uvsT[3])
    shader_set_uniform_f(global.Pattern_Tex_Data, _uvsT[4], _uvsT[5], (texture_get_width(_texT) / texture_get_texel_width(_texT)), (texture_get_height(_texT) / texture_get_texel_height(_texT)))
    var _texS = sprite_get_texture(argument1, argument2)
    var _uvsS = sprite_get_uvs(argument1, argument2)
    shader_set_uniform_f(global.Pattern_Spr_UVs, _uvsS[0], _uvsS[1], _uvsS[2], _uvsS[3])
    shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvsS[4], _uvsS[5], (texture_get_width(_texS) / texture_get_texel_width(_texS)), (texture_get_height(_texS) / texture_get_texel_height(_texS)))
    shader_set_uniform_f(global.Pattern_Spr_Scale, argument3, argument4)
    shader_set_uniform_f(shader_get_uniform(shd_pal_swapper, "pattern_offset"), (sprite_get_xoffset(argument5) + argument7), (sprite_get_yoffset(argument5) + argument8))
    shader_set_uniform_f_array(global.Pattern_Color_Array, argument0)
    shader_set_uniform_f(shade_multiplier, 1)
}

