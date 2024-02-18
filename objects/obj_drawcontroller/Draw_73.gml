with (obj_player)
{
    if (state == states.backbreaker && (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4))
        draw_superslam_enemy()
}
if (room == Mainmenu || room == Longintro || room == Realtitlescreen)
{
    use_dark = 0
    kidsparty_lightning = 0
    dark_lightning = 0
}
if (kidsparty_lightning || dark_lightning)
{
    var cw = (camera_get_view_width(view_camera[0]) + 32)
    var ch = (camera_get_view_height(view_camera[0]) + 32)
    if (!surface_exists(surf))
        surf = surface_create_fix(cw, ch)
    var tsw = sprite_get_width(spr_patrol_lightgradient)
    var tsh = sprite_get_height(spr_patrol_lightgradient)
    if (!surface_exists(patrolcone_tex))
    {
        patrolcone_tex = surface_create_fix(tsw, tsh)
        var s = surface_create_fix(tsw, tsh)
        draw_set_color(c_white)
        surface_set_target(s)
        draw_clear_alpha(c_black, 0)
        draw_rectangle_color(0, 0, tsw, tsh, c_black, c_black, c_black, c_black, 0)
        var p = get_triangle_points(0, (tsh / 2), 0, 300, 24)
        gpu_set_blendmode(bm_subtract)
        draw_triangle_color(0, (tsh / 2), p[0], p[1], p[2], p[3], 16777215, 16777215, 16777215, 0)
        surface_reset_target()
        surface_set_target(patrolcone_tex)
        gpu_set_blendmode(bm_normal)
        draw_clear_alpha(c_black, 0)
        draw_sprite(spr_patrol_lightgradient, 0, 0, (tsh / 2))
        gpu_set_blendmode(bm_subtract)
        draw_surface(s, 0, 0)
        surface_reset_target()
        surface_free(s)
        gpu_set_blendmode(bm_normal)
    }
    if (kidsparty_lightning && (!surface_exists(surf2)))
        surf2 = surface_create_fix(cw, ch)
    var surf_x = camera_get_view_x(view_camera[0])
    var surf_y = camera_get_view_y(view_camera[0])
    if kidsparty_lightning
    {
        if surface_exists(surf)
        {
            surface_set_target(surf)
            draw_clear_alpha(c_black, 0)
            draw_set_color(c_black)
            draw_set_alpha(1)
            draw_rectangle(0, 0, cw, ch, false)
            gpu_set_blendmode(bm_subtract)
            draw_set_color(c_white)
            with (obj_patrolcone)
            {
                if (instance_exists(baddieID) && baddieID.state == states.walk)
                {
                    var points = get_triangle_points(x, y, image_angle, len, size)
                    var c = c_white
                    draw_triangle_color((x - surf_x), (y - surf_y), (points[0] - surf_x), (points[1] - surf_y), (points[2] - surf_x), (points[3] - surf_y), c, c, c, 0)
                }
            }
            gpu_set_blendmode(bm_normal)
            draw_set_alpha(1)
            surface_reset_target()
        }
        if surface_exists(surf2)
        {
            surface_set_target(surf2)
            draw_clear_alpha(c_black, 0)
            draw_set_color(c_black)
            draw_set_alpha(1)
            draw_rectangle(0, 0, cw, ch, false)
            gpu_set_blendmode(bm_subtract)
            draw_set_color(c_white)
            with (obj_patrolcone)
            {
                if (instance_exists(baddieID) && baddieID.state == states.walk)
                {
                    c = c_white
                    draw_surface_ext(other.patrolcone_tex, (x - surf_x), ((y - surf_y) - (tsh / 2)), (image_angle > 90 ? -1 : 1), 1, 0, c, 1)
                }
            }
            gpu_set_blendmode(bm_normal)
            draw_surface(surf, 0, 0)
            gpu_set_blendmode(bm_add)
            draw_set_alpha(0.3)
            with (obj_patrolcone)
            {
                if (instance_exists(baddieID) && baddieID.state == states.walk)
                {
                    if (collision || (instance_exists(baddieID) && baddieID.alarm[5] != -1))
                    {
                        c = c_red
                        draw_surface_ext(other.patrolcone_tex, (x - surf_x), ((y - surf_y) - (tsh / 2)), (image_angle > 90 ? -1 : 1), 1, 0, c, 1)
                    }
                }
            }
            surface_reset_target()
            gpu_set_blendmode(bm_normal)
            draw_set_alpha(bg_alpha)
            draw_surface(surf2, surf_x, surf_y)
            draw_set_alpha(1)
        }
    }
    else if dark_lightning
    {
        if surface_exists(surf)
        {
            surface_set_target(surf)
            draw_clear_alpha(c_black, 0)
            draw_set_color(c_black)
            draw_set_alpha(0.8)
            draw_rectangle(0, 0, cw, ch, false)
            gpu_set_blendmode(bm_subtract)
            draw_set_color(c_white)
            with (obj_player)
            {
                if (state == states.gotoplayer)
                {
                }
                else
                {
                    draw_set_alpha(other.circle_alpha_out)
                    draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), 178, 0)
                    draw_set_alpha(other.circle_alpha_in)
                    draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), 128, 0)
                }
            }
            with (obj_chateaulight)
            {
                draw_set_alpha(circle_alpha_out)
                draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), circle_size_out, 0)
                draw_set_alpha(circle_alpha_in)
                draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), circle_size_in, 0)
            }
            gpu_set_blendmode(bm_normal)
            draw_set_alpha(1)
            surface_reset_target()
            draw_surface(surf, surf_x, surf_y)
        }
    }
}
if (global.MOD.Spotlight && room != timesuproom)
{
    if (!surface_exists(surf))
        surf = surface_create_fix(obj_screensizer.actual_width, obj_screensizer.actual_height)
    surface_set_target(surf)
    draw_clear(c_black)
    gpu_set_blendmode(bm_subtract)
    function anon@4973@gml_Object_obj_drawcontroller_Draw_73(argument0, argument1, argument2, argument3, argument4) //gml_Script_anon@4973@gml_Object_obj_drawcontroller_Draw_73
    {
        if (argument0 == undefined)
            argument0 = obj_player
        if (argument1 == undefined)
            argument1 = 100
        if (argument2 == undefined)
            argument2 = 0
        if (argument3 == undefined)
            argument3 = 0
        if (argument4 == undefined)
            argument4 = 2
        var camx = camera_get_view_x(view_camera[0])
        var camy = camera_get_view_y(view_camera[0])
        with (argument0)
        {
            var xx = ((x + argument2) - camx)
            draw_set_alpha(1)
            draw_circle((xx + random_range(-1, 1)), (((y + argument3) - camy) + random_range(-1, 1)), argument1, 0)
            draw_set_alpha(0.35)
            draw_circle((xx + random_range(-1, 1)), (((y + argument3) - camy) + random_range(-1, 1)), (argument1 + 30), 0)
        }
    }

    if (instance_exists(obj_endlevelfade) || room == rank_room)
        spotlight_size = Approach(spotlight_size, 960, 10)
    else
        spotlight_size = lerp(spotlight_size, lerp(50, 150, (global.combotime / 60)), 0.2)
    if (!((instance_exists(obj_technicaldifficulty) && obj_player1.state == states.actor)))
        self.draw_spotlight(obj_player1, spotlight_size, obj_player1.smoothx)
    draw_set_alpha(1)
    gpu_set_blendmode(bm_normal)
    draw_set_colour(c_white)
    surface_reset_target()
    draw_surface(surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]))
}
if ((room == dungeon_10 || room == dungeon_9 || room == snick_challengeend) && global.snickchallenge && global.snickrematch)
{
    draw_sprite_ext(spr_vignette, 0, 0, 0, 1, 1, 0, c_white, random_range(0.8, 0.9))
    instance_destroy(obj_baddie, false)
    instance_destroy(obj_baddiespawner, false)
}
