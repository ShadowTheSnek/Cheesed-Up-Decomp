if keyboard_check_pressed(vk_escape)
{
    obj_player1.state = states.normal
    instance_destroy()
}
if (input_mode == 0)
{
    blink = 0
    input = ""
    if (!(safe_get(obj_shell, "isOpen")))
        keyboard_string = ""
}
else
{
    keyboard_string = string_copy(keyboard_string, 1, 75)
    keyboard_string = string_replace_all(keyboard_string, "^", "")
    if (input_mode == 2 && keyboard_lastchar != "")
    {
        obj_player1.state = states.normal
        instance_destroy()
    }
    else
    {
        var lastchar = ord(keyboard_lastchar)
        input = keyboard_string
        if (lastchar == 127 || lastchar == 3)
        {
            output += (input + "^C")
            input_mode = 0
            self.DOS_instruct(3, DOS_initstate)
            keyboard_string = ""
            keyboard_lastchar = ""
            input = ""
        }
        else if (lastchar == 13)
        {
            output += input
            self.DOS_command()
            keyboard_string = ""
            keyboard_lastchar = ""
            input = ""
        }
    }
}
if (instructionT > 0)
    instructionT--
else
{
    if is_callable(instructionF)
    {
        self.instructionF()
        instructionF = -1
    }
    var pop = array_shift(instructions)
    if (pop != undefined)
    {
        instructionT = pop[0]
        instructionF = pop[1]
        trace(pop)
    }
}
