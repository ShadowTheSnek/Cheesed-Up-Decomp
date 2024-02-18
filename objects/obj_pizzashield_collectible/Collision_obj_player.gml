if (other.state != states.gotoplayer)
{
    scr_sound_multiple(global.snd_collect, x, y)
    with (other)
        pizzashield = 1
    instance_destroy()
}
