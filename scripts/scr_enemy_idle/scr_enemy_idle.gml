function scr_enemy_idle() //gml_Script_scr_enemy_idle
{
    hsp = 0
    if (vsp > 1 && (grounded || (grounded && (!(place_meeting(x, y, obj_platform))))))
    {
        create_particle(x, y, (12 << 0), 0)
        image_index = 0
    }
    if ((vsp >= 0 || object_index == obj_miniufo || object_index == obj_kentukybomber) && sprite_index == scaredspr && scaredbuffer <= 0)
    {
        state = states.walk
        sprite_index = walkspr
        if (object_index == obj_treasureguy)
            state = (141 << 0)
        if (object_index == obj_pickle && attacking)
        {
            attacking = 0
            bombreset = 0
        }
    }
    if (scaredbuffer > 0)
        scaredbuffer--
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_tank_spawnenemy || sprite_index == spr_forknight_turn || sprite_index == spr_ghostknight_turn || sprite_index == spr_indiancheese_turn || sprite_index == spr_tank_turn || sprite_index == spr_smoreknight_turn || sprite_index == spr_pinhead_turn || sprite_index == spr_patroller_turn)
        {
            sprite_index = walkspr
            state = states.walk
        }
    }
    if (sprite_index == spr_newpizzice_turn && floor(image_index) == (image_number - 1))
    {
        image_xscale *= -1
        sprite_index = walkspr
        state = (128 << 0)
    }
    if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr
        image_xscale *= -1
        state = states.walk
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp += (_railinst.movespeed * _railinst.dir)
    }
    image_speed = 0.35
}

