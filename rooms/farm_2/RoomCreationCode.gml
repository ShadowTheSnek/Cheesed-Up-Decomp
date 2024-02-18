pal_swap_init_system(shd_pal_swapper)
global.roommessage = "COW STACK"
global.gameframe_caption_text = gml_Script_lang_get_value("caption_farm")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@224@gml_Room_farm_2_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@288@gml_Room_farm_2_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
}
