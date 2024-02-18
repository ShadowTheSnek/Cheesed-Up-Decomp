pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER OF THE WEST"
with (obj_player)
{
    if (targetDoor == "B")
    {
        vsp = 0
        hsp = 0
        movespeed = 0
    }
}
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //gml_Script_anon@267@gml_Room_badland_10_Create
    {
        touchedtriggers = 0
    }
, function() //gml_Script_anon@311@gml_Room_badland_10_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@405@gml_Room_badland_10_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //gml_Script_anon@469@gml_Room_badland_10_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
