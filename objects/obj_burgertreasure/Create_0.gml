event_inherited()
function anon@31@gml_Object_obj_burgertreasure_Create_0() //gml_Script_anon@31@gml_Object_obj_burgertreasure_Create_0
{
    if (global.burgercutscene == -4 || (!global.burgercutscene))
    {
        global.burgercutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "burger", 1)
    }
}

if (global.burgercutscene == -4)
    global.burgercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "burger", 0)
if global.burgercutscene
    instance_destroy()
if (global.golfcutscene == -4)
    global.golfcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "golf", 0)
if ((!global.golfcutscene) && (!global.levelcomplete))
    instance_destroy()
