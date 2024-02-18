pal_swap_init_system(shd_pal_swapper)
global.roommessage = "WELCOME TO PIZZA TOWER"
global.gameframe_caption_text = gml_Script_lang_get_value("caption_entrance")
if (!obj_secretmanager.init)
{
    trace("secret init")
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@261@gml_Room_entrance_1_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@305@gml_Room_entrance_1_Create
    {
        if (touchedtriggers >= 4)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@399@gml_Room_entrance_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@463@gml_Room_entrance_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
