function scr_combotitledraw(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_combotitledraw
{
    if (argument4 == undefined)
        argument4 = 0
    var very = 0
    if sugary
        var draw_frame = min(argument3, 24)
    else
    {
        draw_frame = ((argument3 * 2) + argument4)
        while (draw_frame >= sprite_get_number(argument0))
        {
            draw_frame -= sprite_get_number(argument0)
            very++
        }
    }
    if (!global.gameplay)
        very = min(very, 1)
    if (object_index == obj_combotitle && very > 3)
        return;
    draw_sprite_ext(argument0, draw_frame, argument1, argument2, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    if (sugary || very <= 0)
        return;
    var xx = (argument1 - 65)
    var yy = (argument2 - 6)
    repeat very
    {
        xx -= 10
        yy -= 6
    }
    repeat very
    {
        xx += 10
        yy += 6
        draw_sprite_ext(spr_combovery, 0, xx, yy, 1, 1, 0, c_white, image_alpha)
    }
}

