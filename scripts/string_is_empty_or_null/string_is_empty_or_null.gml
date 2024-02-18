function string_is_empty_or_null(argument0) //gml_Script_string_is_empty_or_null
{
    if (!is_string(argument0))
        return 1;
    return string_length(argument0) == 0;
}

