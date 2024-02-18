function get_savefile_ini() //gml_Script_get_savefile_ini
{
    if instance_exists(obj_cyop_loader)
        return ((string("custom{0}/", global.currentsavefile) + filename_name(global.custom_path)) + ".ini");
    return concat("saveData", global.currentsavefile, ".ini");
}

