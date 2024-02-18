global.roommessage = "PIZZA TOWER IN SPACE"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@126@gml_Room_midway_secret2_Create
    {
        secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon@202@gml_Room_midway_secret2_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //gml_Script_anon@309@gml_Room_midway_secret2_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
