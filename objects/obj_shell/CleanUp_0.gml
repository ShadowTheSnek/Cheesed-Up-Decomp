if (!(variable_instance_exists(id, "shellSurface")))
    return;
if surface_exists(shellSurface)
    surface_free(shellSurface)
if ds_exists(deferredQueue, 4)
    ds_queue_destroy(deferredQueue)
if ds_exists(WC_builtins, 1)
    ds_map_destroy(WC_builtins)
