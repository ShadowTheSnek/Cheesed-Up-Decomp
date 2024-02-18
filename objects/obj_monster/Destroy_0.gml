if destroy
{
    repeat (3)
    {
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    if (global.panic && (!in_baddieroom()))
    {
        add_baddieroom()
        notification_push((29 << 0), [object_index])
    }
    sound_play_3d("event:/sfx/enemies/kill", x, y)
    gml_Script_instance_create(x, y, obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    global.combo++
    global.enemykilled++
    global.combotime = 60
    with (gml_Script_instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
}
