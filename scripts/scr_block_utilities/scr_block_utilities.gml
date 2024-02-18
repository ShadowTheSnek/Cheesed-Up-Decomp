function scr_destroy_tiles(argument0, argument1, argument2) //gml_Script_scr_destroy_tiles
{
    if (argument2 == undefined)
        argument2 = 0
    var customlevel = instance_exists(obj_cyop_loader)
    if customlevel
        var lay_id = -1
    else
        lay_id = layer_get_id(argument1)
    if (lay_id != -1 || customlevel)
    {
        if customlevel
            var map_id = -1
        else
            map_id = layer_tilemap_get_id_fix(lay_id)
        var w = (abs(sprite_width) / argument0)
        var h = (abs(sprite_height) / argument0)
        var ix = sign(image_xscale)
        var iy = sign(image_yscale)
        if (ix < 0)
            w++
        for (var yy = (0 - argument2); yy < (h + argument2); yy++)
        {
            for (var xx = (0 - argument2); xx < (w + argument2); xx++)
                scr_destroy_tile((x + ((xx * argument0) * ix)), (y + ((yy * argument0) * iy)), map_id)
        }
    }
}

function scr_destroy_tile_arr(argument0, argument1, argument2) //gml_Script_scr_destroy_tile_arr
{
    if (argument2 == undefined)
        argument2 = 0
    customlevel = instance_exists(obj_cyop_loader)
    if customlevel
        scr_destroy_tiles(argument0, -1, 0)
    else
    {
        var i = 0
        var n = array_length(argument1)
        while (i < n)
        {
            scr_destroy_tiles(argument0, argument1[i], argument2)
            i++
        }
    }
}

function scr_destroy_tile(argument0, argument1, argument2) //gml_Script_scr_destroy_tile
{
    if (argument2 != -1)
    {
        var data = tilemap_get_at_pixel(argument2, argument0, argument1)
        data = tile_set_empty(data)
        tilemap_set_at_pixel(argument2, data, argument0, argument1)
    }
    else if instance_exists(obj_cyop_loader)
    {
        xx = (floor((argument0 / 32)) * 32)
        yy = (floor((argument1 / 32)) * 32)
        ds_list_add(global.cyop_broken_tiles, string("{0}_{1}", xx, yy))
        with (obj_cyop_tilelayer)
        {
            if (!secrettile)
            {
                with (tilelayer)
                {
                    var chunk = ds_map_find_value(chunks, string("{0}_{1}", floor((xx / 960)), floor((yy / 540))))
                    if (chunk != undefined)
                        chunk.dirty = 1
                }
            }
        }
    }
}

function scr_solid_line(argument0) //gml_Script_scr_solid_line
{
    if (collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4)
        return 1;
    if (collision_line(x, y, argument0.x, argument0.y, obj_slope, false, true) != -4)
        return 1;
    return 0;
}

function scr_destroy_nearby_tiles() //gml_Script_scr_destroy_nearby_tiles
{
    instance_destroy(instance_place((x + 1), y, obj_tiledestroy))
    instance_destroy(instance_place((x - 1), y, obj_tiledestroy))
    instance_destroy(instance_place(x, (y + 1), obj_tiledestroy))
    instance_destroy(instance_place(x, (y - 1), obj_tiledestroy))
}

function scr_cutoff() //gml_Script_scr_cutoff
{
    if global.performance
        return;
    if (!global.auto_cutoffs)
    {
        scr_cutoff_old()
        return;
    }
    if place_meeting(x, y, obj_nocutoff)
        return;
    var big = (sprite_width % 64) == 0
    var smallblock = [0, 0, 0, 0]
    with (instance_place(x, (y + 1), obj_destructibles))
    {
        if ((sprite_width % 64) != 0)
            smallblock[0] = 1
    }
    with (instance_place((x + 1), y, obj_destructibles))
    {
        if ((sprite_height % 64) != 0)
            smallblock[1] = 1
    }
    with (instance_place(x, (y - 1), obj_destructibles))
    {
        if ((sprite_width % 64) != 0)
            smallblock[2] = 1
    }
    with (instance_place((x - 1), y, obj_destructibles))
    {
        if ((sprite_height % 64) != 0)
            smallblock[3] = 1
    }
    if ((!(collision_point(bbox_left, bbox_bottom, obj_solid, 1, 1))) || (!(collision_point((bbox_right - 1), bbox_bottom, obj_solid, 1, 1))))
        smallblock[0] = 1
    if ((!(collision_point(bbox_right, bbox_top, obj_solid, 1, 1))) || (!(collision_point(bbox_right, (bbox_bottom - 1), obj_solid, 1, 1))))
        smallblock[1] = 1
    if ((!(collision_point(bbox_left, (bbox_top - 1), obj_solid, 1, 1))) || (!(collision_point((bbox_right - 1), (bbox_top - 1), obj_solid, 1, 1))))
        smallblock[2] = 1
    if ((!(collision_point((bbox_left - 1), bbox_top, obj_solid, 1, 1))) || (!(collision_point((bbox_left - 1), (bbox_bottom - 1), obj_solid, 1, 1))))
        smallblock[3] = 1
    with (obj_cutoffsystem)
    {
        var b = (big && (!smallblock[0]))
        var r = (b ? 64 : 32)
        for (i = 0; i < (other.sprite_width / r); i++)
            self.add_cutoff(((other.x + (32 * b)) + (r * i)), ((other.y + other.sprite_height) - 1), b, 0)
        b = (big && (!smallblock[1]))
        r = (b ? 64 : 32)
        for (i = 0; i < (other.sprite_height / r); i++)
            self.add_cutoff((other.x + other.sprite_width), (((other.y + other.sprite_height) - (32 * b)) - (r * i)), b, 90)
        b = (big && (!smallblock[2]))
        r = (b ? 64 : 32)
        for (i = 0; i < (other.sprite_width / r); i++)
            self.add_cutoff((((other.x + other.sprite_width) - (32 * b)) - (r * i)), (other.y + 1), b, 180)
        b = (big && (!smallblock[3]))
        r = (b ? 64 : 32)
        for (i = 0; i < (other.sprite_height / r); i++)
            self.add_cutoff(other.x, ((other.y + (32 * b)) + (r * i)), b, 270)
    }
}

function scr_cutoff_old() //gml_Script_scr_cutoff_old
{
    with (instance_place(x, y, obj_cutoff))
        instance_destroy()
    var dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    var list = ds_list_create()
    for (i = 0; i < array_length(dirs); i++)
    {
        var d = dirs[i]
        if (!(place_meeting((x + d[0]), (y + d[1]), obj_cutoff)))
        {
        }
        else
        {
            var num = instance_place_list((x + d[0]), (y + d[1]), obj_cutoff, list, 0)
            for (var j = 0; j < ds_list_size(list); j++)
            {
                b = ds_list_find_value(list, j)
                if ((!is_undefined(b)) && instance_exists(b))
                {
                    with (b)
                    {
                        if (!(place_meeting(x, y, obj_solid)))
                            instance_destroy()
                        else if (other.object_index == obj_tiledestroy || ((object_index != obj_cutoffsmall || other.object_index == obj_secretblock) && (object_index != obj_cutoff || other.object_index == obj_secretbigblock || other.object_index == obj_secretmetalblock)))
                        {
                            var a = scr_cutoff_get_angle(b)
                            var da = a
                            if (d[0] < 0)
                                da = 0
                            else if (d[0] > 0)
                                da = 180
                            else if (d[1] < 0)
                                da = 270
                            else if (d[1] > 0)
                                da = 90
                            if (a == da)
                                visible = true
                        }
                    }
                }
            }
            ds_list_clear(list)
        }
    }
    ds_list_clear(list)
    ds_list_destroy(list)
}

function scr_cutoff_get_angle(argument0) //gml_Script_scr_cutoff_get_angle
{
    a = (argument0.image_angle + 90)
    d = point_direction(0, 0, (lengthdir_x(1, a) * argument0.image_yscale), (lengthdir_y(1, a) * argument0.image_yscale))
    return d;
}

