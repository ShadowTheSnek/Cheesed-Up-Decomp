function sprite_set_live(argument0, argument1) //gml_Script_sprite_set_live
{
}

function path_set_live(argument0, argument1) //gml_Script_path_set_live
{
}

function animcurve_set_live(argument0, argument1, argument2) //gml_Script_animcurve_set_live
{
    if (argument2 == undefined)
        argument2 = 16
}

function file_set_live(argument0, argument1, argument2) //gml_Script_file_set_live
{
}

function room_set_live(argument0, argument1) //gml_Script_room_set_live
{
}

function room_goto_live(argument0) //gml_Script_room_goto_live
{
}

function live_update_script_impl(argument0, argument1, argument2) //gml_Script_live_update_script_impl
{
}

function live_constant_add(argument0, argument1) //gml_Script_live_constant_add
{
}

function live_constant_delete(argument0) //gml_Script_live_constant_delete
{
    return 0;
}

function live_variable_add(argument0, argument1) //gml_Script_live_variable_add
{
}

function live_variable_delete(argument0) //gml_Script_live_variable_delete
{
    return 0;
}

function live_function_add(argument0, argument1) //gml_Script_live_function_add
{
}

function live_function_delete(argument0) //gml_Script_live_function_delete
{
    return 0;
}

function live_throw_error(argument0) //gml_Script_live_throw_error
{
}

function live_execute_string(argument0) //gml_Script_live_execute_string
{
    return 0;
}

function live_snippet_create(argument0, argument1) //gml_Script_live_snippet_create
{
    if (argument1 == undefined)
        argument1 = "snippet"
    return undefined;
}

function live_snippet_destroy(argument0) //gml_Script_live_snippet_destroy
{
}

function live_snippet_call(argument0) //gml_Script_live_snippet_call
{
    return 0;
}

function live_update() //gml_Script_live_update
{
}

function live_init(argument0, argument1, argument2) //gml_Script_live_init
{
}

