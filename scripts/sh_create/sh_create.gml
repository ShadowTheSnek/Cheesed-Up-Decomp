function sh_create(argument0) //gml_Script_sh_create
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return "Missing argument: object";
    var object = argument0[1]
    if string_is_number(object)
    {
        object = real(object)
        if (!object_exists(object))
            return string("Object with index {0} doesn't exist", object);
    }
    else if (asset_get_type(object) == 0)
        object = asset_get_index(object)
    else
        return string("Object with name {0} doesn't exist", object);
    if array_contains(asset_get_tags(object, 0), "hidden")
        return string("Object with index {0} doesn't exist", object);
    if array_contains(asset_get_tags(object, 0), "protected")
        return "Can't create protected object";
    var xx = undefined
    var yy = undefined
    if (array_length(argument0) >= 3 && argument0[2] != "")
    {
        if (array_length(argument0) < 4 || argument0[3] == "")
            return "Missing argument: y";
        xx = argument0[2]
        yy = argument0[3]
        if string_is_number(xx)
            xx = real(xx)
        else
            return "\"x\" parameter must be a number";
        if string_is_number(yy)
            yy = real(yy)
        else
            return "\"y\" parameter must be a number";
        gml_Script_instance_create(xx, yy, object)
        return ((((("Created " + argument0[1]) + " at x") + argument0[2]) + " y") + argument0[3]);
    }
    else
    {
        isOpen = 0
        WC_select_mode = (0 << 0)
        WC_select_inst = object
    }
}

function meta_create() //gml_Script_meta_create
{
    return 
    {
        description: "creates an object",
        var arguments: ["object", "<x>", "<y>"],
        suggestions: [function() //gml_Script_anon@1540@___struct___204_meta_create_sh_create
        {
            var obj_array = []
            var tags = tag_get_asset_ids("hidden", 0)
            var i = 0
            while object_exists(i)
            {
                var name = object_get_name(i)
                if ((!(array_contains(tags, i))) && (!(string_starts_with(name, "__YY"))))
                    array_push(obj_array, name)
                i++
            }
            array_sort(obj_array, 1)
            return obj_array;
        }, [(0 << 0)], [(1 << 0)]],
        argumentDescriptions: ["name of the object to spawn", "optional x position to place the object in", "optional y position to place the object in"]
    };
}

