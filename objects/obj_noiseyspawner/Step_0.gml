var b = 0
with (obj_bosscontroller)
{
    if (state == states.arenaintro)
        b = 0
}
with (obj_noisey)
    b = 0
with (obj_noiseboss)
{
    if (state == states.arenaintro || state == states.stun || wastedhits >= 6)
        b = 0
}
if b
{
    if (spawnbuffer > 0)
        spawnbuffer--
    else
    {
        spawnbuffer = spawnmax
        with (gml_Script_instance_create(disx1, -64, obj_noisey))
        {
            important = 1
            x_to = other.disx2
            y_to = irandom_range(other.disy1, other.disy2)
            state = (149 << 0)
            bounce = 1
            stunned = 10
        }
    }
}
