pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = gml_Script_lang_get_value("caption_street")
with (obj_secretbigblock)
    particlespr = spr_streetdebris
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@292@gml_Room_street_intro_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@336@gml_Room_street_intro_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@430@gml_Room_street_intro_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@494@gml_Room_street_intro_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
