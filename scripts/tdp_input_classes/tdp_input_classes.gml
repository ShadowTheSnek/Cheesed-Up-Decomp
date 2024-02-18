function tdp_input_key(argument0, argument1) constructor //gml_Script_tdp_input_key
{
    if (argument1 == undefined)
        argument1 = -4
    if 1
    {
    }
    else
    {
        function anon@87@tdp_input_key_tdp_input_classes(argument0) //gml_Script_anon@87@tdp_input_key_tdp_input_classes
        {
            if (argument0 == undefined)
                argument0 = self
            pressed = 0
            held = 0
            released = 0
            axis_value = 0
            for (var i = 0; i < array_length(actions); i++)
            {
                var b = actions[i]
                argument0.argument0.update(b)
                if b.pressed
                    pressed = 1
                if b.held
                    held = 1
                if b.released
                    released = 1
                actions[i] = b
            }
        }

        function anon@463@tdp_input_key_tdp_input_classes(argument0, argument1, argument2) //gml_Script_anon@463@tdp_input_key_tdp_input_classes
        {
            if (argument2 == undefined)
                argument2 = 0
            for (i = 0; i < array_length(actions); i++)
            {
                b = actions[i]
                if (b.type == argument0 && b.value == argument1)
                {
                    if (argument0 != (2 << 0) || b.joystick_direction == argument2)
                        return 1;
                }
            }
            return 0;
        }

    }
    name = argument0
    pressed = 0
    held = 0
    released = 0
    axis_value = 0
    if (argument1 == -4)
        actions = array_create(0)
    else
        actions = argument1
}

function tdp_input_action(argument0, argument1, argument2) constructor //gml_Script_tdp_input_action
{
    if (argument2 == undefined)
        argument2 = 0
    if 1
    {
    }
    else
        function anon@1079@tdp_input_action_tdp_input_classes(argument0) //gml_Script_anon@1079@tdp_input_action_tdp_input_classes
        {
            if (argument0 == undefined)
                argument0 = -1
            switch type
            {
                case (0 << 0):
                    if is_array(value)
                    {
                        var last_held = held
                        axis_value = (keyboard_check(value[1]) - keyboard_check(value[0]))
                        pressed = (keyboard_check_pressed(value[1]) - keyboard_check_pressed(value[0])) != 0
                        held = axis_value != 0
                        released = (axis_value == 0 && last_held)
                    }
                    else
                    {
                        pressed = keyboard_check_pressed(value)
                        held = keyboard_check(value)
                        released = keyboard_check_released(value)
                    }
                    break
                case (1 << 0):
                    if is_array(value)
                    {
                        last_held = held
                        axis_value = (gamepad_button_check(argument0, value[1]) - gamepad_button_check(argument0, value[0]))
                        pressed = (gamepad_button_check_pressed(argument0, value[1]) - gamepad_button_check_pressed(argument0, value[0])) != 0
                        held = axis_value != 0
                        released = (axis_value == 0 && last_held)
                    }
                    else
                    {
                        pressed = gamepad_button_check_pressed(argument0, value)
                        held = gamepad_button_check(argument0, value)
                        released = gamepad_button_check_released(argument0, value)
                    }
                    break
                case (2 << 0):
                    last_held = held
                    if (!custom_deadzone)
                    {
                        var pdz = global.input_controller_deadzone_press
                        var hdz = global.input_controller_deadzone_horizontal
                        var vdz = global.input_controller_deadzone_vertical
                    }
                    else
                    {
                        pdz = variable_global_get(custom_deadzone_press)
                        hdz = variable_global_get(custom_deadzone_horizontal)
                        hdz = variable_global_get(custom_deadzone_vertical)
                    }
                    switch value
                    {
                        case gp_axislh:
                        case 32787:
                            var dz = hdz
                            break
                        case 32786:
                        case 32788:
                            dz = vdz
                            break
                    }

                    axis_value = gamepad_axis_value(argument0, value)
                    if (joystick_direction == 0)
                        var press_check = (axis_value > pdz || axis_value < (-pdz))
                    else if (joystick_direction == 1)
                        press_check = axis_value > pdz
                    else if (joystick_direction == -1)
                        press_check = axis_value < (-pdz)
                    pressed = (press_check && (!stickpressed))
                    held = press_check
                    released = ((!held) && last_held)
                    if press_check
                        stickpressed = 1
                    else
                        stickpressed = 0
                    break
            }

        }

    type = argument0
    value = argument1
    has_axis_value = 0
    axis_value = 0
    if (type == (2 << 0))
    {
        has_axis_value = 1
        custom_deadzone = 0
        joystick_direction = argument2
        custom_deadzone_press = "input_controller_deadzone_press"
        custom_deadzone_vertical = "input_controller_deadzone_vertical"
        custom_deadzone_horizontal = "input_controller_deadzone_deadzone"
        custom_deadzone_side = "input_controller_deadzone_side"
        axis_value = 0
        stickpressed = 0
    }
    if is_array(value)
    {
        has_axis_value = 1
        axis_value = 0
    }
    pressed = 0
    held = 0
    released = 0
}

