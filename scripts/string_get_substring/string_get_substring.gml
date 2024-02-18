function string_get_substring(argument0, argument1, argument2) //gml_Script_string_get_substring
{
    if (argument2 == undefined)
        argument2 = -1
    if (((!argument2) && argument2 != -1) || string_is_empty_or_null(argument0))
        return argument0;
    return string_copy(argument0, argument1, (argument2 == -1 ? ((string_length(argument0) - argument1) + 1) : argument2));
}

