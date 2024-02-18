depth = -400
scr_menu_getinput()
key_reset = (tdp_input_get("menu_reset_binds").pressed || tdp_input_get("menu_reset_bindsC").pressed)
if (startbuffer > 0)
{
    startbuffer--
    key_back = 0
    key_jump = 0
    key_jump2 = 0
}
if (addbuffer > 0)
{
    addbuffer--
    key_up = 0
    key_up2 = 0
    key_down = 0
    key_down2 = 0
    key_left = 0
    key_left2 = 0
    key_right = 0
    key_right2 = 0
    key_start = 0
    key_back = 0
    key_jump = 0
    key_jump2 = 0
    key_delete = 0
    key_delete2 = 0
    key_quit = 0
    key_quit2 = 0
    key_reset = 0
}
if (!selecting)
{
    if key_up2
    {
        fmod_event_one_shot("event:/sfx/ui/step")
        key_select--
    }
    if key_down2
    {
        fmod_event_one_shot("event:/sfx/ui/step")
        key_select++
    }
    if (key_select != -1 && key_left2)
        key_select = -1
    else if (key_select == -1 && key_right2)
        key_select = 0
    if key_reset
    {
        ini_open_from_string(obj_savesystem.ini_str)
        ini_section_delete("Input")
        scr_initinput(0)
        obj_savesystem.ini_str = ini_close()
    }
    key_select = clamp(key_select, -1, (array_length(input) - 1))
    if (((key_jump || key_back) && key_select <= -1) || (key_select > -1 && key_back))
    {
        var _found = 0
        for (var i = 0; i < array_length(input); i++)
        {
            var _v = input[i][0]
            if (_v != "player_superjump" && _v != "player_groundpound")
            {
                if controller
                    _v = concat(_v, "C")
                if ((!is_undefined(tdp_input_get(_v))) && tdp_input_get(_v).actions != -4 && array_length(tdp_input_get(_v).actions) <= 0)
                    _found = 1
            }
        }
        if (!_found)
        {
            fmod_event_one_shot("event:/sfx/ui/select")
            ini_open_from_string(obj_savesystem.ini_str_options)
            for (i = 0; i < array_length(input); i++)
            {
                _v = input[i][0]
                if controller
                    _v = concat(_v, "C")
                tdp_input_ini_write(_v)
            }
            obj_savesystem.ini_str_options = ini_close()
            if instance_exists(obj_option)
                obj_option.backbuffer = 2
            with (create_transformation_tip(gml_Script_lang_get_value("option_controls_saved")))
            {
                depth = -700
                alarm[1] = 100
            }
            instance_destroy()
        }
        else
            fmod_event_one_shot("event:/sfx/ui/select")
    }
    else if (key_select > -1)
    {
        if key_jump
        {
            selecting = 1
            startbuffer = 1
        }
        else if key_delete2
        {
            if (!controller)
                tdp_input_get(input[key_select][0]).actions = array_create(0)
            else
                tdp_input_get(concat(input[key_select][0], "C")).actions = array_create(0)
            var name = input[key_select][0]
            if (name == "menu_select")
            {
                selecting = 1
                startbuffer = 1
            }
        }
    }
}
else if (!controller)
{
    if keyboard_check_pressed(vk_anykey)
    {
        if (keyboard_key != vk_f1)
        {
            startbuffer = 5
            addbuffer = 5
            var in = tdp_input_get(input[key_select][0])
            if (!((0 << 0).((0 << 0)).has_value(keyboard_key, in)))
                array_push(in.actions, new tdp_input_action(0, keyboard_key))
            selecting = 0
        }
    }
}
else
{
    var val = scr_checkanygamepad(obj_inputAssigner.player_input_device[0])
    if (val == -4)
        val = scr_check_joysticks(obj_inputAssigner.player_input_device[0])
    if (val != -4 && val != 32777)
    {
        startbuffer = 5
        addbuffer = 5
        in = tdp_input_get(concat(input[key_select][0], "C"))
        if (!is_array(val))
        {
            if (!((1 << 0).((1 << 0)).has_value(val, in)))
                array_push(in.actions, new tdp_input_action((1 << 0), val))
        }
        else if (!((2 << 0).((2 << 0)).has_value(val[0], val[1], in)))
            array_push(in.actions, new tdp_input_action((2 << 0), val[0], val[1]))
        selecting = 0
    }
}
