if (!in_saveroom())
{
    sound_play_3d("event:/sfx/misc/breakice", x, y)
    if bird
    {
        gml_Script_instance_create((x + 32), (y + 32), obj_burd)
        notification_push((28 << 0), [room])
    }
    repeat (6)
        create_debris((x + 32), (y + 32), spr_icedebris)
    gml_Script_instance_create((x + 32), (y + 32), obj_parryeffect)
    var val = heat_calculate(10)
    global.collect += val
    with (gml_Script_instance_create((x + 32), (y + 32), obj_smallnumber))
        number = string(val)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    add_saveroom()
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
