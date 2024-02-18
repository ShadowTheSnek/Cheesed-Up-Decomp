pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER IN SPACE"
global.gameframe_caption_text = gml_Script_lang_get_value("caption_space")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@236@gml_Room_space_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@300@gml_Room_space_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@397@gml_Room_space_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
