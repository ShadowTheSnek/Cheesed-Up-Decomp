if ((obj_drawcontroller.use_dark && global.SUGARY) || global.performance)
    return;
function anon@84@gml_Object_obj_cutoffsystem_Draw_0(argument0, argument1) //gml_Script_anon@84@gml_Object_obj_cutoffsystem_Draw_0
{
    x = argument0.x
    y = argument0.y
    sprite_index = (argument0.big ? spr_64x64cutoff : spr_32x32cutoff)
    image_index = argument0.img
    image_angle = argument0.angle
    if (argument0.buffer > 0)
        argument0.buffer = (argument0.buffer - 1)
    var sold = check_solid(x, y)
    if (sold && (sold.object_index == obj_solid || sold.object_index == obj_secretblock || sold.object_index == obj_secretbigblock || sold.object_index == obj_secretblock2 || sold.object_index == obj_secretbigblock2))
    {
        if (image_angle == 0)
            y++
        else if (image_angle == 180)
            y--
        draw_self()
    }
}

array_foreach(cutoffs, f, 0, infinity)
