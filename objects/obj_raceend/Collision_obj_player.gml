if ((!horseyfinish) && start)
{
    with (obj_horsey)
    {
        spd = 0
        hsp = 0
        vsp = 0
        if (state != states.gameover)
        {
            sound_play_3d("event:/sfx/misc/winrace", other.x, other.y)
            add_saveroom()
        }
        state = states.gameover
        with (obj_objecticontracker)
        {
            if (objectID == other.id)
                instance_destroy()
        }
    }
    with (obj_horseyright)
        used = 1
    with (obj_racestart)
        add_saveroom()
    global.horse = 0
    instance_destroy(obj_horseyblock)
}
