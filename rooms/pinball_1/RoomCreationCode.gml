global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@122@gml_Room_pinball_1_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@166@gml_Room_pinball_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@263@gml_Room_pinball_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
}
