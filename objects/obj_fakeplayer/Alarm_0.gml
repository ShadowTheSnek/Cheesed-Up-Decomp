move = 1
movespeed = 2
xscale = 1
ini_open_from_string(obj_savesystem.ini_str_options)
ini_write_real("Modded", "sighting", 1)
obj_savesystem.ini_str_options = ini_close()
gamesave_async_save_options()
