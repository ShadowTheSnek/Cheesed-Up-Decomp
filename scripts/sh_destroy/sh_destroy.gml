function sh_destroy(argument0) //gml_Script_sh_destroy
{
    if (instance_exists(obj_disclaimer) || room == Initroom)
        return "No";
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return "Not enough arguments. Usage: var <instance(:index)> (<execute_event>)";
    var pretarget = argument0[1]
    var exec = true
    if (array_length(argument0) > 2)
        exec = argument0[2]
    if (exec == "1" || exec == "true")
        exec = true
    else if (exec == "0" || exec == "false")
        exec = false
    var target_one = 0
    var target = noone
    var obj = self.WCscr_findobj(pretarget)
    if is_array(obj)
    {
        target = obj[0]
        target_one = obj[1]
    }
    else
        return obj;
    if (target == noone)
        return string("Instance {0} doesn't exist", pretarget);
    if (target == all)
        return "Not a good idea";
    if (instance_exists(target) && array_contains(asset_get_tags(target.object_index, 0), "protected"))
        return "Can't destroy protected object";
    with (target)
        instance_destroy(target, exec)
    obj = ((target_one ? "object " : "all instances of object ") + string(pretarget))
    return string("Destroyed {0}", obj);
}

function meta_destroy() //gml_Script_meta_destroy
{
    return 
    {
        description: "destroy an instance or all instances of an object",
        var arguments: ["instance", "<execute_event>"],
        suggestions: [function() //gml_Script_anon@1454@___struct___246_meta_destroy_sh_destroy
        {
            var obj_array = []
            for (var i = 0; i < instance_count; i++)
            {
                var inst = instance_find(all, i)
                if (!instance_exists(inst))
                {
                }
                else
                {
                    obj = inst.object_index
                    for (var j = 0; j < instance_number(obj); j++)
                    {
                        if (instance_find(obj, j).id == inst.id)
                            array_push(obj_array, concat(object_get_name(obj), ":", j))
                    }
                }
            }
            array_sort(obj_array, 1)
            return obj_array;
        }, ["false", "true"]],
        argumentDescriptions: ["instance or object", "whether to execute the destroy events or not"]
    };
}

