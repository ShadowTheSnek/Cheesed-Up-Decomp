switch ds_map_find_value(async_load, "event_type")
{
    case "DiscordReady":
        active = 1
        userid = string(ds_map_find_value(async_load, "user_id"))
        break
    case "DiscordError":
        trace(string("[DRPC] {0} ({1}", ds_map_find_value(async_load, "error_message"), ds_map_find_value(async_load, "error_code")))
        active = 0
        alarm[0] = 60
        break
}

