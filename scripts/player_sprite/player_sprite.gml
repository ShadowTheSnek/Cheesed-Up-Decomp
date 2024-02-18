function player_sprite(argument0) //gml_Script_player_sprite
{
    if (argument0 == undefined)
        argument0 = obj_player1
    if check_skin((0 << 0), argument0.character, argument0.paletteselect)
        return spr_player_petah;
    if check_skin((1 << 0), argument0.character, argument0.paletteselect)
        return spr_playerN_chungus;
    return argument0.sprite_index;
}

