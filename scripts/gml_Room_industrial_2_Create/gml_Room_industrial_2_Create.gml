pal_swap_init_system(shd_pal_swapper)
global.roommessage = "WELCOME TO PIZZA TOWER"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@170@gml_Room_industrial_2_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@234@gml_Room_industrial_2_Create
    {
        secret_open_portal(1)
    }
)
}
