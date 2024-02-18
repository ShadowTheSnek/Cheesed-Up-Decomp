if (!active)
{
    sound_play_3d("event:/sfx/misc/checkpoint", x, y)
    active = 1
    sprite_index = activatingspr
    image_index = 0
    with (obj_player)
    {
        roomstartx = (other.x + 6)
        roomstarty = (other.y - 46)
    }
}
