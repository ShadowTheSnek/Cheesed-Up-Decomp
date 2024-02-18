if instance_exists(obj_keyconfig)
    return;
gml_Script_toggle_alphafix(1)
if check_sugary()
    scr_pausedraw_ss()
else
    scr_pausedraw()
gml_Script_toggle_alphafix(0)
