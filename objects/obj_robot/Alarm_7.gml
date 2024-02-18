alarm[7] = 10
if (state == states.mach1 || state == states.throw || state == states.tackle || state == states.slap)
{
    with (create_red_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
    {
        if (other.state != states.throw && other.state != states.slap)
            playerid = other.id
    }
}
