var error;
if (ds_map_find_value(async_load, "id") == req)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        str = ds_map_find_value(async_load, "result")
        var firstline = string_copy(str, 1, (string_pos("\n", str) - 1))
        @@try_hook@@(360, 464)
        if (real(firstline) > 3)
            str = string_copy(str, (string_pos("\n", str) + 1), string_length(str))
        else
        {
            state = states.dynamite
            are_you_sure = 1
        }
        @@try_unhook@@()
    }
    else
    {
        trace("DISCLAIMER\nstatus: ", ds_map_find_value(async_load, "status"))
        str = "Server error!\nPlease check your internet connection.\n\nYou may have the game blocked on your firewall.\nRestarting also might work, sometimes this breaks..."
    }
    if (state == states.normal)
    {
        state = states.revolver
        sound_play("event:/modded/sfx/diagopen")
    }
}
