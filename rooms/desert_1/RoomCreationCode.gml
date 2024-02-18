global.roommessage = "PIZZA TOWER OF THE WEST"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@127@gml_Room_desert_1_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@171@gml_Room_desert_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@268@gml_Room_desert_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@335@gml_Room_desert_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
