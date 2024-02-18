if (other.state != states.chainsaw && other.skateboarding == 0)
{
    sound_play_3d("event:/sfx/misc/honkhonk", x, y)
    create_particle(x, y, (9 << 0))
    other.movespeed = 10
    other.state = states.mach2
    other.skateboarding = 1
    other.clowntimer = 300
}
