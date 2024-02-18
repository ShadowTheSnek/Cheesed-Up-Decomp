switch ds_map_find_value(async_load, "event_type")
{
    case 65540:
        if ((room == sucrose_1 || room == sucrose_2) && (ds_map_find_value(async_load, "name") == "Sky Wake" || ds_map_find_value(async_load, "name") == "Sky Active"))
            event_user(0)
        break
}

