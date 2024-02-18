pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER WITH THE DEAD"
global.gameframe_caption_text = gml_Script_lang_get_value("caption_graveyard")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@245@gml_Room_graveyard_1_Create
    {
        if secret_check_trigger(0)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@342@gml_Room_graveyard_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@406@gml_Room_graveyard_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
