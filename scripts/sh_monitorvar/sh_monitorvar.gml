function sh_monitorvar(argument0) //gml_Script_sh_monitorvar
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return "Missing argument: instance";
    if (argument0[1] == "global")
        var inst = @@Global@@()
    else if (argument0[1] == "all")
        return "You can't monitor all objects";
    else
    {
        inst = self.WCscr_findobj(argument0[1])
        if (object_exists(inst[0]) && (!inst[1]))
            return string("Must specify instance index. Example: {0}:0", object_get_name(inst[0]));
        if (!instance_exists(inst[0]))
            return string("The instance of {0} does not exist", argument0[1]);
        inst = inst[0]
    }
    if (array_length(argument0) < 3)
        return "Missing argument: variable";
    var variables = []
    for (var i = 2; i < array_length(argument0); i++)
    {
        if variable_instance_exists(inst, argument0[i])
            array_push(variables, argument0[i])
        else
            return string("{0}.{1} doesn't exist", argument0[1], argument0[i]);
    }
    var title = string("Monitoring {0}", argument0[1])
    draw_set_font(consoleFont)
    var w = (string_width(title) + 12)
    with (new WCwin(title, function() //gml_Script_anon@1024@sh_monitorvar_sh_monitorvar
    {
        if (_inst != @@Global@@() && (!instance_exists(_inst)))
            var txt = "(The instance was deleted)"
        else
        {
            txt = ""
            for (i = 0; i < array_length(_var); i++)
            {
                if (i != 0)
                    txt += "\n"
                txt += string("{0} : {1}", _var[i], variable_instance_get(_inst, _var[i]))
            }
        }
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_text((win_width / 2), (win_height / 2), txt)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    }
))
    {
        _inst = inst
        _var = variables
        self.setSize(w, undefined)
    }
}

function meta_monitorvar() //gml_Script_meta_monitorvar
{
    return 
    {
        description: "monitor an instance's variable or a global variable in a pop-up window",
        var arguments: ["instance", "variables"],
        suggestions: [function() //gml_Script_anon@1799@___struct___211_meta_monitorvar_sh_monitorvar
        {
            var obj_array = []
            for (i = 0; i < instance_count; i++)
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
                            array_push(obj_array, string("{0}:{1}", object_get_name(obj), j))
                    }
                }
            }
            array_sort(obj_array, 1)
            array_insert(obj_array, 0, "global")
            return obj_array;
        }, function() //gml_Script_anon@2318@___struct___211_meta_monitorvar_sh_monitorvar
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
        }],
        argumentDescriptions: ["either just \"global\" or the instance to check", "the variable name to be checked, can be more than just one"]
    };
}

