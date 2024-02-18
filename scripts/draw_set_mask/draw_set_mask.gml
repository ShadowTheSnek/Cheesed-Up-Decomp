function draw_set_mask(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_draw_set_mask
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 0
    if 1
    {
    }
    else
    {
        var u_clip_sprite_texture = ((!shaders_are_supported()) ? -1 : shader_get_sampler_index(shd_masterclip, "u_clip_sprite_texture"))
        var u_clip_sprite_uvs = ((!shaders_are_supported()) ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_uvs"))
        var u_clip_sprite_size = ((!shaders_are_supported()) ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_size"))
        var u_clip_sprite_texelsize = ((!shaders_are_supported()) ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_texelsize"))
        var u_clip_sprite_worldposition = ((!shaders_are_supported()) ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_worldposition"))
        var u_clip_sprite_trimmed = ((!shaders_are_supported()) ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_trimmed"))
        var u_alphafix = ((!shaders_are_supported()) ? -1 : shader_get_uniform(shd_masterclip, "u_mask_alphafix"))
        var u_inverse = ((!shaders_are_supported()) ? -1 : shader_get_uniform(shd_masterclip, "u_mask_inverse"))
    }
    if global.performance
        return 0;
    var shader = (argument5 ? shd_masterclip_basic : shd_masterclip)
    shader_set_fix(shader)
    shader = shader_current()
    var clip_sprite_texture = sprite_get_texture(argument2, argument3)
    var clip_uvs = sprite_get_uvs(argument2, argument3)
    shader_set_uniform_f(shader_get_uniform(shader, "u_domaskclip"), 1)
    texture_set_stage(u_clip_sprite_texture, clip_sprite_texture)
    shader_set_uniform_f(u_clip_sprite_uvs, clip_uvs[0], clip_uvs[1], clip_uvs[2], clip_uvs[3])
    shader_set_uniform_f(u_clip_sprite_size, sprite_get_width(argument2), sprite_get_height(argument2))
    shader_set_uniform_f(u_clip_sprite_texelsize, texture_get_texel_width(clip_sprite_texture), texture_get_texel_height(clip_sprite_texture))
    shader_set_uniform_f(u_clip_sprite_trimmed, clip_uvs[4], clip_uvs[5], clip_uvs[6], clip_uvs[7])
    shader_set_uniform_f(u_clip_sprite_worldposition, argument0, argument1)
    shader_set_uniform_f(u_alphafix, argument4)
    shader_set_uniform_f(u_inverse, argument6)
    return 1;
}

function draw_set_mask_texture(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_draw_set_mask_texture
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if global.performance
        return 0;
    if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
    {
        shader = (argument4 ? shd_masterclip_basic : shd_masterclip)
        shader_set_fix(shader)
    }
    shader = shader_current()
    u_clip_sprite_texture = shader_get_sampler_index(shader, "u_clip_sprite_texture")
    u_clip_sprite_uvs = shader_get_uniform(shader, "u_clip_sprite_uvs")
    u_clip_sprite_size = shader_get_uniform(shader, "u_clip_sprite_size")
    u_clip_sprite_texelsize = shader_get_uniform(shader, "u_clip_sprite_texelsize")
    u_clip_sprite_worldposition = shader_get_uniform(shader, "u_clip_sprite_worldposition")
    u_clip_sprite_trimmed = shader_get_uniform(shader, "u_clip_sprite_trimmed")
    u_alphafix = shader_get_uniform(shader, "u_mask_alphafix")
    u_inverse = shader_get_uniform(shader, "u_mask_inverse")
    clip_uvs = texture_get_uvs(argument2)
    shader_set_uniform_f(shader_get_uniform(shader, "u_domaskclip"), 1)
    texture_set_stage(u_clip_sprite_texture, argument2)
    shader_set_uniform_f(u_clip_sprite_uvs, clip_uvs[0], clip_uvs[1], clip_uvs[2], clip_uvs[3])
    shader_set_uniform_f(u_clip_sprite_size, (1 / texture_get_texel_width(argument2)), (1 / texture_get_texel_height(argument2)))
    shader_set_uniform_f(u_clip_sprite_texelsize, texture_get_texel_width(argument2), texture_get_texel_height(argument2))
    shader_set_uniform_f(u_clip_sprite_trimmed, clip_uvs[4], clip_uvs[5], clip_uvs[6], clip_uvs[7])
    shader_set_uniform_f(u_clip_sprite_worldposition, argument0, argument1)
    shader_set_uniform_f(u_alphafix, argument3)
    shader_set_uniform_f(u_inverse, argument5)
    return 1;
}

