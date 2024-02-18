function check_skin(argument0, argument1, argument2) //gml_Script_check_skin
{
    if (argument1 == undefined)
        argument1 = obj_player1.character
    if (argument2 == undefined)
        argument2 = obj_player1.paletteselect
    switch argument0
    {
        case (0 << 0):
            return (argument1 == "P" && argument2 == 55);
        case (1 << 0):
            return (argument1 == "N" && argument2 == 25);
    }

    return 0;
}

