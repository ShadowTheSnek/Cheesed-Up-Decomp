if (other.thrown && state != states.stun)
{
    state = states.stun
    stunned = 1000
    thrown = 0
    hsp = ((-image_xscale) * 8)
    vsp = -4
    if (other.object_index == obj_pizzaheadportrait)
        lastattack = (1 << 0)
    else if (other.object_index == obj_pizzafacebrick)
        lastattack = (3 << 0)
    instance_destroy(obj_junk)
}
