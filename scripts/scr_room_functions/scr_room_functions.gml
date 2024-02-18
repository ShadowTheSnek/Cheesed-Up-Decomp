function room_get_tile_layers() //gml_Script_room_get_tile_layers
{
    with (obj_persistent)
    {
        if (!array_length(room_tiles))
            event_user(0)
        return room_tiles;
    }
}

function room_get_bg_layers() //gml_Script_room_get_bg_layers
{
    with (obj_persistent)
    {
        if (!array_length(room_bgs))
            event_user(0)
        room_tiles = room_bgs
        return room_tiles;
    }
}

function layer_create_fix(argument0, argument1) //gml_Script_layer_create_fix
{
    if (argument1 == undefined)
        argument1 = ""
    var lid = layer_create(argument0, argument1)
    with (obj_persistent)
    {
        if (argument1 != "" && lid != -1)
            ds_map_add(dynamic_layers, string(lid), argument1)
    }
    return lid;
}

function layer_get_name_fix(argument0) //gml_Script_layer_get_name_fix
{
    var name = layer_get_name(argument0)
    with (obj_persistent)
    {
        if (name == "")
        {
            name = ds_map_find_value(dynamic_layers, string(argument0))
            if (name == undefined)
            {
                room_tiles = ""
                return room_tiles;
            }
        }
    }
    return name;
}

function layer_tilemap_create_fix(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_layer_tilemap_create_fix
{
    lid = layer_tilemap_create(argument0, argument1, argument2, argument3, argument4, argument5)
    with (obj_persistent)
    {
        if (lid != -1)
            ds_map_add(dynamic_layers, concat("tm-", string(argument0)), lid)
    }
    return lid;
}

function layer_background_create_fix(argument0, argument1) //gml_Script_layer_background_create_fix
{
    lid = layer_background_create(argument0, argument1)
    with (obj_persistent)
    {
        if (lid != -1)
            ds_map_add(dynamic_layers, concat("bg-", string(argument0)), lid)
    }
    return lid;
}

function layer_tilemap_get_id_fix(argument0) //gml_Script_layer_tilemap_get_id_fix
{
    lid = layer_tilemap_get_id(argument0)
    with (obj_persistent)
    {
        if (lid == -1)
        {
            lid = ds_map_find_value(dynamic_layers, concat("tm-", string(argument0)))
            if (lid == undefined)
            {
                room_tiles = -1
                return room_tiles;
            }
        }
    }
    return lid;
}

function layer_background_get_id_fix(argument0) //gml_Script_layer_background_get_id_fix
{
    lid = layer_background_get_id(argument0)
    with (obj_persistent)
    {
        if (lid == -1)
        {
            lid = ds_map_find_value(dynamic_layers, concat("bg-", string(argument0)))
            if (lid == undefined)
            {
                room_tiles = -1
                return room_tiles;
            }
        }
    }
    return lid;
}

