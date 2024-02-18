var _sound = 0
if place_meeting(x, y, obj_player)
{
    with (obj_hiddenobject)
    {
        if ((!activated) && trigger == other.trigger)
        {
            _sound = 1
            event_user(0)
        }
    }
}
if _sound
{
    if global.gameplay
    {
        sound_stop("event:/sfx/misc/collectpizza")
        fmod_event_instance_set_parameter(global.snd_secretwall, "state", (check_char("SP") || check_char("SN")), 0)
        fmod_event_instance_play(global.snd_secretwall)
    }
    else if (!global.SUGARY)
        sound_play("event:/sfx/misc/collectpizza")
}
