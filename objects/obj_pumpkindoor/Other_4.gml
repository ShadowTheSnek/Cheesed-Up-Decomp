if ((!(is_holiday((1 << 0)))) || global.panic)
{
    instance_destroy()
    return;
}
if (quick_ini_read_real("", "halloween", "pumpkincount", 0) < 20 && (!global.sandbox))
{
    instance_destroy()
    with (gml_Script_instance_create(x, y, obj_doorblocked))
    {
        sprite_index = spr_pumpkingate2
        depth = other.depth
    }
    return;
}
event_inherited()
sprite_index = spr_pumpkingate
