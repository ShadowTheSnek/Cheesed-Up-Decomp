function scr_solid(argument0, argument1) //gml_Script_scr_solid
{
    var old_x = x
    var old_y = y
    if check_solid(argument0, argument1)
        return 1;
    x = argument0
    y = argument1
    if (variable_instance_exists(id, "flip") && flip < 0)
        y = (old_y - (argument1 - old_y))
    var num = instance_place_list(x, y, obj_platform, global.instancelist, 0)
    if (num > 0)
    {
        var _collided = 0
        for (var i = 0; i < num; i++)
        {
            var b = ds_list_find_value(global.instancelist, i)
            if ((b.image_yscale > 0 && y > old_y) || (b.image_yscale < 0 && y < old_y))
            {
                if ((!(place_meeting(x, old_y, b))) && place_meeting(x, y, b))
                    _collided = 1
            }
        }
        ds_list_clear(global.instancelist)
        if _collided
        {
            x = old_x
            y = old_y
            return 1;
        }
    }
    if (variable_instance_exists(id, "vsp") && vsp >= 0 && place_meeting(x, y, obj_slope_platform))
    {
        num = instance_place_list(x, y, obj_slope_platform, global.instancelist, 0)
        _collided = 0
        for (i = 0; i < num; i++)
        {
            b = ds_list_find_value(global.instancelist, i)
            if check_slope_platform(b, old_y)
                _collided = 1
        }
        ds_list_clear(global.instancelist)
        if _collided
        {
            x = old_x
            y = old_y
            return 1;
        }
    }
    if inside_slope(obj_slope)
    {
        x = old_x
        y = old_y
        return 1;
    }
    x = old_x
    y = old_y
    return 0;
}

function check_solid(argument0, argument1) //gml_Script_check_solid
{
    if (variable_instance_exists(id, "flip") && flip < 0)
        argument1 = (y - (argument1 - y))
    return instance_place(argument0, argument1, obj_solid);
}

function check_slope(argument0, argument1) //gml_Script_check_slope
{
    if (variable_instance_exists(id, "flip") && flip < 0)
        argument1 = (y - (argument1 - y))
    return instance_place(argument0, argument1, obj_slope_parent);
}

function inside_slope(argument0) //gml_Script_inside_slope
{
    ds_list_clear(global.instancelist)
    var slope = instance_place_list(x, y, argument0, global.instancelist, 1)
    if (!slope)
        return 0;
    for (i = 0; i < slope; i++)
    {
        with (ds_list_find_value(global.instancelist, i))
        {
            var arr = object_get_slope_triangle(id)
            if rectangle_in_triangle(other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_bottom, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
            {
                ds_list_clear(global.instancelist)
                return 1;
            }
        }
    }
    ds_list_clear(global.instancelist)
    return 0;
}

function check_slope_platform(argument0, argument1) //gml_Script_check_slope_platform
{
    var _y = y
    slope = instance_place(x, y, argument0)
    if slope
    {
        with (slope)
        {
            var object_side = 0
            var slope_start = 0
            var slope_end = 0
            if (image_xscale > 0)
            {
                object_side = other.bbox_right
                slope_start = bbox_bottom
                slope_end = bbox_top
            }
            else
            {
                object_side = other.bbox_left
                slope_start = bbox_top
                slope_end = bbox_bottom
            }
            var m = ((sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left))
            slope = (slope_start - round((m * (object_side - bbox_left))))
            if (other.bbox_bottom >= slope)
            {
                other.y = argument1
                if (other.bbox_bottom <= (slope + (2 / abs(m))))
                {
                    other.y = _y
                    return 1;
                }
            }
        }
    }
    other.y = _y
    return 0;
}

function check_convex_slope(argument0) //gml_Script_check_convex_slope
{
}

function check_concave_slope(argument0) //gml_Script_check_concave_slope
{
}

function scr_solid_slope(argument0, argument1) //gml_Script_scr_solid_slope
{
    old_x = x
    old_y = y
    x = argument0
    y = argument1
    if (variable_instance_exists(id, "flip") && flip < 0)
        y = (old_y - (argument1 - old_y))
    if inside_slope(obj_slope)
    {
        var inst = instance_place(x, y, obj_slope)
        if (sign(inst.image_xscale) != xscale)
        {
            x = old_x
            y = old_y
            return 1;
        }
    }
    x = old_x
    y = old_y
    return 0;
}

