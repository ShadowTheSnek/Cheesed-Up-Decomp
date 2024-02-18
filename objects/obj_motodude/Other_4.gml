var _destroyed = 0
if in_baddieroom()
{
    _destroyed = 1
    instance_destroy()
}
if (escape == 1 && (!_destroyed))
{
    instance_deactivate_object_hook(id)
    with (gml_Script_instance_create(x, y, obj_escapespawn))
        baddieID = other.id
}
