if (global.timedgate == 1)
{
    global.timedgate = 0
    global.seconds = 30
    ded = 0
    alarm[2] = -1
}
if (global.miniboss == 1)
{
    with (obj_player)
    {
        gml_Script_instance_create(x, y, obj_bangeffect)
        repeat (6)
            create_slapstar(x, y)
        state = states.ejected
        vsp = -10
        audio_stop_all()
        stop_music()
    }
    alarm[2] = -1
    global.miniboss = 0
}
