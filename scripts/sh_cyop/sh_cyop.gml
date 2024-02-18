function sh_cyop() //gml_Script_sh_cyop
{
    instance_create_unique(x, y, obj_cyop_loader)
    with (obj_cyop_loader)
    {
        var load = get_open_filename_ext("CYOP Tower (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", "", (environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\"), "Select a custom level")
        if (load == "")
            return;
        cyop_cleanup()
        var result = cyop_load(load)
        if is_string(result)
        {
            show_message(result)
            if (!loaded)
                instance_destroy()
        }
        else
            loaded = 1
    }
}

function meta_cyop() //gml_Script_meta_cyop
{
    return 
    {
        description: ""
    };
}

