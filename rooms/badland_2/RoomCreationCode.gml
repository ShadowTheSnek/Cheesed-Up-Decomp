pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER OF THE WEST"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@167@gml_Room_badland_2_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@211@gml_Room_badland_2_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@305@gml_Room_badland_2_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@369@gml_Room_badland_2_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
