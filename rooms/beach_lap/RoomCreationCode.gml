global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@129@gml_Room_beach_lap_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        else
            secret_close_portal(1)
    }
)
    secret_add(function() //gml_Script_anon@258@gml_Room_beach_lap_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@302@gml_Room_beach_lap_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
}
