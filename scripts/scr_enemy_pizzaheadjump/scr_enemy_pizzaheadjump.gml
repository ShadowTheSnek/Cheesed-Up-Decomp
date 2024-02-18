function scr_enemy_pizzaheadjump() //gml_Script_scr_enemy_pizzaheadjump
{
    stompable = 0
    if check_solid(x, y)
        vsp = -12
    if (vsp < 0)
    {
        use_collision = 0
        x += hsp
        y += vsp
        if (vsp < 20)
            vsp += grav
    }
    else
        use_collision = 1
    sprite_index = stunfallspr
    if (grounded && vsp > 0)
    {
        stompable = 1
        state = states.stun
        stunned = 2
    }
}

