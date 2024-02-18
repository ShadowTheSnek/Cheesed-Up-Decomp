pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@166@gml_Room_plage_ship2_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        else
            secret_close_portal(1)
    }
)
    secret_add(function() //gml_Script_anon@295@gml_Room_plage_ship2_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@339@gml_Room_plage_ship2_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
}
