bossspr = spr_vsnoise
boss_hp = 16
vstitle = spr_vstitle_noise
boss_hpsprite = spr_bossfight_noiseHP
boss_palette = spr_bossfight_noisepalette
if (check_char("N") && obj_player1.paletteselect != 20)
{
    bossspr = spr_vsdoise
    vstitle = spr_vstitle_doise
}
function anon@294@gml_RoomCC_boss_noise_1_Create() //gml_Script_anon@294@gml_RoomCC_boss_noise_1_Create
{
    var eh = 0
    var p = 0
    with (obj_noiseboss)
    {
        eh = elitehit
        p = phase
        if (((p == 1 && state == states.fightball) || instance_exists(obj_noiseballooncrash)) && phase == 1)
            eh = 0
    }
    if (p == 1)
        boss_hp = eh
    else if (p == 2)
        boss_hp = eh
    else if (p == 0)
        boss_hp = 0
}

