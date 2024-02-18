pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER OF HELL!"
if (!global.snickchallenge)
    global.gameframe_caption_text = gml_Script_lang_get_value("caption_dungeon")
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@266@gml_Room_dungeon_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@330@gml_Room_dungeon_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@394@gml_Room_dungeon_1_Create
    {
        secret_open_portal(2)
    }
)
}
