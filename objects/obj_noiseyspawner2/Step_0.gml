var b = 1
with (obj_bosscontroller)
{
    if (state == states.arenaintro)
        b = 0
}
with (obj_noisey)
    b = 0
with (obj_noiseboss)
{
    if (state == states.arenaintro || state == states.stun || phase == 1)
        b = 0
}
if b
{
    if (spawnbuffer > 0)
        spawnbuffer--
    else
    {
        spawnbuffer = spawnmax
        with (gml_Script_instance_create(x, y, obj_noisey))
        {
            create_particle(x, y, (9 << 0))
            important = 1
            state = states.stun
            bounce = 1
            stunned = 10
            image_xscale = other.image_xscale
        }
        if (x == xstart)
            x = 832
        else
            x = xstart
        image_xscale *= -1
    }
}
