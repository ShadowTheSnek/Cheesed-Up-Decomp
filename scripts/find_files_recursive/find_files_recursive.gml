function find_files_recursive(argument0, argument1, argument2) //gml_Script_find_files_recursive
{
    if (argument2 == undefined)
        argument2 = ""
    if 1
    {
    }
    else
        function anon@82@find_files_recursive_find_files_recursive(argument0, argument1, argument2, argument3) //gml_Script_anon@82@find_files_recursive_find_files_recursive
        {
            if (argument1 == undefined)
                argument1 = ""
            if (argument2 == undefined)
                argument2 = ""
            if (argument3 == undefined)
                argument3 = -4
            if directory_exists(argument0)
            {
                if ((!(string_ends_with(argument0, "/"))) || (!(string_ends_with(argument0, "\\"))))
                    argument0 += "\\"
                var recursion = []
                var file = file_find_first(concat(argument0, "*"), 16)
                while (file != "")
                {
                    var filepath = concat(argument0, file)
                    if directory_exists(filepath)
                    {
                        array_push(recursion, file)
                        file = file_find_next()
                        continue
                    }
                    else if (argument2 == "" || string_ends_with(file, argument2))
                    {
                        if (is_callable(argument3) && self.argument3(filepath))
                        {
                            recursion = []
                            break
                        }
                        else
                        {
                            file = file_find_next()
                            continue
                        }
                    }
                    else
                    {
                        file = file_find_next()
                        continue
                    }
                }
                file_find_close()
                while (array_length(recursion) > 0)
                {
                    var bwah = array_pop(recursion)
                    concat(argument0, "\\", bwah).concat(argument0, "\\", bwah).recursive_func(concat(bwah, "\\"), argument2, argument3, static_get(gml_Script_find_files_recursive))
                }
                return 1;
            }
            return 0;
        }

    return self.recursive_func(argument0, "", argument2, argument1);
}

