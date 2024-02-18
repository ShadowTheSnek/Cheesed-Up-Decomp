pal_swap_init_system(shd_pal_swapper)
global.roommessage = "WELCOME TO PIZZA TOWER"
with (obj_secretbigblock)
    particlespr = spr_factorydebris
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //gml_Script_anon@232@gml_Room_industrial_3_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon@296@gml_Room_industrial_3_Create
    {
        secret_open_portal(1)
    }
)
}
