repeat (3)
    create_debris(x, y, spr_slapstar)
repeat (3)
    create_debris(x, y, spr_metalblockdebris)
with (gml_Script_instance_create(x, y, obj_sausageman_dead))
    sprite_index = other.spr_dead
