global.gameframe_caption_text = gml_Script_lang_get_value("caption_longintro")
with (obj_player)
    state = states.titlescreen
ini_open_from_string(obj_savesystem.ini_str_options)
if (ini_read_real("Modded", "cancelled", 0) < 2)
{
    ini_write_real("Modded", "cancelled", 2)
    obj_savesystem.ini_str_options = ini_close()
    gamesave_async_save_options()
}
else
    ini_close()
