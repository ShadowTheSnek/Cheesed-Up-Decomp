function slope_direction(argument0) //gml_Script_slope_direction
{
    if (argument0 == undefined)
        argument0 = -4
    var slope = argument0
    if (slope == noone)
        slope = check_slope(x, (y + 1))
    if (slope == noone)
        return 0;
    return sign(slope.image_xscale);
}

