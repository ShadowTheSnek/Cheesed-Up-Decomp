if in_saveroom()
    instance_destroy()
if (global.level_minutes > timer)
{
    add_saveroom()
    instance_destroy()
}
if is_holiday((1 << 0))
    sprite_index = spr_PTGhalloween
