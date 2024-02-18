depth = 4
image_speed = 0.35
logicMap = ds_map_create()
function anon@293@gml_Object_obj_sucrosegate_Create_0(argument0) //gml_Script_anon@293@gml_Object_obj_sucrosegate_Create_0
{
    if (argument0 == undefined)
        argument0 = obj_player
    return currentState == (1 << 0);
}

if (!reversed)
{
    currentState = (1 << 0)
    nextState = (1 << 0)
    queuedEvent = (0 << 0)
}
else
{
    currentState = (0 << 0)
    nextState = (0 << 0)
    queuedEvent = (0 << 0)
    sprite_index = spr_sucrosegateRaised
}
image_angle = (round((image_angle / 90)) * 90)
