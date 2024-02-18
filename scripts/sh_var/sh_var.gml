function sh_var(argument0) //gml_Script_sh_var
{
    if (instance_exists(obj_disclaimer) || room == Initroom || 0)
        return "No.";
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 3)
        return "Not enough arguments. Usage: var <instance(:index) or global> <variable> <value>";
    var pretarget = argument0[1]
    var variable = argument0[2]
    var value = self.WCscr_allargs(argument0, 3)
    var target_one = 0
    var target = noone
    if (pretarget == "global")
    {
        target_one = 1
        target = @@Global@@()
    }
    else
    {
        var obj = self.WCscr_findobj(pretarget)
        if is_array(obj)
        {
            target = obj[0]
            target_one = obj[1]
        }
        else
            return obj;
    }
    if (target == noone)
        return string("Instance {0} doesn't exist", pretarget);
    var arrind = -1
    if (string_pos("[", variable) > 0)
    {
        arrind = []
        var arraydet = 0
        var arrind_find = ""
        var nonarrayvar = variable
        for (var i = 1; i <= string_length(variable); i++)
        {
            var charat = string_char_at(variable, i)
            if (arraydet == 0 || arraydet == 2)
            {
                if (charat == "[")
                {
                    if (arraydet == 0)
                        nonarrayvar = string_copy(variable, 1, (i - 1))
                    arrind_find = ""
                    arraydet = 1
                }
                else
                {
                    if (arraydet == 2)
                        return string("Malformed array index for \"{0}\"", variable);
                    if (arraydet == 1)
                    {
                        if (charat == "]")
                        {
                            arraydet = 2
                            if (string_digits(arrind_find) == arrind_find)
                                array_push(arrind, real(arrind_find))
                            else
                                return string("The given array index for \"{0}\" is not a valid number", variable);
                        }
                        else
                            arrind_find += charat
                    }
                }
            }
            else if (arraydet == 1)
            {
                if (charat == "]")
                {
                    arraydet = 2
                    if (string_digits(arrind_find) == arrind_find)
                        array_push(arrind, real(arrind_find))
                    else
                        return string("The given array index for \"{0}\" is not a valid number", variable);
                }
                else
                    arrind_find += charat
            }
        }
        if (array_length(arrind) == 0)
            arrind = -1
        else
            variable = nonarrayvar
    }
    var var_exists = 0
    if (variable_instance_exists(target, variable) || (target == @@Global@@() && variable_global_exists(variable)) || target == all)
        var_exists = 1
    if (array_length(argument0) < 4 || argument0[3] == "")
    {
        if (var_exists && target_one)
            return string("{0}.{1}: {2}", pretarget, variable, variable_instance_get(target, variable));
        else
            return "Must provide a value";
    }
    function anon@2588@sh_var_sh_var(argument0, argument1, argument2, argument3) //gml_Script_anon@2588@sh_var_sh_var
    {
        if (argument3 == undefined)
            argument3 = -1
        argument2 = self.WCscr_getvalue(argument2)
        var ret = argument2
        if (argument3 != -1)
        {
            if (argument1 == "alarm" && argument0 != @@Global@@() && is_real(argument2))
            {
                with (argument0)
                    alarm[argument3[0]] = argument2
                return argument2;
            }
            var arr = variable_instance_get(argument0, argument1)
            if (array_length(argument3) == 2)
                arr[argument3[0]][argument3[1]] = argument2
            else if (array_length(argument3) == 3)
                arr[argument3[0]][argument3[1]][argument3[2]] = argument2
            else
                arr[argument3[0]] = argument2
            argument2 = arr
        }
        variable_instance_set(argument0, argument1, argument2)
        for (i = 0; i < ds_list_size(WC_frozen); i++)
        {
            var frozen = ds_list_find_value(WC_frozen, i)
            if (argument0 == @@Global@@())
            {
                if (frozen[0] == @@Global@@() && frozen[1] == argument1)
                    array_set(ds_list_find_value(WC_frozen, i), 2, argument2)
            }
            else if (instance_exists(argument0) && instance_exists(frozen[0]))
            {
                if (frozen[0].id == argument0.id && frozen[1] == argument1)
                    array_set(ds_list_find_value(WC_frozen, i), 2, argument2)
            }
        }
        return ret;
    }

    var setval = value
    if target_one
        setval = self.setvar(target, variable, value, arrind)
    else
    {
        with (target)
        {
            with (other)
                setval = self.setvar(other, variable, value, arrind)
        }
    }
    if is_string(setval)
        setval = string("string \"{0}\"", setval)
    if (arrind != -1)
    {
        variable = string(variable)
        for (i = 0; i < array_length(arrind); i++)
            variable += string("[{0}]", arrind[i])
    }
    if (target != @@Global@@())
    {
        obj = concat((target_one ? "object " : "objects "), pretarget)
        if (target == -3)
            obj = "all objects"
        return concat((var_exists ? "Set " : "Set new variable "), variable, " to ", setval, " in ", obj);
    }
    else
        return concat((var_exists ? "Set " : "Set new global variable "), "global.", variable, " to ", setval);
}

function meta_var() //gml_Script_meta_var
{
    return 
    {
        description: "set a global or an instance's variable",
        var arguments: ["instance", "variable", "value"],
        suggestions: [function() //gml_Script_anon@4612@___struct___257_meta_var_sh_var
        {
            var obj_array = []
            for (i = 0; i < instance_count; i++)
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
                            array_push(obj_array, string("{0}:{1}", object_get_name(obj), j))
                    }
                }
            }
            array_sort(obj_array, 1)
            array_insert(obj_array, 0, "all")
            array_insert(obj_array, 0, "global")
            return obj_array;
        }, function() //gml_Script_anon@5171@___struct___257_meta_var_sh_var
        {
            with (obj_shell)
            {
                if (!WC_debug)
                    return [];
                pretarget = inputArray[1]
                target = -4
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
        argumentDescriptions: ["either \"global\" or an instance", "the name of the variable that has to be set", "the value you want to set the variable to. if you want to force it to be a string, put apostrophes (') around it"]
    };
}

