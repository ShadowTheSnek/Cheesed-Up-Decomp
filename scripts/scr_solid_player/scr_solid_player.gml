function scr_solid_player(argument0, argument1) //gml_Script_scr_solid_player
{
    var old_x = x
    var old_y = y
    x = argument0
    y = argument1
    if (flip < 0)
        y = (old_y - (argument1 - old_y))
    ds_list_clear(global.instancelist)
    var num = instance_place_list(x, y, obj_solid, global.instancelist, 0)
    var _collided = 0
    var i = 0
    while (i < num)
    {
        var b = ds_list_find_value(global.instancelist, i)
        if instance_exists(b)
        {
            switch b.object_index
            {
                case obj_ghostwall:
                    if (state != states.ghost)
                        _collided = 1
                    break
                case obj_mach3solid:
                    if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost) && (state != states.chainsaw || tauntstoredstate != states.mach3) && state != states.rupertjump && state != states.rupertslide)
                        _collided = 1
                    break
                case obj_metalblock:
                    if (state != states.rupertjump && state != states.rupertslide)
                        _collided = 1
                    break
                default:
                    _collided = 1
            }

        }
        if _collided
            break
        else
        {
            i++
            continue
        }
    }
    ds_list_clear(global.instancelist)
    if _collided
    {
        x = old_x
        y = old_y
        return 1;
    }
    num = instance_place_list(x, y, obj_platform, global.instancelist, 0)
    if (state != states.ladder && state != states.ratmountladder && place_meeting(x, y, obj_platform) && num > 0)
    {
        _collided = 0
        for (i = 0; i < num; i++)
        {
            b = ds_list_find_value(global.instancelist, i)
            if ((b.image_yscale > 0 && y > old_y) || (b.image_yscale < 0 && y < old_y))
            {
                if ((!(place_meeting(x, old_y, b))) && place_meeting(x, y, b))
                {
                    if (b.object_index == obj_cottonplatform_tiled)
                        _collided = (state == (304 << 0) || state == (306 << 0))
                    else
                        _collided = 1
                }
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
    if (vsp >= 0 && state != states.Sjump && state != states.ladder && state != states.ratmountladder && place_meeting(x, y, obj_slope_platform))
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
    if (y > old_y && state == states.grind && (!(place_meeting(x, old_y, obj_grindrail))) && place_meeting(x, y, obj_grindrail))
    {
        x = old_x
        y = old_y
        return 1;
    }
    if inside_slope(obj_slope)
    {
        x = old_x
        y = old_y
        return 1;
    }
    if check_concave_slope_player(obj_concaveslope)
    {
        x = old_x
        y = old_y
        return 1;
    }
    if (state == states.grind && inside_slope(obj_grindrailslope))
    {
        x = old_x
        y = old_y
        return 1;
    }
    x = old_x
    y = old_y
    return 0;
}

function check_slope_pos(argument0, argument1, argument2) //gml_Script_check_slope_pos
{
    if (argument2 == undefined)
        argument2 = obj_slope
    var xx = x
    var yy = y
    x = argument0
    y = argument1
    var ret = inside_slope(argument2)
    x = xx
    y = yy
    return ret;
}

function check_concave_slope_player(argument0) //gml_Script_check_concave_slope_player
{
    var slope = instance_place(x, y, argument0)
    if slope
    {
        with (slope)
        {
            var slope_start = 0
            var slope_end = 0
            var object_side = 0
            var slope_max_side = 0
            var slope_min_side = 0
            if (image_xscale > 0)
            {
                object_side = (other.bbox_right + 1)
                slope_max_side = bbox_right
                slope_min_side = bbox_left
            }
            else
            {
                object_side = other.bbox_left
                slope_max_side = bbox_left
                slope_min_side = bbox_right
            }
            var radius_x = (32 * image_xscale)
            var radius_y = (32 * image_yscale)
            if (point_in_ellipse(object_side, other.bbox_bottom, slope.x, slope.y, radius_x, radius_y) > 1)
                return 1;
        }
    }
    return 0;
}

function point_in_ellipse(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_point_in_ellipse
{
    return ((power((argument0 - argument2), 2) / power(argument4, 2)) + (power((argument1 - argument3), 2) / power(argument5, 2)));
}

