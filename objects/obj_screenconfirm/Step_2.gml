if (alarm[1] > -1)
    return;
scr_menu_getinput()
if (-key_left2)
    select = 0
else if key_right2
    select = 1
if key_jump
{
    if (select == 0)
    {
        if restart
        {
            ini_open_from_string(obj_savesystem.ini_str_options)
            ini_write_real(section, key, saveto)
            obj_savesystem.ini_str_options = ini_close()
            gamesave_async_save_options()
            var str = ""
            var i = 0
            var n = parameter_count()
            while (i < n)
            {
                str += parameter_string(i)
                if (i < (n - 1))
                    str += " "
                i++
            }
            if ((!file_exists(parameter_string(0))) && (!(launch_external(string("\"{0}\"", str)))))
            {
                show_message("Failed to reboot the game.\nPlease reboot the game yourself to see any changes.")
                instance_destroy()
            }
            else
                alarm[1] = 5
        }
        else
        {
            ini_open_from_string(obj_savesystem.ini_str_options)
            ini_write_real(section, key, variable_global_get(varname))
            obj_savesystem.ini_str_options = ini_close()
            timer = 5
            instance_destroy()
        }
    }
    else
    {
        timer = 0
        event_perform(ev_alarm, 0)
        instance_destroy()
    }
}
