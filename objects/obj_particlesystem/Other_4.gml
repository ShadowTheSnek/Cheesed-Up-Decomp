if global.gameplay
    clear_particles()
else if (room == timesuproom)
{
    ds_list_clear(global.debris_list)
    ds_list_clear(global.collect_list)
}
