event_inherited()
ini_open_from_string(obj_savesystem.ini_str)
if ini_read_real("Game", "snotty", 0)
{
    add_baddieroom()
    instance_destroy()
    if global.panic
        gml_Script_instance_create(x, y, obj_snotty)
}
ini_close()
