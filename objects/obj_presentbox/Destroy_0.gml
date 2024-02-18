if (!in_baddieroom())
{
    gml_Script_instance_create(x, y, obj_bombexplosion)
    global.miniboss = 0
    add_baddieroom()
    instance_destroy(obj_baddiespawner)
    instance_destroy(obj_doorblocked)
    instance_destroy(obj_iceblockminiboss)
}
