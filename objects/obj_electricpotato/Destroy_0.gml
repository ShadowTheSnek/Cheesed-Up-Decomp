if (!in_baddieroom())
{
    with (gml_Script_instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
    gml_Script_instance_create(x, y, obj_bangeffect)
    add_baddieroom()
    with (obj_player1)
        supercharge += 1
    global.combo += 1
    global.enemykilled += 1
    global.combotime = 60
    if instance_exists(obj_hardmode)
        global.heatmeter_count++
    var combototal = (10 + floor((global.combo * 0.5)))
    global.collect += combototal
    global.comboscore += combototal
    sound_play_3d("event:/sfx/enemies/kill", x, y)
    repeat (3)
    {
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    gml_Script_instance_create(x, y, obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    if (object_index == obj_miniufo)
        gml_Script_instance_create(x, y, obj_playerexplosion)
    add_baddieroom()
    if escape
        add_saveroom(id, global.escaperoom)
}
