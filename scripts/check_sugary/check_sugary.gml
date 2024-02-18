function check_sugary(argument0) //gml_Script_check_sugary
{
    if (argument0 == undefined)
        argument0 = 0
    if argument0
        return global.SUGARY;
    return (global.SUGARY || (global.sugaryoverride && check_sugarychar()));
}

