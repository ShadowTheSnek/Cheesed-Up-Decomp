if (!in_baddieroom())
{
    with (gml_Script_instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_tank_wheel
}
with (gml_Script_instance_create(x, y, obj_pizzaslice))
{
    depth = (other.depth - 1)
    vsp = -8
    hsp = 2
}
with (gml_Script_instance_create(x, y, obj_pizzaslice))
{
    depth = (other.depth - 1)
    vsp = -8
    hsp = -2
}
event_inherited()
