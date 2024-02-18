if ((!locked) && state != (291 << 0) && other.state != states.door && other.state != states.actor && other.state != states.comingoutdoor && other.state != (296 << 0))
{
    notification_push((40 << 0), [room])
    with (other)
    {
        hitX = x
        hitY = y
        state = (291 << 0)
        sprite_index = spr_hurt
        image_speed = 0.35
    }
    sound_play("event:/sfx/pep/johnghost")
    fadein = 0
    state = (291 << 0)
    playerid = other.id
}
