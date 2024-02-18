function check_char(argument0) //gml_Script_check_char
{
    with (obj_player1)
    {
        if (character == argument0 || (argument0 == "G" && isgustavo && global.gameplay))
            return 1;
    }
    return 0;
}

function check_sugarychar() //gml_Script_check_sugarychar
{
    with (obj_player1)
        return (character == "SP" || character == "SN");
}

