function scr_panicbg_generic() //gml_Script_scr_panicbg_generic
{
    var lay_last = -4
    var d = undefined
    var backs = room_get_bg_layers()
    var i = 0
    var n = array_length(backs)
    while (i < n)
    {
        var lay = backs[i].layer_id
        var dep = layer_get_depth(lay)
        if (dep > 0 && backs[i].bg_sprite != bg_etbbrick && layer_get_visible(lay))
        {
            layer_script_begin(lay, gml_Script_scr_panicbg_start)
            layer_script_end(lay, gml_Script_scr_panicbg_end)
            if (d == undefined || dep < d)
            {
                d = dep
                lay_last = lay
            }
        }
        i++
    }
    if (lay_last != -4)
        layer_script_end(lay_last, gml_Script_scr_panicbg_draw)
}

function scr_panicbg_init() //gml_Script_scr_panicbg_init
{
    if (room != rank_room && room != timesuproom)
        scr_panicbg_generic()
}

global.panicbg_surface = -4
function scr_panicbg_start() //gml_Script_scr_panicbg_start
{
    if (event_type == 8 && event_number == 0)
    {
        if ((global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld") && global.leveltosave != "sucrose" && global.panicbg && (!(safe_get(obj_pause, "pause"))))
        {
            if (!surface_exists(global.panicbg_surface))
                global.panicbg_surface = surface_create_fix(obj_screensizer.actual_width, obj_screensizer.actual_height)
            else if (surface_get_width(global.panicbg_surface) != obj_screensizer.actual_width || surface_get_height(global.panicbg_surface) != obj_screensizer.actual_height)
                surface_resize(global.panicbg_surface, obj_screensizer.actual_width, obj_screensizer.actual_height)
            surface_set_target(global.panicbg_surface)
        }
        else if surface_exists(global.panicbg_surface)
            surface_free(global.panicbg_surface)
        if instance_exists(obj_wartimer)
            warbg_start()
    }
}

function scr_panicbg_draw() //gml_Script_scr_panicbg_draw
{
    var panic = ((global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld") && global.panicbg && global.leveltosave != "sucrose")
    if (event_type == 8 && event_number == 0 && (!(safe_get(obj_pause, "pause"))))
    {
        with (obj_backgroundreplace)
            event_user(0)
        if instance_exists(obj_wartimer)
            warbg_end()
        if (string_starts_with(room_get_name(room), "grinch_") && room != grinch_10)
        {
            shader_set_fix(shd_wind)
            var uTime = shader_get_uniform(shd_wind, "Time")
            shader_set_uniform_f(uTime, (scr_current_time() / 1000))
            var xx = (camera_get_view_x(view_camera[0]) * 0.25)
            var yy = (camera_get_view_y(view_camera[0]) * 0.25)
            if panic
            {
                xx -= camera_get_view_x(view_camera[0])
                yy -= camera_get_view_y(view_camera[0])
            }
            draw_sprite_tiled(bg_grinch_santa, 0, xx, yy)
            shader_reset()
        }
        if panic
        {
            surface_reset_target()
            shader_set_fix(shd_panicbg)
            var panic_id = shader_get_uniform(shd_panicbg, "panic")
            shader_set_uniform_f(panic_id, clamp((global.wave / global.maxwave), -0.5, 1))
            var time_id = shader_get_uniform(shd_panicbg, "time")
            shader_set_uniform_f(time_id, ((scr_current_time() / 1000) % 18.84955592153876))
            gml_Script_reset_blendmode()
            draw_surface(global.panicbg_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]))
            gpu_set_blendmode(bm_normal)
            if (!global.goodmode)
                shader_reset()
        }
    }
}

function scr_panicbg_end() //gml_Script_scr_panicbg_end
{
    if (event_type == 8 && event_number == 0 && (global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld") && global.leveltosave != "sucrose" && global.panicbg && (!(safe_get(obj_pause, "pause"))))
        surface_reset_target()
    if instance_exists(obj_wartimer)
        warbg_end()
}

