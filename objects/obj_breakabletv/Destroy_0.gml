if (!in_saveroom())
{
    gml_Script_instance_create(x, y, obj_bangeffect)
    with (gml_Script_instance_create(x, y, obj_pizzaslice))
        hsp = 2
    with (gml_Script_instance_create(x, y, obj_pizzaslice))
        hsp = -2
    repeat (6)
    {
        with (gml_Script_instance_create(x, y, obj_debris))
        {
            vsp = -5
            sprite_index = spr_tvdebris
        }
    }
    add_saveroom()
}
