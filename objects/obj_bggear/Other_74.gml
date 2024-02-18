if global.panic
    return;
if (ds_map_find_value(async_load, "event_type") != 65535)
    return;
image_angle = ((image_angle + degree_per_beat) % 360)
