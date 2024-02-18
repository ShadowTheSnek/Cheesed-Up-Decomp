global.roommessage = "GRANNY PIG'S HOUSE"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@118@gml_Room_street_john_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@159@gml_Room_street_john_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@251@gml_Room_street_john_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@314@gml_Room_street_john_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
