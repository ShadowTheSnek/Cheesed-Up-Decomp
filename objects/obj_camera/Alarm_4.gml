if (room == timesuproom || is_bossroom() || room == tower_tutorial1)
{
    instance_destroy(obj_comboend)
    return;
}
with (obj_comboend)
{
    for (var i = 0; i < comboscore; i += comboscore)
        create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect))
    comboscore = 0
    instance_destroy()
}
with (gml_Script_instance_create(x, y, obj_comboend))
{
    combo = global.savedcombo
    comboscore = global.comboscore
    comboscoremax = comboscore
    notification_push((50 << 0), [combo])
    combominus = round((comboscore / 50))
}
global.comboscore = 0
global.savedcombo = 0
