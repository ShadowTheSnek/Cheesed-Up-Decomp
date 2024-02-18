function warbg_start() //gml_Script_warbg_start
{
    if ((event_type == 8 && event_number == 0) || object_index == obj_parallax)
    {
        var time = shader_get_uniform(shd_war, "time")
        var size = shader_get_uniform(shd_war, "size")
        var strength = shader_get_uniform(shd_war, "strength")
        shader_set_fix(shd_war)
        shader_set_uniform_f(time, (scr_current_time() / 1000))
        shader_set_uniform_f(size, 512, 512, Wave(0, 0.8, 8, 0))
        shader_set_uniform_f(strength, Wave(0, 0.2, 5, 0))
    }
}

function warbg_end() //gml_Script_warbg_end
{
    if (event_type == 8 && event_number == 0)
        shader_reset()
}

function pizzahead_bg_start() //gml_Script_pizzahead_bg_start
{
    if (event_type == 8 && event_number == 0)
    {
        time = shader_get_uniform(shd_rainbow, "u_time")
        var _speed = shader_get_uniform(shd_rainbow, "u_speed")
        shader_set_fix(shd_rainbow)
        shader_set_uniform_f(time, (scr_current_time() / 1000))
        shader_set_uniform_f(_speed, 1)
    }
}

function pizzahead_bg_end() //gml_Script_pizzahead_bg_end
{
    if (event_type == 8 && event_number == 0)
        shader_reset()
}

function pizzahead_bg_init() //gml_Script_pizzahead_bg_init
{
}

function warbg_generic(argument0, argument1, argument2) //gml_Script_warbg_generic
{
    if (argument2 == undefined)
        argument2 = -4
    var arr = ["Foreground_1", "Foreground_2", "Foreground_3", "Foreground_Ground1"]
    var lays = layer_get_all()
    for (var i = 0; i < array_length(lays); i++)
    {
        var _id = lays[i]
        var _bg = layer_background_get_id_fix(_id)
        if (_bg >= 0)
        {
            var _found = 0
            for (var j = 0; j < array_length(arr); j++)
            {
                if (layer_get_name_fix(_id) == arr[j])
                    _found = 1
            }
            if (argument2 != -4 && is_undefined(ds_map_find_value(argument2, layer_get_name_fix(_id))))
                _found = 0
            if ((!_found) && layer_background_get_sprite(_bg) != bg_etbbrick)
            {
                layer_script_begin(_id, argument0)
                layer_script_end(_id, argument1)
            }
        }
    }
}

function warbg_init() //gml_Script_warbg_init
{
}

function warbg_stop() //gml_Script_warbg_stop
{
    warbg_generic(-4, gml_Script_warbg_end)
}

