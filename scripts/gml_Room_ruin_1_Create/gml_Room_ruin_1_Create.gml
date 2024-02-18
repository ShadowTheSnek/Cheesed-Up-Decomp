pal_swap_init_system(shd_pal_swapper)
global.roommessage = "RUINS OF THE PIZZA TOWER"
if (!global.snickchallenge)
    global.gameframe_caption_text = gml_Script_lang_get_value("caption_ruin")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@267@gml_Room_ruin_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@331@gml_Room_ruin_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@428@gml_Room_ruin_1_Create
    {
        secret_open_portal(2)
    }
)
}
