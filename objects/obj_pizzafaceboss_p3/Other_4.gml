with (obj_bosscontroller)
    bossID = other.id
if instance_exists(obj_fakepepflash)
{
    elitehit = 1
    phase = 2
    destroyable = 1
    state = states.stun
    stunned = 50000000
    savedthrown = 0
    instance_destroy(spotlightID)
}
