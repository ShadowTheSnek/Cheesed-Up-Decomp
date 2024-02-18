if instance_exists(obj_loadingscreen)
    return;
camera_set_view_pos(view_camera[0], (-(floor(((obj_screensizer.actual_width / 2) - 480)))), (-(floor(((obj_screensizer.actual_height / 2) - 270)))))
if (0 && keyboard_check_pressed(ord("R")))
    room_restart()
if (state == states.revolver || (menu == 1 && state == states.dynamite))
{
    if (t == 0)
        fmod_event_one_shot("event:/modded/sfx/diagopen")
    t = Approach(t, 1, 0.075)
    size = animcurve_channel_evaluate(outback, t)
}
if (menu == 0)
{
    fade_alpha -= 0.1
    if (state == states.dynamite)
    {
        var firstboot = (!file_exists("first_boot"))
        if firstboot
        {
            var found = 0
            var path = (environment_get_variable("APPDATA") + "/PizzaTower_GM2")
            if file_exists((path + "/saveData.ini"))
            {
                ini_open((path + "/saveData.ini"))
                options = 
                {
                    ptt: ini_section_exists("Modded"),
                    beaten: ini_read_real("Game", "beaten", 0)
                }

                ini_close()
                found = 1
            }
            else
                sel = 1
            for (var i = 0; i < 3; i++)
            {
                var file = concat(path, "/saves/saveData", (i + 1), ".ini")
                if file_exists(file)
                {
                    ini_open(file)
                    saves[i] = 
                    {
                        percent: ini_read_real("Game", "percent", 0),
                        minutes: ini_read_real("Game", "minutes", 0),
                        seconds: ini_read_real("Game", "seconds", 0),
                        john: ini_read_real("Game", "john", 0),
                        snotty: ini_read_real("Game", "finalsnotty", 0),
                        finalrank: ini_read_string("Game", "finalrank", "")
                    }

                    ini_close()
                    found = 1
                }
                else if ((sel - 1) == i)
                    sel++
            }
            if found
            {
                with (gml_Script_instance_create(0, 0, obj_loadingscreen))
                    group_arr = ["menugroup"]
                menu = 1
            }
            else
                state = states.boots
        }
        else
        {
            fade_alpha = 2
            state = states.boots
        }
    }
    else if (state == states.boots)
    {
        state = -1
        room_goto(Realtitlescreen)
    }
    else if (are_you_sure || 0)
        gml_Script_instance_create(0, 0, obj_softlockcrash)
}
else if (menu == 1)
{
    if (state == states.boots)
    {
        t = Approach(t, 0, 0.1)
        size = animcurve_channel_evaluate(incubic, t)
        if (t == 0)
            fade_alpha = Approach(fade_alpha, 1, 0.1)
        if (fade_alpha == 1)
        {
            menu = 0
            gml_Script_get_options()
            load_moddedconfig()
        }
    }
    else
    {
        fade_alpha = Approach(fade_alpha, 0, 0.1)
        scr_getinput()
        var move = (key_down2 - key_up2)
        if (move != 0 && (sel + move) > -1 && (sel + move) < 5 && (options != -4 || (sel + move) > 0))
        {
            sound_play("event:/sfx/ui/step")
            sel += move
            while (sel > 0 && sel < 4 && saves[(sel - 1)] == -4)
                sel += move
            pizzashift[1] = ((-move) * 10)
        }
        if (key_jump || keyboard_check_pressed(vk_return))
        {
            if (sel == 4)
            {
                sound_play("event:/modded/sfx/diagclose")
                path = (environment_get_variable("APPDATA") + "/PizzaTower_GM2")
                if selected[0]
                    file_copy((path + "/saveData.ini"), "saveData.ini")
                for (i = 1; i < 4; i++)
                {
                    file = concat(path, "/saves/saveData", i, ".ini")
                    if selected[i]
                        file_copy(file, concat("saves/saveData", i, ".ini"))
                }
                state = states.boots
                self.make_firstboot_file()
            }
            else
            {
                selected[sel] = (!selected[sel])
                sound_play("event:/sfx/ui/select")
                pizzashift[0] = 15
                image_index = 8
            }
        }
        pizzashift[0] = lerp(pizzashift[0], 0, 0.25)
        pizzashift[1] = lerp(pizzashift[1], 0, 0.25)
    }
}
else if (menu == 2)
    fade_alpha = Approach(fade_alpha, 0, 0.1)
else if (menu == 3)
{
    if (state == states.dynamite)
        fade_alpha = Approach(fade_alpha, 3, 0.2)
    else
        fade_alpha = Approach(fade_alpha, 0, 0.1)
    scr_menu_getinput()
    if ((key_jump || keyboard_check_pressed(vk_return)) && state != states.dynamite)
    {
        sound_play("event:/modded/sfx/diagclose")
        state = states.dynamite
    }
    if (state == states.dynamite && fade_alpha >= 3)
    {
        file_delete("crash_log.txt")
        file_delete("crash_img.png")
        room_restart()
    }
}
