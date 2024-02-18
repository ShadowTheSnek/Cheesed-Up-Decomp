function wrap(argument0, argument1, argument2) //gml_Script_wrap
{
    if (frac(argument0) == 0)
    {
        while (argument0 > argument2 || argument0 < argument1)
        {
            if (argument0 > argument2)
                argument0 = (((argument1 + argument0) - argument2) - 1)
            else if (argument0 < argument1)
                argument0 = (((argument2 + argument0) - argument1) + 1)
        }
        return argument0;
    }
    else
    {
        var _old = (argument0 + 1)
        while (argument0 != _old)
        {
            _old = argument0
            if (argument0 < argument1)
                argument0 = (argument2 - (argument1 - argument0))
            else if (argument0 > argument2)
                argument0 = (argument1 + (argument0 - argument2))
        }
        return argument0;
    }
}

