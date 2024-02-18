function in_saveroom(argument0, argument1) //gml_Script_in_saveroom
{
    if (argument0 == undefined)
        argument0 = id
    if (argument1 == undefined)
        argument1 = global.saveroom
    if ((!is_string(argument0)) && variable_instance_exists(argument0, "ID"))
        argument0 = argument0.ID
    return ds_list_find_index(argument1, argument0) > -1;
}

function add_saveroom(argument0, argument1) //gml_Script_add_saveroom
{
    if (argument0 == undefined)
        argument0 = id
    if (argument1 == undefined)
        argument1 = global.saveroom
    if ((!is_string(argument0)) && variable_instance_exists(argument0, "ID"))
        argument0 = argument0.ID
    ds_list_add(argument1, argument0)
}

function in_baddieroom(argument0) //gml_Script_in_baddieroom
{
    if (argument0 == undefined)
        argument0 = id
    return in_saveroom(argument0, global.baddieroom);
}

function add_baddieroom(argument0) //gml_Script_add_baddieroom
{
    if (argument0 == undefined)
        argument0 = id
    add_saveroom(argument0, global.baddieroom)
}

