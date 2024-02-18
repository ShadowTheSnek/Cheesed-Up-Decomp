if (respawn > 0)
    respawn--
if (respawn == 0 && visible == false)
{
    if global.gameplay
        create_particle(x, y, (9 << 0))
    visible = true
    x = xstart
    y = ystart
}
