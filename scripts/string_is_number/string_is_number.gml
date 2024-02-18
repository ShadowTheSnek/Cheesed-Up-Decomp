function string_is_number(argument0) //gml_Script_string_is_number
{
    if (!string_length(argument0))
        return 0;
    if is_real(argument0)
        return 1;
    @@try_hook@@(140, 212)
    real(argument0)
    @@try_unhook@@()
    return real(string(real(argument0))) == real(argument0);
}

function number_in_range(argument0, argument1, argument2) //gml_Script_number_in_range
{
    return (argument1 <= argument0 && argument0 <= argument2);
}

