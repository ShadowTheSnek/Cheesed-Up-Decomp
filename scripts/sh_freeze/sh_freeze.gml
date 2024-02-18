function sh_freeze(argument0) //gml_Script_sh_freeze
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return "Missing argument: instance";
    if (argument0[1] == "global")
        var inst = @@Global@@()
    else
    {
        inst = self.WCscr_findobj(argument0[1])
        if (!instance_exists(inst[0]))
            return string("The instance of {0} does not exist", argument0[1]);
        inst = inst[0]
        if array_contains(asset_get_tags(inst.object_index, 0), "protected")
            return "Can't modify protected object";
    }
    if (array_length(argument0) < 3)
        return "Missing argument: variable";
    var variable = argument0[2]
    if variable_instance_exists(inst, variable)
    {
        var res = 0
        if (inst == @@Global@@())
            res = self.WCscr_freezevar(@@Global@@(), variable)
        else
        {
            with (inst)
                res = self.self.WCscr_freezevar(variable, other)
        }
        return string("{0} {1}.{2}", (res ? "Frozen" : "Unfrozen"), argument0[1], argument0[2]);
    }
    else
        return (((argument0[1] + ".") + argument0[2]) + " doesn't exist");
}

function meta_freeze() //gml_Script_meta_freeze
{
    return 
    {
        description: "freeze an instance's variable or a global variable",
        var arguments: ["instance", "variable"],
        suggestions: [function() //gml_Script_anon@1122@___struct___208_meta_freeze_sh_freeze
        {
            var obj_array = []
            for (var i = 0; i < instance_count; i++)
            {
                inst = instance_find(all, i)
                if (!instance_exists(inst))
                {
                }
                else
                {
                    var obj = inst.object_index
                    for (var j = 0; j < instance_number(obj); j++)
                    {
                        if (instance_find(obj, j).id == inst.id)
                            array_push(obj_array, concat(object_get_name(obj), ":", j))
                    }
                }
            }
            array_sort(obj_array, 1)
            array_insert(obj_array, 0, "global")
            return obj_array;
        }, function() //gml_Script_anon@1648@___struct___208_meta_freeze_sh_freeze
        {
            with (obj_shell)
            {
                if (!WC_debug)
                    return [];
                var pretarget = inputArray[1]
                var target = -4
                if (pretarget == "global")
                    target = @@Global@@()
                else
                {
                    obj = self.WCscr_findobj(pretarget)
                    if is_array(obj)
                        target = obj[0]
                }
                if (target != -4 && target != -3)
                    return variable_instance_get_names(target);
            }
        }, []],
        argumentDescriptions: ["either just \"global\" or an instance", "the name of the variable to be frozen"]
    };
}

