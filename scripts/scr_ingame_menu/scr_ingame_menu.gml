function open_menu() //gml_Script_open_menu
{
    global.in_menu = 1
    with (obj_persistent)
        alarm[3] = -1
}

function close_menu() //gml_Script_close_menu
{
    with (obj_persistent)
        alarm[3] = 1
}

