function ref_get_name(argument0) //gml_Script_ref_get_name
{
    if (!is_handle(argument0))
        return "<undefined>";
    var type = array_get(string_split(string(argument0), " "), 1)
    switch type
    {
        case "object":
            return object_get_name(argument0);
        case "room":
            return room_get_name(argument0);
        case "shader":
            return shader_get_name(argument0);
        case "sprite":
            return sprite_get_name(argument0);
    }

}

