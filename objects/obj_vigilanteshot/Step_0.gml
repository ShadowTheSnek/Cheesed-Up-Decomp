x += (image_xscale * spd)
if (image_index > 7 && woosh)
{
    spd = 8
    particle_set_scale((5 << 0), image_xscale, 1)
    create_particle(x, 401, (5 << 0))
    woosh = 0
}
