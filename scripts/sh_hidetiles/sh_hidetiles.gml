function sh_hidetiles(argument0) //gml_Script_sh_hidetiles
{
    if (array_length(argument0) < 2)
        global.hidetiles = (!global.hidetiles)
    else
    {
        if (argument0[1] == "true" || argument0[1] == "1")
            argument0[1] = 1
        else if (argument0[1] == "false" || argument0[1] == "0")
            argument0[1] = 0
        else
            return "Invalid bool";
        global.hidetiles = argument0[1]
    }
    var layers = layer_get_all()
    for (var i = 0; i < array_length(layers); i++)
    {
        var lay = layers[i]
        if (layer_tilemap_get_id_fix(lay) != -1)
            layer_set_visible(lay, (!global.hidetiles))
    }
    return string("Tile visibility {0}", (global.hidetiles ? "OFF" : "ON"));
}

function meta_hidetiles() //gml_Script_meta_hidetiles
{
    return 
    {
        description: "",
        var arguments: ["bool"]
    };
}

