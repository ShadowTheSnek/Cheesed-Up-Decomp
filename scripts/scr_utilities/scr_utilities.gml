function Approach(argument0, argument1, argument2) //gml_Script_Approach
{
    argument2 = abs(argument2)
    if (argument0 < argument1)
    {
        argument0 += argument2
        if (argument0 >= argument1)
            return argument1;
    }
    else
    {
        argument0 -= argument2
        if (argument0 <= argument1)
            return argument1;
    }
    return argument0;
}

function get_milliseconds() //gml_Script_get_milliseconds
{
    return (get_timer() / 1000);
}

function camera_zoom(argument0, argument1) //gml_Script_camera_zoom
{
    with (obj_camera)
    {
        targetzoom = argument0
        targetzoom = clamp(targetzoom, 0, max_zoom)
        if (argument1 != undefined)
            zoomspd = abs(argument1)
    }
}

function camera_set_zoom(argument0) //gml_Script_camera_set_zoom
{
    with (obj_camera)
        zoom = argument0
}

function try_solid(argument0, argument1, argument2, argument3) //gml_Script_try_solid
{
    var old_x = x
    var old_y = y
    var n = -1
    var i = 0
    while (i < argument3)
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
        {
            n = (i + 1)
            break
        }
        else
        {
            i++
            continue
        }
    }
    x = old_x
    y = old_y
    return n;
}

function ledge_bump_vertical() //gml_Script_ledge_bump_vertical
{
    old_x = x
    old_y = y
    y += (argument1 * 4)
    var dirs = [-1, 1]
    for (i = 0; i < array_length(dirs); i++)
    {
        var ledge_dir = dirs[i]
        var tx = try_solid(ledge_dir, 0, obj_solid, argument0)
        y = old_y
        if (tx != -1)
        {
            x -= (tx * ledge_dir)
            y += argument1
            if scr_solid(x, y)
            {
                x = old_x
                y = old_y
                return 1;
            }
            return 0;
        }
    }
    return 1;
}

function ledge_bump(argument0) //gml_Script_ledge_bump
{
    old_x = x
    old_y = y
    x += (xscale * 4)
    var ty = try_solid(0, (-flip), obj_solid, argument0)
    x = old_x
    if (ty != -1)
    {
        y -= (ty * flip)
        x += xscale
        if scr_solid(x, y)
        {
            x = old_x
            y = old_y
            return 1;
        }
        return 0;
    }
    return 1;
}

function instance_create_unique(argument0, argument1, argument2) //gml_Script_instance_create_unique
{
    if instance_exists(argument2)
        return -4;
    var b = gml_Script_instance_create(argument0, argument1, argument2)
    return b;
}

function get_solid_difference(argument0, argument1, argument2) //gml_Script_get_solid_difference
{
    old_x = x
    old_y = y
    n = 0
    for (i = 0; i < argument2; i++)
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
            n++
    }
    x = old_x
    y = old_y
    return n;
}

function trace() //gml_Script_trace
{
    return;
}

function concat() //gml_Script_concat
{
    var _string = buffer_create(64, buffer_grow, 1)
    for (i = 0; i < argument_count; i++)
        buffer_write(_string, buffer_text, string(argument[i]))
    buffer_seek(_string, buffer_seek_start, 0)
    var s = buffer_read(_string, buffer_string)
    buffer_delete(_string)
    return s;
}

function embed_value_string(argument0, argument1) //gml_Script_embed_value_string
{
    var str_copy = string_copy(argument0, 1, string_length(argument0))
    for (i = 0; i < array_length(argument1); i++)
    {
        b = string(argument1[i])
        str_copy = string_replace(str_copy, "%", b)
    }
    return str_copy;
}

function ds_list_add_unique(argument0) //gml_Script_ds_list_add_unique
{
    for (i = 1; i < argument_count; i++)
    {
        b = argument[i]
        if (ds_list_find_index(argument0, b) == -1)
            ds_list_add(argument0, b)
    }
}

function point_in_camera(argument0, argument1, argument2) //gml_Script_point_in_camera
{
    if (argument2 == undefined)
        argument2 = -1
    if (argument2 == -1)
        argument2 = view_camera[view_current]
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function point_in_camera_ext(argument0, argument1, argument2, argument3, argument4) //gml_Script_point_in_camera_ext
{
    if (argument2 == undefined)
        argument2 = -1
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if (argument2 == -1)
        argument2 = view_camera[view_current]
    cam_x = camera_get_view_x(argument2)
    cam_y = camera_get_view_y(argument2)
    cam_w = camera_get_view_width(argument2)
    cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, (cam_x - argument3), (cam_y - argument4), ((cam_x + cam_w) + argument3), ((cam_y + cam_h) + argument4));
}

function bbox_in_camera(argument0, argument1) //gml_Script_bbox_in_camera
{
    if (argument0 == undefined)
        argument0 = self
    if (argument1 == undefined)
        argument1 = fa_top
    if (argument0 == self)
        argument0 = view_camera[view_current]
    cam_x = camera_get_view_x(argument0)
    cam_y = camera_get_view_y(argument0)
    cam_w = camera_get_view_width(argument0)
    cam_h = camera_get_view_height(argument0)
    return (bbox_left < ((cam_x + cam_w) + argument1) && bbox_right > (cam_x - argument1) && bbox_top < ((cam_y + cam_h) + argument1) && bbox_bottom > (cam_y - argument1));
}

function instance_nearest_random(argument0, argument1) //gml_Script_instance_nearest_random
{
    var l = instance_furthest(x, y, argument0)
    var list = ds_list_create()
    for (i = 0; i < instance_number(argument0); i++)
    {
        b = instance_find(argument0, i)
        var t = distance_to_object(b)
        if (t <= l)
            ds_list_add(list, b)
    }
    b = undefined
    if (ds_list_size(list) > 0)
    {
        n = irandom(argument1)
        if (ds_list_size(list) < n)
            n = (ds_list_size(list) - 1)
        b = ds_list_find_value(list, (ds_list_size(list) - n))
    }
    ds_list_destroy(list)
    return b;
}

function instance_random(argument0) //gml_Script_instance_random
{
    return instance_find(argument0, irandom((instance_number(argument0) - 1)));
}

function heat_calculate(argument0) //gml_Script_heat_calculate
{
    if (global.heatmeter || global.MOD.DeathMode)
        argument0 += round((argument0 * global.stylemultiplier))
    return argument0;
}

function draw_set_align(argument0, argument1) //gml_Script_draw_set_align
{
    if (argument0 == undefined)
        argument0 = 0
    if (argument1 == undefined)
        argument1 = 0
    draw_set_halign(argument0)
    draw_set_valign(argument1)
}

function array_unfold(argument0, argument1) //gml_Script_array_unfold
{
    if (argument1 == undefined)
        argument1 = ", "
    _string = buffer_create(64, buffer_grow, 1)
    i = 0
    n = array_length(argument0)
    while (i < n)
    {
        buffer_write(_string, buffer_text, string(argument0[i]))
        if (i < (n - 1))
            buffer_write(_string, buffer_text, argument1)
        i++
    }
    buffer_seek(_string, buffer_seek_start, 0)
    s = buffer_read(_string, buffer_string)
    buffer_delete(_string)
    return s;
}

function point_rotate(argument0, argument1, argument2, argument3, argument4) //gml_Script_point_rotate
{
    s = sin(argument2)
    var c = cos(argument2)
    var _ox = (argument0 - argument3)
    var _oy = (argument1 - argument4)
    var new_x = ((_ox * c) - (_oy * s))
    var new_y = ((_ox * s) + (_oy * c))
    return [(new_x + argument3), (new_y + argument4)];
}

function object_get_slope_line(argument0, argument1, argument2, argument3, argument4) //gml_Script_object_get_slope_line
{
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    var ret_array = [0, 0, 0, 0]
    if (!argument0)
        return ret_array;
    argument1 -= sign(argument0.image_xscale)
    argument3 -= sign(argument0.image_xscale)
    with (argument0)
    {
        ret_array[0] = (bbox_left + argument1)
        ret_array[1] = (bbox_bottom + argument4)
        ret_array[2] = (bbox_right + argument3)
        ret_array[3] = (bbox_top + argument2)
        if (image_xscale < 0)
        {
            ret_array[1] = (bbox_top + argument2)
            ret_array[3] = (bbox_bottom + argument4)
        }
        if (image_yscale < 0)
        {
            ret_array[0] = (bbox_right + argument3)
            ret_array[2] = (bbox_left + argument1)
        }
        return ret_array;
    }
}

function object_get_slope_triangle(argument0) //gml_Script_object_get_slope_triangle
{
    if 1
    {
    }
    else
        ret_array = [0, 0, 0, 0, 0, 0]
    if (!argument0)
        return -4;
    with (argument0)
    {
        var x1 = (bbox_left - 1)
        var y1 = (bbox_bottom + 1)
        var x2 = (bbox_right + 1)
        var y2 = (bbox_top - 1)
        var x3 = (bbox_right + 1)
        var y3 = (bbox_bottom + 1)
        if (image_xscale < 0)
        {
            x1 = (bbox_right + 1)
            x2 = (bbox_left - 1)
            x3 = (bbox_left - 1)
        }
        if (image_yscale < 0)
        {
            y1 = (bbox_top - 1)
            y2 = (bbox_bottom + 1)
            y3 = (bbox_top - 1)
        }
        ret_array[0] = x1
        ret_array[1] = y1
        ret_array[2] = x2
        ret_array[3] = y2
        ret_array[4] = x3
        ret_array[5] = y3
        if (image_angle != 0)
        {
            var angle = ((360 - image_angle) * 0.017453292519943295)
            var center_x = (bbox_left + ((bbox_right - bbox_left) / 2))
            var center_y = (bbox_top + ((bbox_bottom - bbox_top) / 2))
            var point_a = point_rotate(x1, y1, angle, center_x, center_y)
            var point_b = point_rotate(x2, y2, angle, center_x, center_y)
            var point_c = point_rotate(x3, y3, angle, center_x, center_y)
            ret_array[0] = clamp(point_a[0], bbox_left, bbox_right)
            ret_array[1] = clamp(point_a[1], bbox_top, bbox_bottom)
            ret_array[2] = clamp(point_b[0], bbox_left, bbox_right)
            ret_array[3] = clamp(point_b[1], bbox_top, bbox_bottom)
            ret_array[4] = clamp(point_c[0], bbox_left, bbox_right)
            ret_array[5] = clamp(point_c[1], bbox_top, bbox_bottom)
        }
        ret_array = ret_array
        return ret_array;
    }
}

function rectangle_in_rectangle_fast(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_rectangle_in_rectangle_fast
{
    if (argument3 < argument5)
        return 0;
    if (argument1 > argument7)
        return 0;
    if (argument0 > argument6)
        return 0;
    if (argument2 < argument4)
        return 0;
    return rectangle_in_rectangle(argument1, argument0, argument3, argument2, argument5, argument4, argument7, argument6);
}

