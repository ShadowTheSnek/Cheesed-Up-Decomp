if (other.clowntimer <= 0)
{
    create_particle(x, y, (9 << 0))
    other.movespeed = 10
    other.state = states.mach2
    other.skateboarding = 1
    other.clowntimer = 150
}
