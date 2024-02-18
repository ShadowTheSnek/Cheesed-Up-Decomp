collectiblelist = ds_list_create()
depth = 20
if instance_exists(obj_cyop_loader)
    return;
if (!instance_exists(obj_secretportal))
    return;
with (instance_nearest(obj_secretportal.x, obj_secretportal.y, obj_bigcollect))
{
    visible = false
    value = 150
    with (gml_Script_instance_create(x, (y - 42), obj_pizzasonacollect))
        collectID = other.id
}
