message = "don't steal my code shithead"
function cyop_tilelayer(argument0, argument1, argument2, argument3, argument4) constructor //gml_Script_cyop_tilelayer
{
    function anon@260@cyop_tilelayer_cyop_tilelayer(argument0) //gml_Script_anon@260@cyop_tilelayer_cyop_tilelayer
    {
        function anon@348@anon@260_cyop_tilelayer_cyop_tilelayer(argument0, argument1) //gml_Script_anon@348@anon@260_cyop_tilelayer_cyop_tilelayer
        {
            var this = variable_struct_get(tilelayer, argument0)
            if (argument0 == "ID" || (!is_struct(this)))
                return;
            if (this.tileset == -4)
                return;
            else if is_string(this.tileset)
            {
                var pos = string_split(argument0, "_", 1, 1)
                this.x = (real(pos[0]) + x)
                this.y = (real(pos[1]) + y)
                if (frac((this.x / 32)) != 0 || frac((this.y / 32)) != 0)
                {
                    this.tileset = -4
                    return;
                }
                var sprite = ds_map_find_value(global.SPRITES, this.tileset)
                this.size = 32
                if (sprite == undefined)
                {
                    var custom = ds_map_find_value(global.custom_tiles, this.tileset)
                    if (custom != undefined)
                    {
                        this.tileset = custom[0]
                        this.size = custom[1]
                    }
                    else
                    {
                        this.tileset = -4
                        return;
                    }
                }
                else
                    this.tileset = sprite
                if ((this.coord[0] * this.size) >= sprite_get_width(this.tileset) || (this.coord[1] * this.size) >= sprite_get_height(this.tileset))
                {
                    this.tileset = -4
                    return;
                }
            }
            if secrettile
                array_push(tiles, this)
            var texture = sprite_get_texture(this.tileset, 0)
            var chunk_x = floor((this.x / 960))
            var chunk_y = floor((this.y / 540))
            var chunk_name = concat(chunk_x, "_", chunk_y)
            var chunk = ds_map_find_value(chunks, chunk_name)
            if (chunk == undefined)
            {
                chunk = new Chunk((chunk_x * 960), (chunk_y * 540))
                ds_map_set(chunks, chunk_name, chunk)
                array_push(chunk_array, chunk_name)
            }
            var tilemap = ds_map_find_value(chunk.tilemaps, texture)
            if (tilemap == undefined)
            {
                tilemap = new Tilemap(texture)
                ds_map_set(chunk.tilemaps, texture, tilemap)
                array_push(chunk.tilemap_array, texture)
            }
            array_push(tilemap.tiles, this)
        }

        var tiles = variable_struct_get_names(argument0)
        array_foreach(tiles, f, 0, infinity)
    }

    function anon@2547@cyop_tilelayer_cyop_tilelayer(argument0) //gml_Script_anon@2547@cyop_tilelayer_cyop_tilelayer
    {
        var i = 0
        var n = array_length(argument0.tilemap_array)
        while (i < n)
        {
            tilemap = ds_map_find_value(argument0.tilemaps, argument0.tilemap_array[i])
            if (tilemap.vertex_buffer != -4)
                vertex_delete_buffer(tilemap.vertex_buffer)
            tilemap.vertex_buffer = vertex_create_buffer()
            texture = tilemap.texture
            var buffer = tilemap.vertex_buffer
            vertex_begin(buffer, vertex_format)
            f = method(
            {
                tex_w: texture_get_texel_width(texture),
                tex_h: texture_get_texel_height(texture),
                buffer: buffer,
                depth: depth
            }
, function(argument0, argument1) //gml_Script_anon@3214@anon@2547_cyop_tilelayer_cyop_tilelayer
            {
                if (ds_list_find_index(global.cyop_broken_tiles, string("{0}_{1}", argument0.x, argument0.y)) > -1)
                    return;
                var uvs = sprite_get_uvs(argument0.tileset, 0)
                var uv_left = uvs[0]
                var uv_top = uvs[1]
                var tile_trim_x = uvs[4]
                var tile_trim_y = uvs[5]
                var tile_tex_size_x = (argument0.size * tex_w)
                var tile_tex_size_y = (argument0.size * tex_h)
                var tile_tex_pos_x = (((argument0.coord[0] - (tile_trim_x / argument0.size)) * tile_tex_size_x) + uv_left)
                var tile_tex_pos_y = (((argument0.coord[1] - (tile_trim_y / argument0.size)) * tile_tex_size_y) + uv_top)
                vertex_build_quad3D(buffer, argument0.x, argument0.y, depth, 32, 32, 16777215, 1, tile_tex_pos_x, tile_tex_pos_y, tile_tex_size_x, tile_tex_size_y)
            }
)
            array_foreach(tilemap.tiles, f, 0, infinity)
            vertex_end(buffer)
            i++
        }
    }

    function anon@4291@cyop_tilelayer_cyop_tilelayer() //gml_Script_anon@4291@cyop_tilelayer_cyop_tilelayer
    {
        function anon@4317@anon@4291_cyop_tilelayer_cyop_tilelayer(argument0, argument1) //gml_Script_anon@4317@anon@4291_cyop_tilelayer_cyop_tilelayer
        {
            chunk = ds_map_find_value(chunks, argument0)
            if (!(rectangle_in_rectangle(chunk.x, chunk.y, (chunk.x + 960), (chunk.y + 540), camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))))
                return;
            if chunk.dirty
            {
                self.Build_Chunk(chunk)
                chunk.dirty = 0
            }
            chunk.chunk.Draw()
        }

        array_foreach(chunk_array, f, 0, infinity)
    }

    function anon@4674@cyop_tilelayer_cyop_tilelayer() //gml_Script_anon@4674@cyop_tilelayer_cyop_tilelayer
    {
        function anon@4700@anon@4674_cyop_tilelayer_cyop_tilelayer(argument0, argument1) //gml_Script_anon@4700@anon@4674_cyop_tilelayer_cyop_tilelayer
        {
            ds_map_find_value(chunks, argument0).ds_map_find_value(chunks, argument0).Dispose()
        }

        array_foreach(chunk_array, f, 0, infinity)
        ds_map_destroy(chunks)
        vertex_format_delete(vertex_format)
    }

    function anon@4901@cyop_tilelayer_cyop_tilelayer(argument0) constructor //gml_Script_anon@4901@cyop_tilelayer_cyop_tilelayer
    {
        texture = argument0
        vertex_buffer = -4
        tiles = []
        function anon@5021@anon@4901_cyop_tilelayer_cyop_tilelayer() //gml_Script_anon@5021@anon@4901_cyop_tilelayer_cyop_tilelayer
        {
            if (vertex_buffer != -4)
                vertex_delete_buffer(vertex_buffer)
        }

    }

    function anon@5128@cyop_tilelayer_cyop_tilelayer(argument0, argument1) constructor //gml_Script_anon@5128@cyop_tilelayer_cyop_tilelayer
    {
        tilemaps = ds_map_create()
        tilemap_array = []
        dirty = 1
        x = argument0
        y = argument1
        function anon@5277@anon@5128_cyop_tilelayer_cyop_tilelayer() //gml_Script_anon@5277@anon@5128_cyop_tilelayer_cyop_tilelayer
        {
            function anon@5305@anon@5277_anon@5128_cyop_tilelayer_cyop_tilelayer(argument0, argument1) //gml_Script_anon@5305@anon@5277_anon@5128_cyop_tilelayer_cyop_tilelayer
            {
                vertex_submit(ds_map_find_value(tilemaps, argument0).vertex_buffer, 4, ds_map_find_value(tilemaps, argument0).texture)
            }

            array_foreach(tilemap_array, f, 0, infinity)
        }

        function anon@5503@anon@5128_cyop_tilelayer_cyop_tilelayer() //gml_Script_anon@5503@anon@5128_cyop_tilelayer_cyop_tilelayer
        {
            function anon@5531@anon@5503_anon@5128_cyop_tilelayer_cyop_tilelayer(argument0, argument1) //gml_Script_anon@5531@anon@5503_anon@5128_cyop_tilelayer_cyop_tilelayer
            {
                ds_map_find_value(tilemaps, argument0).ds_map_find_value(tilemaps, argument0).Dispose()
            }

            array_foreach(tilemap_array, f, 0, infinity)
            ds_map_destroy(tilemaps)
        }

    }

    chunks = ds_map_create()
    chunk_array = []
    vertex_format = cyop_tilemap_create_vertex_format()
    tiles = []
    x = argument0
    y = argument1
    tilelayer = argument2
    depth = argument3
    secrettile = argument4
    self.Prepare(tilelayer)
}

