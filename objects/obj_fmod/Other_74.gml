switch ds_map_find_value(async_load, "event_type")
{
    case 65537:
        break
    case 65540:
        trace(string("name: {0} position:{1}", ds_map_find_value(async_load, "name"), ds_map_find_value(async_load, "position")))
        break
    default:

}

