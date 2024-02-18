function scr_draw_lap_display(argument0, argument1, argument2, argument3) //gml_Script_scr_draw_lap_display
{
    if (argument3 == undefined)
        argument3 = 0
    var posx = (argument0 - 72)
    var posy = (argument1 - 18)
    draw_sprite((argument3 ? spr_lapflag_ss : spr_lapflag), argument2, posx, posy)
    draw_set_colour(c_white)
    draw_set_align(1, 1)
    draw_set_font((argument3 ? global.lapfont_ss : global.lapfont))
    draw_text(((posx + 34) - string_length(string((global.laps + 1)))), (posy + 30), string((global.laps + 1)))
    draw_set_align()
}

