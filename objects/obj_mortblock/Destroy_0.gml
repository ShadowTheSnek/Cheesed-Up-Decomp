if (!in_saveroom())
{
    add_saveroom()
    repeat (4)
        create_debris(x, y, spr_mortcubedebris)
    notification_push((6 << 0), [room])
    sound_play("event:/sfx/mort/cube")
}
