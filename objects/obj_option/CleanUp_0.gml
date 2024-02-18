for (var j = 0; j < array_length(menus); j++)
{
    var m = menus[j]
    for (var i = 0; i < array_length(m.options); i++)
    {
        var b = m.options[i]
        if (b.type == (3 << 0) && b.sound != -4)
        {
            fmod_event_instance_stop(b.sound, 1)
            sound_destroy_instance(b.sound)
        }
    }
}
