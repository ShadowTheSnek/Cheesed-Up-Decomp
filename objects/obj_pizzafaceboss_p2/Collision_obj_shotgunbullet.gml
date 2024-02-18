if (state != states.stun)
{
    state = states.stun
    stunned = 1000
    thrown = 0
    hsp = ((-image_xscale) * 8)
    vsp = -4
    lastattack = (2 << 0)
    with (obj_player)
        shotgunAnim = 0
}
instance_destroy(other)
