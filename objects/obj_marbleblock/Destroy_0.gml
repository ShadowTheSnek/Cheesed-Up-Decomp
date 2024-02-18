if (!in_saveroom())
{
    with (gml_Script_instance_create((x + 32), (y + 32), obj_sausageman_dead))
        sprite_index = spr_harddoughblockdead
    scr_sleep(5)
    gml_Script_instance_create((x + 32), (y + 32), obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = (40 / room_speed)
    }
    GamepadSetVibration(playerindex, 1, 1, 0.8)
    sound_play_3d("event:/sfx/misc/breakmetal", x, y)
    add_saveroom()
}
depth = 1
