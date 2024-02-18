if restart
    return;
alarm[0] = 60
timer--
if (timer <= 0)
{
    variable_global_set(varname, savedoption)
    gml_Script_screen_apply_fullscreen(global.option_fullscreen)
    gml_Script_screen_apply_size()
    instance_destroy()
}
