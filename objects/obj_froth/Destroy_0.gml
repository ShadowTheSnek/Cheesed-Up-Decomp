if (!in_baddieroom())
{
    with (gml_Script_instance_create(x, y, obj_parryeffect))
        sprite_index = spr_snowcloudhit
}
event_inherited()
