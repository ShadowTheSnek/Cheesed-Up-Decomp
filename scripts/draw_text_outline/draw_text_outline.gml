function draw_text_outline(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_draw_text_outline
{
    if (argument3 == undefined)
        argument3 = c_black
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = 1
    var resetcolor = draw_get_colour()
    draw_set_color(argument3)
    if (argument4 == 1 && argument5 == 0)
    {
        draw_text((argument0 - argument6), (argument1 - argument6), argument2)
        draw_text((argument0 - argument6), (argument1 + argument6), argument2)
        draw_text((argument0 + argument6), (argument1 + argument6), argument2)
        draw_text((argument0 + argument6), (argument1 - argument6), argument2)
        draw_set_color(resetcolor)
        draw_text(argument0, argument1, argument2)
    }
    else
    {
        draw_text_transformed((argument0 - argument6), (argument1 - argument6), argument2, argument4, argument4, argument5)
        draw_text_transformed((argument0 - argument6), (argument1 + argument6), argument2, argument4, argument4, argument5)
        draw_text_transformed((argument0 + argument6), (argument1 + argument6), argument2, argument4, argument4, argument5)
        draw_text_transformed((argument0 + argument6), (argument1 - argument6), argument2, argument4, argument4, argument5)
        draw_set_color(resetcolor)
        draw_text_transformed(argument0, argument1, argument2, argument4, argument4, argument5)
    }
}

