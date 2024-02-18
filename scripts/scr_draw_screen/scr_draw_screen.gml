var _temp_local_var_7, _temp_local_var_8, _temp_local_var_9;
function scr_draw_screen(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_draw_screen
{
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = 0
    if (!surface_exists(application_surface))
        return;
    argument0 = floor(argument0)
    argument1 = floor(argument1)
    with (obj_camera)
    {
        if (greyscale > 0)
        {
            shader_set_fix(shd_greyscale)
            var fader = shader_get_uniform(shd_greyscale, "fade")
            shader_set_uniform_f(fader, greyscale)
        }
    }
    var mirror = (global.MOD.Mirror && (!instance_exists(obj_rank)))
    var flip = (safe_get(obj_player1, "gravityjump") && (!global.MOD.GravityJump))
    var _temp_local_var_7 = (flip ? -1 : 1)
    var _temp_local_var_8 = (mirror ? -1 : 1)
    var _temp_local_var_9 = (flip ? (surface_get_height(application_surface) * argument3) : 0)
    draw_surface_ext(application_surface, (argument0 + (mirror ? (surface_get_width(application_surface) * argument2) : 0)), (argument1 + argument0), (argument2 * argument1), (argument3 * argument2), 0, c_white, argument4)
    shader_reset()
}

