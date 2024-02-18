if (!in_saveroom())
{
    repeat (6)
    {
        with (gml_Script_instance_create((x + 32), (y + 32), obj_metaldebris))
            sprite_index = spr_supermetalblock_debris
    }
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = (40 / room_speed)
    }
    sound_play("event:/sfx/misc/breakmetal")
    add_saveroom()
}
depth = 1
