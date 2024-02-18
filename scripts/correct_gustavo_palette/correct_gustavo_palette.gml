function gustavo_palette(argument0) //gml_Script_gustavo_palette
{
    var char = obj_player1.character
    if obj_player1.isgustavo
        char = "G"
    var pal_new = (argument0 % sprite_get_width(spr_peppalette))
    if (argument0 == 0 && char != "P" && char != "SP" && char != "G")
        pal_new = 1
    if (argument0 != 12 && (pal_new == 2 || pal_new == 12 || pal_new == 13 || pal_new == 14))
        pal_new = 1
    if (char != "P" && char != "G")
        pal_new = 1
    return pal_new;
}

