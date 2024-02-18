function scr_init_input() //gml_Script_scr_init_input
{
    key_up = 0
    key_up2 = 0
    key_right = 0
    key_right2 = 0
    key_left = 0
    key_left2 = 0
    key_down = 0
    key_down2 = 0
    key_jump = 0
    key_jump2 = 0
    key_slap = 0
    key_slap2 = 0
    key_taunt = 0
    key_taunt2 = 0
    key_attack = 0
    key_attack2 = 0
    key_shoot = 0
    key_shoot2 = 0
    key_start = 0
    key_escape = 0
    key_chainsaw = 0
    key_chainsaw2 = 0
    stickpressed = 0
    stickpressed_horizontal = 0
    stickpressed_vertical = 0
}

function scr_check_superjump() //gml_Script_scr_check_superjump
{
    var sj = global.gamepad_superjump
    if (obj_inputAssigner.player_input_device[0] < 0)
        sj = global.keyboard_superjump
    return ((sj && key_up) || key_superjump);
}

function scr_check_groundpound() //gml_Script_scr_check_groundpound
{
    var gp = global.gamepad_groundpound
    if (obj_inputAssigner.player_input_device[0] < 0)
        gp = global.keyboard_groundpound
    return ((gp && key_down2) || key_groundpound);
}

function scr_check_groundpound2() //gml_Script_scr_check_groundpound2
{
    gp = global.gamepad_groundpound
    if (obj_inputAssigner.player_input_device[0] < 0)
        gp = global.keyboard_groundpound
    return ((gp && key_down) || key_groundpound2);
}

function scr_switch_get_menu_input() //gml_Script_scr_switch_get_menu_input
{
    var _dvc = obj_inputAssigner.player_input_device[0]
    key_jump = gamepad_button_check_pressed(_dvc, gp_face2)
    key_jump2 = gamepad_button_check(_dvc, gp_face2)
    key_back = gamepad_button_check_pressed(_dvc, gp_face1)
}

function scr_menu_getinput() //gml_Script_scr_menu_getinput
{
    if (!instance_exists(obj_player))
        tdp_input_update(obj_inputAssigner.player_input_device[0])
    if safe_get(obj_shell, "isOpen")
    {
        scr_init_input()
        key_back = 0
        key_delete = 0
        key_delete2 = 0
        key_quit = 0
        key_quit2 = 0
        return;
    }
    key_up = (tdp_input_get("menu_up").held || tdp_input_get("menu_upC").held)
    key_up2 = (tdp_input_get("menu_up").pressed || tdp_input_get("menu_upC").pressed)
    key_down = (tdp_input_get("menu_down").held || tdp_input_get("menu_downC").held)
    key_down2 = (tdp_input_get("menu_down").pressed || tdp_input_get("menu_downC").pressed)
    key_left = (-((tdp_input_get("menu_left").held || tdp_input_get("menu_leftC").held)))
    key_left2 = (-((tdp_input_get("menu_left").pressed || tdp_input_get("menu_leftC").pressed)))
    key_right = (tdp_input_get("menu_right").held || tdp_input_get("menu_rightC").held)
    key_right2 = (tdp_input_get("menu_right").pressed || tdp_input_get("menu_rightC").pressed)
    key_start = (tdp_input_get("menu_start").pressed || tdp_input_get("menu_startC").pressed)
    key_back = (tdp_input_get("menu_back").pressed || tdp_input_get("menu_backC").pressed)
    key_jump = (tdp_input_get("menu_select").pressed || tdp_input_get("menu_selectC").pressed)
    key_jump2 = (tdp_input_get("menu_select").held || tdp_input_get("menu_selectC").held)
    key_delete = (tdp_input_get("menu_delete").held || tdp_input_get("menu_deleteC").held)
    key_delete2 = (tdp_input_get("menu_delete").pressed || tdp_input_get("menu_deleteC").pressed)
    key_quit = (tdp_input_get("menu_quit").held || tdp_input_get("menu_quitC").held)
    key_quit2 = (tdp_input_get("menu_quit").pressed || tdp_input_get("menu_quitC").pressed)
    key_slap = (tdp_input_get("player_slap").held || tdp_input_get("player_slapC").held)
    key_slap2 = (tdp_input_get("player_slap").pressed || tdp_input_get("player_slapC").pressed)
    key_taunt = (tdp_input_get("player_taunt").held || tdp_input_get("player_tauntC").held)
    key_taunt2 = (tdp_input_get("player_taunt").pressed || tdp_input_get("player_tauntC").pressed)
    key_attack = (tdp_input_get("player_attack").held || tdp_input_get("player_attackC").held)
    key_attack2 = (tdp_input_get("player_attack").pressed || tdp_input_get("player_attackC").pressed)
    key_chainsaw = (tdp_input_get("player_chainsaw").held || tdp_input_get("player_chainsawC").held)
    key_chainsaw2 = (tdp_input_get("player_chainsaw").pressed || tdp_input_get("player_chainsawC").pressed)
    key_shoot = (tdp_input_get("player_shoot").held || tdp_input_get("player_shootC").held)
    key_shoot2 = (tdp_input_get("player_shoot").pressed || tdp_input_get("player_shootC").pressed)
}

function scr_getinput(argument0) //gml_Script_scr_getinput
{
    if (argument0 == undefined)
        argument0 = 0
    _dvc = obj_inputAssigner.player_input_device[0]
    if ((!argument0) || (!instance_exists(obj_player)))
        tdp_input_update(_dvc)
    if (safe_get(obj_shell, "isOpen") || (global.in_menu && (!argument0)))
    {
        scr_init_input()
        return;
    }
    var verticaldeadzone = global.input_controller_deadzone_vertical
    var horizontaldeadzone = global.input_controller_deadzone_horizontal
    var vertpress_dz = global.input_controller_deadzone_press
    var horizpress_dz = global.input_controller_deadzone_press
    key_up = (tdp_input_get("player_up").held || tdp_input_get("player_upC").held)
    key_up2 = (tdp_input_get("player_up").pressed || tdp_input_get("player_upC").pressed)
    key_right = (tdp_input_get("player_right").held || tdp_input_get("player_rightC").held)
    key_right2 = (tdp_input_get("player_right").pressed || tdp_input_get("player_rightC").pressed)
    key_left = (-((tdp_input_get("player_left").held || tdp_input_get("player_leftC").held)))
    key_left2 = (-((tdp_input_get("player_left").pressed || tdp_input_get("player_leftC").pressed)))
    key_down = (tdp_input_get("player_down").held || tdp_input_get("player_downC").held)
    key_down2 = (tdp_input_get("player_down").pressed || tdp_input_get("player_downC").pressed)
    key_jump = (tdp_input_get("player_jump").pressed || tdp_input_get("player_jumpC").pressed)
    key_jump2 = (tdp_input_get("player_jump").held || tdp_input_get("player_jumpC").held)
    key_slap = (tdp_input_get("player_slap").held || tdp_input_get("player_slapC").held)
    key_slap2 = (tdp_input_get("player_slap").pressed || tdp_input_get("player_slapC").pressed)
    key_taunt = (tdp_input_get("player_taunt").held || tdp_input_get("player_tauntC").held)
    key_taunt2 = (tdp_input_get("player_taunt").pressed || tdp_input_get("player_tauntC").pressed)
    key_attack = (tdp_input_get("player_attack").held || tdp_input_get("player_attackC").held)
    key_attack2 = (tdp_input_get("player_attack").pressed || tdp_input_get("player_attackC").pressed)
    key_chainsaw = (tdp_input_get("player_chainsaw").held || tdp_input_get("player_chainsawC").held)
    key_chainsaw2 = (tdp_input_get("player_chainsaw").pressed || tdp_input_get("player_chainsawC").pressed)
    key_shoot = (tdp_input_get("player_shoot").held || tdp_input_get("player_shootC").held)
    key_shoot2 = (tdp_input_get("player_shoot").pressed || tdp_input_get("player_shootC").pressed)
    key_start = (tdp_input_get("menu_start").pressed || tdp_input_get("menu_startC").pressed)
    key_superjump = (tdp_input_get("player_superjumpC").held || tdp_input_get("player_superjump").held)
    key_groundpound = (tdp_input_get("player_groundpoundC").pressed || tdp_input_get("player_groundpound").pressed)
    key_groundpound2 = (tdp_input_get("player_groundpoundC").held || tdp_input_get("player_groundpound").held)
    key_left_axis = scr_get_move_axis("player_leftC")
    key_right_axis = scr_get_move_axis("player_rightC")
    key_up_axis = scr_get_move_axis("player_upC")
    key_down_axis = scr_get_move_axis("player_downC")
    if (global.MOD.Mirror && object_index == obj_player1)
    {
        var uwu1 = key_left
        var uwu2 = key_left2
        key_left = (-key_right)
        key_left2 = (-key_right2)
        key_right = (-uwu1)
        key_right2 = (-uwu2)
    }
    if (gamepad_axis_value(_dvc, gp_axislh) >= horizpress_dz || gamepad_axis_value(_dvc, gp_axislh) <= (-horizpress_dz))
        stickpressed_horizontal = 1
    else
        stickpressed_horizontal = 0
    if (gamepad_axis_value(_dvc, gp_axislv) >= vertpress_dz || gamepad_axis_value(_dvc, gp_axislv) <= (-vertpress_dz))
        stickpressed_vertical = 1
    else
        stickpressed_vertical = 0
    if (object_index == obj_player1)
    {
        if (state == states.Sjumpprep || state == states.crouch || state == states.ratmountcrouch)
        {
            if (state == states.Sjumpprep)
            {
                var in = tdp_input_get("player_upC")
                var dz = global.gamepad_deadzone_superjump
            }
            else
            {
                in = tdp_input_get("player_downC")
                dz = global.gamepad_deadzone_crouch
            }
            var i = 0
            var n = array_length(in.actions)
            while (i < n)
            {
                var b = in.actions[i]
                with (b)
                {
                    if (type == (2 << 0))
                    {
                        switch value
                        {
                            case 32786:
                                var inverted_axis = gamepad_axis_value(_dvc, gp_axislh)
                                break
                            case 32788:
                                inverted_axis = gamepad_axis_value(_dvc, gp_axisrh)
                                break
                            case 32785:
                                inverted_axis = gamepad_axis_value(_dvc, gp_axislv)
                                break
                            case 32787:
                                inverted_axis = gamepad_axis_value(_dvc, gp_axisrv)
                                break
                        }

                        if (other.state == states.Sjumpprep)
                        {
                            if (axis_value <= (-0.8 + dz) && (axis_value != 0 || inverted_axis != 0))
                                other.key_up = 1
                        }
                        else if (axis_value >= (0.8 - dz) && (axis_value != 0 || inverted_axis != 0))
                            other.key_down = 1
                    }
                }
                i++
            }
        }
    }
}

function scr_get_move_axis(argument0) //gml_Script_scr_get_move_axis
{
    in = tdp_input_get(argument0)
    i = 0
    n = array_length(in.actions)
    while (i < n)
    {
        b = in.actions[i]
        with (b)
        {
            if (type == (2 << 0))
            {
                var av = axis_value
                if (joystick_direction == -1 && av > 0)
                    av = 0
                else if (joystick_direction == 1 && av < 0)
                    av = 0
                if (av != 0)
                    return av;
            }
        }
        i++
    }
    return 0;
}

