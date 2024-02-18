var found = 0
ini_open_from_string(obj_savesystem.ini_str_options)
if (ini_read_real("Modded", "sighting", 0) && ((!keyboard_check(ord("E"))) || 1))
{
    layer_depth("Tiles_Secret1", 80)
    instance_destroy()
    instance_destroy(obj_fakeplayer)
    found = 1
}
obj_savesystem.ini_str_options = ini_close()
if (!found)
    event_user(0)
