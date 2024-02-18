function scr_slope_angle(argument0) //gml_Script_scr_slope_angle
{
    var angle = 0
    with (argument0)
    {
        if (sign(image_xscale) == 1)
            angle = point_direction(bbox_left, bbox_bottom, bbox_right, bbox_top)
        if (sign(image_xscale) == -1)
            angle = (-((point_direction(bbox_right, bbox_top, bbox_left, bbox_bottom) - 180)))
    }
    return angle;
}

