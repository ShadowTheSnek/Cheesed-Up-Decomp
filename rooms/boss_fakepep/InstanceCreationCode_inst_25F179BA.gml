var _first = 1
ini_open_from_string(obj_savesystem.ini_str)
if ini_read_real("Game", "fakepepportrait", 0)
    _first = 0
ini_write_real("Game", "fakepepportrait", 1)
obj_savesystem.ini_str = ini_close()
if _first
{
    bossspr = spr_vsfakepep2
    vstitle = spr_vstitle_fakepep2
}
else
{
    bossspr = spr_vsfakepep
    vstitle = spr_vstitle_fakepep
}
boss_hp = 10
boss_hpsprite = spr_bossfight_fakepephp
boss_palette = spr_bossfight_fakepeppalette
boss_columnmax = 3
boss_hp_x += 50
function anon@535@gml_RoomCC_boss_fakepep_1_Create() //gml_Script_anon@535@gml_RoomCC_boss_fakepep_1_Create
{
    var eh = 0
    var p = 0
    with (obj_fakepepboss)
    {
        eh = elitehit
        p = phase
    }
    if (p == 1)
        boss_hp = eh
    else if (p == 2)
        boss_hp = eh
    else if (p == 0)
    {
        boss_hp = 0
        if (room == boss_fakepephallway)
            boss_hp = 1
    }
}

