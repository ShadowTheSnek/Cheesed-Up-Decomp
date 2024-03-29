if (!in_saveroom())
{
    if (!instance_exists(obj_wartimer))
    {
        with (instance_create_unique(0, 0, obj_wartimer))
        {
            minutes = 0
            seconds = 30
        }
        if (room == war_1)
        {
            with (obj_escapecollect)
                image_alpha = 1
            with (obj_music)
                warstart = 1
        }
    }
    sound_play("event:/sfx/ui/wartimerup")
    with (obj_wartimer)
    {
        addseconds += other.seconds
        while (other.minutes > 0)
        {
            other.minutes--
            addseconds += 60
        }
        alarm[0] = -1
        alarm[2] = 1
    }
    for (var i = 0; i < sprite_get_number(spr_warterminal_debris); i++)
    {
        with (create_debris(x, y, spr_warterminal_debris))
            image_index = i
    }
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    add_saveroom()
    notification_push((45 << 0), [room])
}
