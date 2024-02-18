bossspr = spr_vsvigilante
boss_hp = 20
vstitle = spr_vstitle_vigilante
boss_columnmax = 3
boss_rowmax = 3
boss_hp_x += 25
boss_hpsprite = spr_bossfight_vigiHP
boss_palette = spr_bossfight_vigipalette
if (check_char("V") && obj_player1.paletteselect != 17)
{
    bossspr = spr_vssnotty
    vstitle = spr_vstitle_snotty
}
function anon@360@gml_RoomCC_boss_vigilante_1_Create() //gml_Script_anon@360@gml_RoomCC_boss_vigilante_1_Create
{
    var eh = 0
    var p = -1
    with (obj_vigilanteboss)
    {
        eh = elitehit
        p = phase
    }
    if (p == 1)
        boss_hp = eh
    else if (p == 2)
        boss_hp = eh
    else if (p == -1)
        boss_hp = 0
}

