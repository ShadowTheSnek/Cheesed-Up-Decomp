var player = instance_nearest(x, y, obj_player)
image_speed = 0.35
switch state
{
    case states.normal:
        if (collisioned && fmod_event_instance_is_playing(snd))
            fmod_event_instance_stop(snd, 1)
        if collisioned
            visible = false
        else if (place_meeting(x, y, obj_frontcanonbomb) || place_meeting(x, y, obj_canonexplosion) || (!instance_exists(obj_frontcanongoblin)))
            collisioned = 1
        if (cooldown > 0)
            cooldown--
        else if (distance_to_pos(x, y, player.x, player.y, threshold_x, threshold_y) && instance_exists(obj_frontcanongoblin))
        {
            state = states.transitioncutscene
            attackbuffer = 20
        }
        break
    case (8 << 0):
        if (!fmod_event_instance_is_playing(snd))
            fmod_event_instance_play(snd)
        sound_instance_move(snd, x, y)
        visible = true
        if (attackbuffer > 0)
            attackbuffer--
        else
        {
            with (obj_frontcanongoblin)
            {
                if (state != states.transitioncutscene && state != states.gameover)
                {
                    crosshair_x = other.x
                    crosshair_y = other.y
                    event_perform(ev_alarm, 0)
                    other.state = states.normal
                    other.collisioned = 0
                    other.cooldown = 150
                }
            }
        }
        break
}

