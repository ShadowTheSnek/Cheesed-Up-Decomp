global.roommessage = "PIZZA TOWER ISLAND"
global.pizzadelivery = 1
global.hp = 8
global.use_temperature = 1
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@200@gml_Room_rm_testing_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@244@gml_Room_rm_testing_Create
    {
        if (touchedtriggers >= 2)
            secret_open_portal(0)
    }
)
    secret_add(function() //gml_Script_anon@334@gml_Room_rm_testing_Create
    {
        hittriggers = 0
    }
, function() //gml_Script_anon@374@gml_Room_rm_testing_Create
    {
        if (hittriggers >= 2)
            secret_open_portal(4)
    }
)
    secret_add(-4, function() //gml_Script_anon@467@gml_Room_rm_testing_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@567@gml_Room_rm_testing_Create
    {
        secret_open_portal(2)
    }
)
    secret_add(-4, function() //gml_Script_anon@634@gml_Room_rm_testing_Create
    {
        if secret_check_trigger(3)
            secret_open_portal(3)
        else
            secret_close_portal(3)
    }
)
    secret_add(function() //gml_Script_anon@763@gml_Room_rm_testing_Create
    {
        totems = 0
    }
, function() //gml_Script_anon@798@gml_Room_rm_testing_Create
    {
        if (totems >= 3)
            secret_open_portal(5)
    }
)
    secret_add(-4, function() //gml_Script_anon@886@gml_Room_rm_testing_Create
    {
        if secret_check_trigger(6)
            secret_open_portal(6)
    }
)
    secret_add(-4, function() //gml_Script_anon@986@gml_Room_rm_testing_Create
    {
        if secret_check_trigger(7)
            secret_open_portal(7)
    }
)
}
