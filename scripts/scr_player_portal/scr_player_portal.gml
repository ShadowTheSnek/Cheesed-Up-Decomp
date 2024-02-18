function scr_player_portal() //gml_Script_scr_player_portal
{
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_pizzaportalentrancestart)
    {
        gml_Script_instance_create(x, y, obj_pizzaportalfade)
        state = states.freefall
        grav = 0.5
    }
    mach2 = 0
}

