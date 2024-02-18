pal_swap_init_system(shd_pal_swapper)
global.roommessage = "WELCOME TO PIZZA TOWER"
global.gameframe_caption_text = gml_Script_lang_get_value("caption_industrial")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@243@gml_Room_industrial_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@307@gml_Room_industrial_1_Create
    {
        secret_open_portal(1)
    }
)
}
