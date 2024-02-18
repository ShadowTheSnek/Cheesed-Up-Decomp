function sh_debughud(argument0) //gml_Script_sh_debughud
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    var inst = undefined
    if (array_length(argument0) > 1)
    {
        if (argument0[1] == "global")
            inst = @@Global@@()
        else if (argument0[1] == "all")
            return "You can't debug all objects at once. Yeah I know, bummer, right?";
        else
        {
            inst = self.WCscr_findobj(argument0[1])
            if (object_exists(inst[0]) && (!inst[1]))
                return string("Must specify instance index. Example: {0}:0", object_get_name(inst[0]));
            if (!instance_exists(inst[0]))
                return string("The instance of {0} does not exist", argument0[1]);
            inst = inst[0]
        }
    }
    if is_undefined(inst)
    {
        if ((!isOpen) && keyboard_check(vk_control))
            WC_select_mode = (1 << 0)
        else if ((!isOpen) && keyboard_check(vk_shift))
        {
            WC_debugview = 1
            WC_debugview_target = @@Global@@()
            WC_debugview_scroll = 0
        }
        else
            WC_debugview = (!WC_debugview)
    }
    else
    {
        WC_debugview = 1
        WC_debugview_target = inst
        WC_debugview_scroll = 0
    }
}

function meta_debughud() //gml_Script_meta_debughud
{
    return 
    {
        description: "toggle debug view. while it's on press PAGE UP or PAGE DOWN to scroll the variable list",
        var arguments: ["<instance>"],
        suggestions: [function() //gml_Script_anon@1228@___struct___196_meta_debughud_sh_debughud
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
        }],
        argumentDescriptions: ["either just \"global\" or the instance to check"]
    };
}

