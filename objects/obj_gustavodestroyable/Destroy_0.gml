if (!in_saveroom())
{
    with (gml_Script_instance_create((x + 32), (y + 32), obj_sausageman_dead))
        sprite_index = spr_bigdoughblockdead
    scr_sleep(5)
    add_saveroom()
}
