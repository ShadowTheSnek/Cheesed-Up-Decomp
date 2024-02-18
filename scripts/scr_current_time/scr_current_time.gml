function scr_current_time() //gml_Script_scr_current_time
{
    return (((!(safe_get(obj_pause, "pause"))) && global.gameplay) ? ((global.time / 60) * 1000) : current_time);
}

