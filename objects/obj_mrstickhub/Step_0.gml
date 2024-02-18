switch state
{
    case states.normal:
        break
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
        {
            instance_activate_object(bossdoorID)
            with (bossdoorID)
            {
                vsp = -5
                state = states.jump
                event_perform(ev_other, ev_room_start)
            }
            state = states.jump
        }
        break
    case (92 << 0):
        sprite_index = spr_mrstick_helicopterhat
        y -= 10
        if (y < -100)
            instance_destroy()
        break
    default:

}

