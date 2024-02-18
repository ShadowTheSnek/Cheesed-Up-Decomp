function scr_hub_bg_init(argument0) //gml_Script_scr_hub_bg_init
{
    if (argument0 == undefined)
        argument0 = 1
    bgsprite_number = sprite_get_number(bgsprite)
    bgsprite_width = sprite_get_width(bgsprite)
    bgsprite_height = sprite_get_height(bgsprite)
    bgspritepos = 0
    bgspriteposstart = 0
    bgalpha = 1
    bg_useparallax = 0
    bgparallax = [(0.65 * argument0), (0.75 * argument0), (0.85 * argument0)]
    bgparallax2 = [(0.1 * argument0), (0.15 * argument0), (0.2 * argument0)]
    bgmask_surface = -4
    bgclip_surface = -4
}

function scr_hub_bg_reinit(argument0, argument1) //gml_Script_scr_hub_bg_reinit
{
    bgsprite_number = sprite_get_number(bgsprite)
    bgsprite_width = sprite_get_width(bgsprite)
    bgsprite_height = sprite_get_height(bgsprite)
    for (var i = 0; i < bgsprite_number; i++)
    {
        bgspriteposstart[i] = 0
        bgspritepos[i] = 0
        if (bg_useparallax && i < array_length(bgparallax2))
        {
            var p = bgparallax2[i]
            bgspriteposstart[i] = [((argument0 - (argument0 * p)) - ((obj_screensizer.actual_width / 4) * p)), ((argument1 - (argument1 * p)) - ((obj_screensizer.actual_height / 4) * p))]
            bgspritepos[i] = [bgspriteposstart[i][0], bgspriteposstart[i][1]]
        }
    }
}

function scr_hub_bg_step() //gml_Script_scr_hub_bg_step
{
    for (i = 0; i < array_length(bgspritepos); i++)
    {
        if ((!bg_useparallax) && i < array_length(bgparallax))
            bgspritepos[i] = ((bgspritepos[i] - bgparallax[i]) % bgsprite_width)
        else if (i < array_length(bgparallax2))
        {
            p = bgparallax2[i]
            bgspritepos[i][0] = ((bgspriteposstart[i][0] + ((camera_get_view_x(view_camera[0]) + (obj_screensizer.actual_width / 2)) * p)) + ((obj_screensizer.actual_width / 5) * p))
            bgspritepos[i][1] = (bgspriteposstart[i][1] + ((camera_get_view_y(view_camera[0]) + (obj_screensizer.actual_height / 2)) * p))
        }
    }
}

function scr_hub_bg_draw(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_hub_bg_draw
{
    if (argument4 == undefined)
        argument4 = 0
    if (!sprite_exists(argument2))
        return;
    if (bgalpha < 1 || locked)
    {
        var w = sprite_get_width(argument2)
        var h = sprite_get_height(argument2)
        var x1 = sprite_get_xoffset(argument2)
        var y1 = sprite_get_yoffset(argument2)
        if locked
        {
            if (!surface_exists(bgmask_surface))
            {
                bgmask_surface = surface_create_fix(w, h)
                surface_set_target(bgmask_surface)
                draw_clear_alpha(c_black, 0)
                draw_set_flash(0x002868)
                draw_sprite(argument2, 0, (3 + x1), y1)
                draw_sprite(argument2, 0, (-3 + x1), y1)
                draw_sprite(argument2, 0, x1, (2 + y1))
                draw_reset_flash()
                surface_reset_target()
            }
            var xpad = 38
            draw_set_mask((argument0 - x1), (argument1 - y1), argument2, argument3)
            draw_sprite_tiled(spr_gate_lock, 0, (argument0 - x1), (argument1 - y1))
            draw_surface(bgmask_surface, (argument0 - x1), (argument1 - y1))
            draw_sprite_stretched(spr_gate_lockbase, 0, ((argument0 - x1) + xpad), (bbox_bottom - 18), (w - xpad), 19)
        }
        else
        {
            draw_set_mask((argument0 - x1), (argument1 - y1), argument2, argument3)
            for (i = 0; i < array_length(bgspritepos); i++)
            {
                if (!bg_useparallax)
                {
                    var b = bgspritepos[i]
                    draw_sprite_tiled(bgsprite, i, ((b + argument0) - x1), ((h + argument1) - y1))
                }
                else
                {
                    var bx = bgspritepos[i][0]
                    var by = bgspritepos[i][1]
                    draw_sprite_tiled(bgsprite, i, (bx - x1), ((by + h) - y1))
                }
            }
        }
        draw_reset_clip()
    }
    if (bgalpha > 0 && (!locked))
        draw_sprite_ext(argument2, argument3, argument0, argument1, image_xscale, image_yscale, image_angle, image_blend, bgalpha)
}

