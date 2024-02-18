function instance_deactivate_all_hook(argument0) //gml_Script_instance_deactivate_all_hook
{
    instance_deactivate_all(argument0)
    instance_activate_object(obj_gmlive)
}

function instance_deactivate_layer_hook(argument0) //gml_Script_instance_deactivate_layer_hook
{
    instance_deactivate_layer(argument0)
    instance_activate_object(obj_gmlive)
}

function instance_deactivate_object_hook(argument0) //gml_Script_instance_deactivate_object_hook
{
    instance_deactivate_object(argument0)
    instance_activate_object(obj_gmlive)
}

function instance_deactivate_region_hook(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_instance_deactivate_region_hook
{
    instance_deactivate_region(argument0, argument1, argument2, argument3, argument4, argument5)
    instance_activate_object(obj_gmlive)
}

