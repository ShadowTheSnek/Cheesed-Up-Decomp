with (other)
{
    if (state != states.trashroll && state != states.trashjump && state != states.cheeseball)
    {
        sound_play_3d("event:/sfx/pep/slip", x, y)
        sprite_index = spr_slipbanan1
        other.drop = 1
        vsp = -11
        movespeed = abs(movespeed)
        movespeed += 2
        if (movespeed > 14)
            movespeed = 14
        hsp = (movespeed * xscale)
        image_index = 0
        state = states.slipbanan
    }
    instance_destroy(other)
}
