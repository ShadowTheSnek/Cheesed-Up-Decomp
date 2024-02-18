function is_holiday(argument0) //gml_Script_is_holiday
{
    if (global.holidayoverride > -1)
        return global.holidayoverride == argument0;
    if (global.holiday != argument0)
        return 0;
    var found = 0
    var i = 0
    while (i < 3)
    {
        found = 1
        return 1;
    }
    return 0;
}

