event_inherited()
function anon@31@gml_Object_obj_bottletreasure_Create_0() //gml_Script_anon@31@gml_Object_obj_bottletreasure_Create_0
{
    if (global.bottlecutscene == -4 || (!global.bottlecutscene))
    {
        global.bottlecutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "bottle", 1)
    }
}

if (global.bottlecutscene == -4)
    global.bottlecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "bottle", 0)
if global.bottlecutscene
    instance_destroy()
