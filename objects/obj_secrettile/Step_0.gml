if (buffer > 0)
    buffer--
player = instance_place(x, y, obj_player)
if ((player && place_meeting(x, y, player) && player.state != states.chainsaw && player.state != states.backtohub) || active)
{
    if (buffer > 0)
        image_alpha = 0
    if (!revealed)
    {
        revealed = 1
        add_saveroom()
        if (global.gameplay && buffer <= 0)
        {
            sound_stop("event:/sfx/misc/collectpizza")
            fmod_event_instance_set_parameter(global.snd_secretwall, "state", check_sugarychar(), 0)
            fmod_event_instance_play(global.snd_secretwall)
        }
    }
    with (obj_secrettile)
    {
        if (distance_to_object(other) <= 1)
        {
            var found = 0
            with (obj_secrettile)
            {
                if player
                    found = 1
            }
            if found
            {
                if (!revealed)
                {
                    if (other.buffer > 0)
                        image_alpha = 0
                    revealed = 1
                    add_saveroom()
                }
                active = 1
            }
        }
    }
    depth = max(-8, desireddepth)
    image_alpha = Approach(image_alpha, 0, 0.05)
}
else if (!((player && player.state == states.chainsaw)))
{
    depth = desireddepth
    image_alpha = Approach(image_alpha, 1, 0.05)
}
active = 0
