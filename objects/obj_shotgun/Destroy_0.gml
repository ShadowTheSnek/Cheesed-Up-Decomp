if (!in_saveroom())
{
    repeat (4)
        create_debris(x, y, spr_ammoboxdebris)
    with (gml_Script_instance_create(x, y, obj_parryeffect))
        sprite_index = spr_morthookgrabeffect
    add_saveroom()
}
