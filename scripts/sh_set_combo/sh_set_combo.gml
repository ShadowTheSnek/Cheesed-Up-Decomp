function sh_set_combo(argument0) //gml_Script_sh_set_combo
{
    if (array_length(argument0) < 2)
        return "Combo parameter missing";
    else
    {
        if (!string_is_number(argument0[1]))
            return "Invalid combo";
        var combo = real(argument0[1])
        var combotime = 60
        if (array_length(argument0) > 2)
        {
            if string_is_number(argument0[2])
                combotime = real(argument0[2])
            else
                return "Invalid combotime";
        }
        global.combo = combo
        global.combotime = combotime
        with (obj_player)
            supercharge = 10
    }
}

function meta_set_combo() //gml_Script_meta_set_combo
{
    return 
    {
        description: "set the combo",
        var arguments: ["combo", "<combotime>"]
    };
}

