if (drop == 0)
{
    gml_Script_instance_create(x, y, obj_bumpeffect)
    hsp = (-hsp)
    vsp = -3
    drop = 1
}
else
{
    instance_destroy()
    gml_Script_instance_create(x, y, obj_bombexplosion)
}
