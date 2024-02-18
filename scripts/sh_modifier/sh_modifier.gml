function sh_modifier(argument0) //gml_Script_sh_modifier
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return "Argument missing: modifier";
    var modifier = argument0[1]
    if (!(variable_struct_exists(global.MOD, modifier)))
        return string("Modifier {0} not found", modifier);
    if (array_length(argument0) >= 3)
    {
        if string_is_number(argument0[2])
            var value = real(argument0[2])
        else
            return "Value parameter is not a valid number";
    }
    else
        value = (!(variable_struct_get(global.MOD, modifier)))
    variable_struct_set(global.MOD, modifier, value)
    if (value == 0 || value == 1)
        return string("{0} modifier {1}", modifier, (value ? "ON" : "OFF"));
    else
        return string("{0} modifier set to {1}", modifier, value);
}

function meta_modifier() //gml_Script_meta_modifier
{
    return 
    {
        description: "toggle a modifier",
        var arguments: ["modifier", "<value>"],
        suggestions: [function() //gml_Script_anon@847@___struct___47_meta_modifier_sh_modifier
        {
            var state_array = variable_struct_get_names(global.MOD)
            array_sort(state_array, 1)
            return state_array;
        }]
    };
}

