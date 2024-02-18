with (other)
{
    if (grounded && (movespeed < 16 || instance_exists(obj_ghostcollectibles)))
    {
        sound_play_3d("event:/sfx/pep/slip", x, y)
        sprite_index = spr_slipbanan1
        vsp = -11
        movespeed = abs(movespeed)
        hsp = (movespeed * xscale)
        image_index = 0
        state = states.slipbanan
        instance_destroy(other)
    }
}
